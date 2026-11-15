/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from the WebView helpers in https://github.com/crimera/piko
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Build;
import android.text.InputType;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.Toast;

/**
 * Small in-app browser used for the two requests that Instagram enforces on
 * the server: browsing without an account and opening a profile's web Reels
 * tab. The browser keeps the app session intact; the logged-out entry point
 * clears only the WebView cookie jar after an explicit confirmation.
 */
@SuppressWarnings("unused")
public final class InstagramWebBrowser {

    private InstagramWebBrowser() {
    }

    public static void openLoggedOut(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        InstagramSettings.initialize(activity);
        new AlertDialog.Builder(activity)
                .setTitle("Logged-out browser")
                .setMessage(
                        "This opens Instagram's public web pages in an in-app browser without "
                                + "Instagram web cookies.\n\n"
                                + "Your Instagram app login is not affected. Public pages are "
                                + "available; private profiles and personalised likes are not.")
                .setPositiveButton("Continue", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        clearWebCookies(activity, InstagramWebBrowserUrls.loggedOutExplore());
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    public static void openProfileReels(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        final EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setHint("username");
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        int padding = dp(activity, 20);
        FrameLayout container = new FrameLayout(activity);
        container.setPadding(padding, padding / 2, padding, 0);
        container.addView(input, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        new AlertDialog.Builder(activity)
                .setTitle("Open profile Reels")
                .setMessage("Instagram does not expose another account's liked Reels. "
                        + "This opens the account's public Reels tab in the in-app browser instead.")
                .setView(container)
                .setPositiveButton("Open", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String url = InstagramWebBrowserUrls.profileReels(input.getText().toString());
                        if (url == null) {
                            Toast.makeText(activity, "Enter a valid Instagram username",
                                    Toast.LENGTH_SHORT).show();
                            return;
                        }
                        show(activity, url, "Reels · " + input.getText().toString().trim());
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    public static void openOwnLikedPosts(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        show(activity, InstagramWebBrowserUrls.ownLikedPosts(), "Your liked posts (web)");
    }

    private static void clearWebCookies(final Activity activity, final String url) {
        try {
            final CookieManager cookies = CookieManager.getInstance();
            cookies.setAcceptCookie(true);
            cookies.removeAllCookies(new android.webkit.ValueCallback<Boolean>() {
                @Override
                public void onReceiveValue(Boolean value) {
                    try {
                        cookies.flush();
                    } catch (Throwable ignored) {
                        // Flush is best effort.
                    }
                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            show(activity, url, "Instagram (logged out)");
                        }
                    });
                }
            });
        } catch (Throwable ignored) {
            show(activity, url, "Instagram (logged out)");
        }
    }

    private static void show(final Activity activity, String url, String title) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        InstagramSettings.initialize(activity);

        final WebView webView = new WebView(activity);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            settings.setMixedContentMode(WebSettings.MIXED_CONTENT_COMPATIBILITY_MODE);
        }
        webView.setWebViewClient(new WebViewClient());
        webView.setWebChromeClient(new WebChromeClient());
        webView.setBackgroundColor(Color.BLACK);
        webView.loadUrl(url);

        int screenHeight = activity.getResources().getDisplayMetrics().heightPixels;
        int height = Math.max(dp(activity, 360), (int) (screenHeight * 0.68f));
        FrameLayout container = new FrameLayout(activity);
        container.addView(webView, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, height));

        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(title)
                .setView(container)
                .setNegativeButton("Close", null)
                .create();
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface unused) {
                try {
                    webView.stopLoading();
                    webView.loadUrl("about:blank");
                    webView.destroy();
                } catch (Throwable ignored) {
                    // The WebView may already be detached.
                }
            }
        });
        dialog.show();
    }

    private static int dp(Activity activity, int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics());
    }
}
