package app.noam.extension.chesscom.review;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.window.OnBackInvokedDispatcher;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import app.noam.extension.chesscom.Utils;
import app.noam.extension.chesscom.theme.Accent;

/**
 * An in-app browser for Lichess. The game is imported (no account needed) and its page opens here;
 * if the import fails, the analysis board opens with the PGN in its address.
 */
public final class LichessActivity extends Activity {
    public static final String EXTRA_PGN = "morphe_pgn";

    private static final int BACKGROUND = 0xFF161512;
    private static final int BAR = 0xFF262421;
    private static final int TEXT = 0xFFFFFFFF;
    private static final int TEXT_SECONDARY = 0xFFB4B2B0;

    private WebView web;
    private ProgressBar progress;
    private TextView status;
    private String pageUrl;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String pgn = getIntent().getStringExtra(EXTRA_PGN);
        getWindow().setStatusBarColor(BAR);
        getWindow().setNavigationBarColor(BACKGROUND);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BACKGROUND);

        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(BAR);
        bar.setMinimumHeight(dp(56));
        View back = icon("glyph_arrow_chevron_left", "Back");
        back.setOnClickListener(view -> finish());
        bar.addView(back, new LinearLayout.LayoutParams(dp(56), dp(56)));
        LinearLayout titles = new LinearLayout(this);
        titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = text("Lichess", 20, TEXT);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titles.addView(title);
        titles.addView(text("Game Review with Lichess", 13, TEXT_SECONDARY));
        bar.addView(titles, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView browser = text("Open in browser", 14, Accent.current());
        browser.setPadding(dp(12), dp(12), dp(16), dp(12));
        browser.setOnClickListener(view -> {
            if (pageUrl != null) startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(pageUrl)));
        });
        bar.addView(browser);
        root.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT));

        progress = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        progress.setIndeterminate(true);
        root.addView(progress, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(4)));

        FrameLayout content = new FrameLayout(this);
        web = new WebView(this);
        web.setBackgroundColor(BACKGROUND);
        WebSettings settings = web.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setMediaPlaybackRequiresUserGesture(true);
        web.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                Uri uri = request.getUrl();
                String host = uri.getHost();
                if (host != null && (host.equals("lichess.org") || host.endsWith(".lichess.org"))) return false;
                try {
                    startActivity(new Intent(Intent.ACTION_VIEW, uri));
                } catch (Throwable ignored) {
                    // No browser for it.
                }
                return true;
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                pageUrl = url;
            }
        });
        web.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                progress.setIndeterminate(false);
                progress.setProgress(newProgress);
                progress.setVisibility(newProgress >= 100 ? View.INVISIBLE : View.VISIBLE);
            }
        });
        content.addView(web, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT));
        status = text("Importing your game to Lichess…", 15, TEXT_SECONDARY);
        status.setGravity(Gravity.CENTER);
        content.addView(status, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top, bottom;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.ime());
                top = bars.top;
                bottom = bars.bottom;
            } else {
                top = insets.getSystemWindowInsetTop();
                bottom = insets.getSystemWindowInsetBottom();
            }
            bar.setPadding(0, top, 0, 0);
            content.setPadding(0, 0, 0, bottom);
            return insets;
        });
        setContentView(root);
        if (Build.VERSION.SDK_INT >= 33) {
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT, this::back);
        }

        if (savedInstanceState != null) {
            web.restoreState(savedInstanceState);
            status.setVisibility(View.GONE);
            return;
        }
        if (pgn == null) {
            status.setText("No game to review");
            progress.setVisibility(View.INVISIBLE);
            return;
        }
        Thread importer = new Thread(() -> {
            String url = importGame(pgn);
            runOnUiThread(() -> {
                if (isFinishing() || web == null) return;
                status.setVisibility(View.GONE);
                pageUrl = url;
                web.loadUrl(url);
            });
        }, "LichessImport");
        importer.start();
    }

    /** The imported game's page, or the analysis board with the PGN when the import fails. */
    private static String importGame(String pgn) {
        try {
            HttpURLConnection connection = (HttpURLConnection) new URL("https://lichess.org/api/import").openConnection();
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(20_000);
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Accept", "application/json");
            try (OutputStream out = connection.getOutputStream()) {
                out.write(("pgn=" + URLEncoder.encode(pgn, "UTF-8")).getBytes("UTF-8"));
            }
            try {
                if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                    try (InputStream in = connection.getInputStream()) {
                        ByteArrayOutputStream body = new ByteArrayOutputStream();
                        byte[] buffer = new byte[8192];
                        for (int read; (read = in.read(buffer)) != -1; ) body.write(buffer, 0, read);
                        String url = new JSONObject(body.toString("UTF-8")).optString("url", null);
                        if (url != null && url.startsWith("https://lichess.org/")) return url;
                    }
                } else {
                    Utils.log("Lichess import answered " + connection.getResponseCode());
                }
            } finally {
                connection.disconnect();
            }
        } catch (Throwable throwable) {
            Utils.logError("Lichess import failed", throwable);
        }
        return "https://lichess.org/analysis/pgn/" + Uri.encode(pgn);
    }

    /** Back walks Lichess's own pages first, then closes this screen. */
    private void back() {
        if (web != null && web.canGoBack()) web.goBack();
        else finish();
    }

    @SuppressLint("GestureBackNavigation")
    @Override
    public void onBackPressed() {
        back();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (web != null) web.saveState(outState);
    }

    @Override
    protected void onDestroy() {
        if (web != null) {
            web.destroy();
            web = null;
        }
        super.onDestroy();
    }

    private View icon(String name, String description) {
        int id = Utils.resourceId(name, "drawable");
        if (id != 0) {
            try {
                Drawable drawable = getDrawable(id);
                if (drawable != null) {
                    ImageView image = new ImageView(this);
                    drawable.setTint(TEXT);
                    image.setImageDrawable(drawable);
                    image.setScaleType(ImageView.ScaleType.CENTER);
                    image.setContentDescription(description);
                    return image;
                }
            } catch (Throwable ignored) {
                // Falls back to the text below.
            }
        }
        TextView text = text("‹", 28, TEXT);
        text.setGravity(Gravity.CENTER);
        text.setContentDescription(description);
        return text;
    }

    private TextView text(String value, int sp, int color) {
        TextView text = new TextView(this);
        text.setText(value);
        text.setTextColor(color);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        return text;
    }

    private int dp(float value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
