package app.noam.extension.chesscom.gamereview;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.CookieManager;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.RequiresApi;

import app.noam.extension.chesscom.theme.Amoled;

/** Lichess's own login page, shown once so Lichess reviews can use the user's Lichess account. */
public final class LichessLoginActivity extends Activity {
    private boolean reported;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        int background = Amoled.enabled() ? 0xFF000000 : 0xFF161512;
        getWindow().setStatusBarColor(background);
        getWindow().setNavigationBarColor(background);
        show(background);
    }

    /** The login page, in a new WebView. */
    @SuppressLint("SetJavaScriptEnabled")
    private void show(int background) {
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
                if (!isFinishing()) show(background);
                return true;
            }
        });
        setContentView(web);
        web.loadUrl(LichessSession.ORIGIN + "/login?referrer=/");
    }

    private void report(boolean ok) {
        if (reported) return;
        reported = true;
        LichessSession.onLogin(ok);
        finish();
    }

    @Override
    protected void onDestroy() {
        report(false);
        super.onDestroy();
    }
}
