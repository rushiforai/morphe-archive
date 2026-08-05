package dev.alastorkaneki.morphe.extension.operagx;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Android share target injected into Opera GX by the Morphe patch.
 * It resolves only official GX CDN URLs and hands the package to DownloadManager.
 */
public final class GxModDownloadActivity extends Activity {
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 20_000;
    private static final int MAX_PAGE_BYTES = 12 * 1024 * 1024;
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 15) AppleWebKit/537.36 " +
                    "(KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36 OPR/91";

    private final ExecutorService executor = Executors.newSingleThreadExecutor();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        String sharedText = readSharedText(getIntent());
        String directUrl = extractDirectCrxFromSharedText(sharedText);
        if (directUrl != null) {
            enqueueDownload(directUrl, "gx-mod");
            return;
        }

        String storeUrl = GxModUrlResolver.extractStorePageUrl(sharedText);
        if (storeUrl == null) {
            fail("Share a GX Store mod page, not a search or category page.");
            return;
        }

        toast("Resolving GX mod package…");
        executor.execute(() -> resolveAndDownload(storeUrl));
    }

    @Override
    protected void onDestroy() {
        executor.shutdownNow();
        super.onDestroy();
    }

    private void resolveAndDownload(String storeUrl) {
        try {
            String html = fetchText(storeUrl);
            String crxUrl = GxModUrlResolver.resolveCrxUrlFromHtml(html);
            if (crxUrl == null) {
                failOnUiThread(
                        "GX Store did not expose a package URL on this page. " +
                                "The mod may be mobile-only, removed, or the store format changed."
                );
                return;
            }
            runOnUiThread(() -> enqueueDownload(
                    crxUrl,
                    GxModUrlResolver.slugFromStoreUrl(storeUrl)
            ));
        } catch (IOException error) {
            String detail = error.getMessage();
            failOnUiThread("Could not read GX Store" +
                    (detail == null ? "." : ": " + detail));
        }
    }

    private void enqueueDownload(String crxUrl, String slug) {
        if (!GxModUrlResolver.isAllowedCrxUrl(crxUrl)) {
            fail("Blocked a non-GX package URL.");
            return;
        }

        String timestamp = new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US)
                .format(new Date());
        String fileName = slug + "-" + timestamp + ".crx";

        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(crxUrl))
                .setTitle(fileName)
                .setDescription("Raw Opera GX mod package")
                .setMimeType("application/x-chrome-extension")
                .setAllowedOverMetered(true)
                .setAllowedOverRoaming(true)
                .setNotificationVisibility(
                        DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED
                )
                .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, fileName);

        DownloadManager manager =
                (DownloadManager) getSystemService(Context.DOWNLOAD_SERVICE);
        if (manager == null) {
            fail("Android Download Manager is unavailable.");
            return;
        }

        try {
            manager.enqueue(request);
            toast("Downloading " + fileName + " to Downloads");
            finish();
        } catch (RuntimeException error) {
            fail("Could not start download: " + error.getMessage());
        }
    }

    private static String readSharedText(Intent intent) {
        if (intent == null) {
            return null;
        }
        if (intent.getDataString() != null) {
            return intent.getDataString();
        }
        CharSequence text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT);
        return text == null ? null : text.toString();
    }

    private static String extractDirectCrxFromSharedText(String text) {
        if (text == null) {
            return null;
        }
        for (String token : text.split("\\s+")) {
            String candidate = token.replaceAll("[),.;\\]]+$", "");
            if (GxModUrlResolver.isAllowedCrxUrl(candidate)) {
                return candidate;
            }
        }
        return null;
    }

    private static String fetchText(String urlString) throws IOException {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(urlString).openConnection();
            connection.setInstanceFollowRedirects(true);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Accept", "text/html,application/xhtml+xml");
            connection.setRequestProperty("Accept-Encoding", "identity");

            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) {
                throw new IOException("HTTP " + status);
            }

            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                int total = 0;
                int read;
                while ((read = input.read(buffer)) != -1) {
                    total += read;
                    if (total > MAX_PAGE_BYTES) {
                        throw new IOException("page exceeded 12 MB safety limit");
                    }
                    output.write(buffer, 0, read);
                }
                return new String(output.toByteArray(), StandardCharsets.UTF_8);
            }
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private void failOnUiThread(String message) {
        runOnUiThread(() -> fail(message));
    }

    private void fail(String message) {
        toast(message);
        finish();
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }
}
