package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public final class ShareContentPatch {

    private static volatile Object pendingLink;
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final AtomicBoolean SHARE_IN_PROGRESS = new AtomicBoolean(false);

    public static void setLink(Object link) {
        pendingLink = link;
    }

    public static boolean onShare(Context context, Intent chooser) {
        try {
            Object link = pendingLink;
            pendingLink = null;
            if (link == null || !BinocularsMods.isEnabled("share_post_content")) {
                return false;
            }
            if (chooser == null) {
                return false;
            }

            Intent inner;
            if (Build.VERSION.SDK_INT >= 33) {
                inner = chooser.getParcelableExtra(Intent.EXTRA_INTENT, Intent.class);
            } else {
                inner = chooser.getParcelableExtra(Intent.EXTRA_INTENT);
            }
            if (inner == null) {
                return false;
            }

            Intent fallbackChooser = new Intent(chooser);
            Intent fallbackInner = new Intent(inner);
            fallbackChooser.putExtra(Intent.EXTRA_INTENT, fallbackInner);

            Object post = link;
            Object crossPosts = invokeMethod(link, "getCrossPostParentList");
            if (crossPosts instanceof List) {
                List<?> list = (List<?>) crossPosts;
                if (!list.isEmpty() && list.get(0) != null) {
                    post = list.get(0);
                }
            }

            List<String> mediaUrls = null;
            boolean isVideo = false;
            String textToShare = null;

            Object media = invokeMethod(post, "getMedia");
            Object redditVideo = invokeMethod(media, "getRedditVideo");
            Object downloadUrlObj = invokeMethod(redditVideo, "getDownloadUrl");
            String downloadUrl = downloadUrlObj instanceof String ? ((String) downloadUrlObj).trim() : null;
            if (downloadUrl != null && !downloadUrl.isEmpty()) {
                mediaUrls = Collections.singletonList(downloadUrl);
                isVideo = true;
            }

            if (mediaUrls == null) {
                Object gallery = invokeMethod(post, "getGallery");
                Object itemsObj = invokeMethod(gallery, "getItems");
                if (itemsObj instanceof List) {
                    List<?> items = (List<?>) itemsObj;
                    if (!items.isEmpty()) {
                        List<String> galleryUrls = new ArrayList<>();
                        for (Object item : items) {
                            if (item != null) {
                                Object itemUrlObj = invokeMethod(item, "getUrl");
                                if (itemUrlObj instanceof String) {
                                    String u = ((String) itemUrlObj).trim();
                                    if (!u.isEmpty()) {
                                        galleryUrls.add(u);
                                    }
                                }
                            }
                        }
                        if (!galleryUrls.isEmpty()) {
                            mediaUrls = galleryUrls;
                            isVideo = false;
                        }
                    }
                }
            }

            Object isSelfObj = invokeMethod(post, "isSelf");
            boolean isSelf = Boolean.TRUE.equals(isSelfObj);
            Object urlObj = invokeMethod(post, "getUrl");
            String postUrl = urlObj instanceof String ? ((String) urlObj).trim() : null;
            String postHost = getHost(postUrl);

            if (mediaUrls == null) {
                Object hintObj = invokeMethod(post, "getPostHint");
                String postHint = hintObj instanceof String ? ((String) hintObj).trim() : null;

                if (postUrl != null && !postUrl.isEmpty()
                        && ("image".equals(postHint) || "i.redd.it".equalsIgnoreCase(postHost))) {
                    mediaUrls = Collections.singletonList(postUrl);
                    isVideo = false;
                }
            }

            if (mediaUrls == null) {
                Object selftextObj = invokeMethod(post, "getSelftext");
                String selftext = selftextObj instanceof String ? ((String) selftextObj).trim() : null;

                if (isSelf && selftext != null && !selftext.isEmpty()) {
                    Object titleObj = invokeMethod(post, "getTitle");
                    String title = titleObj instanceof String ? (String) titleObj : "";
                    textToShare = title + "\n\n" + selftext;
                }
            }

            if (mediaUrls == null && textToShare == null) {
                if (!isSelf && postUrl != null && !postUrl.isEmpty() && !isRedditHost(postHost)) {
                    textToShare = postUrl;
                }
            }

            if (textToShare != null) {
                String action = inner.getAction();
                if (Intent.ACTION_SEND.equals(action) || Intent.ACTION_SENDTO.equals(action)) {
                    inner.putExtra(Intent.EXTRA_TEXT, textToShare);
                    chooser.putExtra(Intent.EXTRA_INTENT, inner);
                    return false;
                }
                return false;
            }

            if (mediaUrls != null) {
                if (!Intent.ACTION_SEND.equals(inner.getAction())) {
                    return false;
                }
                if (!SHARE_IN_PROGRESS.compareAndSet(false, true)) {
                    return true;
                }
                try {
                    showToast(context, "bin0culars_share_preparing");
                    final List<String> urlsToDownload = mediaUrls;
                    final boolean isVideoMedia = isVideo;

                    EXECUTOR.execute(() -> {
                        try {
                            processMediaShare(context, chooser, inner, urlsToDownload, isVideoMedia, fallbackChooser);
                        } finally {
                            SHARE_IN_PROGRESS.set(false);
                        }
                    });
                    return true;
                } catch (Throwable t) {
                    SHARE_IN_PROGRESS.set(false);
                    return false;
                }
            }

            return false;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void processMediaShare(
            Context context,
            Intent chooser,
            Intent inner,
            List<String> mediaUrls,
            boolean isVideo,
            Intent fallbackChooser) {
        try {
            File cacheDir = context.getCacheDir();
            File shareDir = new File(cacheDir, "internal_cache_share/bin0culars_share");
            if (shareDir.exists()) {
                File[] files = shareDir.listFiles();
                if (files != null) {
                    for (File f : files) {
                        f.delete();
                    }
                }
            } else {
                shareDir.mkdirs();
            }

            List<File> downloadedFiles = new ArrayList<>();
            List<String> mimeTypes = new ArrayList<>();
            long totalBytes = 0;
            final long maxTotalBytes = 100 * 1024 * 1024;

            for (int i = 0; i < mediaUrls.size(); i++) {
                String urlString = mediaUrls.get(i);
                HttpURLConnection conn = openConnectionWithRedirects(urlString);
                try {
                    int responseCode = conn.getResponseCode();
                    if (responseCode < 200 || responseCode >= 300) {
                        throw new IOException("HTTP error: " + responseCode);
                    }

                    String contentType = conn.getContentType();
                    String ext = getExtensionFromMime(contentType);
                    if (ext == null) {
                        ext = getExtensionFromUrl(urlString);
                    }
                    if (ext == null) {
                        ext = "bin";
                    }

                    String mime = getMimeFromContentTypeOrExt(contentType, ext, isVideo);

                    File targetFile = new File(shareDir, "share_" + i + "." + ext);
                    try (InputStream in = conn.getInputStream();
                         OutputStream out = new FileOutputStream(targetFile)) {
                        byte[] buffer = new byte[8192];
                        int read;
                        while ((read = in.read(buffer)) != -1) {
                            totalBytes += read;
                            if (totalBytes > maxTotalBytes) {
                                throw new IOException("Total size exceeded 100 MB");
                            }
                            out.write(buffer, 0, read);
                        }
                        out.flush();
                    }

                    downloadedFiles.add(targetFile);
                    mimeTypes.add(mime);
                } finally {
                    conn.disconnect();
                }
            }

            if (downloadedFiles.isEmpty()) {
                throw new IOException("No files downloaded");
            }

            String authority = getFileProviderAuthority(context);
            List<Uri> uris = new ArrayList<>();
            for (File f : downloadedFiles) {
                Uri uri = new Uri.Builder()
                        .scheme("content")
                        .authority(authority)
                        .appendPath("internal_cache_files")
                        .appendPath("bin0culars_share")
                        .appendPath(f.getName())
                        .build();
                uris.add(uri);
            }

            Intent newInner = new Intent(inner);
            newInner.removeExtra(Intent.EXTRA_TEXT);

            if (uris.size() == 1) {
                newInner.setAction(Intent.ACTION_SEND);
                newInner.putExtra(Intent.EXTRA_STREAM, uris.get(0));
                newInner.setType(mimeTypes.get(0));
            } else {
                newInner.setAction(Intent.ACTION_SEND_MULTIPLE);
                newInner.putParcelableArrayListExtra(Intent.EXTRA_STREAM, new ArrayList<>(uris));
                newInner.setType("image/*");
            }

            ClipData clipData = ClipData.newUri(context.getContentResolver(), "share", uris.get(0));
            for (int i = 1; i < uris.size(); i++) {
                clipData.addItem(new ClipData.Item(uris.get(i)));
            }
            newInner.setClipData(clipData);
            newInner.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    chooser.putExtra(Intent.EXTRA_INTENT, newInner);
                    chooser.setClipData(clipData);
                    chooser.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

                    if (!(context instanceof Activity)) {
                        newInner.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    }

                    String targetPackage = newInner.getPackage();
                    if (targetPackage == null && newInner.getComponent() != null) {
                        targetPackage = newInner.getComponent().getPackageName();
                    }

                    if (targetPackage != null && !targetPackage.isEmpty()) {
                        try {
                            context.startActivity(newInner);
                        } catch (ActivityNotFoundException e) {
                            context.startActivity(chooser);
                        }
                    } else {
                        context.startActivity(chooser);
                    }
                } catch (Throwable t) {
                    launchFallback(context, fallbackChooser);
                }
            });
        } catch (Throwable t) {
            launchFallback(context, fallbackChooser);
        }
    }

    private static void launchFallback(Context context, Intent fallbackChooser) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                showToast(context, "bin0culars_share_failed");
                if (!(context instanceof Activity)) {
                    fallbackChooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                }
                context.startActivity(fallbackChooser);
            } catch (Throwable ignored) {
            }
        });
    }

    private static void showToast(Context context, String stringName) {
        Runnable r = () -> {
            try {
                String msg = getString(context, stringName);
                if (!msg.isEmpty()) {
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                }
            } catch (Throwable ignored) {
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }

    private static String getString(Context context, String name) {
        try {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) {
                return context.getString(id);
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    private static HttpURLConnection openConnectionWithRedirects(String urlString) throws IOException {
        String currentUrl = urlString;
        for (int i = 0; i < 5; i++) {
            URL url = new URL(currentUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(15000);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android)");
            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_MOVED_PERM
                    || code == HttpURLConnection.HTTP_MOVED_TEMP
                    || code == HttpURLConnection.HTTP_SEE_OTHER
                    || code == 307
                    || code == 308) {
                String location = conn.getHeaderField("Location");
                conn.disconnect();
                if (location != null && !location.isEmpty()) {
                    URL nextUrl = new URL(url, location);
                    currentUrl = nextUrl.toExternalForm();
                    continue;
                }
            }
            return conn;
        }
        throw new IOException("Too many redirects");
    }

    private static String getExtensionFromMime(String contentType) {
        if (contentType == null) {
            return null;
        }
        String mime = contentType.split(";")[0].trim().toLowerCase(Locale.US);
        switch (mime) {
            case "image/jpeg":
                return "jpg";
            case "image/png":
                return "png";
            case "image/gif":
                return "gif";
            case "image/webp":
                return "webp";
            case "video/mp4":
                return "mp4";
            default:
                return null;
        }
    }

    private static String getExtensionFromUrl(String urlString) {
        if (urlString == null) {
            return null;
        }
        try {
            Uri uri = Uri.parse(urlString);
            String path = uri.getPath();
            if (path != null) {
                int lastSlash = path.lastIndexOf('/');
                String filename = lastSlash >= 0 ? path.substring(lastSlash + 1) : path;
                int lastDot = filename.lastIndexOf('.');
                if (lastDot >= 0 && lastDot < filename.length() - 1) {
                    String ext = filename.substring(lastDot + 1).toLowerCase(Locale.US);
                    if (ext.matches("^[a-z0-9]{1,5}$")) {
                        return ext;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String getMimeFromContentTypeOrExt(String contentType, String ext, boolean isVideo) {
        if (contentType != null) {
            String clean = contentType.split(";")[0].trim().toLowerCase(Locale.US);
            if (!clean.isEmpty() && !clean.equals("application/octet-stream")) {
                return clean;
            }
        }
        if ("jpg".equals(ext) || "jpeg".equals(ext)) {
            return "image/jpeg";
        }
        if ("png".equals(ext)) {
            return "image/png";
        }
        if ("gif".equals(ext)) {
            return "image/gif";
        }
        if ("webp".equals(ext)) {
            return "image/webp";
        }
        if ("mp4".equals(ext)) {
            return "video/mp4";
        }
        return isVideo ? "video/mp4" : "image/jpeg";
    }

    private static String getHost(String urlString) {
        if (urlString == null || urlString.trim().isEmpty()) {
            return null;
        }
        try {
            Uri uri = Uri.parse(urlString);
            String host = uri.getHost();
            return host != null ? host.toLowerCase(Locale.US) : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isRedditHost(String host) {
        if (host == null) {
            return false;
        }
        String h = host.toLowerCase(Locale.US);
        return h.equals("reddit.com") || h.endsWith(".reddit.com")
                || h.equals("redd.it") || h.endsWith(".redd.it");
    }

    private static String getFileProviderAuthority(Context context) {
        try {
            PackageManager pm = context.getPackageManager();
            PackageInfo info = pm.getPackageInfo(context.getPackageName(), PackageManager.GET_PROVIDERS);
            if (info != null && info.providers != null) {
                for (ProviderInfo provider : info.providers) {
                    if ("androidx.core.content.FileProvider".equals(provider.name)) {
                        return provider.authority;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return "com.reddit.frontpage.provider.file";
    }

    private static Object invokeMethod(Object target, String methodName) {
        if (target == null) {
            return null;
        }
        try {
            Method method = target.getClass().getMethod(methodName);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
