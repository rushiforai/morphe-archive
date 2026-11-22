package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Dialog;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

/** Hands the draft to Futaba's actual browser form, which owns submission and validation. */
final class FutabaPostingPopup {
    static final String OFFICIAL = "futabaOfficialPostingPopup";
    static final String DIRECT = "futabaDirectPostingPopup";
    private static final Map<Object, Binding> EDITORS = new WeakHashMap<>();
    private static final Map<Activity, Binding> DIRECT_EDITORS = new WeakHashMap<>();
    private static final int IMAGE_CHUNK = 96 * 1024;
    private static final java.util.regex.Pattern AD_FRAME = java.util.regex.Pattern.compile(
            "/bin/(?:sphead|headrect|tue3|spfoot_a|foot2_a|hsi1|foot4_ab|hsif|overlay|radif)\\.htm");
    private static final String SUCCESS = "'完了'===document.getElementById('retmestip')?.textContent.trim()";
    // Keep the site's original form and handwriting controls in the document.
    private static final String FORM_ONLY =
            "for(let current=f;current&&current!==document.body;current=current.parentElement){"
            + "for(const node of current.parentElement.childNodes){if(node.nodeType===3&&node.textContent.trim())node.textContent='';}"
            + "for(const sibling of current.parentElement.children){if(sibling!==current)"
            + "sibling.style.setProperty('display','none','important');}}"
            + "let viewport=document.querySelector('meta[name=viewport]');"
            + "if(!viewport){viewport=document.createElement('meta');viewport.name='viewport';document.head.append(viewport);}"
            + "viewport.content='width=device-width, initial-scale=1';"
            + "const submit=f.querySelector('input[type=submit],button[type=submit]');"
            + "if(submit){const actions=document.createElement('div');actions.id='haiagaru-post-actions';"
            + "actions.append(submit);f.append(actions);}"
            + "const textOnly=f.elements.textonly;"
            + "if(textOnly&&textOnly.closest('label'))textOnly.closest('label').classList.add('haiagaru-text-only');"
            + "const style=document.createElement('style');"
            + "style.textContent='body{margin:8px} #fm{margin:0 auto!important;max-width:620px} #fm table{width:100%;max-width:100%} "
            + "#fm .ftb2,#fm #reszb,#fm #usercounter,#fm iframe[src*=\"dec.2chan.net/bin/\"]{display:none!important} "
            + "#fm textarea,#fm input:not([type=checkbox]):not([type=submit]){max-width:100%;box-sizing:border-box} "
            + "#fm textarea{width:100%} #fm td{min-width:0} #fm canvas{max-width:100%} "
            + "#haiagaru-post-actions{text-align:center;padding:12px 0 4px} "
            + "#fm input[type=file]::file-selector-button{min-height:56px;font-size:18px;padding:10px 14px} "
            + "#fm input[type=file]::-webkit-file-upload-button{min-height:56px;font-size:18px;padding:10px 14px} "
            + "#haiagaru-post-actions input,#haiagaru-post-actions button,"
            + "#fm #oebtnd a,#fm #oebtnd span[onclick],#fm .haiagaru-text-only"
            + "{min-height:56px;font-size:18px;padding:10px 14px;box-sizing:border-box} "
            + "#haiagaru-post-actions input,#haiagaru-post-actions button{min-width:180px;min-height:64px;font-size:20px} "
            + "#fm #oebtnd a,#fm #oebtnd span[onclick],#fm .haiagaru-text-only{display:inline-flex;align-items:center;justify-content:center} "
            + "#fm input[name=textonly]{width:24px;height:24px;margin:0 8px 0 0}';"
            + "document.head.append(style);window.scrollTo(0,0);";

    private static final class Binding {
        final WeakReference<Activity> activity;
        final WeakReference<EditText> body, name, mail, title;
        final String target, thread, page;
        final SiteBoardProtocol.Board board;
        boolean open;

        Binding(Activity activity, EditText body, EditText name, EditText mail, EditText title,
                String target, SiteBoardProtocol.Board board, String thread) {
            this.activity = new WeakReference<>(activity);
            this.body = new WeakReference<>(body);
            this.name = new WeakReference<>(name);
            this.mail = new WeakReference<>(mail);
            this.title = new WeakReference<>(title);
            this.target = target;
            this.board = board;
            this.thread = thread;
            page = thread.equals("new") ? board.url + "futaba.htm" : board.threadUrl(thread);
        }
    }

