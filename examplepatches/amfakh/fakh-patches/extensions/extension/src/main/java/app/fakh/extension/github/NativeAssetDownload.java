/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.extension.github;

import android.app.DownloadManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.MimeTypeMap;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.fakh.extension.shared.AppRuntime;
import app.fakh.extension.shared.Features;
import app.fakh.extension.shared.I18n;

/**
 * Downloads release assets through Android's {@link DownloadManager} instead of handing the URL off to the browser,
 * resolving private-repo asset URLs to pre-signed CDN links via the GitHub API and falling back to the original
 * chooser intent if enqueueing fails.
 */
@SuppressWarnings("unused")
public final class NativeAssetDownload {
    static final String FOLDER_KEY = "fakh_download_folder";
    static final String DEFAULT_FOLDER = "GitHub";
    private static final String TAG = "FakhNativeAssetDownload";
    private static final int TIMEOUT_MS = 10_000;
    private static final String API = "https://api.github.com";
    private static String pendingAsset;
    // Per API host, the token of the account that sent the latest request there.
    private static final Map<String, String> TOKENS = new ConcurrentHashMap<>();

    private NativeAssetDownload() {
    }

    /** Captures the {@code ReleaseAsset} metadata right before the download branch builds its view intent. */
    public static void prepare(Object asset) {
        pendingAsset = asset == null ? null : asset.toString();
    }

    /**
     * Captures an account's token from the header the app signs an API request with.
     *
     * @param header  The Authorization header.
     * @param address The request's address.
     */
    public static void captureAuth(String header, Object address) {
        if (header == null || !header.startsWith("Bearer ")) return;
        String token = header.substring(7).trim();
        String host = Uri.parse(String.valueOf(address)).getHost();
        if (host != null && !token.isEmpty() && !"null".equals(token)) TOKENS.put(host, token);
    }

    /** The token for an API address, or null before the app signed a request to its host. */
    static String token(Uri address) {
        String host = address.getHost();
        return host == null ? null : TOKENS.get(host);
    }

    /**
     * Saves one file of a repository to the download folder.
     *
     * @param context  The screen's context.
     * @param uri      The API address of the file, which answers with its bytes.
     * @param fileName The name to save it as.
     * @param page     The file's page on the web, opened when the download cannot start.
     */
    static void file(Context context, Uri uri, String fileName, Uri page) {
        String sub = folder();
        String mime = mimeType(fileName, null);
        // Without a type the manager takes the API's, which would add .json to the name.
        enqueue(context, new Intent(Intent.ACTION_VIEW, page), uri, fileName,
                mime != null ? mime : "application/octet-stream", sub.isEmpty() ? fileName : sub + "/" + fileName,
                token(uri), true);
    }

    /** Subfolder under Download, or empty to save directly in Download. */
    static String folder() {
        return sanitize(Features.text(FOLDER_KEY, DEFAULT_FOLDER));
    }

    /** Relative path shown to the user, such as {@code Download/GitHub}. */
    static String location() {
        String sub = folder();
        return sub.isEmpty() ? Environment.DIRECTORY_DOWNLOADS : Environment.DIRECTORY_DOWNLOADS + "/" + sub;
    }

    /** Strips leading/trailing slashes and dot segments so DownloadManager accepts the relative path. */
    static String sanitize(String raw) {
        if (raw == null) return "";
        StringBuilder out = new StringBuilder();
        for (String part : raw.split("[/\\\\]+")) {
            String trimmed = part.trim();
            if (trimmed.isEmpty() || ".".equals(trimmed) || "..".equals(trimmed)) continue;
            if (out.length() > 0) out.append('/');
            out.append(trimmed);
        }
        return out.toString();
    }

    /** Enqueues the release asset URL from {@code intent} into the system download manager. */
    public static void download(Intent intent) {
        String assetInfo = pendingAsset;
        pendingAsset = null;
        Context context = AppRuntime.application();
        if (context == null || intent == null) return;
        Intent target = Intent.ACTION_CHOOSER.equals(intent.getAction())
                ? intent.getParcelableExtra(Intent.EXTRA_INTENT)
                : intent;
        Uri uri = target == null ? null : target.getData();
        if (uri == null || !Features.on("fakh_download_assets")) {
            startChooser(context, intent);
            return;
        }
        String fileName = field(assetInfo, "name=", ", size=");
        if (fileName == null || fileName.isEmpty()) fileName = fallbackName(uri);
        String contentType = field(assetInfo, "contentType=", ")");
        String sub = folder();
        String subPath = sub.isEmpty() ? fileName : sub + "/" + fileName;
        String resolvedName = fileName;
        String resolvedMime = mimeType(fileName, contentType);

        if (token(Uri.parse(API)) != null && isGitHubReleaseUrl(uri)) {
            Toast.makeText(context, I18n.f("Downloading to %1$s", location()), Toast.LENGTH_SHORT).show();
            new Thread(() -> {
                Uri resolved = resolveForPrivateRepo(uri, resolvedName);
                new Handler(Looper.getMainLooper()).post(() ->
                        enqueue(context, intent, resolved != null ? resolved : uri, resolvedName, resolvedMime, subPath,
                                null, false));
            }).start();
            return;
        }
        enqueue(context, intent, uri, resolvedName, resolvedMime, subPath, null, true);
    }

