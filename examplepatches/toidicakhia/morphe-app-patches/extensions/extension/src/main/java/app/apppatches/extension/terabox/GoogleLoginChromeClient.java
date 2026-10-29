/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.extension.terabox;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Message;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import org.json.JSONObject;

@SuppressWarnings("unused")
public class GoogleLoginChromeClient extends WebChromeClient {

    private static final String LOGIN_PATH = "/hylogin/";

    private static final String RELAY_SCHEME = "storagerelay:";

    private static final String GOOGLE_ACCOUNTS_HOST = "accounts.google.com";

    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 "
                    + "(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36";

    private static final String OPENER_RELAY_SCRIPT = """
            (function(){try{if(window.__tbShim)return;window.__tbShim=1;\
            var o=window.opener;var relay={postMessage:function(d,t){\
            try{window.__tbCaptured=(typeof d==='string')?d:JSON.stringify(d);}catch(e){}\
            try{if(o&&o.postMessage)o.postMessage(d,t);}catch(e){}}};\
            try{Object.defineProperty(window,'opener',{configurable:true,get:function(){return relay}});}\
            catch(e){window.opener=relay;}}catch(e){}})()\
            """;

    private static final String READ_CREDENTIAL_SCRIPT = """
            (function(){var c=window.__tbCaptured||'';\
            if(!c&&document.documentElement){var m=document.documentElement.outerHTML.match(/eyJ[A-Za-z0-9_-]{10,}\\.[A-Za-z0-9_-]{10,}\\.[A-Za-z0-9_-]+/);\
            if(m)c=m[0];}return c;})()\
            """;

    private static final String RESET_BUTTON_SCRIPT = "window.__tbReset&&window.__tbReset()";

    private static final String LOGIN_PAGE_SCRIPT = """
            (function(){if(window.__tbFix)return;window.__tbFix=1;\
            var rawFetch=window.fetch?window.fetch.bind(window):null;\
            function send(d){try{var p={state:1,ndus:d.ndus,uid:String(d.userid||''),\
            displayName:d.displayName||'',headUrl:d.headUrl||'',\
            region_domain_prefix:d.region_domain_prefix||'www',cur_country:d.cur_country||'',\
            reg_country:d.reg_country||'',reg_time:d.reg_time||0};\
            var u='dubox://user/tbsend/sendLoginResults?params='+encodeURIComponent(JSON.stringify(p));\
            var f=document.createElement('iframe');f.style.display='none';\
            document.documentElement.appendChild(f);f.src=u;\
            setTimeout(function(){try{f.remove()}catch(e){}},1500);}catch(e){}}\
            function rewrite(v){v=String(v);\
            if(v.indexOf('/passport/ssologin')<0||v.indexOf('__tbraw')>=0)return v;\
            v=v.replace(/([?&])client=[^&]*/,'$1client=web')\
            .replace(/([?&])clienttype=[^&]*/,'$1clienttype=0');\
            var cb=(v.match(/[?&]callback=([^&]*)/)||[])[1];\
            var j=v.replace(/([?&])callback=[^&]*/,'$1__tbraw=1');\
            if(rawFetch)rawFetch(j,{credentials:'include'}).then(function(r){return r.text()})\
            .then(function(t){\
            var a=t.indexOf('{'),b=t.lastIndexOf('}');\
            var o=JSON.parse(t.slice(a,b+1));\
            var ok=o&&o.code===0&&o.data&&o.data.ndus;\
            if(ok)send(o.data);\
            if(!ok&&cb&&window[cb])window[cb](o);}).catch(function(e){});\
            return 'data:text/javascript,';}\
            try{var d=Object.getOwnPropertyDescriptor(HTMLScriptElement.prototype,'src');\
            if(d&&d.set)Object.defineProperty(HTMLScriptElement.prototype,'src',{configurable:true,\
            enumerable:d.enumerable,get:d.get,set:function(v){d.set.call(this,rewrite(v))}});\
            var sa=Element.prototype.setAttribute;Element.prototype.setAttribute=function(n,v){\
            if(String(n).toLowerCase()==='src')v=rewrite(v);return sa.call(this,n,v)};\
            if(rawFetch)window.fetch=function(u,o){if(typeof u==='string')u=rewrite(u);return rawFetch(u,o)};\
            var oo=XMLHttpRequest.prototype.open;XMLHttpRequest.prototype.open=function(m,u){\
            arguments[1]=rewrite(u);return oo.apply(this,arguments)};}catch(e){}\
            window.__tbDeliver=function(c){try{if(window.__tbCb)window.__tbCb({credential:c,select_by:'btn'});}catch(e){}};\
            window.__tbReset=function(){\
            try{var g=window.google&&window.google.accounts&&window.google.accounts.id;\
            if(g&&g.cancel)g.cancel();\
            var h=document.querySelector('.hidden-google-btn');\
            if(g&&h){var d=h.firstElementChild||h;d.innerHTML='';\
            g.renderButton(d,{type:'standard',theme:'outline',size:'large',\
            width:Math.round(h.getBoundingClientRect().width)||340,text:'continue_with'});\
            }}catch(e){}};\
            var w=false,n=0,t=setInterval(function(){\
            var g=window.google&&window.google.accounts&&window.google.accounts.id;\
            if(g&&!w){w=true;var o2=g.initialize;\
            g.initialize=function(c){if(c&&c.callback)window.__tbCb=c.callback;return o2.apply(this,arguments)};}\
            var h=document.querySelector('.hidden-google-btn');\
            if(h){var d2=h.firstElementChild||h;if(!d2.id)d2.id='google_login_button';\
            if(g&&!d2.__tb){d2.__tb=1;try{d2.innerHTML='';\
            g.renderButton(d2,{type:'standard',theme:'outline',size:'large',\
            width:Math.round(h.getBoundingClientRect().width)||340,text:'continue_with'});\
            }catch(e){d2.__tb=0;}}\
            if(d2.__tb&&h.querySelector('iframe')){clearInterval(t);return;}}\
            if(++n>300)clearInterval(t);},50);})()\
            """;