    static void bind(Object fragment, Object model, View root, EditText body, EditText name,
                     EditText title, String url, boolean newThread) {
        if (url == null) return;
        Activity activity = ExternalBoardAuth.activity(fragment);
        if (activity == null) return;
        try {
            SiteBoardGateway gateway = SiteBoardGateway.get(activity);
            String target = gateway.attachmentTarget(url);
            int separator = target.indexOf(':');
            SiteBoardProtocol.Board board = gateway.boards.get(target.substring(0, separator));
            String thread = target.substring(separator + 1);
            if (!eligible(board) || newThread != thread.equals("new")) return;
            Binding binding = new Binding(activity, body, name, findMail(root), title, target, board, thread);
            EDITORS.put(fragment, binding);
            EDITORS.put(model, binding);
        } catch (IOException ignored) {
            // Native boards and disabled additional boards have no attachment target.
        }
    }

    static boolean eligible(SiteBoardProtocol.Board board) {
        return board != null && board.kind.equals("futaba") && board.path.equals("b")
                && (board.url.equals("https://img.2chan.net/b/") || board.url.equals("https://may.2chan.net/b/"));
    }

    static boolean toolbar(Object fragment, Activity activity) {
        if (!FeatureSwitches.enabled(OFFICIAL, true) || !FeatureSwitches.enabled(DIRECT, true)) return false;
        try {
            String version = activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName;
            String url = NativeThreadContext.url(NativeThreadContext.board(fragment, version), version, 0);
            return openDirect(activity, url);
        } catch (Exception unavailable) {
            return false;
        }
    }

    static void openFromSettings(Activity activity) {
        SiteBoardGateway gateway = SiteBoardGateway.get(activity);
        java.util.List<String> keys = new java.util.ArrayList<>();
        java.util.List<String> labels = new java.util.ArrayList<>();
        for (String key : new java.util.TreeSet<>(gateway.boards.keySet())) {
            SiteBoardProtocol.Board board = gateway.boards.get(key);
            if (!eligible(board) || !gateway.boardEnabled(key)) continue;
            keys.add(key);
            labels.add("ふたば " + board.host);
        }
        if (keys.isEmpty()) {
            Toast.makeText(activity, "追加掲示板でふたばの img または may を有効にしてください", Toast.LENGTH_LONG).show();
            return;
        }
        new android.app.AlertDialog.Builder(activity).setTitle("新規投稿する板")
                .setItems(labels.toArray(new String[0]), (dialog, index) -> {
                    try {
                        if (openDirect(activity, gateway.nativeUrl(keys.get(index), null))) return;
                    } catch (IOException ignored) { }
                    Toast.makeText(activity, "投稿先を開けませんでした", Toast.LENGTH_SHORT).show();
                }).setNegativeButton("キャンセル", null).show();
    }

    private static boolean openDirect(Activity activity, String url) {
        if (url == null || activity.isFinishing() || activity.isDestroyed()) return false;
        SiteBoardGateway gateway = SiteBoardGateway.get(activity);
        String target;
        try { target = gateway.attachmentTarget(url); }
        catch (IOException ignored) { return false; }
        int separator = target.indexOf(':');
        SiteBoardProtocol.Board board = gateway.boards.get(target.substring(0, separator));
        if (!eligible(board)) return false;
        Binding previous = DIRECT_EDITORS.get(activity);
        if (previous != null && previous.open) return true;
        Binding binding = new Binding(activity, null, null, null, null, target, board,
                target.substring(separator + 1));
        try {
            new Popup(activity, binding, gateway, "", gateway.popupAttachment(target)).show();
            DIRECT_EDITORS.put(activity, binding);
        } catch (IOException failure) {
            Toast.makeText(activity, failure.getMessage(), Toast.LENGTH_LONG).show();
        } catch (RuntimeException unavailable) {
            Toast.makeText(activity, "投稿画面を開けませんでした", Toast.LENGTH_LONG).show();
        }
        return true;
    }

    static boolean intercept(Object owner) {
        if (!FeatureSwitches.enabled(OFFICIAL, true)) return false;
        Binding binding = EDITORS.get(owner);
        if (binding == null) return false;
        Activity activity = binding.activity.get();
        EditText body = binding.body.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()
                || body == null || !body.isAttachedToWindow()) return false;
        if (binding.open) return true;

