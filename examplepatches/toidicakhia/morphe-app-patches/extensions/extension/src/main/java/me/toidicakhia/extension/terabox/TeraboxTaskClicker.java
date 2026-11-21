package me.toidicakhia.extension.terabox;

import android.app.Activity;
import android.os.Build;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps the TeraBox task-center and check-in pages clicking themselves.
 *
 * Both pages are offline packs the app downloads, so the injected script
 * targets their own class names by CSS selector instead of by label: reward
 * popups, the "watch ads" task group, the featured card and the check-in
 * calendar. Destructive controls (complete, subscribe/remind, close, card
 * exchange) are never pressed, and every press goes through a cooldown.
 *
 * A control is pressed only when it is visible, enabled, on screen and not
 * covered by a real modal. A press that changes nothing drops that one control
 * for a minute, never the whole clicker. On the check-in page a real sign-in is
 * detected by today's cell showing an img; once signed and quiet, the page
 * closes through its own `closePage` bridge.
 */
@SuppressWarnings("unused")
public final class TeraboxTaskClicker {

    private static final String TAG = "TeraboxTaskClicker";

    private static final long POLL_INTERVAL_MS = 600L;

    private static final int MAX_POLLS = 9000;

    /** Re-inject the script occasionally as a keepalive; the script is idempotent. */
    private static final int KEEPALIVE_POLLS = 12;

    /**
     * Pages that can host the reward task list. The Benefits entry may point at
     * a server-configured URL, so do not rely on `taskcenter` alone.
     */
    private static final String[] TASK_PAGE_HINTS = {
            "taskcenter",
            "benefit",
            "welfare",
            "reward",
            "bonus",
            "earn",
            "coin",
    };

    private static final Map<WebView, Boolean> ATTACHED =
            Collections.synchronizedMap(new WeakHashMap<WebView, Boolean>());

    /** Name of the bridge the injected script uses to report what it pressed. */
    private static final String HUD_BRIDGE = "tbTaskHud";

    private TeraboxTaskClicker() {
    }

    /**
     * Called from the hybrid bridge setup before the page starts loading.
     * Safe to call more than once per WebView.
     */
    public static void attach(WebView webView) {
        if (webView == null) {
            return;
        }

        synchronized (ATTACHED) {
            if (ATTACHED.containsKey(webView)) {
                return;
            }
            ATTACHED.put(webView, Boolean.TRUE);
        }

        webView.addJavascriptInterface(new HudBridge(webView), HUD_BRIDGE);
        webView.post(new Poller(webView));
    }

    /** Receives the label of the control the injected script just pressed. */
    private static final class HudBridge {

        private final WeakReference<WebView> webViewRef;

        HudBridge(WebView webView) {
            this.webViewRef = new WeakReference<>(webView);
        }

        @JavascriptInterface
        public void clicked(String label) {
            final WebView webView = webViewRef.get();
            if (webView != null) {
                TeraboxTaskHud.clicked(webView, label);
            }
        }

        /** Why the script is not pressing anything right now. */
        @JavascriptInterface
        public void note(String reason) {
            final WebView webView = webViewRef.get();
            if (webView != null) {
                TeraboxTaskHud.note(webView, reason);
            }
        }
    }

    private static final class Poller implements Runnable {

        private final WeakReference<WebView> webViewRef;

        private boolean wasAttached;

        private int polls;

        private int lastUrlHash;

        private boolean paused;

        private String lastStatus = "";

        /** Set only once an ad has actually covered this page. */
        private boolean sawAd;

        /** The script is injected once per URL, not on every poll. */
        private boolean injected;

        private int pollsSinceInject;

        Poller(WebView webView) {
            this.webViewRef = new WeakReference<>(webView);
        }

        @Override
        public void run() {
            WebView webView = webViewRef.get();
            if (webView == null) {
                return;
            }

            try {
                syncState(webView);
                loadScript(webView);
            } catch (Throwable throwable) {
                Log.w(TAG, "Could not inject the task clicker", throwable);
            }

            if (++polls >= MAX_POLLS || isGone(webView)) {
                stop(webView);
                return;
            }

            webView.postDelayed(this, POLL_INTERVAL_MS);
        }

