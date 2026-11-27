package app.ayham.extension.music.features;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

/**
 * The canvas's Spotify sign-in row (canvas.md §13 rule 9): "Sign in" while signed out, opening
 * Spotify's own login page in a web view; "Spotify connected" with Sign out while signed in. No
 * password or cookie is typed into the app: the sp_dc cookie is read from the web view once the
 * listener is signed in (SpotifySession), and never shown.
 */
@SuppressWarnings("deprecation")
public class SpotifySignInPreference extends Preference {
    private static final String LOGIN_URL = "https://accounts.spotify.com/login?continue=https%3A%2F%2Fopen.spotify.com%2F";

    public SpotifySignInPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        refresh();
    }

    public SpotifySignInPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        refresh();
    }

    public SpotifySignInPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        refresh();
    }

    public SpotifySignInPreference(Context context) {
        super(context);
        refresh();
    }

    private void refresh() {
        boolean in = SpotifySession.signedIn(getContext());
        setTitle(in ? "Spotify connected" : "Spotify sign-in");
        setSummary(in ? "Canvases are asked with your Spotify account first. Tap to sign out."
                : "Sign in to Spotify so canvases are found with your account (Spotify's own page; nothing is typed into this app).");
    }

    @Override
    protected void onClick() {
        Context c = getContext();
        if (gone(activity(c))) return;
        if (SpotifySession.signedIn(c)) {
            new AlertDialog.Builder(c)
                    .setTitle("Sign out of Spotify?")
                    .setMessage("Canvases are then asked without your account.")
                    .setPositiveButton("Sign out", (d, w) -> {
                        SpotifySession.signOut(c);
                        Log.i("Ayham", "canvas spotify: signed out");
                        refresh();
                    })
                    .setNegativeButton(android.R.string.cancel, null)
                    .show();
            return;
        }
        signIn(c);
    }

    private static Activity activity(Context c) {
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    /** The settings screen is finishing or gone: no dialog is shown on it or dismissed from it. */
    private static boolean gone(Activity a) {
        return a != null && (a.isFinishing() || a.isDestroyed());
    }

    /** A dismiss that can't crash: the window may be leaving with its activity (rotation, back). */
    private static void dismiss(Dialog dialog) {
        try {
            if (dialog.isShowing()) dialog.dismiss();
        } catch (IllegalArgumentException ignored) {
            // not attached to the window manager any more
        }
    }

    private void signIn(Context c) {
        Activity a = activity(c);
        Dialog dialog = new Dialog(c, android.R.style.Theme_DeviceDefault_NoActionBar);
        WebView web = new WebView(c);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setDomStorageEnabled(true);
        CookieManager.getInstance().setAcceptCookie(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(web, true);
        web.setWebViewClient(new WebViewClient() {
            private boolean done;

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                check();
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                check();
            }

            /** Signed in once Spotify's own page has set its session cookie. */
            private void check() {
                if (done || !dialog.isShowing()) return;
                String v = SpotifySession.spDc(CookieManager.getInstance().getCookie("https://open.spotify.com"));
                if (v == null) return;
                done = true; // the dismiss is posted: the next page event must not sign in again
                SpotifySession.save(c, v);
                Log.i("Ayham", "canvas spotify: signed in");
                Toast.makeText(c, "Spotify connected", Toast.LENGTH_SHORT).show();
                // not from inside the web view's own callback: the dismiss destroys it
                web.post(() -> dismiss(dialog));
            }
        });
        dialog.setContentView(web, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // the settings screen destroyed with the dialog open (rotation, leaving): the dialog is
        // dismissed with it, so its window isn't leaked and the dismiss below still frees the web view
        Application.ActivityLifecycleCallbacks closeWith = a == null ? null : new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityDestroyed(Activity x) {
                if (x == a) dismiss(dialog);
            }

            @Override
            public void onActivityCreated(Activity x, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity x) {
            }

            @Override
            public void onActivityResumed(Activity x) {
            }

            @Override
            public void onActivityPaused(Activity x) {
            }

            @Override
            public void onActivityStopped(Activity x) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity x, Bundle b) {
            }
        };
        dialog.setOnDismissListener(d -> {
            if (closeWith != null) a.getApplication().unregisterActivityLifecycleCallbacks(closeWith);
            // a web view is destroyed out of its window, and not inside one of its own callbacks
            web.stopLoading();
            if (web.getParent() instanceof ViewGroup) ((ViewGroup) web.getParent()).removeView(web);
            new android.os.Handler(android.os.Looper.getMainLooper()).post(web::destroy);
            if (!gone(a)) refresh();
        });
        if (gone(a)) {
            web.destroy();
            return;
        }
        if (closeWith != null) a.getApplication().registerActivityLifecycleCallbacks(closeWith);
        dialog.show();
        web.loadUrl(LOGIN_URL);
    }
}
