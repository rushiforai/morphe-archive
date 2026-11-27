/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.JavascriptInterface;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.TextView;

/**
 * A diagram of a README or comment on a full screen of its own, where it can be pinched and dragged. The page the
 * diagram sits in is as tall as its content inside a scrolling list, so it cannot zoom in place.
 */
@SuppressWarnings("unused")
public final class DiagramViewer {
    private final WebView page;

    private DiagramViewer(WebView page) {
        this.page = page;
    }

    /**
     * Lets the page of a markdown view open the viewer, as {@code window.fakhDiagram}.
     *
     * @param page The view, before it loads its page.
     */
    public static void attach(WebView page) {
        page.addJavascriptInterface(new DiagramViewer(page), "fakhDiagram");
    }

    /**
     * Opens a diagram. Called by the page, off the main thread.
     *
     * @param svg  The drawn diagram.
     * @param dark Whether it was drawn for a dark page.
     */
    @JavascriptInterface
    public void open(String svg, boolean dark) {
        page.post(() -> show(page.getContext(), svg, dark));
    }

    /** Shows the diagram in a full screen dialog, closed by Back or its button. */
    private static void show(Context context, String svg, boolean dark) {
        Dialog dialog = new Dialog(context, dark
                ? android.R.style.Theme_DeviceDefault_NoActionBar
                : android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        String background = dark ? "#0d1117" : "#ffffff";

        // JavaScript stays off: the diagram is only looked at.
        WebView view = new WebView(context);
        WebSettings settings = view.getSettings();
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        view.setBackgroundColor(Color.parseColor(background));
        view.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView ignored, WebResourceRequest request) {
                return true;
            }
        });
        // The page is wider than the screen and shown whole: a page as wide as the screen cannot be zoomed by a
        // double tap. The drawing takes all of it and keeps its shape, so it starts fitted and centered.
        view.loadDataWithBaseURL(null, "<!DOCTYPE html><meta charset=\"utf-8\">"
                + "<meta name=\"viewport\" content=\"width=1000,maximum-scale=10\">"
                + "<style>html,body{margin:0;height:100%;background:" + background + "}"
                + "body>svg{display:block;width:100%!important;height:100%!important;max-width:none!important}</style>"
                + svg, "text/html", "utf-8", null);

        float density = context.getResources().getDisplayMetrics().density;
        int padding = Math.round(16 * density);
        TextView close = new TextView(context);
        close.setText("✕");
        close.setContentDescription(context.getString(android.R.string.cancel));
        close.setTextSize(22);
        close.setTextColor(dark ? Color.WHITE : Color.BLACK);
        close.setPadding(padding, padding, padding, padding);
        close.setOnClickListener(ignored -> dialog.dismiss());

        FrameLayout root = new FrameLayout(context);
        root.setFitsSystemWindows(true);
        root.setBackgroundColor(Color.parseColor(background));
        root.addView(view, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(close, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.END));
        dialog.setContentView(root);
        dialog.setOnDismissListener(ignored -> {
            root.removeView(view);
            view.destroy();
        });
        dialog.show();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        }
    }
}
