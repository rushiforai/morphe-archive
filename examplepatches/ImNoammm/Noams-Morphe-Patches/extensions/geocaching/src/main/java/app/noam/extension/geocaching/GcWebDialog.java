package app.noam.extension.geocaching;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

/**
 * Coordinate checkers (GeoCheck, Certitude, GeoChecker...) and other description links open in a
 * full-screen page inside the app instead of handing you over to the browser.
 */
final class GcWebDialog {
    private GcWebDialog() {}

    /** Tells the sign-in page when a loaded page means you're signed in. */
    interface SignedIn {
        boolean check(String url);
    }

    static void show(Context context, String url) {
        open(context, url, null, null);
    }

    /** The site's sign-in page; closes itself once [signedIn] accepts a loaded page. */
    static void signIn(Context context, String url, SignedIn signedIn, Runnable onClosed) {
        open(context, url, signedIn, onClosed);
    }

    @SuppressLint("SetJavaScriptEnabled")
    @SuppressWarnings("deprecation")
    private static void open(Context context, String url, SignedIn finished, Runnable onClosed) {
        Dialog dialog = new Dialog(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        LinearLayout root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);

        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(0xFF2B2B2B);
        int pad = Utils.dp(8);
        bar.setPadding(pad, pad, pad, pad);
        Button close = new Button(context);
        close.setText("✕");
        close.setTextColor(Color.WHITE);
        close.setBackgroundColor(Color.TRANSPARENT);
        close.setOnClickListener(v -> dialog.dismiss());
        bar.addView(close);
        TextView title = new TextView(context);
        title.setTextColor(Color.WHITE);
        title.setTextSize(16);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setSingleLine(true);
        title.setText(android.net.Uri.parse(url).getHost());
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(bar);

        ProgressBar progress = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(100);
        root.addView(progress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Utils.dp(3)));

        WebView web = new WebView(context);
        web.getSettings().setJavaScriptEnabled(true);
        web.getSettings().setDomStorageEnabled(true);
        web.getSettings().setLoadWithOverviewMode(true);
        web.getSettings().setUseWideViewPort(true);
        web.getSettings().setBuiltInZoomControls(true);
        web.getSettings().setDisplayZoomControls(false);
        web.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String loaded) {
                String pageTitle = view.getTitle();
                title.setText(pageTitle == null || pageTitle.isEmpty() ? android.net.Uri.parse(loaded).getHost() : pageTitle);
                if (finished != null && finished.check(loaded)) dialog.dismiss();
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                progress.setProgress(newProgress);
                progress.setVisibility(newProgress >= 100 ? android.view.View.INVISIBLE : android.view.View.VISIBLE);
            }
        });
        root.addView(web, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // The app draws edge to edge, so keep the bar below the status bar and the page above the nav bar.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(android.view.WindowInsets.Type.systemBars());
                v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            } else {
                v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            }
            return insets;
        });
        root.setBackgroundColor(0xFF2B2B2B);
        dialog.setContentView(root);
        dialog.setOnKeyListener((d, keyCode, event) -> {
            if (keyCode == android.view.KeyEvent.KEYCODE_BACK && event.getAction() == android.view.KeyEvent.ACTION_UP && web.canGoBack()) {
                web.goBack();
                return true;
            }
            return false;
        });
        dialog.setOnDismissListener(d -> {
            web.destroy();
            if (onClosed != null) onClosed.run();
        });
        dialog.show();
        web.loadUrl(url);
    }
}
