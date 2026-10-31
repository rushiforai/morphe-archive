// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.chat;

import static app.morphe.extension.shared.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.ViewFlipper;

import androidx.annotation.Nullable;

import com.google.android.material.appbar.AppBarLayout;
import com.onelouder.baconreader.ToolbarActivity;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Reddit's mobile website chat, www.reddit.com/chat, in a WebView over MainActivity's post list, below its toolbar,
 * so the toolbar and the drawer stay. Users log in to Reddit's website here once; its cookies stay in the WebView's
 * cookie store. The WebView lives as long as the activity, hidden while a post list shows.
 */
final class ChatPanel {
    private static final String TAG = "ChatPanel";
    static final int REQUEST_FILES = 0x4348;
    private static final String LINK_DISPATCHER = "com.onelouder.baconreader.LinkDispatcher";

    // Sign-in pages Reddit's login opens.
    private static final List<String> SIGN_IN_HOSTS =
            Arrays.asList("accounts.reddit.com", "accounts.google.com", "appleid.apple.com");
    private static final List<String> LOGIN_PATHS =
            Arrays.asList("/login", "/account", "/register", "/password", "/verification");

    /** The ids of MainActivity's views the chat goes between, from the app's resources. */
    static final class MainViews {
        final int listLayout;
        final int adContainer;
        final int toolbar;
        final int toolbarTitle;
        final int toolbarFlipper;
        final int appBar;
        final int refreshItem;

        MainViews(int listLayout, int adContainer, int toolbar, int toolbarTitle, int toolbarFlipper, int appBar,
                  int refreshItem) {
            this.listLayout = listLayout;
            this.adContainer = adContainer;
            this.toolbar = toolbar;
            this.toolbarTitle = toolbarTitle;
            this.toolbarFlipper = toolbarFlipper;
            this.appBar = appBar;
            this.refreshItem = refreshItem;
        }
    }

    private final Activity activity;
    private final MainViews views;
    private final FrameLayout root;
    private final ProgressBar progress;
    private final TextView errorText;
    private final LinearLayout errorView;
    @Nullable
    private WebView webView;
    @Nullable
    private ValueCallback<Uri[]> pendingFiles;
    private boolean failed;
    private boolean attached;

    @Nullable
    private CharSequence savedTitle;
    private int savedFlipperChild;
    @Nullable
    private Integer savedSoftInputMode;

    private boolean showing;

    ChatPanel(Activity activity, MainViews views) {
        this.activity = activity;
        this.views = views;
        root = new FrameLayout(activity);
        progress = new ProgressBar(activity, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(100);
        progress.setVisibility(View.GONE);
        errorText = new TextView(activity);
        errorView = errorView();

        root.setBackgroundColor(background());
        // Keeps taps from reaching the post list underneath.
        root.setClickable(true);
        root.setVisibility(View.GONE);
        root.addView(errorView, matchParent());
        root.addView(progress,
                new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(4), Gravity.TOP));
    }

    boolean isShowing() {
        return showing;
    }

    /** Shows the chat, at url or where it was. */
    void show(@Nullable String url) {
        attach();
        WebView webView = this.webView != null ? this.webView : createWebView();
        if (!showing) {
            showing = true;
            TextView title = activity.findViewById(views.toolbarTitle);
            if (title != null) {
                savedTitle = title.getText();
                title.setText(str("revanced_baconreader_chat_entry"));
            }
            ViewFlipper flipper = activity.findViewById(views.toolbarFlipper);
            if (flipper != null) {
                savedFlipperChild = flipper.getDisplayedChild();
                flipper.setDisplayedChild(0);
            }
            // The keyboard must not cover the chat's message box.
            savedSoftInputMode = activity.getWindow().getAttributes().softInputMode;
            activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            if (activity instanceof ToolbarActivity) ((ToolbarActivity) activity).showActionBar(true);
            View appBar = activity.findViewById(views.appBar);
            if (appBar instanceof AppBarLayout) ((AppBarLayout) appBar).setExpanded(true, false);
            placeBelowToolbar();
            root.setVisibility(View.VISIBLE);
            webView.onResume();
            activity.invalidateOptionsMenu();
        }
        if (url != null) {
            webView.loadUrl(url);
        } else if (webView.getUrl() == null || webView.getUrl().isEmpty()) {
            webView.loadUrl(RedditChatPatch.CHAT_URL);
        }
    }

