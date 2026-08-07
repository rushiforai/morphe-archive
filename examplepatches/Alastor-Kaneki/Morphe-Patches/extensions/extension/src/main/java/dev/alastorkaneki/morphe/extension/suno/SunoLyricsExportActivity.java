package dev.alastorkaneki.morphe.extension.suno;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Self-contained timestamped-lyrics exporter injected into the Suno app.
 *
 * The exporter opens the official Suno song page in an embedded WebView and uses
 * that page's own authenticated session to request the aligned lyric payload.
 * Credentials are never copied out of the page; only the resulting lyric JSON is
 * passed to Java and converted locally.
 */
public final class SunoLyricsExportActivity extends Activity {
    private static final String BRIDGE_NAME = "SunoLyricsBridge";
    private static final int CREATE_DOCUMENT_REQUEST = 0x5A31;
    private static final int BACKGROUND = Color.rgb(5, 5, 7);
    private static final int SURFACE = Color.rgb(18, 18, 23);
    private static final int SURFACE_HIGH = Color.rgb(30, 29, 38);
    private static final int ACCENT = Color.rgb(139, 92, 246);
    private static final int TEXT = Color.WHITE;
    private static final int TEXT_MUTED = Color.rgb(190, 188, 202);

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final AtomicBoolean exportInProgress = new AtomicBoolean(false);