    /** Queues a download. A token asks the API for a file's bytes; release assets need none. */
    private static void enqueue(Context context, Intent fallbackIntent, Uri uri, String fileName,
            String mime, String subPath, String token, boolean showToast) {
        try {
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            if (manager == null) {
                startChooser(context, fallbackIntent);
                return;
            }
            DownloadManager.Request request = new DownloadManager.Request(uri)
                    .setTitle(fileName)
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, subPath);
            if (mime != null) request.setMimeType(mime);
            if (token != null) {
                request.addRequestHeader("Authorization", "token " + token)
                        .addRequestHeader("Accept", RepoFile.RAW);
            }
            manager.enqueue(request);
            if (showToast) {
                Toast.makeText(context, I18n.f("Downloading to %1$s", location()), Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable error) {
            Log.w(TAG, "Download", error);
            startChooser(context, fallbackIntent);
        }
    }

    private static boolean isGitHubReleaseUrl(Uri uri) {
        if (!"github.com".equalsIgnoreCase(uri.getHost())) return false;
        List<String> segments = uri.getPathSegments();
        return segments.size() >= 6 && "releases".equals(segments.get(2)) && "download".equals(segments.get(3));
    }

    /**
     * Checks whether {@code uri} is publicly reachable; on 404 (private repo), resolves the asset via the GitHub
     * REST API with the account's token to obtain a pre-signed CDN URL.
     */
    private static Uri resolveForPrivateRepo(Uri uri, String fileName) {
        try {
            HttpURLConnection head = (HttpURLConnection) new URL(uri.toString()).openConnection();
            head.setRequestMethod("HEAD");
            head.setInstanceFollowRedirects(false);
            head.setConnectTimeout(TIMEOUT_MS);
            head.setReadTimeout(TIMEOUT_MS);
            int code = head.getResponseCode();
            head.disconnect();
            if (code == 200 || (code >= 300 && code < 400)) return uri;

            String token = token(Uri.parse(API));
            if (token == null) return uri;
            List<String> segs = uri.getPathSegments();
            String owner = Uri.encode(segs.get(0));
            String repo = Uri.encode(segs.get(1));
            String tag = Uri.encode(segs.get(4));
            String releaseJson = getJson(API + "/repos/" + owner + "/" + repo + "/releases/tags/" + tag, token);
            if (releaseJson == null) return uri;

            JSONArray assets = new JSONObject(releaseJson).optJSONArray("assets");
            if (assets == null) return uri;
            String assetApiUrl = null;
            for (int i = 0; i < assets.length(); i++) {
                JSONObject asset = assets.optJSONObject(i);
                if (asset != null && fileName.equals(asset.optString("name"))) {
                    assetApiUrl = asset.optString("url", null);
                    break;
                }
            }
            if (assetApiUrl == null || assetApiUrl.isEmpty()) return uri;

            HttpURLConnection assetConn = (HttpURLConnection) new URL(assetApiUrl).openConnection();
            assetConn.setInstanceFollowRedirects(false);
            assetConn.setConnectTimeout(TIMEOUT_MS);
            assetConn.setReadTimeout(TIMEOUT_MS);
            assetConn.setRequestProperty("Authorization", "token " + token);
            assetConn.setRequestProperty("Accept", "application/octet-stream");
            int assetCode = assetConn.getResponseCode();
            String redirect = assetConn.getHeaderField("Location");
            assetConn.disconnect();
            if (assetCode >= 300 && assetCode < 400 && redirect != null && !redirect.isEmpty()) {
                return Uri.parse(redirect);
            }
        } catch (Throwable error) {
            Log.w(TAG, "Private asset resolve", error);
        }
        return uri;
    }

    private static String getJson(String url, String token) throws Exception {
        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestProperty("Authorization", "token " + token);
        conn.setRequestProperty("Accept", "application/vnd.github+json");
        try {
            if (conn.getResponseCode() != 200) return null;
            try (InputStream in = conn.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[4096];
                int n;
                while ((n = in.read(buf)) >= 0) out.write(buf, 0, n);
                return out.toString(StandardCharsets.UTF_8.name());
            }
        } finally {
            conn.disconnect();
        }
    }

    private static String field(String info, String startKey, String endKey) {
        if (info == null) return null;
        int start = info.indexOf(startKey);
        if (start < 0) return null;
        start += startKey.length();
        int end = info.indexOf(endKey, start);
        if (end <= start) return null;
        return info.substring(start, end).trim();
    }

    private static String fallbackName(Uri uri) {
        String last = uri.getLastPathSegment();
        if (last == null || last.trim().isEmpty()) return "download";
        int slash = last.lastIndexOf('/');
        if (slash >= 0) last = last.substring(slash + 1);
        return last.isEmpty() ? "download" : last;
    }

    private static String mimeType(String fileName, String contentType) {
        int dot = fileName.lastIndexOf('.');
        if (dot >= 0 && dot < fileName.length() - 1) {
            String ext = fileName.substring(dot + 1).toLowerCase(Locale.ROOT);
            String mapped = MimeTypeMap.getSingleton().getMimeTypeFromExtension(ext);
            if (mapped != null) return mapped;
        }
        if (contentType != null && !contentType.isEmpty() && !"application/octet-stream".equals(contentType)) {
            return contentType;
        }
        return null;
    }

    private static void startChooser(Context context, Intent intent) {
        try {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable error) {
            Log.w(TAG, "Fallback chooser", error);
        }
    }
}