    private static final String APP_UA_TOKEN = "dubox;";

    private static final String WEBKIT_TOKEN = "AppleWebKit/537.36";

    public static void setBrowserUserAgent(WebSettings settings, String userAgent) {
        if (userAgent == null || userAgent.length() == 0) {
            return;
        }

        int token = userAgent.indexOf(APP_UA_TOKEN);
        String appUserAgent = (token >= 0) ? userAgent.substring(token) : userAgent;

        settings.setUserAgentString(appUserAgent + " " + WEBKIT_TOKEN);
    }

    public static void injectLoginScript(WebView view, int newProgress) {
        if (newProgress < 10) {
            return;
        }

        String url = view.getUrl();
        if (url == null || !url.contains(LOGIN_PATH)) {
            return;
        }

        view.evaluateJavascript(LOGIN_PAGE_SCRIPT, null);
    }

    public static boolean openPopup(
            WebView view, boolean isDialog, boolean isUserGesture, Message resultMsg) {
        return openPopup(view, resultMsg);
    }

    private static boolean openPopup(WebView opener, Message resultMsg) {
        Activity activity = activityOf(opener.getContext());
        if (activity == null || activity.isFinishing()) {
            return false;
        }

        WebView popup = new WebView(activity);
        WebSettings settings = popup.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setSupportMultipleWindows(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setUserAgentString(opener.getSettings().getUserAgentString());
        CookieManager.getInstance().setAcceptThirdPartyCookies(popup, true);

        Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        FrameLayout container = new FrameLayout(activity);
        container.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(0, insets.getSystemWindowInsetTop(), 0, insets.getSystemWindowInsetBottom());
            return insets;
        });
        container.addView(popup);
        dialog.setContentView(container);
        dialog.setOnDismissListener((d) -> {
            opener.evaluateJavascript(RESET_BUTTON_SCRIPT, null);
            popup.destroy();
        });
        PopupViewClient viewClient = new PopupViewClient(opener, dialog);
        popup.setWebViewClient(viewClient);
        popup.setWebChromeClient(new PopupChromeClient(viewClient));
        dialog.show();