    /** Back to the post list. restoreTitle is false when a new feed sets its own title. */
    void hide(boolean restoreTitle) {
        if (!showing) return;
        showing = false;
        root.setVisibility(View.GONE);
        if (webView != null) webView.onPause();
        CookieManager.getInstance().flush();
        if (restoreTitle) {
            TextView title = activity.findViewById(views.toolbarTitle);
            if (title != null) title.setText(savedTitle);
            ViewFlipper flipper = activity.findViewById(views.toolbarFlipper);
            if (flipper != null) flipper.setDisplayedChild(savedFlipperChild);
        }
        if (savedSoftInputMode != null) activity.getWindow().setSoftInputMode(savedSoftInputMode);
        savedSoftInputMode = null;
        activity.invalidateOptionsMenu();
    }

    /** Back: the chat's previous page, then the post list. False when it isn't showing. */
    boolean back(boolean finishInstead) {
        if (!showing) return false;
        if (webView != null && errorView.getVisibility() != View.VISIBLE && webView.canGoBack()) {
            webView.goBack();
            return true;
        }
        if (finishInstead) activity.finish();
        else hide(true);
        return true;
    }

    /** Starts the chat over in a new web view, such as for another account's login. */
    void restart() {
        destroyWebView();
        if (showing) createWebView().loadUrl(RedditChatPatch.CHAT_URL);
    }

    void reload() {
        if (webView == null) {
            show(RedditChatPatch.CHAT_URL);
            return;
        }
        errorView.setVisibility(View.GONE);
        String url = webView.getUrl();
        if (url == null || url.trim().isEmpty() || url.equals("about:blank")) {
            webView.loadUrl(RedditChatPatch.CHAT_URL);
        } else {
            webView.reload();
        }
    }

    /** While the chat shows, only the toolbar's refresh stays, and reloads the chat. */
    void prepareMenu(Menu menu) {
        if (!showing) return;
        for (int index = 0; index < menu.size(); index++) {
            MenuItem item = menu.getItem(index);
            item.setVisible(item.getItemId() == views.refreshItem);
        }
    }

    void onPause() {
        if (webView != null) webView.onPause();
        // Keeps the login when Android closes the app in the background.
        CookieManager.getInstance().flush();
    }

    void onResume() {
        if (showing && webView != null) webView.onResume();
    }

    void onActivityResult(int resultCode, @Nullable Intent data) {
        ValueCallback<Uri[]> callback = pendingFiles;
        if (callback == null) return;
        pendingFiles = null;
        callback.onReceiveValue(chosenFiles(resultCode, data));
    }

    void destroy() {
        if (pendingFiles != null) pendingFiles.onReceiveValue(null);
        pendingFiles = null;
        destroyWebView();
        if (root.getParent() instanceof ViewGroup) ((ViewGroup) root.getParent()).removeView(root);
    }

    private void attach() {
        if (attached) return;
        ViewGroup list = activity.findViewById(views.listLayout);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        params.addRule(RelativeLayout.ABOVE, views.adContainer);
        list.addView(root, params);
        attached = true;
    }

