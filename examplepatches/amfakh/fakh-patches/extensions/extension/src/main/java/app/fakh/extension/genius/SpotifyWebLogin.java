/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.genius;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/** Opens Spotify's authorize page in a WebView dialog and hands the redirect URI back to LoginActivity. */
public final class SpotifyWebLogin {
    private SpotifyWebLogin() {
    }

    /** Shows Spotify's authorize page for [authorizeUrl] and intercepts redirects to [redirectUri]. */
    @SuppressLint("SetJavaScriptEnabled")
    public static void open(Activity activity, String authorizeUrl, String redirectUri) {
        if (activity == null || TextUtils.isEmpty(authorizeUrl) || TextUtils.isEmpty(redirectUri)) {
            return;
        }
        Uri targetRedirect = Uri.parse(redirectUri);
        Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar);
        WebView web = new WebView(activity);
        WebSettings settings = web.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        Handler main = new Handler(Looper.getMainLooper());
        boolean[] answered = {false};

        web.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return land(request.getUrl());
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                if (url != null && land(Uri.parse(url))) {
                    view.stopLoading();
                }
            }

            private boolean land(Uri url) {
                if (!isRedirect(url, targetRedirect)) {
                    return false;
                }
                if (!answered[0]) {
                    answered[0] = true;
                    dialog.dismiss();
                    main.post(() -> deliver(activity, url));
                }
                return true;
            }
        });

        dialog.setOnDismissListener(closed -> {
            main.post(web::destroy);
            if (!answered[0]) {
                answered[0] = true;
                main.post(() -> {
                    if (!activity.isFinishing() && !activity.isDestroyed()) {
                        activity.setResult(Activity.RESULT_CANCELED);
                        activity.finish();
                    }
                });
            }
        });

        dialog.setContentView(
            web,
            new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        );
        if (dialog.getWindow() != null) {
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        dialog.show();
        web.loadUrl(authorizeUrl);
    }

    private static boolean isRedirect(Uri url, Uri redirect) {
        if (url == null || redirect == null) {
            return false;
        }
        return TextUtils.equals(url.getScheme(), redirect.getScheme())
            && TextUtils.equals(url.getHost(), redirect.getHost())
            && TextUtils.equals(trimSlash(url.getPath()), trimSlash(redirect.getPath()));
    }

    private static String trimSlash(String path) {
        return path != null && path.endsWith("/") ? path.substring(0, path.length() - 1) : path;
    }

    private static void deliver(Activity activity, Uri landed) {
        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }
        Intent intent = new Intent(activity, activity.getClass());
        intent.setData(landed);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        activity.startActivity(intent);
    }
}
