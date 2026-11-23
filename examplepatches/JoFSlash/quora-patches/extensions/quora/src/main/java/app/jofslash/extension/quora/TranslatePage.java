package app.jofslash.extension.quora;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.net.Uri;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;


/**
 * For Translate button: a page inside the app with Google Translate's own website, the text already
 * filled in and translated into the phone's language. Google Translate's site rather than its
 * unofficial API, which could stop working at any time.
 */
final class TranslatePage {

    private static final String TAG = "JoFSlashPatches";

    private TranslatePage() {
    }

    /** A link that translates one part (see TextParts) into the language set for the button. */
    static String url(String part) {
        return "https://translate.google.com/?sl=auto&tl=" + Uri.encode(ReadingPatch.translateTarget())
                + "&op=translate&text=" + Uri.encode(part);
    }

    /** "Next part 2/3", or "First part" on the last one. */
    private static String nextLabel(int shown, int count) {
        return shown + 1 < count ? Texts.t("Next part") + " " + (shown + 2) + "/" + count : Texts.t("First part");
    }

    @SuppressLint("SetJavaScriptEnabled")
    static void show(Context context, String text) {
        java.util.List<String> parts = TextParts.split(text);
        if (parts.isEmpty()) return;
        try {
            boolean dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                    == Configuration.UI_MODE_NIGHT_YES;
            int bar = dark ? 0xFF202020 : 0xFFF7F7F8;
            int ink = dark ? 0xFFE6E7E8 : 0xFF282829;
            float density = context.getResources().getDisplayMetrics().density;

            Dialog dialog = new Dialog(context, dark
                    ? android.R.style.Theme_Material_NoActionBar
                    : android.R.style.Theme_Material_Light_NoActionBar);

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(bar);
            root.setFitsSystemWindows(true);

            LinearLayout top = new LinearLayout(context);
            top.setOrientation(LinearLayout.HORIZONTAL);
            top.setGravity(Gravity.CENTER_VERTICAL);
            top.setMinimumHeight((int) (56 * density));
            TextView back = new TextView(context);
            back.setText("←");
            back.setTextSize(26);
            back.setTextColor(ink);
            back.setGravity(Gravity.CENTER);
            back.setContentDescription(Texts.t("Back"));
            back.setOnClickListener((v) -> dialog.dismiss());
            top.addView(back, new LinearLayout.LayoutParams((int) (56 * density), (int) (56 * density)));
            TextView title = new TextView(context);
            title.setText(Texts.t("Translate"));
            title.setTextSize(21);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            title.setTextColor(ink);
            top.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            // A long answer goes to Google in parts; this steps through them.
            TextView next = new TextView(context);
            int[] shown = {0};
            // Switching parts is not a step back can undo: back still means back inside one part.
            boolean[] clearHistory = {false};
            if (parts.size() > 1) {
                next.setText(nextLabel(0, parts.size()));
                next.setTextSize(16);
                next.setTypeface(Typeface.DEFAULT_BOLD);
                next.setTextColor(0xFF2E69FF);
                next.setGravity(Gravity.CENTER);
                int pad = (int) (16 * density);
                next.setPadding(pad, 0, pad, 0);
                top.addView(next, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, (int) (56 * density)));
            }
            root.addView(top);

            ProgressBar progress = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
            progress.setIndeterminate(true);
            root.addView(progress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (4 * density)));

            WebView web = new WebView(context);
            WebSettings settings = web.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            web.setWebChromeClient(new WebChromeClient());
            web.setWebViewClient(new WebViewClient() {
                @Override
                public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                    // Google's own pages (Translate, and its cookie consent in the EU) stay here.
                    String host = request.getUrl().getHost();
                    return host == null || !(host.equals("google.com") || host.endsWith(".google.com")
                            || host.endsWith(".google") || host.endsWith(".gstatic.com"));
                }

                @Override
                public void onPageFinished(WebView view, String url) {
                    progress.setVisibility(View.GONE);
                    if (clearHistory[0]) {
                        clearHistory[0] = false;
                        view.clearHistory();
                    }
                }
            });
            root.addView(web, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            dialog.setContentView(root);
            dialog.setOnKeyListener((d, keyCode, event) -> {
                // Back steps back inside the page first, for example from the language list.
                if (keyCode == android.view.KeyEvent.KEYCODE_BACK && event.getAction() == android.view.KeyEvent.ACTION_UP
                        && web.canGoBack()) {
                    web.goBack();
                    return true;
                }
                return false;
            });
            dialog.setOnDismissListener((d) -> web.destroy());
            Window window = dialog.getWindow();
            if (window != null) {
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(bar));
                window.setStatusBarColor(bar);
                window.setWindowAnimations(android.R.style.Animation_Activity);
                // Light icons on the dark bar, dark icons on the light one.
                window.getDecorView().setSystemUiVisibility(dark ? 0 : View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
                if (android.os.Build.VERSION.SDK_INT >= 30) {
                    android.view.WindowInsetsController insets = window.getInsetsController();
                    if (insets != null) {
                        int light = android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;
                        insets.setSystemBarsAppearance(dark ? 0 : light, light);
                    }
                }
            }
            next.setOnClickListener((v) -> {
                shown[0] = (shown[0] + 1) % parts.size();
                next.setText(nextLabel(shown[0], parts.size()));
                progress.setVisibility(View.VISIBLE);
                clearHistory[0] = true;
                web.loadUrl(url(parts.get(shown[0])));
            });
            web.loadUrl(url(parts.get(0)));
            dialog.show();
            if (parts.size() > 1) {
                Toast.makeText(context, Texts.t("Long answer: translated in parts. Use Next part at the top."),
                        Toast.LENGTH_LONG).show();
            }
        } catch (Exception ex) {
            Log.e(TAG, "Failed to open the translation", ex);
        }
    }
}
