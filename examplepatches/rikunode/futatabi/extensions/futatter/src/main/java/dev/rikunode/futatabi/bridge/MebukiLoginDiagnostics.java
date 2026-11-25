package dev.rikunode.futatabi.bridge;

import java.net.URI;
import android.os.SystemClock;
import android.util.Log;
import android.webkit.ConsoleMessage;
import android.webkit.WebView;
import java.util.Locale;
import org.json.JSONObject;
import org.json.JSONTokener;

/** Pre-credential, separate diagnostic build only. Never logs raw URLs or console text. */
final class MebukiLoginDiagnostics {
    static final boolean ENABLED = false;
    static final String TAG = "FutatabiMebukiDiag";
    private final long start = SystemClock.elapsedRealtime();
    private int events, consoleEvents;
    private boolean stopped;

    void event(String event, String url, String details) {
        if (!ENABLED || stopped || events >= 160) return;
        Log.i(TAG, "n=" + (++events) + " ms=" + (SystemClock.elapsedRealtime() - start)
                + " " + event + " " + route(url) + " " + details);
    }

    // Fixed route categories only: no arbitrary path, URL query, fragment, code or state.
    static String route(String raw) {
        if (raw == null) return "route=none";
        try {
            URI uri = URI.create(raw);
            String host = uri.getHost();
            String scheme = uri.getScheme();
            MebukiLoginFlow.Page page = MebukiLoginFlow.page(scheme, host, uri.getPath(), false);
            if (page == MebukiLoginFlow.Page.OTHER) return "route=other";
            String path = uri.getPath();
            String route = "other";
            if ("/".equals(path)) route = "root";
            else if ("/auth/callback".equals(path)) route = "callback";
            else if ("/i/oauth2/authorize".equals(path) || "/oauth2/authorize".equals(path)
                    || "/oauth/authorize".equals(path) || "/oauth/authenticate".equals(path)) route = "authorize";
            else if ("/i/flow/login".equals(path) || "/login".equals(path)) route = "login";
            else if (path != null && path.startsWith("/api/auth/callback/")) route = "provider_callback";
            // Only recognized provider domains, not arbitrary subdomain text.
            String domain = "other";
            if (host != null) {
                String h = host.toLowerCase(Locale.ROOT);
                for (String known : new String[]{"mebuki.moe", "x.com", "twitter.com", "api.twitter.com",
                        "api.x.com", "discord.com", "discordapp.com", "accounts.google.com"}) {
                    if (known.equals(h)) { domain = known; break; }
                }
            }
            return "provider=" + page.name() + " host=" + domain + " route=" + route;
        } catch (RuntimeException ignored) { return "route=invalid"; }
    }

    static String consoleCategory(String raw) {
        String s = raw == null ? "" : raw.toLowerCase(Locale.ROOT);
        if (s.contains("popup") || s.contains("window.open") || s.contains("new window")) return "window";
        if (s.contains("captcha") || s.contains("challenge") || s.contains("turnstile")) return "challenge";
        if (s.contains("content security policy") || s.contains("csp")) return "csp";
        if (s.contains("cors") || s.contains("cross-origin")) return "cross_origin";
        if (s.contains("cookie") || s.contains("samesite")) return "cookie";
        if (s.contains("net::err") || s.contains("failed to fetch") || s.contains("networkerror")) return "network";
        if (s.contains("typeerror") || s.contains("referenceerror") || s.contains("syntaxerror")) return "js_error";
        if (s.contains("blocked") || s.contains("denied") || s.contains("not allowed")) return "blocked";
        return "other";
    }

    void console(ConsoleMessage message) {
        if (!ENABLED || stopped || message == null || consoleEvents++ >= 32) return;
        event("console", message.sourceId(), "level=" + message.messageLevel().name()
                + " category=" + consoleCategory(message.message()) + " line=" + message.lineNumber());
    }

    // No input values, raw page text, attributes with tokens, or HTML are returned.
    // This is a read-only snapshot; it neither clicks nor modifies the DOM.
    void snapshot(WebView view, String phase) {
        if (!ENABLED || stopped || events >= 160) return;
        String url = view.getUrl();
        event("snapshot_" + phase, url, "loading_progress=" + view.getProgress());
        view.evaluateJavascript("(function(){try{var t=(document.body?document.body.innerText:'').toLowerCase();"
                + "return JSON.stringify({loginPrompt:/log in to x to continue|sign in to x/.test(t),"
                + "credentialField:!!document.querySelector('input[autocomplete=username],input[type=email],input[type=password],input[name=text]'),"
                + "challenge:!!document.querySelector('iframe[src*=captcha],iframe[src*=challenge],iframe[src*=turnstile],iframe[src*=arkoselabs]')"
                + "||/verify you are human|checking your browser|security challenge|captcha|unusual activity/.test(t),"
                + "explicitError:/something went wrong|access denied|unsupported browser|try again later|could not log in/.test(t),"
                + "blankTarget:!!document.querySelector('a[target=_blank],form[target=_blank]')});"
                + "}catch(e){return '{}';}})()", result -> {
            if (stopped) return;
            try {
                Object decoded = new JSONTokener(result).nextValue();
                JSONObject flags = new JSONObject((String) decoded);
                event("dom_" + phase, url, "login_prompt=" + flags.optBoolean("loginPrompt")
                        + " credential_field=" + flags.optBoolean("credentialField")
                        + " challenge=" + flags.optBoolean("challenge")
                        + " explicit_error=" + flags.optBoolean("explicitError")
                        + " blank_target=" + flags.optBoolean("blankTarget"));
            } catch (Exception ignored) { event("dom_" + phase, url, "snapshot_unavailable"); }
        });
    }

    void stop() { stopped = true; }
}