        /**
         * Pauses the page while an ad is in flight and mirrors the state on the
         * ad window, which covers this WebView and its HUD.
         */
        private void syncState(WebView webView) {
            boolean adOnTop = TeraboxAdCloser.isAdOnTop();
            // Also lets the closer give up on an ad whose reward callback never
            // arrived, so a failed network cannot leave the task flow hanging.
            TeraboxAdCloser.watchStuckAd();
            Activity host = TeraboxTaskHud.activityOf(webView);
            boolean otherPage = host != null && !TeraboxAdCloser.isOnTop(host);
            // `recentlyRewarded()` is global and can still be true from an ad
            // watched elsewhere. Only honour it here after an ad showed on this
            // page, otherwise opening Benefits right after a reward reports
            // "reward received" and pauses for no reason.
            if (adOnTop) {
                sawAd = true;
            } else if (!TeraboxAdCloser.recentlyRewarded()) {
                sawAd = false;
            }
            boolean holding = sawAd && TeraboxAdCloser.recentlyRewarded();
            boolean pauseNow = adOnTop || otherPage || holding;
            String status = adOnTop ? "watching ad"
                    : otherPage ? "waiting for the page"
                    : holding ? "reward received, waiting" : "clicking";
            boolean wasPaused = paused;
            if (pauseNow != paused || !status.equals(lastStatus)) {
                paused = pauseNow;
                lastStatus = status;
                Log.i(TAG, (pauseNow ? "Clicker paused: " : "Clicker resumed: ") + status);
            }
            // Re-send the pause flag every poll in case the page reloaded; on
            // resume nudge the page instead of waiting for its next heartbeat.
            if (pauseNow || wasPaused) {
                String flags = "window.__tbTaskPaused=" + (pauseNow ? "1" : "0") + ";";
                if (!pauseNow && wasPaused) {
                    flags = flags + "window.__tbTick&&window.__tbTick();";
                }
                webView.evaluateJavascript(flags, null);
            }

            Activity adActivity = TeraboxAdCloser.currentAdActivity();
            if (adActivity != null) {
                TeraboxTaskHud.adOverlay(adActivity, "Auto task · watching ad");
            } else {
                TeraboxTaskHud.hideAdOverlay();
            }
        }

        /** Injects the script once per URL, with a periodic keepalive. */
        private void loadScript(WebView webView) {
            String url = webView.getUrl();
            if (url == null || !isTaskPage(url)) {
                injected = false;
                pollsSinceInject = 0;
                if (url != null && url.hashCode() != lastUrlHash) {
                    lastUrlHash = url.hashCode();
                    Log.d(TAG, "Not a task page: " + url);
                }
                TeraboxTaskHud.hide(webView);
                return;
            }
            if (url.hashCode() != lastUrlHash) {
                lastUrlHash = url.hashCode();
                injected = false;
                pollsSinceInject = 0;
                Log.i(TAG, "Injecting the task clicker into " + url);
            }
            // The script guards itself; the keepalive only restarts it after a
            // silent reload that did not change the URL.
            if (!injected || ++pollsSinceInject >= KEEPALIVE_POLLS) {
                webView.evaluateJavascript(SCRIPT, null);
                injected = true;
                pollsSinceInject = 0;
            }
            TeraboxTaskHud.status(webView, lastStatus);
        }

        /** Detaches the HUD and never leaves the page paused. */
        private void stop(WebView webView) {
            synchronized (ATTACHED) {
                ATTACHED.remove(webView);
            }
            TeraboxTaskHud.hide(webView);
            TeraboxTaskHud.hideAdOverlay();
            webView.evaluateJavascript("window.__tbTaskPaused=0;", null);
        }

