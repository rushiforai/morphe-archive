package app.morphe.extension.tv360;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.webkit.CookieManager;
import android.webkit.PermissionRequest;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

/**
 * In-app YouTube browser and official iframe playback. Separate from Media3.
 * No stream extraction, API key, external Intent, login interception or JS bridge.
 */
public final class YouTubeInsideActivity extends Activity {
    public static final String EXTRA_URL = "app.morphe.tv360.YOUTUBE_URL";
    private static final int ACCENT = 0xFFF0445B;
    private static final int PANEL = 0xFF101014;
    private static final String HOME = "https://m.youtube.com/";
    private static final String REFERER = "https://com.bitel.tv360/";

    private FrameLayout root;
    private LinearLayout navigation;
    private EditText search;
    private TextView status;
    private WebView browser;
    private View customVideoView;
    private WebChromeClient.CustomViewCallback customCallback;
    private boolean videoEmbed;
    private String lastVideoPage;

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private GradientDrawable surface(int color, int radius) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(radius));
        return shape;
    }

    private Button actionButton(String symbol, String description, View.OnClickListener action) {
        Button button = new Button(this);
        button.setText(symbol);
        button.setTextSize(15);
        button.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        button.setAllCaps(false);
        button.setTextColor(Color.WHITE);
        button.setContentDescription(description);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setMinWidth(0);
        button.setMinimumWidth(0);
        button.setPadding(dp(7), 0, dp(7), 0);
        button.setBackground(surface(PANEL, 12));
        button.setOnClickListener(action);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(46), dp(46));
        params.setMargins(dp(3), 0, dp(3), 0);
        button.setLayoutParams(params);
        return button;
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().setStatusBarColor(Color.BLACK);
        getWindow().setNavigationBarColor(Color.BLACK);
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);

        root = new FrameLayout(this);
        root.setBackgroundColor(Color.BLACK);
        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(Color.BLACK);
        root.addView(column, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        navigation = new LinearLayout(this);
        navigation.setPadding(dp(6), dp(6), dp(6), dp(5));
        navigation.setGravity(Gravity.CENTER_VERTICAL);
        navigation.setBackgroundColor(Color.BLACK);
        navigation.addView(actionButton("‹", "Volver dentro de YouTube", v -> goBack()));
        navigation.addView(actionButton("⌂", "Inicio de YouTube", v -> openPage(HOME)));

        LinearLayout titles = new LinearLayout(this);
        titles.setOrientation(LinearLayout.VERTICAL);
        titles.setPadding(dp(8), 0, dp(4), 0);
        TextView heading = new TextView(this);
        heading.setText("YOUTUBE  ·  TV360");
        heading.setTextColor(Color.WHITE);
        heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        heading.setTextSize(15);
        titles.addView(heading);
        status = new TextView(this);
        status.setText("Explora y reproduce aquí, sin salir de TV360");
        status.setTextColor(0xFFA6A6AD);
        status.setTextSize(10);
        status.setSingleLine(true);
        titles.addView(status);
        navigation.addView(titles, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        navigation.addView(actionButton("WEB", "Ver vídeo en el sitio YouTube, dentro de TV360",
                v -> openPage(lastVideoPage == null ? HOME : lastVideoPage)));
        navigation.addView(actionButton("⌕", "Buscar vídeos y canales",
                v -> showSearchDialog()));
        navigation.addView(actionButton("✕", "Cerrar YouTube y volver a Media3",
                v -> finish()));
        column.addView(navigation);

        search = new EditText(this);
        search.setSingleLine(true);
        search.setTextColor(Color.WHITE);
        search.setHintTextColor(0xFF88888E);
        search.setTextSize(14);
        search.setHint("Buscar en YouTube…");
        search.setPadding(dp(12), 0, dp(12), 0);
        search.setBackground(surface(PANEL, 12));
        search.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        search.setOnEditorActionListener((view, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH ||
                    (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER)) {
                searchFor(search.getText().toString());
                return true;
            }
            return false;
        });
        LinearLayout.LayoutParams searchParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(46));
        searchParams.setMargins(dp(12), 0, dp(12), dp(6));
        column.addView(search, searchParams);

        browser = new WebView(this);
        browser.setBackgroundColor(Color.BLACK);
        browser.setWebViewClient(new InternalClient());
        browser.setWebChromeClient(new InternalChrome());
        WebSettings settings = browser.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(false);
        settings.setSupportMultipleWindows(false);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setMediaPlaybackRequiresUserGesture(true);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        if (Build.VERSION.SDK_INT >= 26)
            settings.setSafeBrowsingEnabled(true);
        CookieManager.getInstance().setAcceptThirdPartyCookies(browser, false);
        browser.setFocusable(true);
        browser.setFocusableInTouchMode(true);
        column.addView(browser, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);
        String requested = getIntent().getStringExtra(EXTRA_URL);
        if (requested == null || requested.isEmpty())
            openPage(HOME);
        else
            navigate(Uri.parse(requested));
    }

    private void showSearchDialog() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setHint("Buscar vídeos, música o canales");
        input.setTextColor(Color.WHITE);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
        new AlertDialog.Builder(this).setTitle("Buscar en YouTube")
                .setView(input).setNegativeButton("Cancelar", null)
                .setPositiveButton("Buscar", (dialog, which) ->
                        searchFor(input.getText().toString())).show();
    }

    private void searchFor(String term) {
        String query = term == null ? "" : term.trim();
        if (query.isEmpty()) return;
        search.setText(query);
        openPage("https://m.youtube.com/results?search_query=" + Uri.encode(query));
        // Search results are YouTube's own page; selection of a video is
        // redirected to its official embedded player in this same WebView.
    }

    private static boolean isYouTube(Uri uri) {
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme())) return false;
        String host = uri.getHost();
        if (host == null) return false;
        host = host.toLowerCase(Locale.ROOT);
        return host.equals("youtube.com") || host.endsWith(".youtube.com") ||
                host.equals("youtu.be") || host.equals("www.youtu.be") ||
                host.equals("youtube-nocookie.com") || host.endsWith(".youtube-nocookie.com");
    }

    private static String id(String candidate) {
        if (candidate != null && candidate.matches("[A-Za-z0-9_-]{11}"))
            return candidate;
        return null;
    }

    private static String playlistId(String candidate) {
        if (candidate != null && candidate.matches("[A-Za-z0-9_-]{10,120}"))
            return candidate;
        return null;
    }

    private static String youtubeEmbed(Uri uri) {
        if (!isYouTube(uri)) return null;
        String host = uri.getHost().toLowerCase(Locale.ROOT);
        String path = uri.getPath() == null ? "" : uri.getPath();
        String video = null;
        String list = playlistId(uri.getQueryParameter("list"));
        if (host.equals("youtu.be") || host.equals("www.youtu.be"))
            video = id(uri.getLastPathSegment());
        else if (path.equals("/watch"))
            video = id(uri.getQueryParameter("v"));
        else if (path.startsWith("/shorts/") || path.startsWith("/live/") ||
                path.startsWith("/embed/"))
            video = id(uri.getLastPathSegment());

        if (video != null) {
            return "https://www.youtube.com/embed/" + video + "?playsinline=1&rel=0" +
                    (list == null ? "" : "&list=" + list);
        }
        if (path.equals("/playlist") && list != null) {
            return "https://www.youtube.com/embed/videoseries?playsinline=1&list=" + list;
        }
        return null;
    }

    private void navigate(Uri uri) {
        if (!isYouTube(uri)) {
            Toast.makeText(this, "Solo enlaces HTTPS de YouTube dentro del visor",
                    Toast.LENGTH_LONG).show();
            return;
        }
        String embed = youtubeEmbed(uri);
        if (embed != null) {
            lastVideoPage = uri.toString();
            openEmbed(embed);
        } else {
            openPage(uri.toString());
        }
    }

    private void openPage(String url) {
        Uri uri = Uri.parse(url);
        if (!isYouTube(uri)) return;
        videoEmbed = false;
        status.setText("EXPLORANDO · YOUTUBE");
        browser.loadUrl(uri.toString());
    }

    private void openEmbed(String embed) {
        videoEmbed = true;
        status.setText("REPRODUCTOR OFICIAL · YOUTUBE");
        // The HTTP Referer is supplied by the Android app's installed package
        // identity, as documented for WebView loadDataWithBaseURL integrations.
        // The official iframe is not masked, restyled or intercepted.
        String html = "<!doctype html><html lang='es'><head>" +
                "<meta charset='utf-8'>" +
                "<meta name='viewport' content='width=device-width,initial-scale=1'>" +
                "<meta name='referrer' content='strict-origin-when-cross-origin'>" +
                "<style>html,body{margin:0;width:100%;height:100%;background:#000;overflow:hidden}" +
                "iframe{position:absolute;inset:0;width:100%;height:100%;border:0}</style>" +
                "</head><body><iframe src='" + embed +
                "' title='Reproductor oficial de YouTube' allow='autoplay;encrypted-media;" +
                "picture-in-picture;fullscreen' allowfullscreen></iframe></body></html>";
        browser.loadDataWithBaseURL(REFERER, html, "text/html", "UTF-8", null);
    }

    private final class InternalClient extends WebViewClient {
        @Override public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            if (!request.isForMainFrame()) return false;
            Uri target = request.getUrl();
            if (!isYouTube(target)) {
                Toast.makeText(YouTubeInsideActivity.this,
                        "Por seguridad, solo se permiten páginas de YouTube.",
                        Toast.LENGTH_SHORT).show();
                return true;
            }
            String embedded = youtubeEmbed(target);
            if (embedded != null) {
                lastVideoPage = target.toString();
                openEmbed(embedded);
                return true;
            }
            return false;
        }

        @Override public void onPageFinished(WebView view, String url) {
            if (isYouTube(Uri.parse(url))) {
                videoEmbed = false;
                status.setText("YOUTUBE · NAVEGACIÓN INTERNA");
            }
        }

        @Override public void onReceivedError(WebView view, WebResourceRequest request,
                WebResourceError error) {
            if (request.isForMainFrame())
                status.setText("No se pudo cargar YouTube · revisa conexión");
        }
    }

    private final class InternalChrome extends WebChromeClient {
        @Override public void onShowCustomView(View video, CustomViewCallback callback) {
            if (customVideoView != null) {
                callback.onCustomViewHidden();
                return;
            }
            customVideoView = video;
            customCallback = callback;
            ViewGroup parent = (ViewGroup) video.getParent();
            if (parent != null) parent.removeView(video);
            root.addView(video, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));
            navigation.setVisibility(View.GONE);
            getWindow().getDecorView().setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                    View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
        }

        @Override public void onHideCustomView() {
            if (customVideoView == null) return;
            root.removeView(customVideoView);
            customVideoView = null;
            if (customCallback != null) customCallback.onCustomViewHidden();
            customCallback = null;
            navigation.setVisibility(View.VISIBLE);
            getWindow().getDecorView().setSystemUiVisibility(0);
        }

        @Override public void onPermissionRequest(PermissionRequest request) {
            request.deny();
        }
    }

    private void goBack() {
        if (customVideoView != null) {
            if (browser.getWebChromeClient() instanceof InternalChrome)
                ((InternalChrome) browser.getWebChromeClient()).onHideCustomView();
            return;
        }
        if (browser.canGoBack()) browser.goBack();
        else finish();
    }

    @Override public void onBackPressed() { goBack(); }

    @Override protected void onPause() {
        if (browser != null) browser.onPause();
        super.onPause();
    }

    @Override protected void onResume() {
        super.onResume();
        if (browser != null) browser.onResume();
    }

    @Override protected void onDestroy() {
        if (browser != null) {
            browser.stopLoading();
            browser.loadUrl("about:blank");
            ((ViewGroup) browser.getParent()).removeView(browser);
            browser.destroy();
            browser = null;
        }
        super.onDestroy();
    }
}