    private void placeBelowToolbar() {
        View toolbar = activity.findViewById(views.toolbar);
        int height = toolbar != null && toolbar.getHeight() > 0 ? toolbar.getHeight() : dp(56);
        if (!(root.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) root.getLayoutParams();
        if (params.topMargin != height) {
            params.topMargin = height;
            root.setLayoutParams(params);
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    @SuppressWarnings("deprecation")
    private WebView createWebView() {
        WebView webView = new WebView(activity);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        // The app targets Android 12, where force dark, not algorithmic darkening, is what applies.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            settings.setForceDark(isDark() ? WebSettings.FORCE_DARK_ON : WebSettings.FORCE_DARK_OFF);
        }
        CookieManager cookies = CookieManager.getInstance();
        cookies.setAcceptCookie(true);
        // The chat page talks to matrix.redditspace.com, a third party for www.reddit.com.
        cookies.setAcceptThirdPartyCookies(webView, true);
        webView.setWebViewClient(new ChatClient());
        webView.setWebChromeClient(new ChatChromeClient());
        webView.setDownloadListener((url, userAgent, contentDisposition, mimetype, contentLength) ->
                openOutside(Uri.parse(url)));
        root.addView(webView, 0, matchParent());
        this.webView = webView;
        if (!showing) webView.onPause();
        return webView;
    }

    private void destroyWebView() {
        if (webView != null) {
            root.removeView(webView);
            webView.destroy();
        }
        webView = null;
    }

    private final class ChatClient extends WebViewClient {
        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            if (request == null || !request.isForMainFrame()) return false;
            return navigate(view, request.getUrl(), request.hasGesture());
        }

        @Override
        @SuppressWarnings("deprecation")
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            if (url == null || Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) return false;
            return navigate(view, Uri.parse(url), true);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            failed = false;
        }

        @Override
        public void onPageFinished(WebView view, String url) {
            progress.setVisibility(View.GONE);
            if (!failed) errorView.setVisibility(View.GONE);
        }

        @Override
        public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
            if (request == null || !request.isForMainFrame()) return;
            showError(error == null || error.getDescription() == null ? null : error.getDescription().toString());
        }

