/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.webkit.MimeTypeMap;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Locale;
import java.util.UUID;

import app.fakh.extension.shared.I18n;
import app.fakh.extension.shared.MaterialYou;

/**
 * A full-screen page showing an HTML file of a repository. The page lives on a made-up host, and each file it asks that
 * host for is read from the repository at the same ref through the API, so private repositories show with their styles
 * and images. Scripts are off until the user allows them, since they could read any file of the repository and send it
 * elsewhere. Each repository has a host of its own, so what its scripts save in the browser stays apart from the rest.
 */
final class HtmlPreview {
    private static final String TAG = "FakhHtmlPreview";
    private static final int TIMEOUT_MS = 20_000;

    private HtmlPreview() {
    }

    /** Opens the preview of {@code file} over the activity. */
    static void open(Activity activity, RepoFile file) {
        boolean night = MaterialYou.night(activity);
        int surface = night ? 0xFF0D1117 : 0xFFFFFFFF;
        int text = night ? 0xFFE6EDF3 : 0xFF1F2328;
        float density = activity.getResources().getDisplayMetrics().density;
        Dialog dialog = new Dialog(activity, night ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);

        WebView web = new WebView(activity);
        WebSettings settings = web.getSettings();
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        // A site of its own under the reserved top-level domain, named after the repository.
        String host = UUID.nameUUIDFromBytes((file.page.getHost() + "/" + file.owner + "/" + file.repository)
                .toLowerCase(Locale.ROOT).getBytes(StandardCharsets.UTF_8)) + ".invalid";
        web.setWebViewClient(new Files(file, host));

        TextView close = button(activity, "←", text, density);
        close.setContentDescription(I18n.tr("Close"));
        close.setOnClickListener(v -> dialog.dismiss());
        TextView title = new TextView(activity);
        title.setText(file.name());
        title.setTextColor(text);
        title.setTextSize(18);
        title.setSingleLine(true);
        TextView scripts = button(activity, I18n.tr("Run scripts"), text, density);
        scripts.setTextSize(14);
        scripts.setOnClickListener(v -> new AlertDialog.Builder(activity)
                .setTitle(I18n.tr("Run scripts"))
                .setMessage(I18n.tr("Scripts of this page can read other files of this repository and send them "
                        + "elsewhere. Run them only if you trust the file."))
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton(I18n.tr("Run scripts"), (confirm, which) -> {
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(true);
                    scripts.setVisibility(View.GONE);
                    web.reload();
                })
                .show());

        LinearLayout bar = new LinearLayout(activity);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.addView(close);
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        bar.addView(scripts);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackgroundColor(surface);
        column.addView(bar);
        column.addView(web, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        // The window draws behind the system bars.
        column.setOnApplyWindowInsetsListener((view, insets) -> {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars()
                    | WindowInsets.Type.displayCutout());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            return WindowInsets.CONSUMED;
        });

        dialog.setContentView(column);
        dialog.setOnDismissListener(d -> web.destroy());
        dialog.show();
        Window window = dialog.getWindow();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        window.setDecorFitsSystemWindows(false);
        window.setStatusBarColor(surface);
        window.setNavigationBarColor(surface);
        WindowInsetsController controller = window.getInsetsController();
        int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
        if (controller != null) controller.setSystemBarsAppearance(night ? 0 : light, light);
        web.loadUrl(new Uri.Builder().scheme("https").authority(host).path(file.path).toString());
    }

    /** A text button of the top bar. */
    private static TextView button(Activity activity, String label, int color, float density) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextColor(color);
        view.setTextSize(22);
        int pad = Math.round(16 * density);
        view.setPadding(pad, pad * 3 / 4, pad, pad * 3 / 4);
        return view;
    }

    /** Serves the files of the preview's host from the repository and sends tapped links to the browser. */
    private static final class Files extends WebViewClient {
        private final RepoFile file;
        private final String host;

        Files(RepoFile file, String host) {
            this.file = file;
            this.host = host;
        }

        @Override
        public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
            Uri url = request.getUrl();
            if (!host.equals(url.getHost()) || url.getPath() == null) return null;
            String path = url.getPath().substring(1);
            String extension = path.substring(path.lastIndexOf('.') + 1).toLowerCase(Locale.ROOT);
            // The map of the system lacks scripts and some web files.
            String mime = extension.equals("js") || extension.equals("mjs") ? "text/javascript"
                    : MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
            try {
                Uri source = file.api(path);
                HttpURLConnection connection = (HttpURLConnection) new URL(source.toString()).openConnection();
                connection.setConnectTimeout(TIMEOUT_MS);
                connection.setReadTimeout(TIMEOUT_MS);
                connection.setRequestProperty("Accept", RepoFile.RAW);
                String token = NativeAssetDownload.token(source);
                if (token != null) connection.setRequestProperty("Authorization", "token " + token);
                int code = connection.getResponseCode();
                if (code == 200) {
                    return new WebResourceResponse(mime != null ? mime : "application/octet-stream", null,
                            connection.getInputStream());
                }
                connection.disconnect();
                return failed(code, path);
            } catch (IOException error) {
                Log.w(TAG, path, error);
                return failed(502, path);
            }
        }

        /** The answer for a file that cannot be read, which a page shows when it is the file previewed. */
        private static WebResourceResponse failed(int code, String path) {
            byte[] body = (code + " " + path).getBytes(StandardCharsets.UTF_8);
            return new WebResourceResponse("text/plain", "utf-8", code, "Not loaded", Collections.emptyMap(),
                    new ByteArrayInputStream(body));
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
            Uri url = request.getUrl();
            if (host.equals(url.getHost())) return false;
            // A page may not open the browser by itself.
            if (request.hasGesture()) {
                try {
                    view.getContext().startActivity(new Intent(Intent.ACTION_VIEW, url));
                } catch (ActivityNotFoundException error) {
                    Log.w(TAG, "Link", error);
                }
            }
            return true;
        }
    }
}