    private EditText songInput;
    private Button formatButton;
    private Button exportButton;
    private TextView statusView;
    private WebView webView;
    private SunoLyricsFormatter.Format selectedFormat = SunoLyricsFormatter.Format.LRC;
    private String currentSongId;
    private String pendingContent;
    private String pendingFileName;
    private int lastPayloadHash;
    private volatile boolean trustedPage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setStatusBarColor(BACKGROUND);
        getWindow().setNavigationBarColor(BACKGROUND);
        buildInterface();
        configureWebView();
        handleIntent(getIntent());
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        handleIntent(intent);
    }

    private void buildInterface() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BACKGROUND);
        root.setPadding(dp(16), dp(12), dp(16), dp(12));

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);

        TextView title = new TextView(this);
        title.setText("Timestamped Lyrics");
        title.setTextColor(TEXT);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        titleRow.addView(title, new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1f
        ));

        Button close = createButton("Close", SURFACE_HIGH);
        close.setOnClickListener(view -> finish());
        titleRow.addView(close);
        root.addView(titleRow);

        TextView help = new TextView(this);
        help.setText(
                "Paste or share a Suno song link. Public songs often export immediately; " +
                        "for private songs, sign in to Suno in the page below and tap Export again."
        );
        help.setTextColor(TEXT_MUTED);
        help.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        help.setPadding(0, dp(8), 0, dp(10));
        root.addView(help);

        songInput = new EditText(this);
        songInput.setSingleLine(true);
        songInput.setHint("https://suno.com/song/… or song UUID");
        songInput.setHintTextColor(Color.rgb(130, 128, 145));
        songInput.setTextColor(TEXT);
        songInput.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        songInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        songInput.setPadding(dp(14), dp(12), dp(14), dp(12));
        songInput.setBackground(roundedBackground(SURFACE, ACCENT, 1, 12));
        root.addView(songInput, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER_VERTICAL);
        actions.setPadding(0, dp(10), 0, 0);

        Button pasteButton = createButton("Paste", SURFACE_HIGH);
        pasteButton.setOnClickListener(view -> pasteSongReference());
        actions.addView(pasteButton, weightedButtonParams());

        formatButton = createButton(selectedFormat.label, SURFACE_HIGH);
        formatButton.setOnClickListener(view -> chooseFormat());
        LinearLayout.LayoutParams formatParams = weightedButtonParams();
        formatParams.setMargins(dp(8), 0, 0, 0);
        actions.addView(formatButton, formatParams);

        exportButton = createButton("Export", ACCENT);
        exportButton.setOnClickListener(view -> beginExport());
        LinearLayout.LayoutParams exportParams = weightedButtonParams();
        exportParams.setMargins(dp(8), 0, 0, 0);
        actions.addView(exportButton, exportParams);
        root.addView(actions);

        statusView = new TextView(this);
        statusView.setText("Ready");
        statusView.setTextColor(TEXT_MUTED);
        statusView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        statusView.setPadding(0, dp(9), 0, dp(9));
        root.addView(statusView);

        webView = new WebView(this);
        webView.setBackgroundColor(BACKGROUND);
        root.addView(webView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                0,
                1f
        ));

        setContentView(root);
    }

    private void configureWebView() {
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMixedContentMode(WebSettings.MIXED_CONTENT_NEVER_ALLOW);
        settings.setUserAgentString(settings.getUserAgentString() + " SunoMorpheLyrics/1.0");

        CookieManager cookies = CookieManager.getInstance();
        cookies.setAcceptCookie(true);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            cookies.setAcceptThirdPartyCookies(webView, true);
        }

        webView.addJavascriptInterface(new LyricsBridge(), BRIDGE_NAME);
        webView.setWebChromeClient(new WebChromeClient());
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageStarted(WebView view, String url, android.graphics.Bitmap favicon) {
                trustedPage = isTrustedSunoPage(url);
                super.onPageStarted(view, url, favicon);
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                Uri uri = request == null ? null : request.getUrl();
                return uri == null || !"https".equalsIgnoreCase(uri.getScheme());
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                Uri uri = url == null ? null : Uri.parse(url);
                return uri == null || !"https".equalsIgnoreCase(uri.getScheme());
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                trustedPage = isTrustedSunoPage(url);
                if (trustedPage && currentSongId != null) {
                    setStatus("Suno page loaded. Requesting aligned lyrics…");
                    view.postDelayed(() -> requestAlignedLyrics(currentSongId), 900);
                } else {
                    setStatus("Complete sign-in, return to the song page, then tap Export.");
                }
            }
        });
    }

    private void handleIntent(Intent intent) {
        String songId = SunoSongReference.fromIntent(intent);
        if (songId == null) {
            songId = SunoSongReference.fromClipboard(this);
        }
        if (songId != null) {
            songInput.setText(SunoSongReference.toSongUri(songId).toString());
            songInput.setSelection(songInput.length());
            loadSong(songId, true);
        }
    }

    private void pasteSongReference() {
        String songId = SunoSongReference.fromClipboard(this);
        if (songId == null) {
            toast("Clipboard does not contain a Suno song link or UUID.");
            return;
        }
        songInput.setText(SunoSongReference.toSongUri(songId).toString());
        songInput.setSelection(songInput.length());
    }

    private void chooseFormat() {
        SunoLyricsFormatter.Format[] formats = SunoLyricsFormatter.Format.values();
        String[] labels = new String[formats.length];
        int selected = 0;
        for (int index = 0; index < formats.length; index++) {
            labels[index] = formats[index].label;
            if (formats[index] == selectedFormat) {
                selected = index;
            }
        }

        new AlertDialog.Builder(this)
                .setTitle("Export format")
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    selectedFormat = formats[which];
                    formatButton.setText(selectedFormat.label);
                    dialog.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void beginExport() {
        String songId = SunoSongReference.extract(songInput.getText().toString());
        if (songId == null) {
            toast("Enter a valid Suno song link or UUID.");
            return;
        }

        String url = webView.getUrl();
        if (!songId.equals(currentSongId) || !isSongPageFor(url, songId)) {
            loadSong(songId, true);
            return;
        }
        requestAlignedLyrics(songId);
    }

    private void loadSong(String songId, boolean attemptAutomatically) {
        currentSongId = songId;
        exportInProgress.set(false);
        lastPayloadHash = 0;
        String url = SunoSongReference.toSongUri(songId).toString();
        setStatus("Opening official Suno song page…");
        webView.loadUrl(url);
        if (!attemptAutomatically) {
            setStatus("Song page opened. Tap Export when ready.");
        }
    }

    private void requestAlignedLyrics(String songId) {
        if (!isTrustedSunoPage(webView.getUrl())) {
            setStatus("Open the Suno song page after sign-in, then tap Export.");
            return;
        }
        if (!exportInProgress.compareAndSet(false, true)) {
            return;
        }
        exportButton.setEnabled(false);
        setStatus("Requesting Suno's aligned lyric timing…");
        webView.evaluateJavascript(buildExportScript(songId), value -> {
            // Completion is reported asynchronously through LyricsBridge.
        });
    }

    private String buildExportScript(String songId) {
        return "(async function(){" +
                "const bridge=window." + BRIDGE_NAME + ";" +
                "if(!bridge){return;}" +
                "const id='" + songId + "';" +
                "const sleep=(ms)=>new Promise(r=>setTimeout(r,ms));" +
                "const report=(m)=>{try{bridge.onStatus(String(m));}catch(e){}};" +
                "async function getToken(){" +
                " for(let i=0;i<24;i++){" +
                "  const candidates=[window.Clerk,window.__clerk_client,window.__clerk];" +
                "  for(const clerk of candidates){" +
                "   try{" +
                "    if(clerk&&clerk.session&&typeof clerk.session.getToken==='function'){" +
                "     const token=await clerk.session.getToken(); if(token){return token;}" +
                "    }" +
                "    if(clerk&&clerk.client&&clerk.client.activeSessions&&clerk.client.activeSessions[0]&&" +
                "       typeof clerk.client.activeSessions[0].getToken==='function'){" +
                "     const token=await clerk.client.activeSessions[0].getToken(); if(token){return token;}" +
                "    }" +
                "   }catch(e){}" +
                "  }" +
                "  await sleep(250);" +
                " }" +
                " const cookies=document.cookie.split(';').map(v=>v.trim()).filter(v=>v.startsWith('__session='));" +
                " if(cookies.length){return decodeURIComponent(cookies[cookies.length-1].slice(10));}" +
                " return '';" +
                "}" +
                "try{" +
                " report('Resolving Suno session…');" +
                " const token=await getToken();" +
                " const endpoints=[" +
                "  'https://studio-api.prod.suno.com/api/gen/'+id+'/aligned_lyrics/v2/'," +
                "  'https://studio-api.prod.suno.com/api/gen/'+id+'/aligned_lyrics/'" +
                " ];" +
                " let lastStatus=0; let lastBody='';" +
                " for(const endpoint of endpoints){" +
                "  const headers={'Accept':'application/json'};" +
                "  if(token){headers['Authorization']='Bearer '+token;}" +
                "  report('Downloading aligned lyrics…');" +
                "  const response=await fetch(endpoint,{method:'GET',credentials:'include',headers:headers});" +
                "  lastStatus=response.status; lastBody=await response.text();" +
                "  if(response.ok){" +
                "   let payload; try{payload=JSON.parse(lastBody);}catch(e){payload=null;}" +
                "   if(payload&&(Array.isArray(payload.aligned_lyrics)||Array.isArray(payload.aligned_words))){" +
                "    const heading=document.querySelector('h1');" +
                "    const title=(heading&&heading.textContent?heading.textContent:document.title)||('suno-'+id);" +
                "    bridge.onPayload(lastBody,String(title)); return;" +
                "   }" +
                "  }" +
                "  if(response.status!==404){break;}" +
                " }" +
                " if(lastStatus===401||lastStatus===403){" +
                "  bridge.onError('SIGN_IN_REQUIRED','Sign in to Suno in this page, reopen the song, and tap Export.');" +
                " }else if(lastStatus===202||/processing/i.test(lastBody)){" +
                "  bridge.onError('PROCESSING','Suno is still generating lyric timing. Try Export again shortly.');" +
                " }else{" +
                "  bridge.onError('NO_TIMING','Suno did not return aligned lyric data for this song (HTTP '+lastStatus+').');" +
                " }" +
                "}catch(error){" +
                " bridge.onError('REQUEST_FAILED',error&&error.message?String(error.message):String(error));" +
                "}" +
                "})();";
    }

    private final class LyricsBridge {
        @JavascriptInterface
        public void onStatus(String message) {
            runOnUiThread(() -> setStatus(message));
        }

        @JavascriptInterface
        public void onError(String code, String message) {
            runOnUiThread(() -> {
                exportInProgress.set(false);
                exportButton.setEnabled(true);
                setStatus(message);
                if (!"PROCESSING".equals(code)) {
                    toast(message);
                }
            });
        }

        @JavascriptInterface
        public void onPayload(String json, String pageTitle) {
            if (json == null) {
                return;
            }
            runOnUiThread(() -> {
                if (!trustedPage) {
                    exportInProgress.set(false);
                    exportButton.setEnabled(true);
                    setStatus("Ignored lyric data from an untrusted page.");
                    return;
                }
                SunoLyricsFormatter.Format format = selectedFormat;
                String songId = currentSongId;
                int payloadHash = 31 * json.hashCode() + format.ordinal();
                if (payloadHash == lastPayloadHash) {
                    exportInProgress.set(false);
                    exportButton.setEnabled(true);
                    setStatus("This format was already exported. Change format to export another file.");
                    return;
                }
                lastPayloadHash = payloadHash;
                executor.execute(() -> prepareAndSave(json, pageTitle, songId, format));
            });
        }
    }

    private void prepareAndSave(
            String json,
            String pageTitle,
            String songId,
            SunoLyricsFormatter.Format format
    ) {
        try {
            SunoLyricsFormatter.ParsedLyrics parsed = SunoLyricsFormatter.parse(json);
            String base = SunoSongReference.sanitizeFileBase(pageTitle, songId);
            String suffix = format == SunoLyricsFormatter.Format.JSON
                    ? "-timing"
                    : "-timed-lyrics";
            String fileName = base + suffix + "." + format.extension;
            String content = SunoLyricsFormatter.render(parsed, format, base);
            saveContent(fileName, format.mimeType, content);
        } catch (JSONException error) {
            finishExportWithError("Could not parse Suno lyric timing: " + error.getMessage());
        } catch (RuntimeException error) {
            finishExportWithError("Could not prepare lyric file: " + error.getMessage());
        }
    }

    private void saveContent(String fileName, String mimeType, String content) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            try {
                ContentValues values = new ContentValues();
                values.put(MediaStore.Downloads.DISPLAY_NAME, fileName);
                values.put(MediaStore.Downloads.MIME_TYPE, mimeType);
                values.put(
                        MediaStore.Downloads.RELATIVE_PATH,
                        Environment.DIRECTORY_DOWNLOADS + "/Suno Lyrics"
                );
                values.put(MediaStore.Downloads.IS_PENDING, 1);

                ContentResolver resolver = getContentResolver();
                Uri destination = resolver.insert(
                        MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                        values
                );
                if (destination == null) {
                    throw new IOException("Android did not create a Downloads entry");
                }

                try (OutputStream output = resolver.openOutputStream(destination, "w")) {
                    if (output == null) {
                        throw new IOException("Android did not open the output file");
                    }
                    output.write(content.getBytes(StandardCharsets.UTF_8));
                } catch (IOException error) {
                    resolver.delete(destination, null, null);
                    throw error;
                }

                ContentValues complete = new ContentValues();
                complete.put(MediaStore.Downloads.IS_PENDING, 0);
                resolver.update(destination, complete, null, null);
                finishExportSuccess(fileName);
                return;
            } catch (IOException | RuntimeException error) {
                // Fall through to the system file picker.
            }
        }

        pendingContent = content;
        pendingFileName = fileName;
        runOnUiThread(() -> {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType(mimeType)
                    .putExtra(Intent.EXTRA_TITLE, fileName);
            try {
                startActivityForResult(intent, CREATE_DOCUMENT_REQUEST);
                setStatus("Choose where to save " + fileName);
            } catch (RuntimeException error) {
                finishExportWithError("No file picker is available: " + error.getMessage());
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != CREATE_DOCUMENT_REQUEST) {
            return;
        }
        if (resultCode != RESULT_OK || data == null || data.getData() == null) {
            exportInProgress.set(false);
            exportButton.setEnabled(true);
            setStatus("Save cancelled.");
            return;
        }

        Uri destination = data.getData();
        String content = pendingContent;
        String fileName = pendingFileName;
        pendingContent = null;
        pendingFileName = null;
        executor.execute(() -> {
            try (OutputStream output = getContentResolver().openOutputStream(destination, "w")) {
                if (output == null) {
                    throw new IOException("Android did not open the selected file");
                }
                output.write(content.getBytes(StandardCharsets.UTF_8));
                finishExportSuccess(fileName);
            } catch (IOException | RuntimeException error) {
                finishExportWithError("Could not save file: " + error.getMessage());
            }
        });
    }

    private void finishExportSuccess(String fileName) {
        runOnUiThread(() -> {
            exportInProgress.set(false);
            exportButton.setEnabled(true);
            setStatus("Saved to Downloads/Suno Lyrics: " + fileName);
            toast("Saved " + fileName);
        });
    }

    private void finishExportWithError(String message) {
        runOnUiThread(() -> {
            exportInProgress.set(false);
            exportButton.setEnabled(true);
            setStatus(message);
            toast(message);
        });
    }

    private boolean isTrustedSunoPage(String url) {
        if (url == null) {
            return false;
        }
        Uri uri = Uri.parse(url);
        String host = uri.getHost();
        return "https".equalsIgnoreCase(uri.getScheme()) && host != null &&
                (host.equalsIgnoreCase("suno.com") || host.equalsIgnoreCase("www.suno.com"));
    }

    private boolean isSongPageFor(String url, String songId) {
        return isTrustedSunoPage(url) && songId.equals(SunoSongReference.extract(url));
    }

    private void setStatus(String message) {
        statusView.setText(message == null ? "" : message);
    }

    private Button createButton(String label, int fillColor) {
        Button button = new Button(this);
        button.setText(label);
        button.setTextColor(TEXT);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setAllCaps(false);
        button.setPadding(dp(12), dp(8), dp(12), dp(8));
        button.setMinHeight(0);
        button.setMinWidth(0);
        button.setBackground(roundedBackground(fillColor, fillColor, 0, 12));
        return button;
    }

    private LinearLayout.LayoutParams weightedButtonParams() {
        return new LinearLayout.LayoutParams(0, dp(42), 1f);
    }

    private GradientDrawable roundedBackground(
            int fillColor,
            int strokeColor,
            int strokeWidthDp,
            int radiusDp
    ) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fillColor);
        drawable.setCornerRadius(dp(radiusDp));
        if (strokeWidthDp > 0) {
            drawable.setStroke(dp(strokeWidthDp), strokeColor);
        }
        return drawable;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void onBackPressed() {
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }

    @Override
    protected void onDestroy() {
        if (webView != null) {
            webView.removeJavascriptInterface(BRIDGE_NAME);
            webView.stopLoading();
            webView.destroy();
        }
        executor.shutdownNow();
        super.onDestroy();
    }
}
