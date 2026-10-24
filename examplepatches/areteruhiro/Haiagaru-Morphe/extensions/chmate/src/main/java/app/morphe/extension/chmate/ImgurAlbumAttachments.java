package app.morphe.extension.chmate;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Resolves album metadata without changing the posted response text. */
public final class ImgurAlbumAttachments {
    private static final Pattern ALBUM = Pattern.compile(
            "(?<![A-Za-z0-9_./:@-])(?:(?:https?|ttps?)://|//)?"
                    + "(?:(?:www|i)\\.)?imgur\\.com/a/([A-Za-z0-9]+)(?=[/?#\\s<>\"'()（）]|$)"
                    + "(?:[/?#][^\\s<>\\\"]*)?", Pattern.CASE_INSENSITIVE);
    private static final Pattern META = Pattern.compile("<meta\\b[^>]*>", Pattern.CASE_INSENSITIVE);
    private static final Pattern PROPERTY = Pattern.compile(
            "(?:property|name)\\s*=\\s*['\\\"]og:image['\\\"]", Pattern.CASE_INSENSITIVE);
    private static final Pattern CONTENT = Pattern.compile(
            "content\\s*=\\s*['\\\"]([^'\\\"]+)['\\\"]", Pattern.CASE_INSENSITIVE);
    private static final Pattern IMAGE = Pattern.compile(
            "https://i\\.imgur\\.com/[A-Za-z0-9]+\\.(?:png|jpe?g|gif|webp)(?:[?#].*)?",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern VIDEO_PROPERTY = Pattern.compile(
            "(?:property|name)\\s*=\\s*['\"]og:video(?::(?:url|secure_url))?['\"]", Pattern.CASE_INSENSITIVE);
    private static final Pattern VIDEO = Pattern.compile(
            "https://i\\.imgur\\.com/[A-Za-z0-9]+\\.mp4(?:[?#].*)?", Pattern.CASE_INSENSITIVE);
    private static final ExecutorService WORKER = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, Entry> CACHE = new LinkedHashMap<>();
    private static final int MAX_CACHE = 128;
    private static final long RETRY_MS = 60_000L;
    // Native thumbnail getters also run during measurement and for unloaded
    // manual-download placeholders. Parse each response body once, not per bind.
    private static final Map<Object, ParsedBody> PARSED = new java.util.WeakHashMap<>();
    private static final class ParsedBody {
        final String body;
        final int mode;
        final boolean images;
        final String[] direct, ids;
        ParsedBody(String body, int mode, boolean images) {
            this.body = body; this.mode = mode; this.images = images;
            LinkedHashSet<String> urls = new LinkedHashSet<>();
            if (images) java.util.Collections.addAll(urls, TwimgImageUrls.extract(body));
            if (mode != 3) {
                java.util.Collections.addAll(urls, XMediaAttachments.directVideos(body));
                java.util.Collections.addAll(urls, ImgurDirectVideos.extract(body));
                java.util.Collections.addAll(urls, DirectVideoUrls.extract(body));
            }
            direct = urls.toArray(new String[0]);
            LinkedHashSet<String> posts = new LinkedHashSet<>();
            Matcher albums = ALBUM.matcher(body);
            while ((mode != 3 || images) && albums.find() && posts.size() < 8) posts.add(albums.group(1));
            for (String id : XMediaAttachments.postIds(body)) posts.add("x:" + id);
            for (String id : InstagramMediaAttachments.postIds(body)) posts.add("ig:" + id);
            ids = posts.toArray(new String[0]);
        }
    }
    private static ParsedBody parsed(Object model, String body, int mode, boolean images) {
        synchronized (PARSED) {
            ParsedBody cached = PARSED.get(model);
            if (cached != null && cached.body.equals(body) && cached.mode == mode && cached.images == images) return cached;
        }
        ParsedBody result = new ParsedBody(body, mode, images);
        synchronized (PARSED) {
            if (PARSED.size() >= 4096) {
                java.util.Iterator<Object> entries = PARSED.keySet().iterator();
                if (entries.hasNext()) { entries.next(); entries.remove(); }
            }
            PARSED.put(model, result);
        }
        return result;
    }
    private static final Map<Object, Boolean> VIDEO_MODELS = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static boolean videoRefreshPending;

    static void refreshVideoModels() {
        synchronized (VIDEO_MODELS) {
            if (videoRefreshPending) return;
            videoRefreshPending = true;
        }
        MAIN.postDelayed(() -> {
            synchronized (VIDEO_MODELS) {
                videoRefreshPending = false;
                for (Object model : VIDEO_MODELS.keySet()) {
                    try {
                        for (Field field : model.getClass().getDeclaredFields()) {
                            if (field.getType() != CharSequence[].class || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                            field.setAccessible(true);
                            field.set(model, null);
                        }
                    } catch (ReflectiveOperationException | RuntimeException error) {
                        Log.w("HaiagaruMedia", "Video projection refresh failed", error);
                    }
                }
            }
            Haiagaru.refreshImgurAttachments();
        }, 80);
    }

    private ImgurAlbumAttachments() {}

    /** Background patrol may wait for its own metadata, not unrelated on-screen requests. */
    static boolean pendingFor(java.util.Collection<?> models) {
        java.util.Set<Object> targets = java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
        targets.addAll(models);
        synchronized (CACHE) {
            for (Entry entry : CACHE.values()) {
                if (!entry.pending) continue;
                for (Subscriber subscriber : entry.subscribers)
                    if (targets.contains(subscriber.model.get())) return true;
            }
        }
        return false;
    }

    /** Called after native extraction, so a fast metadata response cannot replace its results. */
    public static String[] complete(Object model, String[] original) {
        if (model == null || original == null) return original;
        String body;
        switch (model.getClass().getName()) {
            case "o.processAdDisplayErrorPostbackForUserError": body = "c"; break;
            case "o.BouncyCastleSocketAdapterCompanion": body = "d"; break;
            case "o.setDislikeWidth": body = "g"; break;
            case "o.KeJ11": body = "h"; break;
            default: return original;
        }
        try {
            Field onlyCache = null;
            int cacheCount = 0;
            for (Field field : model.getClass().getDeclaredFields()) {
                if (field.getType() != String[].class
                        || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                onlyCache = field;
                cacheCount++;
                if (field.get(model) != original) continue;
                prepare(model, body, field.getName());
                Object updated = field.get(model);
                return projectImageVpn(model, body, updated instanceof String[] ? (String[]) updated : original);
            }
            // BE filtering can return a new array rather than the native cached instance.
            if (cacheCount == 1 && onlyCache != null) {
                onlyCache.set(model, original);
                prepare(model, body, onlyCache.getName());
                return projectImageVpn(model, body, (String[]) onlyCache.get(model));
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("HaiagaruImgur", "Attachment cache unavailable", error);
        }
        return projectImageVpn(model, body, original);
    }

    private static String[] projectImageVpn(Object model, String bodyField, String[] urls) {
        String body = null;
        try {
            Field field = model.getClass().getDeclaredField(bodyField);
            field.setAccessible(true);
            Object raw = field.get(model);
            if (raw instanceof String) body = (String) raw;
        } catch (ReflectiveOperationException ignored) { }
        urls = GifAutoFetch.project(model, body, urls);
        if (!ImageVpnController.enabled()) return urls;
        return ImageVpnController.attachments(Haiagaru.mediaImageFetchEnabled() ? body : null, urls);
    }

    /** Runs before the native cached attachment getter; networking stays off the UI thread. */
    public static void prepare(Object model, String bodyFieldName, String cacheFieldName) {
        if (model == null) return;
        int mode = Haiagaru.mediaAutoFetchMode();
        if (mode == 3 && !Haiagaru.mediaImageFetchEnabled() && Haiagaru.gifAutoFetchMode() == 3) return;
        try {
            Field bodyField = model.getClass().getDeclaredField(bodyFieldName);
            bodyField.setAccessible(true);
            Object raw = bodyField.get(model);
            if (!(raw instanceof String)) return;
            if (((String) raw).contains("video.twimg.com")) VIDEO_MODELS.put(model, Boolean.TRUE);
            ParsedBody parsed = parsed(model, (String) raw, mode, Haiagaru.mediaImageFetchEnabled());
            append(model, cacheFieldName, parsed.direct);
            for (String id : parsed.ids) {
                Entry entry;
                boolean request = false;
                synchronized (CACHE) {
                    entry = CACHE.get(id);
                    if (entry == null) {
                        if (CACHE.size() >= MAX_CACHE) {
                            String removable = null;
                            for (Map.Entry<String, Entry> item : CACHE.entrySet()) {
                                if (!item.getValue().pending) { removable = item.getKey(); break; }
                            }
                            if (removable == null) continue;
                            CACHE.remove(removable);
                        }
                        entry = new Entry();
                        CACHE.put(id, entry);
                    }
                    if (entry.images == null) {
                        entry.subscribers.removeIf(subscriber -> subscriber.model.get() == null);
                        boolean subscribed = false;
                        for (Subscriber subscriber : entry.subscribers) {
                            if (subscriber.model.get() == model) { subscribed = true; break; }
                        }
                        if (!subscribed && entry.subscribers.size() < 64)
                            entry.subscribers.add(new Subscriber(model, cacheFieldName));
                        if (!entry.pending && System.currentTimeMillis() - entry.lastAttempt > RETRY_MS) {
                            entry.pending = true;
                            entry.lastAttempt = System.currentTimeMillis();
                            request = true;
                        }
                    }
                }
                if (entry.images != null) append(model, cacheFieldName, entry.images);
                if (request) WORKER.execute(() -> resolve(id));
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("HaiagaruImgur", "Album attachment model unavailable", error);
        }
    }

    public static String imageFromHtml(String html) {
        Matcher tags = META.matcher(html);
        while (tags.find()) {
            String tag = tags.group();
            if (!PROPERTY.matcher(tag).find()) continue;
            Matcher content = CONTENT.matcher(tag);
            if (!content.find()) continue;
            String image = content.group(1).replace("&amp;", "&");
            if (!IMAGE.matcher(image).matches()) continue;
            int query = image.indexOf('?');
            int fragment = image.indexOf('#');
            int end = query < 0 ? image.length() : query;
            if (fragment >= 0) end = Math.min(end, fragment);
            return image.substring(0, end);
        }
        return null;
    }

    public static String[] imagesFromJson(String json) throws org.json.JSONException {
        org.json.JSONObject root = new org.json.JSONObject(json);
        if (!root.optBoolean("success", false)) return new String[0];
        org.json.JSONArray images = root.getJSONObject("data").getJSONArray("images");
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        for (int i = 0; i < images.length() && urls.size() < 100; i++) {
            org.json.JSONObject item = images.getJSONObject(i);
            String hash = item.optString("hash");
            String ext = item.optString("ext");
            String url = "https://i.imgur.com/" + hash + ext;
            if (hash.matches("[A-Za-z0-9]+") && ext.matches("(?i)\\.(png|jpe?g|gif|webp|mp4)"))
                urls.add(url);
        }
        return urls.toArray(new String[0]);
    }

    public static String[] mediaFromHtml(String html) {
        Matcher tags = META.matcher(html);
        LinkedHashSet<String> videos = new LinkedHashSet<>();
        while (tags.find() && videos.size() < 100) {
            String tag = tags.group();
            if (!VIDEO_PROPERTY.matcher(tag).find()) continue;
            Matcher content = CONTENT.matcher(tag);
            if (!content.find()) continue;
            String url = content.group(1).replace("&amp;", "&");
            if (VIDEO.matcher(url).matches()) videos.add(url);
        }
        if (!videos.isEmpty()) return videos.toArray(new String[0]);
        String image = imageFromHtml(html);
        return image == null ? new String[0] : new String[]{image};
    }

    private static String fetch(String url) throws Exception {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(8_000);
            connection.setReadTimeout(8_000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 Haiagaru");
            if (connection.getResponseCode() == 200) {
                try (InputStream stream = connection.getInputStream();
                     ByteArrayOutputStream bytes = new ByteArrayOutputStream()) {
                    byte[] buffer = new byte[8192];
                    int count;
                    while ((count = stream.read(buffer)) >= 0) {
                        if (bytes.size() + count > 2_000_000) break;
                        bytes.write(buffer, 0, count);
                    }
                    return bytes.toString("UTF-8");
                }
            }
        } finally {
            if (connection != null) connection.disconnect();
        }
        return null;
    }

    private static void resolve(String id) {
        String[] images = null;
        boolean xPost = id.startsWith("x:");
        boolean instagramPost = id.startsWith("ig:");
        try {
            String json = xPost ? XPostMetadata.fetch(id.substring(2)) : fetch(instagramPost
                    ? "https://www.instagram.com/p/" + id.substring(3) + "/embed/"
                    : "https://imgur.com/ajaxalbums/getimages/" + id + "/hit.json");
            if (json != null) images = instagramPost ? InstagramMediaAttachments.fromHtml(json, id.substring(3))
                    : xPost ? XMediaAttachments.fromJson(json, id.substring(2)) : imagesFromJson(json);
        } catch (Exception error) {
            Log.w("HaiagaruImgur", "Album image list unavailable: " + id, error);
        }
        if (instagramPost && (images == null || images.length == 0)) {
            try {
                String html = fetch("https://www.instagram.com/p/" + id.substring(3) + "/");
                if (html != null) images = InstagramMediaAttachments.fromHtml(html, id.substring(3));
            } catch (Exception error) { Log.w("HaiagaruImgur", "Instagram public media unavailable", error); }
        }
        if (!xPost && !instagramPost && (images == null || images.length == 0)) {
            try {
                String html = fetch("https://imgur.com/a/" + id);
                images = html == null ? null : mediaFromHtml(html);
            } catch (Exception error) {
                Log.w("HaiagaruImgur", "Album metadata unavailable: " + id, error);
            }
        }
        // Empty/error responses are retryable, not a permanently cached empty album.
        final String[] resolved = images == null || images.length == 0 ? null : images;
        if (resolved == null) Log.w("HaiagaruImgur", "No media returned; retry allowed: " + id);
        if (resolved != null) Log.i("HaiagaruImgur", "Album " + id + ": " + resolved.length + " images");
        List<Subscriber> subscribers;
        synchronized (CACHE) {
            Entry entry = CACHE.get(id);
            if (entry == null) return;
            entry.images = resolved;
            entry.pending = false;
            subscribers = new ArrayList<>(entry.subscribers);
            entry.subscribers.clear();
        }
        if (resolved != null) MAIN.post(() -> {
            boolean changed = false;
            for (Subscriber subscriber : subscribers) {
                Object model = subscriber.model.get();
                if (model != null) changed |= append(model, subscriber.cacheFieldName, resolved);
            }
            if (changed) Haiagaru.refreshImgurAttachments();
        });
    }

    private static boolean append(Object model, String fieldName, String[] images) {
        try {
            Field field = model.getClass().getDeclaredField(fieldName);
            field.setAccessible(true);
            Object existing = field.get(model);
            // Leave native extraction intact when it has not run yet.
            if (!(existing instanceof String[])) return false;
            LinkedHashSet<String> urls = new LinkedHashSet<>();
            boolean changed = false;
            int mode = Haiagaru.mediaAutoFetchMode();
            for (String url : (String[]) existing) {
                if (Haiagaru.mediaImageFetchEnabled()) {
                    String normalized = TwimgImageUrls.canonical(url);
                    if (normalized != null && !normalized.equals(url)) {
                        url = normalized;
                        changed = true;
                    }
                }
                boolean resolvedPost = false;
                // i.imgur.com/a/... is an album page, not an additional image.
                // Replace only once resolution succeeds; failed albums remain retryable.
                Matcher album = url == null ? null : ALBUM.matcher(url);
                if ((mode != 3 || Haiagaru.mediaImageFetchEnabled()) && album != null && album.matches()) {
                    synchronized (CACHE) {
                        Entry entry = CACHE.get(album.group(1));
                        resolvedPost = entry != null && entry.images != null && entry.images.length > 0;
                    }
                }
                for (String code : InstagramMediaAttachments.postIds(url)) {
                    synchronized (CACHE) {
                        Entry entry = CACHE.get("ig:" + code);
                        resolvedPost = entry != null && entry.images != null && entry.images.length > 0;
                    }
                    if (resolvedPost) break;
                }
                // Only replace a post URL after its own public media resolved.
                // Keep the original response text and unsuccessful posts unchanged.
                if (resolvedPost) {
                    changed = true;
                    continue;
                }
                boolean directVideo = DirectVideoUrls.supported(url);
                if (directVideo && (mode == 0 || mode == 3)) {
                    changed = true;
                    if (mode == 0) {
                        VIDEO_MODELS.put(model, Boolean.TRUE);
                        String poster = XMediaAttachments.generatedPoster(url);
                        if (poster != null) urls.add(poster);
                        else VideoFrameThumbnail.request(url);
                    }
                } else changed |= !urls.add(url);
            }
            for (String image : images) {
                boolean video = DirectVideoUrls.supported(image);
                if (video && mode == 3) continue;
                if (!video && XMediaAttachments.isPoster(image) && mode != 0 && mode != 1) continue;
                if (!video && !Haiagaru.mediaImageFetchEnabled() && !XMediaAttachments.isPoster(image)
                        && !GifAutoFetchPolicy.supported(image)) continue;
                if (video && mode == 0) {
                    VIDEO_MODELS.put(model, Boolean.TRUE);
                    String poster = XMediaAttachments.generatedPoster(image);
                    if (poster != null) changed |= urls.add(poster);
                    else VideoFrameThumbnail.request(image);
                    continue;
                }
                if (video && mode == 1) {
                    VIDEO_MODELS.put(model, Boolean.TRUE);
                    String poster = XMediaAttachments.generatedPoster(image);
                    if (poster != null) changed |= urls.add(poster);
                    else VideoFrameThumbnail.request(image);
                }
                if (video) VIDEO_MODELS.put(model, Boolean.TRUE);
                changed |= urls.add(image);
            }
            if (changed) {
                String[] updated = urls.toArray(new String[0]);
                if (java.util.Arrays.equals((String[]) existing, updated)) return false;
                field.set(model, updated);
                // ChMate also caches thumbnail projections separately from the raw URL array.
                // Let the native renderer rebuild them using the expanded attachments.
                for (Field projection : model.getClass().getDeclaredFields()) {
                    if (projection.getType() != CharSequence[].class
                            || java.lang.reflect.Modifier.isStatic(projection.getModifiers())) continue;
                    projection.setAccessible(true);
                    projection.set(model, null);
                }
                return true;
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("HaiagaruImgur", "Could not append resolved image", error);
        }
        return false;
    }

    private static final class Entry {
        volatile String[] images;
        boolean pending;
        long lastAttempt;
        final List<Subscriber> subscribers = new ArrayList<>();
    }

    private static final class Subscriber {
        final WeakReference<Object> model;
        final String cacheFieldName;
        Subscriber(Object model, String cacheFieldName) {
            this.model = new WeakReference<>(model);
            this.cacheFieldName = cacheFieldName;
        }
    }
}
