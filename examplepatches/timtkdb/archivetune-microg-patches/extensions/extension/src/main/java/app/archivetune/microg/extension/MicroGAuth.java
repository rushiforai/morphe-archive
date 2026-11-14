package app.archivetune.microg.extension;

import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.webkit.WebView;
import android.widget.Toast;

import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.net.URLEncoder;

/**
 * Glue between ArchiveTune's login screen and microG (GmsCore).
 *
 * Flow: the login screen's WebView is handed to {@link #loadLogin}. {@link MicroGLoginActivity} lets the
 * user pick a microG account and asks microG for a "weblogin:" token. For that token type microG returns
 * a sign-in URL (the same mechanism Google apps use to open a signed-in WebView). Loading it signs the
 * WebView in with real cookies, after which ArchiveTune's own login pipeline takes over unchanged.
 *
 * Nothing here logs the sign-in URL: it contains a one-time credential.
 */
public final class MicroGAuth {
    static final String TAG = "ATMicroG";

    private static final String LANDING_URL = "https://music.youtube.com/";

    private static final String[] MICROG_PACKAGES = {
            "app.revanced.android.gms",
            "app.morphe.android.gms",
    };

    private static volatile WeakReference<WebView> pendingWebView = new WeakReference<>(null);
    private static volatile String pendingOriginalUrl;
    private static volatile String cachedAccountType;

    private MicroGAuth() {
    }

    /**
     * Token types to try, in order. The first mirrors what Google's own apps request for YouTube;
     * the second is the plain form microG itself uses.
     */
    static String[] webLoginServices() {
        String continueUrl;
        try {
            continueUrl = URLEncoder.encode(LANDING_URL, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            continueUrl = LANDING_URL;
        }
        return new String[]{
                "weblogin:service=youtube&continue=" + continueUrl,
                "weblogin:continue=" + continueUrl,
        };
    }

    // ------------------------------------------------------------------------------------------
    // Hook: replaces `webView.loadUrl(googleSignInUrl)` on ArchiveTune's login screen.
    // ------------------------------------------------------------------------------------------

    public static void loadLogin(WebView webView, String originalUrl) {
        Context context = webView.getContext();
        if (findAccountType(context) == null) {
            Toast.makeText(context, "microG not found. Using Google web sign-in.", Toast.LENGTH_LONG).show();
            webView.loadUrl(originalUrl);
            return;
        }
        pendingWebView = new WeakReference<>(webView);
        pendingOriginalUrl = originalUrl;

        Intent intent = new Intent(context, MicroGLoginActivity.class);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }

    /** microG produced a sign-in URL: load it so the WebView becomes signed in. */
    static void onWebLoginUrl(String url) {
        WebView webView = pendingWebView.get();
        if (webView == null) {
            Log.w(TAG, "Login WebView is gone");
            return;
        }
        Log.i(TAG, "loading microG sign-in url (length " + url.length() + ")");
        webView.post(() -> webView.loadUrl(url));
    }

    /** microG could not sign in (declined, unsupported, cancelled): fall back to the original Google page. */
    static void onWebLoginFailed(Context context, String reason) {
        Log.w(TAG, "microG sign-in failed: " + reason);
        Toast.makeText(context, "microG sign-in failed (" + reason + "). Using Google web sign-in.",
                Toast.LENGTH_LONG).show();
        WebView webView = pendingWebView.get();
        String original = pendingOriginalUrl;
        if (webView != null && original != null) {
            webView.post(() -> webView.loadUrl(original));
        }
    }

    /** Finds the account type owned by an installed microG package, or null if none is visible. */
    static String findAccountType(Context context) {
        if (cachedAccountType != null) return cachedAccountType;
        if (context == null) return null;

        for (AuthenticatorDescription description : AccountManager.get(context).getAuthenticatorTypes()) {
            for (String microGPackage : MICROG_PACKAGES) {
                if (microGPackage.equals(description.packageName)) {
                    cachedAccountType = description.type;
                    return cachedAccountType;
                }
            }
        }
        return null;
    }
}