        private boolean isGone(WebView webView) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
                return false;
            }
            if (webView.isAttachedToWindow()) {
                wasAttached = true;
                return false;
            }
            // The fragment may hand the WebView over before it is attached;
            // only treat a detach as final after it has been attached once.
            return wasAttached;
        }
    }

    private static boolean isTaskPage(String url) {
        String lower = url.toLowerCase();
        for (String hint : TASK_PAGE_HINTS) {
            if (lower.contains(hint)) {
                return true;
            }
        }
        return false;
    }

    /**
     * CSS targets come from the offline packs captured on 4.27.5. The order is
     * reward popups, check-in, then only the "Xem quảng cáo" / "Watch ads" task
     * group, with the lucky bag last. The five daily tasks share `.btn.go` with
     * the watch-ad task, so their buttons are taken only from that group.
     *
     * The sign-in entry is pressed once per page load. Off-screen controls are
     * scrolled in once; a real modal at the press point blocks the click. A
     * press that changes nothing drops that control for a minute. Once the
     * check-in page is signed and quiet, it closes through `closePage`.
     */
    private static final String SCRIPT = String.join(" ",
            "(function(){",
            "if(window.__tbTaskClicker){return;}window.__tbTaskClicker=1;",
            "var SIGN_ENTRY='.coin-wrap .sign-in';",
            "var WATCH_GROUP='__WATCH_AD_GROUP__';",
            "var WATCH_WORDS=/xem quảng cáo|xem quang cao|quảng cáo|quang cao|watch ad|watch video|advertis|观看广告|看广告|nonton iklan|tonton iklan|ver anuncio|ver anúncio|смотреть рекламу|reklam/i;",
            "var WATCH_SELECTOR='.tc-task-card-v2 .task-btn-wrap .btn.btn-go,.tc-task-card-v2 .task-btn-wrap .btn.btn-collect';",
            "var TARGETS=[",
            "'.popup-bg-box .popup-box .video-btn:not(.notClickable)',",
            "'.reward-toast .extra-button.video',",
            "'.reward-toast .extra-button:not(.video)',",
            "'.popup-bg-box .popup-box .btn:not(.notClickable)',",
            "'.popup-btn',",
            "'.coin-wrap .sign-in',",
            "'button.check-in-pill.is-unsigned',",
            "'.calendar-body .sign-flash',",
            "'.sign-in-box .sub-title .title-left',",
            "'.sign-in-box .sign-button',",
            "WATCH_GROUP,",
            "'.task-top-card',",
            "'.welfare-header-getCoinsCard',",
            "'.expire-coin-box .view-video-btn',",
            "'.tc-lucky-bag__cta:not(.is-completed)',",
            "'.tc-lb-dialog__cta'",
            "];",
            "function watchGroup(){var groups;try{groups=document.querySelectorAll('.tc-task-group');}catch(e){return null;}for(var i=0;i<groups.length;i++){var head=groups[i].querySelector('.group-title');if(!head)continue;var text=(''+((head.innerText||head.textContent)||'')).replace(/\\s+/g,' ').trim();if(WATCH_WORDS.test(text))return groups[i];}return null;}",
            "function watchTargets(now,i){var g=watchGroup();if(!g)return [];var list;try{list=g.querySelectorAll(WATCH_SELECTOR);}catch(e){return [];}var out=[];for(var j=0;j<list.length;j++){var el=list[j];if(visible(el)&&enabled(el)&&ready(el,i,now))out.push(el);}return out;}",
            "var MODALS='.popup-bg-box,.popup-mask,.dialog-mask,.base-popup-mask,.auto-sign-rewards-mask,.continuous-sign-in-popup,.sign-rules,.makeup-card-content,.task-sheet-mask,.record-drawer-mask,.guide-ad-mask,.reward-toast,[role=dialog],.modal';",
            "var LOADERS='.loading-box,.el-m-toast__spinner,.task-card__loading';",
            "var COOLDOWN=6000,DEAD=60000,MIN_GAP=1000,PER_MIN=10,TICK=500,SETTLE=300,VERIFY=1000,MIN_TICK=200;",
            "var dead={},lastAt={},lastNote='',noteAt=0,recent=[],scrolled='',pending=null,url=(window.location&&window.location.href)||'',pageAt=Date.now(),loadStart=0,quietSince=0,closed=false,busy=false,lastClick=0,lastSig='',signEntryDone=false,lastRun=0;",
            "function label(el){try{return (''+((el.innerText||el.textContent)||'')).replace(/\\s+/g,' ').trim();}catch(e){return '';}}",
            "function cls(el){try{var c=el&&el.className;return ''+((c&&c.baseVal!==undefined)?c.baseVal:c||'');}catch(e){return '';}}",
            "function note(m){try{var n=Date.now();if(m===lastNote&&n-noteAt<5000)return;lastNote=m;noteAt=n;window.tbTaskHud&&window.tbTaskHud.note(m);}catch(e){}}",
            "function hud(t){try{window.tbTaskHud&&window.tbTaskHud.clicked(t);}catch(e){}}",
            "function visible(el){try{var r=el.getBoundingClientRect();if(r.width<4||r.height<4)return false;var s=window.getComputedStyle(el);return s.display!=='none'&&s.visibility!=='hidden'&&parseFloat(s.opacity||'1')!==0;}catch(e){return false;}}",
            "function enabled(el){try{if(el.disabled)return false;if(el.getAttribute&&(el.getAttribute('aria-disabled')==='true'||el.getAttribute('disabled')!==null))return false;if(/disabl|notClickable|is-disabled|is-completed|complete-btn|grey|gray|claimed|received|expired/i.test(cls(el)))return false;if(el.closest&&el.closest('.adx,.adx-two,.notClickable'))return false;if(/mua gói|nap tien|nạp tiền|đăng ký|dang ky|subscribe|purchase|top ?up|recharge|upgrade|đổi thẻ|doi the|exchange|share|chía sẻ|invite|mời bạn|uninstall|gỡ cài đặt/i.test(label(el)))return false;return true;}catch(e){return false;}}",
            "function onScreen(el){try{var r=el.getBoundingClientRect(),h=window.innerHeight||1e9,w=window.innerWidth||1e9;return r.bottom>0&&r.right>0&&r.top<h&&r.left<w;}catch(e){return false;}}",
            "function covered(el){try{var r=el.getBoundingClientRect(),x=r.left+r.width/2,y=r.top+r.height/2;if(x<0||y<0||x>(window.innerWidth||1e9)||y>(window.innerHeight||1e9))return false;var top=document.elementFromPoint(x,y);if(!top||top===el||el.contains&&el.contains(top)||top.contains&&top.contains(el))return false;if(top.getAttribute&&top.getAttribute('role')==='dialog')return true;for(var p=top;p&&p!==document.body;p=p.parentElement){if(/popup-bg-box|popup-mask|dialog-mask|base-popup-mask|auto-sign-rewards-mask|continuous-sign-in-popup|sign-rules|makeup-card-content|task-sheet-mask|record-drawer-mask|guide-ad-mask|reward-toast/.test(cls(p)))return true;}}catch(e){}return false;}",
            "function loading(){try{var n=document.querySelectorAll(LOADERS);for(var i=0;i<n.length;i++){var r=n[i].getBoundingClientRect();if(visible(n[i])&&r.width>=40&&r.height>=40)return true;}}catch(e){}return false;}",
            "function sigOf(){var o=[];for(var i=0;i<TARGETS.length;i++){try{o.push(TARGETS[i]===WATCH_GROUP?watchTargets(Date.now(),i).length:document.querySelectorAll(TARGETS[i]).length);}catch(e){o.push('x');}}return o.join(',');}",
            "function keyOf(el,i){var idx=0,p=el.parentElement;if(p){var s=p.children;for(var k=0;k<s.length;k++){if(s[k]===el){idx=k;break;}}}return i+'#'+idx+'#'+label(el).slice(0,24);}",
            "function ready(el,i,now){var k=keyOf(el,i);if(dead[k]&&now-dead[k]<DEAD)return false;if(now-(lastAt[k]||0)<COOLDOWN)return false;return true;}",
            "function pick(now){for(var i=0;i<TARGETS.length;i++){if(TARGETS[i]===SIGN_ENTRY&&signEntryDone)continue;var list;if(TARGETS[i]===WATCH_GROUP){list=watchTargets(now,i);}else{try{list=document.querySelectorAll(TARGETS[i]);}catch(e){continue;}}for(var j=0;j<list.length;j++){var el=list[j];if(!visible(el)||!enabled(el)||!ready(el,i,now))continue;return {el:el,i:i,key:keyOf(el,i)};}}return null;}",
            "function signDone(){try{var href=(window.location&&window.location.href)||'';if(href.indexOf('/taskcenter/signin')<0)return false;if(!document.querySelector('.calendar-body')&&!document.querySelector('.sign-in-box'))return false;var m=document.querySelectorAll(MODALS);for(var i=0;i<m.length;i++){if(visible(m[i]))return false;}if(document.querySelector('.sign-flash'))return false;var cells=document.querySelectorAll('.calendar-body .single');for(var j=0;j<cells.length;j++){if(cells[j].querySelector('img'))return true;}return false;}catch(e){return false;}}",
            "function closePage(){try{var f=document.createElement('iframe');f.style.display='none';f.src='dubox://page/'+Date.now()+'/closePage?params=%7B%7D';document.documentElement.appendChild(f);setTimeout(function(){try{f.remove();}catch(e){}},1000);}catch(e){}}",
            "function tick(){",
            "var href=(window.location&&window.location.href)||'';",
            "if(pending&&(sigOf()!==pending.sig||href!==pending.url))pending=null;",
            "if(window.__tbTaskPaused){quietSince=0;note('ad on screen, waiting');return;}",
            "if(busy)return;",
            "var now=Date.now();",
            "if(now-lastRun<MIN_TICK)return;lastRun=now;",
            "busy=true;",
            "try{",
            "if(href!==url){url=href;pageAt=now;scrolled='';pending=null;quietSince=0;closed=false;}",
            "if(pending&&now-pending.at>=VERIFY){dead[pending.key]=now;pending=null;note('that control had no effect, skipping it for a minute');}",
            "if(now-pageAt<SETTLE){note('page just loaded');return;}",
            "var cand=pick(now);",
            "if(!cand&&loading()){if(!loadStart)loadStart=now;if(now-loadStart<3000){note('waiting for the page to finish loading');return;}}",
            "loadStart=0;",
            "if(!cand){if(!quietSince)quietSince=now;if(!closed&&now-quietSince>=8000&&signDone()){closed=true;closePage();note('check-in complete, closing page');}else note('no matching control on this page');return;}",
            "quietSince=now;",
            "if(!onScreen(cand.el)&&scrolled!==cand.key){scrolled=cand.key;try{cand.el.scrollIntoView({block:'center'});}catch(e){try{cand.el.scrollIntoView();}catch(e2){}}note('scrolling to the control');return;}",
            "scrolled='';",
            "if(covered(cand.el)){note('waiting, a modal is on top');return;}",
            "if(now-lastClick<MIN_GAP)return;",
            "recent=recent.filter(function(t){return now-t<60000;});",
            "if(recent.length>=PER_MIN){note('rate limit reached');return;}",
            "lastAt[cand.key]=now;lastClick=now;recent.push(now);",
            "if(TARGETS[cand.i]===SIGN_ENTRY)signEntryDone=true;",
            "pending={key:cand.key,sig:sigOf(),url:href,at:now};",
            "try{cand.el.click();}catch(e){}",
            "hud(label(cand.el)||cand.key);",
            "}finally{busy=false;}}",
            "function start(){lastSig=sigOf();window.__tbTick=function(){lastRun=0;tick();};setInterval(tick,TICK);try{new MutationObserver(function(){var n=Date.now();if(n-lastScan<200)return;lastScan=n;var s=sigOf();if(s!==lastSig){lastSig=s;quietSince=0;scrolled='';}tick();}).observe(document.documentElement,{childList:true,subtree:true,characterData:true,attributes:true,attributeFilter:['class','disabled','aria-disabled']});}catch(e){}tick();}",
            "var lastScan=0;",
            "if(document.readyState==='loading'){document.addEventListener('DOMContentLoaded',start);}else{start();}",
            "})();"
    );
}