        WebView.WebViewTransport transport = (WebView.WebViewTransport) resultMsg.obj;
        transport.setWebView(popup);
        resultMsg.sendToTarget();
        return true;
    }

    private static boolean completeLogin(Activity activity, String credential) {
        if (activity == null || credential == null || credential.length() == 0) {
            return false;
        }

        try {
            String token = URLEncoder.encode(credential, StandardCharsets.UTF_8.name())
                    .replace("+", "%20");
            String url = "https://www.terabox.com/passport/ssologin"
                    + "?lang=en&type=3&client=web&clienttype=0&support_unify=1"
                    + "&pass_version=1.0&clientfrom=web"
                    + "&first_referer=https%3A%2F%2Fwww.terabox.com%2F"
                    + "&access_token=" + token;
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(20000);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Referer", "https://www.terabox.com/wap/hylogin/login");
            connection.setRequestProperty("Origin", "https://www.terabox.com");
            connection.setRequestProperty("Accept", "*/*");

            int status = connection.getResponseCode();
            InputStream stream = (status >= 400)
                    ? connection.getErrorStream()
                    : connection.getInputStream();
            String body = readAll(stream);
            connection.disconnect();

            int start = body.indexOf('{');
            int end = body.lastIndexOf('}');
            if (start < 0 || end <= start) {
                return false;
            }

            JSONObject response = new JSONObject(body.substring(start, end + 1));
            if (response.optInt("code", -1) != 0) {
                return false;
            }

            JSONObject data = response.optJSONObject("data");
            if (data == null) {
                return false;
            }

            String ndus = data.optString("ndus", "");
            if (ndus.length() == 0) {
                return false;
            }

            JSONObject params = new JSONObject();
            params.put("state", 1);
            params.put("ndus", ndus);
            params.put("uid", data.optString("userid", ""));
            params.put("displayName", data.optString("displayName", ""));
            params.put("headUrl", data.optString("headUrl", ""));
            params.put("region_domain_prefix", data.optString("region_domain_prefix", "www"));
            params.put("cur_country", data.optString("cur_country", ""));
            params.put("reg_country", data.optString("reg_country", ""));
            params.put("reg_time", data.optLong("reg_time", 0));

            String deepLink = "dubox://user/tbsend/sendLoginResults?params="
                    + URLEncoder.encode(params.toString(), StandardCharsets.UTF_8.name())
                    .replace("+", "%20");
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(deepLink));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.runOnUiThread(() -> activity.startActivity(intent));
            return true;
        } catch (Exception ignored) {
            return false;
        }
    }

    private static String readAll(InputStream stream) {
        if (stream == null) {
            return "";
        }

        StringBuilder builder = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            char[] buffer = new char[4096];
            int read;
            while ((read = reader.read(buffer)) >= 0) {
                builder.append(buffer, 0, read);
                if (builder.length() > 1048576) {
                    break;
                }
            }
        } catch (Exception ignored) {
        }
        return builder.toString();
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static final class PopupViewClient extends WebViewClient {

        private final WebView opener;

        private final Dialog dialog;

        PopupViewClient(WebView opener, Dialog dialog) {
            this.opener = opener;
            this.dialog = dialog;
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            return interceptRelayUrl(request.getUrl().toString());
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return interceptRelayUrl(url);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            super.onPageStarted(view, url, favicon);

            if (isGoogleAccountsPage(url)) {
                view.evaluateJavascript(OPENER_RELAY_SCRIPT, null);
            }
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            super.onPageFinished(view, url);

            if (!isGoogleAccountsPage(url)) {
                return;
            }

            view.evaluateJavascript(READ_CREDENTIAL_SCRIPT, (value) -> {
                String credential = jwtOf(value);
                if (credential == null) {
                    return;
                }

                deliver(credential);
                dismiss();
            });
        }

        void relayCapturedCredentialAndClose(WebView view) {
            view.evaluateJavascript(READ_CREDENTIAL_SCRIPT, (value) -> {
                deliver(jwtOf(value));
                dismiss();
            });
        }

        private void dismiss() {
            if (this.dialog.isShowing()) {
                this.dialog.dismiss();
            }
        }

        private void deliver(String credential) {
            if (credential == null) {
                return;
            }

            this.opener.evaluateJavascript(
                    "(function(){return !!(window.__tbCb&&window.__tbDeliver)})()",
                    value -> {
                        if ("true".equals(value)) {
                            this.opener.evaluateJavascript(
                                    "window.__tbDeliver(" + JSONObject.quote(credential) + ")",
                                    null);
                            return;
                        }

                        Activity activity = activityOf(this.opener.getContext());
                        new Thread(() -> {
                            if (!completeLogin(activity, credential)) {
                                this.opener.post(() -> this.opener.evaluateJavascript(
                                        "window.__tbDeliver&&window.__tbDeliver("
                                                + JSONObject.quote(credential) + ")", null));
                            }
                        }, "TeraBoxGoogleLogin").start();
                    });
        }

        private boolean interceptRelayUrl(String url) {
            if (!url.startsWith(RELAY_SCHEME)) {
                return false;
            }

            deliver(credentialOf(url));
            dismiss();
            return true;
        }

        private static String jwtOf(String value) {
            if (value == null) {
                return null;
            }

            int start = value.indexOf("eyJ");
            if (start < 0) {
                return null;
            }

            int end = start;
            while (end < value.length() && isTokenChar(value.charAt(end))) {
                end++;
            }

            String token = value.substring(start, end);
            return (token.indexOf('.') > 0) ? token : null;
        }

        private static boolean isTokenChar(char c) {
            return Character.isLetterOrDigit(c) || c == '.' || c == '_' || c == '-';
        }

        private static boolean isGoogleAccountsPage(String url) {
            return url != null && GOOGLE_ACCOUNTS_HOST.equals(Uri.parse(url).getHost());
        }

        private static String credentialOf(String url) {
            for (String key : new String[] { "credential=", "id_token=", "access_token=" }) {
                int start = url.indexOf(key);
                if (start < 0) {
                    continue;
                }

                start += key.length();
                int end = url.indexOf('&', start);
                return (end < 0) ? url.substring(start) : url.substring(start, end);
            }
            return null;
        }

    }

    private static final class PopupChromeClient extends WebChromeClient {

        private final PopupViewClient viewClient;

        PopupChromeClient(PopupViewClient viewClient) {
            this.viewClient = viewClient;
        }

        @Override
        public boolean onCreateWindow(WebView view, boolean isDialog, boolean isUserGesture, Message resultMsg) {
            return openPopup(view, resultMsg);
        }

        @Override
        public void onCloseWindow(WebView window) {
            this.viewClient.relayCapturedCredentialAndClose(window);
        }

    }

}