        @Override
        @SuppressWarnings("deprecation")
        public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
            // Android 6 and later call the other overload.
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) showError(description);
        }

        @Override
        public boolean onRenderProcessGone(WebView view, RenderProcessGoneDetail detail) {
            // Unhandled, a crash of the WebView's renderer closes the whole app. Retry makes a new WebView.
            Log.w(TAG, "The chat's WebView renderer stopped");
            destroyWebView();
            showError(null);
            return true;
        }
    }

    private final class ChatChromeClient extends WebChromeClient {
        @Override
        public void onProgressChanged(WebView view, int newProgress) {
            progress.setProgress(newProgress);
            progress.setVisibility(newProgress < 100 ? View.VISIBLE : View.GONE);
        }

        @Override
        @SuppressWarnings("deprecation")
        public boolean onShowFileChooser(WebView webView, ValueCallback<Uri[]> filePathCallback,
                                         FileChooserParams fileChooserParams) {
            if (pendingFiles != null) pendingFiles.onReceiveValue(null);
            pendingFiles = filePathCallback;
            Intent intent = null;
            try {
                if (fileChooserParams != null) intent = fileChooserParams.createIntent();
            } catch (Exception ignored) {
            }
            if (intent == null) {
                intent = new Intent(Intent.ACTION_GET_CONTENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*");
            }
            if (fileChooserParams != null && fileChooserParams.getMode() == FileChooserParams.MODE_OPEN_MULTIPLE) {
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
            }
            try {
                activity.startActivityForResult(intent, REQUEST_FILES);
                return true;
            } catch (ActivityNotFoundException exception) {
                Log.i(TAG, "No app to choose files with", exception);
                pendingFiles = null;
                return false;
            }
        }
    }

    /**
     * Keeps the chat and Reddit's login pages in the WebView. Other Reddit links open in BaconReader, and other
     * sites in the browser.
     */
    private boolean navigate(@Nullable WebView view, @Nullable Uri uri, boolean hasGesture) {
        if (uri == null) return false;
        String scheme = uri.getScheme() == null ? null : uri.getScheme().toLowerCase(Locale.ROOT);
        if ("about".equals(scheme) || "data".equals(scheme) || "blob".equals(scheme)
                || "javascript".equals(scheme)) {
            return false;
        }
        if (!"http".equals(scheme) && !"https".equals(scheme)) {
            openOutside(uri);
            return true;
        }
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
        if (RedditChatPatch.isChatLink(uri) || SIGN_IN_HOSTS.contains(host)) return false;
        if (host.equals("reddit.com") || host.endsWith(".reddit.com")) {
            String path = uri.getPath() == null ? "" : uri.getPath();
            for (String login : LOGIN_PATHS) {
                if (path.equals(login) || path.startsWith(login + "/")) return false;
            }
            if (!hasGesture) {
                // A redirect, such as to the front page after logging in: back to the chat.
                if (path.isEmpty() || path.equals("/")) {
                    if (view != null) view.loadUrl(RedditChatPatch.CHAT_URL);
                    return true;
                }
                return false;
            }
            openInApp(uri);
            return true;
        }
        openOutside(uri);
        return true;
    }

    private void openInApp(Uri uri) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, uri).setClassName(activity, LINK_DISPATCHER));
        } catch (Exception exception) {
            Log.i(TAG, "BaconReader could not open " + uri, exception);
            openOutside(uri);
        }
    }

    private void openOutside(Uri uri) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, uri)
                    .addCategory(Intent.CATEGORY_BROWSABLE)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (ActivityNotFoundException exception) {
            Log.i(TAG, "No app opens " + uri, exception);
        }
    }

    @Nullable
    private static Uri[] chosenFiles(int resultCode, @Nullable Intent data) {
        if (resultCode != Activity.RESULT_OK || data == null) return null;
        ClipData clip = data.getClipData();
        if (clip != null && clip.getItemCount() > 0) {
            Uri[] uris = new Uri[clip.getItemCount()];
            for (int i = 0; i < uris.length; i++) uris[i] = clip.getItemAt(i).getUri();
            return uris;
        }
        return WebChromeClient.FileChooserParams.parseResult(resultCode, data);
    }

    private void showError(@Nullable String description) {
        failed = true;
        progress.setVisibility(View.GONE);
        String message = str("revanced_baconreader_chat_load_error");
        errorText.setText(description == null || description.trim().isEmpty()
                ? message
                : message + "\n\n" + description);
        errorView.setVisibility(View.VISIBLE);
    }

    private void retry() {
        errorView.setVisibility(View.GONE);
        if (webView == null) {
            createWebView().loadUrl(RedditChatPatch.CHAT_URL);
            return;
        }
        reload();
    }

    private LinearLayout errorView() {
        errorText.setGravity(Gravity.CENTER);
        errorText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
        Button button = new Button(activity);
        button.setText(str("revanced_baconreader_chat_retry"));
        button.setOnClickListener(v -> retry());

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setGravity(Gravity.CENTER);
        layout.setPadding(dp(32), dp(32), dp(32), dp(32));
        layout.setBackgroundColor(background());
        layout.setVisibility(View.GONE);
        // Keeps taps from reaching the WebView's error page underneath.
        layout.setClickable(true);
        layout.addView(errorText);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(16);
        layout.addView(button, params);
        return layout;
    }

    /** The background of BaconReader's theme. */
    private int background() {
        TypedValue value = new TypedValue();
        boolean found = activity.getTheme().resolveAttribute(android.R.attr.colorBackground, value, true);
        if (found && value.type >= TypedValue.TYPE_FIRST_COLOR_INT) return value.data;
        return isSystemNight() ? Color.BLACK : Color.WHITE;
    }

    /** Whether BaconReader's theme is a dark one, which the chat follows. */
    private boolean isDark() {
        int color = background();
        double luminance = (0.299 * Color.red(color) + 0.587 * Color.green(color) + 0.114 * Color.blue(color)) / 255;
        return luminance < 0.5;
    }

    private boolean isSystemNight() {
        return (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    private int dp(int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density);
    }

    private static FrameLayout.LayoutParams matchParent() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }
}