        try {
            SiteBoardGateway gateway = SiteBoardGateway.get(activity);
            if (!gateway.boardEnabled(binding.target.substring(0, binding.target.indexOf(':'))))
                throw new IOException("この板の「使用する」をオンにしてください");
            String draft = body.getText().toString();
            SitePostProtocol.Image attachment = gateway.popupAttachment(binding.target);
            new Popup(activity, binding, gateway, draft, attachment).show();
        } catch (IOException failure) {
            Toast.makeText(activity, failure.getMessage(), Toast.LENGTH_LONG).show();
        } catch (RuntimeException failure) {
            android.util.Log.w("Haiagaru", "Futaba posting popup unavailable", failure);
            Toast.makeText(activity, "投稿画面を開けませんでした", Toast.LENGTH_LONG).show();
        }
        return true;
    }

    static boolean adResource(Uri uri) {
        String host = uri.getHost();
        if ("j.microad.net".equals(host) || "adm.shinobi.jp".equals(host)
                || "js.boost-next.co.jp".equals(host)) return true;
        String path = uri.getPath();
        return "dec.2chan.net".equals(host) && path != null && AD_FRAME.matcher(path).matches();
    }

    private static EditText findMail(View view) {
        if (view instanceof EditText && PostMailInput.isMail((EditText) view)) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = findMail(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String value(WeakReference<EditText> reference) {
        EditText field = reference.get();
        return field == null ? "" : field.getText().toString();
    }

    private static final class Popup {
        final Binding binding;
        final SiteBoardGateway gateway;
        final String draft;
        final SitePostProtocol.Image attachment;
        final Dialog dialog;
        final WebView web;
        final TextView status;
        final boolean newThread;
        boolean seeded, submitted, closed;
        boolean initialScaleSet;
        String pickerToken;
        int requestedHeight;
        final Runnable poll = this::checkReply;

        Popup(Activity activity, Binding binding, SiteBoardGateway gateway, String draft,
              SitePostProtocol.Image attachment) {
            this.binding = binding;
            this.gateway = gateway;
            this.draft = draft;
            this.attachment = attachment;
            newThread = binding.thread.equals("new");
            dialog = new Dialog(activity);
            dialog.setTitle("ふたばの書き込み");
            FrameLayout content = new FrameLayout(activity);
            web = new WebView(activity);
            content.addView(web, new FrameLayout.LayoutParams(-1, -1));
            status = new TextView(activity);
            status.setGravity(android.view.Gravity.CENTER);
            status.setText("投稿フォームを読み込んでいます…");
            content.addView(status, new FrameLayout.LayoutParams(-1, -1));
            web.setVisibility(View.INVISIBLE);
            dialog.setContentView(content);
            WebSettings settings = web.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            settings.setAllowFileAccess(false);
            settings.setAllowContentAccess(false);
            settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
            settings.setUseWideViewPort(true);
            settings.setLoadWithOverviewMode(true);
            settings.setBuiltInZoomControls(true);
            settings.setDisplayZoomControls(false);
            CookieManager.getInstance().setAcceptThirdPartyCookies(web, false);
            web.setWebChromeClient(new WebChromeClient() {
                @Override public boolean onShowFileChooser(WebView view, android.webkit.ValueCallback<Uri[]> callback,
                                                           FileChooserParams params) {
                    if (closed || !binding.page.equals(view.getUrl())) return false;
                    SitePostingImageActivity.finishWebPicker(pickerToken, null);
                    pickerToken = SitePostingImageActivity.openWebPicker(activity, callback);
                    return true;
                }
            });
            web.setWebViewClient(new WebViewClient() {
                @Override public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
                    if (!request.isForMainFrame() && adResource(request.getUrl())) {
                        return new WebResourceResponse("text/plain", "UTF-8",
                                new java.io.ByteArrayInputStream(new byte[0]));
                    }
                    return null;
                }
                @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                    return request.isForMainFrame() && !allows(request.getUrl());
                }
                @Override public boolean shouldOverrideUrlLoading(WebView view, String url) {
                    return !allows(Uri.parse(url));
                }
                @Override public void onPageFinished(WebView view, String url) {
                    if (closed || !allows(Uri.parse(url))) return;
                    if (!seeded && binding.page.equals(url)) seed();
                    else if (seeded && newThread) checkNewThread();
                }
                @Override public void onReceivedError(WebView view, WebResourceRequest request,
                                                       android.webkit.WebResourceError error) {
                    if (request.isForMainFrame() && !seeded) status.setText("投稿フォームを読み込めませんでした");
                }
            });
        }

        void show() {
            dialog.setOnDismissListener(ignored -> {
                closed = true;
                binding.open = false;
                web.removeCallbacks(poll);
                SitePostingImageActivity.finishWebPicker(pickerToken, null);
                web.stopLoading();
                ((ViewGroup) web.getParent()).removeView(web);
                web.destroy();
            });
            dialog.show();
            binding.open = true;
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            dialog.getWindow().setLayout(-1, Math.round(300 * web.getResources().getDisplayMetrics().density));
            web.loadUrl(binding.page);
        }

        boolean allows(Uri url) {
            if (!"https".equals(url.getScheme()) || !binding.board.host.equals(url.getHost())
                    || url.getUserInfo() != null || url.getPort() != -1) return false;
            String path = url.getPath();
            return path != null && (path.equals(Uri.parse(binding.page).getPath())
                    || path.equals("/b/futaba.php") || path.equals("/b/futaba.htm")
                    || path.equals("/b/") || newThread && path.matches("/b/res/[1-9][0-9]{0,11}\\.htm"));
        }

        void seed() {
            seeded = true;
            String number = newThread ? "" : binding.thread;
            String script = "(()=>{if(location.href!==" + JSONObject.quote(binding.page)
                    + ")return false;const f=document.querySelector('form#fm');"
                    + "if(!f||f.method!=='post'||new URL(f.action).origin!==location.origin"
                    + "||new URL(f.action).pathname!=='/b/futaba.php'||f.elements.mode?.value!=='regist'"
                    + "||(f.elements.resto?.value||'').replace(/^0$/,'')!==" + JSONObject.quote(number)
                    + "||!f.elements.com||typeof ptfk!=='function')return false;"
                    + "const set=(k,v)=>{if(f.elements[k])f.elements[k].value=v;};"
                    + "let body=" + JSONObject.quote(draft) + ";"
                    + (newThread ? "" : "const ids=[null," + JSONObject.quote(number) + "];"
                        + "document.querySelectorAll('.thre[data-res=\"'+f.elements.resto.value+'\"] td.rtd').forEach(r=>{"
                        + "const id=r.querySelector('.cno');ids.push(id?.textContent.match(/No\\.([1-9][0-9]{0,11})/)?.[1]);});"
                        + "body=body.replace(/>>([1-9][0-9]{0,5})(?:-([1-9][0-9]{0,5}))?/g,"
                        + "(all,a,b)=>ids[a]&&(!b||ids[b])?'>>'+ids[a]+(b?'-'+ids[b]:''):all);")
                    + "set('com',body);set('name'," + JSONObject.quote(value(binding.name))
                    + ");set('email'," + JSONObject.quote(value(binding.mail)) + ");"
                    + (newThread ? "set('sub'," + JSONObject.quote(value(binding.title)) + ");" : "")
                    + "set('pwd'," + JSONObject.quote(gateway.prefs.getString("password:" + binding.board.url, "")) + ");"
                    + "f.addEventListener('submit',()=>sessionStorage.setItem('haiagaruFutabaSubmitting','1'));"
                    + "sessionStorage.removeItem('haiagaruFutabaSubmitting');"
                    + FORM_ONLY
                    + "window.haiagaruFutabaParts=[];return true;})()";
            web.evaluateJavascript(script, result -> {
                if (closed) return;
                if (!"true".equals(result)) {
                    status.setText("このページに投稿フォームがありません");
                    return;
                }
                if (attachment == null) reveal();
                else copyImage(0);
            });
        }

        void copyImage(int offset) {
            if (closed) return;
            int length = Math.min(IMAGE_CHUNK, attachment.bytes.length - offset);
            if (length != 0) {
                String encoded = Base64.encodeToString(attachment.bytes, offset, length, Base64.NO_WRAP);
                web.evaluateJavascript("location.href===" + JSONObject.quote(binding.page)
                        + "?window.haiagaruFutabaParts?.push(Uint8Array.from(atob("
                        + JSONObject.quote(encoded) + "),c=>c.charCodeAt(0))):null", result -> {
                    if (!closed && !"null".equals(result)) copyImage(offset + length);
                    else if (!closed) status.setText("添付画像を投稿フォームに渡せませんでした");
                });
                return;
            }
            web.evaluateJavascript("(()=>{if(location.href!==" + JSONObject.quote(binding.page)
                    + ")return false;const el=document.querySelector('form#fm input[name=upfile]');"
                    + "if(!el||typeof DataTransfer!=='function')return false;const dt=new DataTransfer();"
                    + "dt.items.add(new File(window.haiagaruFutabaParts,"
                    + JSONObject.quote(attachment.displayName) + ",{type:" + JSONObject.quote(attachment.type)
                    + "}));delete window.haiagaruFutabaParts;el.files=dt.files;"
                    + "el.dispatchEvent(new Event('change',{bubbles:true}));"
                    + "const textOnly=el.form.elements.textonly;if(textOnly)textOnly.checked=false;"
                    + "return el.files.length===1;})()", result -> {
                if (closed) return;
                if ("true".equals(result)) reveal();
                else status.setText("添付画像を投稿フォームに渡せませんでした");
            });
        }

        void reveal() {
            status.setVisibility(View.GONE);
            web.setVisibility(View.VISIBLE);
            web.post(poll);
        }

        void checkReply() {
            if (closed) return;
            web.evaluateJavascript("(()=>{if(location.href!==" + JSONObject.quote(binding.page)
                    + ")return null;const f=document.querySelector('form#fm');return [(" + SUCCESS
                    + "),f?f.getBoundingClientRect().height:0,window.innerWidth,f?f.scrollWidth:0,"
                    + "f?f.getBoundingClientRect().width:0];})()", result -> {
                if (closed) return;
                try {
                    JSONArray state = new JSONArray(result);
                    if (state.getBoolean(0)) { complete(); return; }
                    resize(state.optDouble(1), state.optDouble(2), state.optDouble(3), state.optDouble(4));
                } catch (JSONException ignored) { }
                web.postDelayed(poll, 250);
            });
        }

        void resize(double formHeight, double cssWidth, double contentWidth, double formWidth) {
            if (!(formHeight > 0 && cssWidth > 0) || web.getWidth() == 0) return;
            android.util.DisplayMetrics display = web.getResources().getDisplayMetrics();
            int chrome = dialog.getWindow().getDecorView().getHeight() - web.getHeight();
            int maxHeight = Math.round(display.heightPixels * .86f);
            double pixelsPerCssPixel = web.getWidth() / cssWidth;
            int verticalSpace = Math.max(0, chrome) + Math.round(18 * display.density);
            if (!initialScaleSet) {
                initialScaleSet = true;
                double scale = Math.min((maxHeight - verticalSpace) / (formHeight * pixelsPerCssPixel),
                        (cssWidth - 16) / Math.max(formWidth, contentWidth));
                if (scale > 0 && scale < .99) {
                    web.evaluateJavascript("(()=>{const f=document.querySelector('form#fm');if(!f)return;"
                            + "f.style.width='" + formWidth + "px';f.style.zoom='" + scale + "';})()", null);
                    return;
                }
            }
            int target = Math.min(maxHeight, (int) Math.ceil(formHeight * pixelsPerCssPixel) + verticalSpace);
            if (target > 0 && Math.abs(requestedHeight - target) > 3) {
                requestedHeight = target;
                dialog.getWindow().setLayout(-1, target);
            }
        }

        void checkNewThread() {
            if (binding.page.equals(web.getUrl())) return;
            web.evaluateJavascript("(()=>{if(sessionStorage.getItem('haiagaruFutabaSubmitting')!=='1')return false;"
                    + "const m=document.querySelector('meta[http-equiv=refresh i]');"
                    + "return location.pathname==='/b/futaba.php'&&!!m"
                    + "&&/;\\s*url\\s*=\\s*(?:\\.\\/)?futaba\\.htm\\s*$/i.test(m.content)"
                    + "&&document.body.innerText.includes('画面を切り替えます');})()", result -> {
                if (!closed && "true".equals(result)) complete();
            });
        }

        void complete() {
            if (closed || submitted) return;
            submitted = true;
            gateway.clearPopupAttachment(binding.target, attachment);
            EditText body = binding.body.get();
            if (body != null && TextUtils.equals(body.getText(), draft)) body.setText("");
            Toast.makeText(web.getContext(), "書き込みました", Toast.LENGTH_SHORT).show();
            dialog.dismiss();
        }
    }

    private FutabaPostingPopup() {}
}
