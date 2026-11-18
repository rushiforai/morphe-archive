package io.github.henr1klmb.patches.shared;

import java.lang.reflect.Method;

public class WebViewHelper {
    private static final String DEFAULT_AD_BLOCKER_JS =
        "javascript:(function(){" +
        "window.open=function(){return null;};" +
        "var s=document.getElementById('morphe-adblock')||document.createElement('style');" +
        "s.id='morphe-adblock';" +
        "s.textContent='ins.adsbygoogle,[id*=google_ads],[class*=ad-banner],[class*=ad_banner],[id*=ad-container],[id*=popunder],iframe[src*=ads],iframe[src*=doubleclick],iframe[src*=adsterra],iframe[src*=propeller]{display:none!important;visibility:hidden!important;height:0!important;pointer-events:none!important;}';" +
        "(document.head||document.documentElement).appendChild(s);" +
        "function fixOverlay(){" +
        "try{" +
        "var keywords=['we need support','open 1 ads per day','open 1 ad per day','page reload'];" +
        "var walker=document.createTreeWalker(document.body||document.documentElement,NodeFilter.SHOW_TEXT,null,false);" +
        "var node;" +
        "var foundNodes=[];" +
        "while(node=walker.nextNode()){" +
        "var text=(node.nodeValue||'').toLowerCase().trim();" +
        "for(var i=0;i<keywords.length;i++){" +
        "if(text.indexOf(keywords[i])!==-1){" +
        "foundNodes.push(node);" +
        "break;" +
        "}" +
        "}" +
        "}" +
        "for(var j=0;j<foundNodes.length;j++){" +
        "var el=foundNodes[j].parentElement;" +
        "while(el&&el!==document.body&&el!==document.documentElement){" +
        "var style=window.getComputedStyle(el);" +
        "if(style.position==='fixed'||style.position==='absolute'||(parseInt(style.zIndex,10)>100)||el.getAttribute('role')==='dialog'||el.classList.contains('modal')||el.classList.contains('overlay')){" +
        "el.style.setProperty('display','none','important');" +
        "el.style.setProperty('visibility','hidden','important');" +
        "el.style.setProperty('pointer-events','none','important');" +
        "break;" +
        "}" +
        "el=el.parentElement;" +
        "}" +
        "}" +
        "if(foundNodes.length>0||document.querySelector('[class*=modal],[class*=backdrop],[class*=overlay]')){" +
        "if(document.body){document.body.style.setProperty('overflow','auto','important');document.body.style.setProperty('pointer-events','auto','important');}" +
        "if(document.documentElement){document.documentElement.style.setProperty('overflow','auto','important');document.documentElement.style.setProperty('pointer-events','auto','important');}" +
        "}" +
        "}catch(e){}" +
        "try{" +
        "var now=Date.now();" +
        "var keys=['ad_watched','ad_watched_time','ads_watched','ads_last_watched','support_ad','ad_timer','ad_unlocked','last_ad_time','open_ad','open_ads'];" +
        "for(var k=0;k<keys.length;k++){" +
        "try{localStorage.setItem(keys[k],''+now);}catch(e){}" +
        "try{sessionStorage.setItem(keys[k],''+now);}catch(e){}" +
        "}" +
        "document.cookie='ad_watched=1; path=/; max-age=86400';" +
        "document.cookie='support_ad=1; path=/; max-age=86400';" +
        "}catch(e){}" +
        "}" +
        "fixOverlay();" +
        "if(!window._morpheObserver){" +
        "try{" +
        "var obs=new MutationObserver(function(){fixOverlay();});" +
        "obs.observe(document.documentElement||document.body,{childList:true,subtree:true});" +
        "window._morpheObserver=obs;" +
        "}catch(e){}" +
        "}" +
        "})();";

    private static final String DEFAULT_TRACKER_BLOCKER_JS =
        "javascript:(function(){" +
        "window.ga=function(){};" +
        "window.gtag=function(){};" +
        "window.fbq=function(){};" +
        "window._paq=[];" +
        "window.mixpanel={track:function(){},identify:function(){}};" +
        "window.amplitude={getInstance:function(){return{logEvent:function(){},setUserId:function(){}};}};" +
        "})();";

    public static void injectAdBlock(Object webView) {
        injectJs(webView, DEFAULT_AD_BLOCKER_JS);
    }

    public static void injectTrackerBlock(Object webView) {
        injectJs(webView, DEFAULT_TRACKER_BLOCKER_JS);
    }

    public static void injectCustomCss(Object webView, String cssSelector) {
        String script =
            "javascript:(function(){" +
            "var s=document.getElementById('morphe-custom-css')||document.createElement('style');" +
            "s.id='morphe-custom-css';" +
            "s.textContent='" + cssSelector + "{display:none!important;visibility:hidden!important;height:0!important;pointer-events:none!important;}';" +
            "(document.head||document.documentElement).appendChild(s);" +
            "})();";
        injectJs(webView, script);
    }

    public static void injectJs(Object webView, String script) {
        if (webView == null) return;
        try {
            Class<?> clazz = webView.getClass();
            Method postMethod = clazz.getMethod("post", Runnable.class);
            final Method loadUrlMethod = clazz.getMethod("loadUrl", String.class);
            final Object target = webView;
            final String js = script;
            postMethod.invoke(webView, new Runnable() {
                @Override
                public void run() {
                    try {
                        loadUrlMethod.invoke(target, js);
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }
}
