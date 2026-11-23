package app.noam.extension.chesscom.gamereview;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;

import androidx.annotation.RequiresApi;

import app.noam.extension.chesscom.theme.Amoled;

/**
 * Lichess's own login page, shown once so Lichess reviews can use the user's Lichess account. A
 * plain view tree, so a root mount can show it in a dialog: the activity that declares it in the
 * manifest is not there.
 */
final class LichessLoginScreen extends ContextWrapper {
    private final int background;
    private FrameLayout root;
    private Runnable close;
    private boolean reported;

    LichessLoginScreen(Context base) {
        super(base);
        background = Amoled.enabled() ? 0xFF000000 : 0xFF161512;
    }

    /** The page's background, for the host's status and navigation bars. */
    int background() {
        return background;
    }

    /** What the host does once the login is reported. */
    void onClose(Runnable close) {
        this.close = close;
    }

    /** The login page in a WebView; the host puts it in its window. */
    View create() {
        root = new FrameLayout(this);
        root.setBackgroundColor(background);
        load();
        return root;
    }

    /** The host is gone: a login that never finished is a no. */
    void destroy() {
        report(false);
    }

    @SuppressLint("SetJavaScriptEnabled")
    private void load() {
        if (root == null) return;
        root.removeAllViews();
        WebView web = new WebView(this);
        web.setBackgroundColor(background);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setDomStorageEnabled(true);
        CookieManager.getInstance().setAcceptCookie(true);
        web.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String url) {
                if (url == null || url.contains("/login")) return;
                view.evaluateJavascript("!!document.getElementById('user_tag')", value -> {
                    if ("true".equals(value)) report(true);
                });
            }

            // Android ended the page's renderer (it does when memory runs low): the page shows again,
            // instead of the WebView taking the whole app down with it.
            @RequiresApi(26)
            @Override
            public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
                view.destroy();
                load();
                return true;
            }
        });
        root.addView(web, new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        web.loadUrl(LichessSession.ORIGIN + "/login?referrer=/");
    }

    private void report(boolean ok) {
        if (reported) return;
        reported = true;
        LichessSession.onLogin(ok);
        if (close != null) close.run();
    }
}
