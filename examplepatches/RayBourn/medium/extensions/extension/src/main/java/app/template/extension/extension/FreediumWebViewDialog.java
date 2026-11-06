package app.template.extension.extension;

import android.app.Dialog;
import android.app.DownloadManager;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.Color;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.DownloadListener;
import android.webkit.JavascriptInterface;
import android.webkit.SslErrorHandler;
import android.webkit.URLUtil;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

public class FreediumWebViewDialog extends Dialog {
    private final String url;
    private WebView webView;
    private volatile boolean isLightboxOpen = false;

    public FreediumWebViewDialog(Context context, String url) {
        super(context, android.R.style.Theme_DeviceDefault_NoActionBar);
        this.url = url;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        final Context context = getContext();
        final boolean isDarkMode = (context.getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK) 
                == android.content.res.Configuration.UI_MODE_NIGHT_YES;

        Window window = getWindow();
        if (window != null) {
            window.setWindowAnimations(android.R.style.Animation_InputMethod);
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            
            // Set status bar colors and icon visibility dynamically
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.LOLLIPOP) {
                window.addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                window.setStatusBarColor(isDarkMode ? Color.BLACK : Color.WHITE);
                
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
                    int flags = window.getDecorView().getSystemUiVisibility();
                    if (isDarkMode) {
                        flags &= ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                    } else {
                        flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
                    }
                    window.getDecorView().setSystemUiVisibility(flags);
                }
            }
        }

        FrameLayout rootLayout = new FrameLayout(context);
        rootLayout.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
        ));
        rootLayout.setFitsSystemWindows(true);
        rootLayout.setBackgroundColor(isDarkMode ? Color.BLACK : Color.WHITE);

        // Main WebView
        webView = new WebView(context);
        webView.setLayoutParams(new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
        ));
        webView.setBackgroundColor(isDarkMode ? Color.BLACK : Color.WHITE);

        // Loading Overlay
        final WebView loaderWebView = new WebView(context);
        loaderWebView.setLayoutParams(new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT
        ));
        loaderWebView.setVerticalScrollBarEnabled(false);
        loaderWebView.setHorizontalScrollBarEnabled(false);

        String bgColor = isDarkMode ? "#000000" : "#FFFFFF";
        String textColor = isDarkMode ? "#F8FAFC" : "#0F172A";
        String spinnerColor = "#02B875";
        
        String html = "<html>" +
                "<head>" +
                "  <style>" +
                "    body {" +
                "      background-color: " + bgColor + ";" +
                "      display: flex;" +
                "      flex-direction: column;" +
                "      justify-content: center;" +
                "      align-items: center;" +
                "      height: 100vh;" +
                "      margin: 0;" +
                "      font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, sans-serif;" +
                "      color: " + textColor + ";" +
                "      user-select: none;" +
                "    }" +
                "    .spinner {" +
                "      width: 48px;" +
                "      height: 48px;" +
                "      border: 4px solid " + (isDarkMode ? "rgba(255,255,255,0.1)" : "rgba(0,0,0,0.1)") + ";" +
                "      border-radius: 50%;" +
                "      border-top-color: " + spinnerColor + ";" +
                "      animation: spin 0.8s cubic-bezier(0.4, 0, 0.2, 1) infinite;" +
                "    }" +
                "    @keyframes spin {" +
                "      to { transform: rotate(360deg); }" +
                "    }" +
                "    .text {" +
                "      margin-top: 24px;" +
                "      font-size: 15px;" +
                "      font-weight: 500;" +
                "      letter-spacing: 0.03em;" +
                "      animation: pulse 1.5s infinite ease-in-out;" +
                "    }" +
                "    @keyframes pulse {" +
                "      0%, 100% { opacity: 0.5; }" +
                "      50% { opacity: 1; }" +
                "    }" +
                "  </style>" +
                "</head>" +
                "<body>" +
                "  <div class=\"spinner\"></div>" +
                "  <div class=\"text\">Unlocking article...</div>" +
                "</body>" +
                "</html>";
                
        loaderWebView.loadDataWithBaseURL(null, html, "text/html", "UTF-8", null);

        loaderWebView.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (loaderWebView.getVisibility() == View.VISIBLE) {
                    injectCleanStyles(webView, isDarkMode);
                    loaderWebView.setVisibility(View.GONE);
                }
            }
        }, 8000);

        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setSupportZoom(true);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        settings.setUseWideViewPort(false);
        settings.setLoadWithOverviewMode(false);
        settings.setTextZoom(100);

        webView.addJavascriptInterface(new Object() {
            @JavascriptInterface
            public void setLightboxVisible(boolean visible) {
                isLightboxOpen = visible;
            }

            @JavascriptInterface
            public void saveBase64File(String base64Data, String filename, String mimeType) {
                FreediumWebViewDialog.this.saveBase64File(base64Data, filename, mimeType);
            }

            @JavascriptInterface
            public void downloadHttpFile(String downloadUrl, String filename, String mimeType) {
                FreediumWebViewDialog.this.downloadHttpFile(downloadUrl, filename, mimeType);
            }
        }, "AndroidBridge");

        webView.setDownloadListener(new DownloadListener() {
            @Override
            public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimeType, long contentLength) {
                String guessName = URLUtil.guessFileName(url, contentDisposition, mimeType);
                downloadHttpFile(url, guessName, mimeType);
            }
        });

        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                if (url != null && (url.contains("/api/download") || url.endsWith(".md") || url.endsWith(".pdf"))) {
                    String guessName = URLUtil.guessFileName(url, null, null);
                    downloadHttpFile(url, guessName, null);
                    return true;
                }
                view.loadUrl(url);
                return true;
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                if (request != null && request.getUrl() != null) {
                    String reqUrl = request.getUrl().toString();
                    if (reqUrl.contains("/api/download") || reqUrl.endsWith(".md") || reqUrl.endsWith(".pdf")) {
                        String guessName = URLUtil.guessFileName(reqUrl, null, null);
                        downloadHttpFile(reqUrl, guessName, null);
                        return true;
                    }
                    view.loadUrl(reqUrl);
                    return true;
                }
                return true;
            }

            @Override
            public void onPageCommitVisible(WebView view, String url) {
                super.onPageCommitVisible(view, url);
                injectCleanStyles(view, isDarkMode);
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                injectCleanStyles(view, isDarkMode);
                loaderWebView.setVisibility(View.GONE);
            }

            @Override
            public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                super.onReceivedError(view, errorCode, description, failingUrl);
                loaderWebView.setVisibility(View.GONE);
                Toast.makeText(context, "Mirror connection failed: " + description, Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                super.onReceivedError(view, request, error);
                if (request != null && request.isForMainFrame()) {
                    loaderWebView.setVisibility(View.GONE);
                }
            }

            @Override
            public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
                loaderWebView.setVisibility(View.GONE);
                Toast.makeText(context, "SSL certificate warning on mirror", Toast.LENGTH_SHORT).show();
                super.onReceivedSslError(view, handler, error);
            }
        });

        rootLayout.addView(webView);
        rootLayout.addView(loaderWebView);

        setContentView(rootLayout);
        webView.loadUrl(url);
    }

    private void injectCleanStyles(WebView view, boolean isDarkMode) {
        if (view == null) return;

        String bg = isDarkMode ? "#000000" : "#FFFFFF";
        String bodyText = isDarkMode ? "#E8E8E8" : "#242424";
        String headingText = isDarkMode ? "#FFFFFF" : "#0F172A";
        String subText = isDarkMode ? "#94A3B8" : "#6B7280";
        String borderColor = isDarkMode ? "#333333" : "#E5E7EB";
        String btnBg = isDarkMode ? "#262626" : "#F3F4F6";
        String btnText = isDarkMode ? "#FFFFFF" : "#1F2937";

        String css =
                "div[role='alert'], .alert, [class*='alert'], [class*='banner'], [class*='toast'], " +
                "[class*='notification'], [class*='announcement'], a[href*='discord'], header, nav, footer, " +
                "#toc-heading, #toc-list, " +
                "div[data-nosnippet]:has(#toc-heading), div[data-nosnippet]:has(#toc-list) { " +
                "  display: none !important; " +
                "} " +
                "html, body { " +
                "  margin: 0 !important; " +
                "  padding: 0 !important; " +
                "  width: 100% !important; " +
                "  min-width: 100% !important; " +
                "  max-width: 100% !important; " +
                "  background-color: " + bg + " !important; " +
                "  color: " + bodyText + " !important; " +
                "  overflow-x: hidden !important; " +
                "  box-sizing: border-box !important; " +
                "} " +
                "main, #svelte, [class*='wrapper'], [class*='card'], [class*='shadow'], div[class*='max-w-'], div[class*='mx-auto'], .container, [class*='container'] { " +
                "  width: 100% !important; " +
                "  max-width: 100% !important; " +
                "  margin-left: 0 !important; " +
                "  margin-right: 0 !important; " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "  box-shadow: none !important; " +
                "  border: none !important; " +
                "  border-radius: 0 !important; " +
                "  background: transparent !important; " +
                "  background-color: transparent !important; " +
                "  box-sizing: border-box !important; " +
                "} " +
                "article, .prose, [class*='prose'] { " +
                "  width: 100% !important; " +
                "  max-width: 100% !important; " +
                "  margin: 0 auto !important; " +
                "  padding-left: 16px !important; " +
                "  padding-right: 16px !important; " +
                "  box-sizing: border-box !important; " +
                "  background: transparent !important; " +
                "  background-color: transparent !important; " +
                "  --tw-prose-body: " + bodyText + " !important; " +
                "  --tw-prose-headings: " + headingText + " !important; " +
                "  --tw-prose-lead: " + bodyText + " !important; " +
                "  --tw-prose-links: " + bodyText + " !important; " +
                "  --tw-prose-bold: " + headingText + " !important; " +
                "  --tw-prose-quotes: " + bodyText + " !important; " +
                "  --tw-prose-quote-borders: " + bodyText + " !important; " +
                "  --tw-prose-captions: " + subText + " !important; " +
                "} " +
                "a[href*='download'], button[class*='download'], [class*='download'] { " +
                "  display: inline-flex !important; " +
                "  align-items: center !important; " +
                "  justify-content: center !important; " +
                "  background-color: " + btnBg + " !important; " +
                "  color: " + btnText + " !important; " +
                "  border: 1px solid " + borderColor + " !important; " +
                "  border-radius: 9999px !important; " +
                "  padding: 8px 18px !important; " +
                "  font-size: 14px !important; " +
                "  font-weight: 500 !important; " +
                "  text-decoration: none !important; " +
                "  margin: 12px auto !important; " +
                "  box-sizing: border-box !important; " +
                "} " +
                "details, summary, .collapse, [class*='collapse'] { " +
                "  background-color: transparent !important; " +
                "  color: inherit !important; " +
                "  border-color: " + borderColor + " !important; " +
                "  margin: 1rem 0 !important; " +
                "  box-sizing: border-box !important; " +
                "} " +
                "p, li, dd, dt { " +
                "  font-family: 'Charter', 'Georgia', 'Cambria', 'Times New Roman', serif !important; " +
                "  font-size: 19px !important; " +
                "  line-height: 1.68 !important; " +
                "  color: " + bodyText + " !important; " +
                "  margin-bottom: 1.5rem !important; " +
                "  letter-spacing: -0.003em !important; " +
                "  word-break: break-word !important; " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "} " +
                "blockquote, [class*='quote'] { " +
                "  border-left: 3px solid " + (isDarkMode ? "#E8E8E8" : "#242424") + " !important; " +
                "  padding-left: 20px !important; " +
                "  padding-right: 0 !important; " +
                "  margin: 1.5rem 0 !important; " +
                "  font-style: italic !important; " +
                "  color: " + bodyText + " !important; " +
                "  box-sizing: border-box !important; " +
                "} " +
                "blockquote p, blockquote li, blockquote div, blockquote em, blockquote span { " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "  margin-left: 0 !important; " +
                "  margin-right: 0 !important; " +
                "  margin-bottom: 0.8rem !important; " +
                "  font-style: inherit !important; " +
                "  color: inherit !important; " +
                "} " +
                "em, i, strong, b, cite, q { " +
                "  color: inherit !important; " +
                "  opacity: 1 !important; " +
                "} " +
                "article em, article cite, .prose em, .prose cite, [class*='kicker'] { " +
                "  color: " + bodyText + " !important; " +
                "  opacity: 1 !important; " +
                "  font-style: italic !important; " +
                "} " +
                "h1 { " +
                "  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important; " +
                "  font-size: 32px !important; " +
                "  font-weight: 700 !important; " +
                "  line-height: 1.25 !important; " +
                "  color: " + headingText + " !important; " +
                "  margin-top: 1.5rem !important; " +
                "  margin-bottom: 0.8rem !important; " +
                "  letter-spacing: -0.015em !important; " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "} " +
                "h2, h3, h4, h5, h6 { " +
                "  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important; " +
                "  font-weight: 700 !important; " +
                "  color: " + headingText + " !important; " +
                "  line-height: 1.3 !important; " +
                "  margin-top: 1.6rem !important; " +
                "  margin-bottom: 0.6rem !important; " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "} " +
                "figure, article img, .prose img, main img { " +
                "  width: calc(100% + 32px) !important; " +
                "  max-width: calc(100% + 32px) !important; " +
                "  height: auto !important; " +
                "  display: block !important; " +
                "  margin-left: -16px !important; " +
                "  margin-right: -16px !important; " +
                "  margin-top: 1.5rem !important; " +
                "  margin-bottom: 1.5rem !important; " +
                "  border-radius: 0 !important; " +
                "  box-sizing: border-box !important; " +
                "  cursor: zoom-in !important; " +
                "} " +
                "img[class*='avatar'], img[class*='author'], img[class*='icon'], img[width='24'], img[width='32'], img[width='40'], img[width='48'] { " +
                "  width: auto !important; " +
                "  max-width: 48px !important; " +
                "  height: auto !important; " +
                "  display: inline-block !important; " +
                "  margin: 0 4px !important; " +
                "  margin-left: 0 !important; " +
                "  margin-right: 4px !important; " +
                "  border-radius: 50% !important; " +
                "  cursor: default !important; " +
                "} " +
                "figcaption, small { " +
                "  font-size: 14px !important; " +
                "  color: " + subText + " !important; " +
                "  text-align: center !important; " +
                "  display: block !important; " +
                "  padding-left: 0 !important; " +
                "  padding-right: 0 !important; " +
                "} " +
                "span, a { " +
                "  color: inherit !important; " +
                "} " +
                "#freedium-lightbox { " +
                "  display: none; " +
                "  position: fixed; " +
                "  top: 0; " +
                "  left: 0; " +
                "  width: 100vw; " +
                "  height: 100vh; " +
                "  background: rgba(0, 0, 0, 0.95); " +
                "  z-index: 9999999; " +
                "  touch-action: none; " +
                "  overflow: hidden; " +
                "  user-select: none; " +
                "  -webkit-user-select: none; " +
                "} " +
                "#freedium-lightbox.active { " +
                "  display: flex !important; " +
                "  flex-direction: column !important; " +
                "  justify-content: center !important; " +
                "  align-items: center !important; " +
                "} " +
                "#fl-close { " +
                "  position: absolute; " +
                "  top: 16px; " +
                "  right: 18px; " +
                "  width: 40px; " +
                "  height: 40px; " +
                "  background: rgba(255, 255, 255, 0.25); " +
                "  color: #FFFFFF; " +
                "  border-radius: 50%; " +
                "  display: flex; " +
                "  justify-content: center; " +
                "  align-items: center; " +
                "  font-size: 22px; " +
                "  font-weight: bold; " +
                "  cursor: pointer; " +
                "  z-index: 10000000; " +
                "  line-height: 1; " +
                "} " +
                "#fl-container { " +
                "  width: 100vw; " +
                "  height: 85vh; " +
                "  display: flex; " +
                "  justify-content: center; " +
                "  align-items: center; " +
                "  overflow: hidden; " +
                "  position: relative; " +
                "} " +
                "#fl-img { " +
                "  max-width: 100vw; " +
                "  max-height: 85vh; " +
                "  object-fit: contain; " +
                "  transition: transform 0.05s ease-out; " +
                "  transform-origin: center center; " +
                "  will-change: transform; " +
                "} " +
                "#fl-caption { " +
                "  position: absolute; " +
                "  bottom: 16px; " +
                "  left: 18px; " +
                "  right: 18px; " +
                "  text-align: center; " +
                "  color: #E2E8F0; " +
                "  font-size: 13px; " +
                "  max-height: 48px; " +
                "  overflow: hidden; " +
                "  text-overflow: ellipsis; " +
                "  pointer-events: none; " +
                "}";

        String js =
                "(function() { " +
                "  var isDark = " + isDarkMode + "; " +
                "  if (!isDark) { " +
                "    document.documentElement.classList.remove('dark'); " +
                "    document.body.classList.remove('dark'); " +
                "  } else { " +
                "    document.documentElement.classList.add('dark'); " +
                "    document.body.classList.add('dark'); " +
                "  } " +
                "  var vp = document.querySelector('meta[name=\"viewport\"]'); " +
                "  if (!vp) { " +
                "    vp = document.createElement('meta'); " +
                "    vp.name = 'viewport'; " +
                "    if (document.head) { document.head.appendChild(vp); } " +
                "  } " +
                "  if (vp) { vp.content = 'width=device-width, initial-scale=1.0, maximum-scale=5.0, user-scalable=yes'; } " +
                "  var style = document.getElementById('freedium-clean-style'); " +
                "  if (!style) { " +
                "    style = document.createElement('style'); " +
                "    style.id = 'freedium-clean-style'; " +
                "    style.innerHTML = `" + css + "`; " +
                "    if (document.head) { document.head.appendChild(style); } " +
                "    else if (document.documentElement) { document.documentElement.appendChild(style); } " +
                "  } else { " +
                "    style.innerHTML = `" + css + "`; " +
                "  } " +
                "  document.querySelectorAll('div, section, aside, [role=\"alert\"]').forEach(function(el) { " +
                "    var t = el.innerText || ''; " +
                "    if ((t.includes('new sources supported') || t.includes('Freedium has been updated') || t.includes('Join our Discord')) && !el.querySelector('article') && !el.querySelector('button') && !t.includes('Download')) { " +
                "      el.style.setProperty('display', 'none', 'important'); " +
                "    } " +
                "  }); " +
                "  document.querySelectorAll('#toc-heading, #toc-list').forEach(function(el) { " +
                "    var tocCard = el.closest('div[data-nosnippet]'); " +
                "    if (tocCard && !tocCard.querySelector('article')) { " +
                "      tocCard.style.setProperty('display', 'none', 'important'); " +
                "    } else { " +
                "      el.style.setProperty('display', 'none', 'important'); " +
                "    } " +
                "  }); " +
                "  var lb = document.getElementById('freedium-lightbox'); " +
                "  if (!lb) { " +
                "    lb = document.createElement('div'); " +
                "    lb.id = 'freedium-lightbox'; " +
                "    lb.innerHTML = '<div id=\"fl-close\">&#10005;</div><div id=\"fl-container\"><img id=\"fl-img\" /></div><div id=\"fl-caption\"></div>'; " +
                "    document.body.appendChild(lb); " +
                "    var flImg = document.getElementById('fl-img'); " +
                "    var flClose = document.getElementById('fl-close'); " +
                "    var flCaption = document.getElementById('fl-caption'); " +
                "    var scale = 1, posX = 0, posY = 0; " +
                "    var startX = 0, startY = 0, isDragging = false; " +
                "    var initialDist = 0, initialScale = 1; " +
                "    var lastTap = 0; " +
                "    function updateTransform() { " +
                "      if (flImg) { flImg.style.transform = 'translate3d(' + posX + 'px,' + posY + 'px,0) scale(' + scale + ')'; } " +
                "    } " +
                "    function resetZoom() { " +
                "      scale = 1; posX = 0; posY = 0; updateTransform(); " +
                "    } " +
                "    window.closeFreediumLightbox = function() { " +
                "      if (lb) { lb.classList.remove('active'); lb.style.display = 'none'; } " +
                "      resetZoom(); " +
                "      if (window.AndroidBridge && window.AndroidBridge.setLightboxVisible) { window.AndroidBridge.setLightboxVisible(false); } " +
                "    }; " +
                "    window.openFreediumLightbox = function(src, caption) { " +
                "      if (!lb || !flImg) return; " +
                "      flImg.src = src; " +
                "      flCaption.innerText = caption || ''; " +
                "      resetZoom(); " +
                "      lb.style.display = 'flex'; " +
                "      lb.classList.add('active'); " +
                "      if (window.AndroidBridge && window.AndroidBridge.setLightboxVisible) { window.AndroidBridge.setLightboxVisible(true); } " +
                "    }; " +
                "    flClose.addEventListener('click', function(e) { " +
                "      e.stopPropagation(); window.closeFreediumLightbox(); " +
                "    }); " +
                "    lb.addEventListener('click', function(e) { " +
                "      if (e.target === lb || e.target.id === 'fl-container') { " +
                "        if (scale <= 1.05) { window.closeFreediumLightbox(); } else { resetZoom(); } " +
                "      } " +
                "    }); " +
                "    lb.addEventListener('touchstart', function(e) { " +
                "      if (e.touches.length === 1) { " +
                "        var now = Date.now(); " +
                "        if (now - lastTap < 320) { " +
                "          if (scale > 1.2) { resetZoom(); } else { scale = 2.5; posX = 0; posY = 0; updateTransform(); } " +
                "          lastTap = 0; return; " +
                "        } " +
                "        lastTap = now; " +
                "        if (scale > 1) { isDragging = true; startX = e.touches[0].clientX - posX; startY = e.touches[0].clientY - posY; } " +
                "      } else if (e.touches.length === 2) { " +
                "        isDragging = false; " +
                "        var dx = e.touches[0].clientX - e.touches[1].clientX; " +
                "        var dy = e.touches[0].clientY - e.touches[1].clientY; " +
                "        initialDist = Math.hypot(dx, dy); " +
                "        initialScale = scale; " +
                "      } " +
                "    }, { passive: false }); " +
                "    lb.addEventListener('touchmove', function(e) { " +
                "      if (e.touches.length === 2 && initialDist > 0) { " +
                "        e.preventDefault(); " +
                "        var dx = e.touches[0].clientX - e.touches[1].clientX; " +
                "        var dy = e.touches[0].clientY - e.touches[1].clientY; " +
                "        var dist = Math.hypot(dx, dy); " +
                "        var newScale = initialScale * (dist / initialDist); " +
                "        scale = Math.min(Math.max(newScale, 1.0), 4.5); " +
                "        updateTransform(); " +
                "      } else if (e.touches.length === 1 && isDragging && scale > 1) { " +
                "        e.preventDefault(); " +
                "        posX = e.touches[0].clientX - startX; " +
                "        posY = e.touches[0].clientY - startY; " +
                "        updateTransform(); " +
                "      } " +
                "    }, { passive: false }); " +
                "    lb.addEventListener('touchend', function(e) { " +
                "      if (e.touches.length < 2) { initialDist = 0; } " +
                "      if (e.touches.length === 0) { isDragging = false; if (scale <= 1.05) { resetZoom(); } } " +
                "    }); " +
                "  } " +
                "  document.querySelectorAll('article img, .prose img, main img, figure img').forEach(function(img) { " +
                "    if (img.id === 'fl-img') return; " +
                "    if (img.classList.contains('avatar') || img.classList.contains('icon') || (img.width && img.width <= 48)) return; " +
                "    img.style.cursor = 'zoom-in'; " +
                "    img.onclick = function(e) { " +
                "      e.preventDefault(); " +
                "      var src = img.currentSrc || img.src || img.getAttribute('data-src') || ''; " +
                "      var fig = img.closest('figure'); " +
                "      var cap = fig ? (fig.querySelector('figcaption') ? fig.querySelector('figcaption').innerText : '') : (img.alt || ''); " +
                "      if (src && window.openFreediumLightbox) { window.openFreediumLightbox(src, cap); } " +
                "    }; " +
                "  }); " +
                "  if (!window._freediumDownloadHooked) { " +
                "    window._freediumDownloadHooked = true; " +
                "    var blobMap = {}; " +
                "    var origCreate = URL.createObjectURL; " +
                "    if (origCreate) { " +
                "      URL.createObjectURL = function(blob) { " +
                "        var u = origCreate.apply(URL, arguments); " +
                "        try { blobMap[u] = blob; } catch(e) {} " +
                "        return u; " +
                "      }; " +
                "    } " +
                "    var origRevoke = URL.revokeObjectURL; " +
                "    if (origRevoke) { " +
                "      URL.revokeObjectURL = function(u) { " +
                "        setTimeout(function() { " +
                "          try { delete blobMap[u]; } catch(e) {} " +
                "          try { origRevoke.call(URL, u); } catch(e) {} " +
                "        }, 45000); " +
                "      }; " +
                "    } " +
                "    function sendBlobToBridge(blob, filename, mime) { " +
                "      var reader = new FileReader(); " +
                "      reader.onloadend = function() { " +
                "        if (window.AndroidBridge && window.AndroidBridge.saveBase64File) { " +
                "          window.AndroidBridge.saveBase64File(reader.result, filename, mime || blob.type || 'application/pdf'); " +
                "        } " +
                "      }; " +
                "      reader.readAsDataURL(blob); " +
                "    } " +
                "    function handleBlobUrl(href, filename, mime) { " +
                "      var b = blobMap[href]; " +
                "      if (b) { " +
                "        sendBlobToBridge(b, filename, mime); " +
                "      } else { " +
                "        fetch(href) " +
                "          .then(function(r) { return r.blob(); }) " +
                "          .then(function(b2) { sendBlobToBridge(b2, filename, mime); }) " +
                "          .catch(function(err) { console.error('Blob fetch failed', err); }); " +
                "      } " +
                "    } " +
                "    function handleHttpDownload(href, filename, mime) { " +
                "      fetch(href) " +
                "        .then(function(r) { return r.blob(); }) " +
                "        .then(function(b) { sendBlobToBridge(b, filename, mime || b.type || 'text/markdown'); }) " +
                "        .catch(function() { " +
                "          if (window.AndroidBridge && window.AndroidBridge.downloadHttpFile) { " +
                "            window.AndroidBridge.downloadHttpFile(href, filename, mime || 'text/markdown'); " +
                "          } " +
                "        }); " +
                "    } " +
                "    var origAnchorClick = HTMLAnchorElement.prototype.click; " +
                "    HTMLAnchorElement.prototype.click = function() { " +
                "      var href = this.href || this.getAttribute('href') || ''; " +
                "      var download = this.download || this.getAttribute('download') || ''; " +
                "      if (href.startsWith('blob:')) { " +
                "        handleBlobUrl(href, download || 'article.pdf', 'application/pdf'); " +
                "        return; " +
                "      } " +
                "      if (href.indexOf('/api/download') !== -1 || (download && (download.endsWith('.md') || download.endsWith('.pdf')))) { " +
                "        handleHttpDownload(href, download || 'article.md', 'text/markdown'); " +
                "        return; " +
                "      } " +
                "      return origAnchorClick.apply(this, arguments); " +
                "    }; " +
                "    document.addEventListener('click', function(e) { " +
                "      var a = e.target.closest('a'); " +
                "      if (!a) return; " +
                "      var href = a.href || a.getAttribute('href') || ''; " +
                "      var download = a.download || a.getAttribute('download') || ''; " +
                "      if (href.startsWith('blob:')) { " +
                "        e.preventDefault(); e.stopPropagation(); " +
                "        handleBlobUrl(href, download || 'article.pdf', 'application/pdf'); " +
                "        return; " +
                "      } " +
                "      if (href.indexOf('/api/download') !== -1 || (download && (download.endsWith('.md') || download.endsWith('.pdf')))) { " +
                "        e.preventDefault(); e.stopPropagation(); " +
                "        handleHttpDownload(href, download || 'article.md', 'text/markdown'); " +
                "      } " +
                "    }, true); " +
                "  } " +
                "})();";

        view.evaluateJavascript(js, null);
    }

    public void saveBase64File(final String base64Data, final String filename, final String mimeType) {
        if (base64Data == null || base64Data.isEmpty()) return;
        final Context context = getContext();
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    String cleanBase64 = base64Data;
                    if (cleanBase64.contains(",")) {
                        cleanBase64 = cleanBase64.substring(cleanBase64.indexOf(",") + 1);
                    }
                    byte[] bytes = Base64.decode(cleanBase64, Base64.DEFAULT);

                    String safeName = (filename != null && !filename.trim().isEmpty()) ? filename : "article";
                    safeName = safeName.replaceAll("[\\\\/:*?\"<>|]", "_");

                    String resolvedMime = mimeType;
                    if (resolvedMime == null || resolvedMime.isEmpty()) {
                        if (safeName.endsWith(".pdf")) {
                            resolvedMime = "application/pdf";
                        } else if (safeName.endsWith(".md")) {
                            resolvedMime = "text/markdown";
                        } else {
                            resolvedMime = "application/octet-stream";
                        }
                    }

                    boolean success = false;
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        ContentValues values = new ContentValues();
                        values.put(MediaStore.Downloads.DISPLAY_NAME, safeName);
                        values.put(MediaStore.Downloads.MIME_TYPE, resolvedMime);
                        values.put(MediaStore.Downloads.IS_PENDING, 1);

                        Uri collection = MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
                        Uri itemUri = context.getContentResolver().insert(collection, values);
                        if (itemUri != null) {
                            try (OutputStream out = context.getContentResolver().openOutputStream(itemUri)) {
                                if (out != null) {
                                    out.write(bytes);
                                    out.flush();
                                    success = true;
                                }
                            }
                            values.clear();
                            values.put(MediaStore.Downloads.IS_PENDING, 0);
                            context.getContentResolver().update(itemUri, values, null, null);
                        }
                    } else {
                        File downloadsDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
                        if (!downloadsDir.exists()) {
                            downloadsDir.mkdirs();
                        }
                        File dest = new File(downloadsDir, safeName);
                        try (FileOutputStream fos = new FileOutputStream(dest)) {
                            fos.write(bytes);
                            fos.flush();
                            success = true;
                        }
                    }

                    final boolean finalSuccess = success;
                    final String finalName = safeName;
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            if (finalSuccess) {
                                Toast.makeText(context, "Saved to Downloads: " + finalName, Toast.LENGTH_LONG).show();
                            } else {
                                Toast.makeText(context, "Failed to save " + finalName, Toast.LENGTH_SHORT).show();
                            }
                        }
                    });
                } catch (final Exception e) {
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(context, "Download error: " + e.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                    });
                }
            }
        }).start();
    }

    public void downloadHttpFile(final String downloadUrl, final String filename, final String mimeType) {
        if (downloadUrl == null || downloadUrl.isEmpty()) return;
        final Context context = getContext();
        try {
            String safeName = (filename != null && !filename.trim().isEmpty()) ? filename : URLUtil.guessFileName(downloadUrl, null, mimeType);
            safeName = safeName.replaceAll("[\\\\/:*?\"<>|]", "_");

            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(downloadUrl));
            if (mimeType != null && !mimeType.isEmpty()) {
                request.setMimeType(mimeType);
            }
            request.setTitle(safeName);
            request.setDescription("Downloading article...");
            request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, safeName);
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                request.allowScanningByMediaScanner();
            }

            DownloadManager dm = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            if (dm != null) {
                dm.enqueue(request);
                final String finalName = safeName;
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(context, "Downloading " + finalName + "...", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        } catch (final Exception e) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(context, "Download failed: " + e.getMessage(), Toast.LENGTH_SHORT).show();
                }
            });
        }
    }

    @Override
    public void onBackPressed() {
        if (isLightboxOpen) {
            isLightboxOpen = false;
            if (webView != null) {
                webView.evaluateJavascript("if (window.closeFreediumLightbox) { window.closeFreediumLightbox(); }", null);
            }
            return;
        }
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }
}
