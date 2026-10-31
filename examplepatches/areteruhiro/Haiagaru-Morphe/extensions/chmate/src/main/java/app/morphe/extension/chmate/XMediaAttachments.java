package app.morphe.extension.chmate;

import java.net.URI;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Public X embed metadata only; no login credentials or third-party mirrors. */
public final class XMediaAttachments {
    private static final java.util.Map<String, String> FRAME_POSTERS = java.util.Collections.synchronizedMap(
            new java.util.LinkedHashMap<String, String>() {
                @Override protected boolean removeEldestEntry(java.util.Map.Entry<String, String> entry) { return size() > 256; }
            });
    private static final java.util.Map<String, String> POSTERS = java.util.Collections.synchronizedMap(
            new java.util.LinkedHashMap<String, String>() {
                @Override protected boolean removeEldestEntry(java.util.Map.Entry<String, String> entry) {
                    return size() > 256;
                }
            });
    private static final Pattern POST = Pattern.compile(
            "(?<![A-Za-z0-9_./:@-])(?:(?:https?|ttps?)://|//)?"
                    + "(?:(?:www|mobile)\\.)?(?:x\\.com|twitter\\.com)/"
                    + "(?:[A-Za-z0-9_]+/status|i/web/status)/(\\d+)(?=[/?#\\s<>\"'()（）]|$)",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern DIRECT = Pattern.compile(
            "(?<![A-Za-z0-9_./:@-])(?:(?:https?|ttps?)://|//)?"
                    + "video\\.twimg\\.com/[^\\s<>\"']+", Pattern.CASE_INSENSITIVE);

    private XMediaAttachments() {}

    public static Object nativeVideo(String url, String className) {
        if (!isVideo(url)) return null;
        int mode = Haiagaru.mediaAutoFetchMode();
        if (mode == 0 || mode == 3) return null;
        if (!POSTERS.containsKey(url) || VideoFrameThumbnail.fourAllowed()) VideoFrameThumbnail.request(url);
        try {
            java.lang.reflect.Constructor<?> constructor = Class.forName(className)
                    .getDeclaredConstructor(String.class, String.class);
            constructor.setAccessible(true);
            String poster = generatedPoster(url);
            if (poster == null) poster = VideoThumbnailServer.placeholder();
            return constructor.newInstance(url, poster);
        } catch (Exception error) {
            android.util.Log.w("HaiagaruMedia", "Native video projection unavailable", error);
            return null;
        }
    }

    static void setGeneratedPoster(String url, String poster) { POSTERS.put(url, poster); }
    static boolean hasFramePoster(String url,String variant){return FRAME_POSTERS.containsKey(variant+":"+url);}
    static void setFramePoster(String url, String variant, String poster) { FRAME_POSTERS.put(variant + ":" + url, poster); }
    static boolean isPoster(String url) { return POSTERS.containsValue(url) || FRAME_POSTERS.containsValue(url); }
    static String sourceVideo(String poster){
        String result=null;
        for(java.util.Map<String,String> map:new java.util.Map[]{POSTERS,FRAME_POSTERS})synchronized(map){
            for(java.util.Map.Entry<String,String> entry:map.entrySet())if(java.util.Objects.equals(poster,entry.getValue())){
                String key=entry.getKey();int start=key.indexOf("https://");if(start<0)start=key.indexOf("http://");
                if(start<0)continue;String url=key.substring(start);if(!isVideo(url))continue;
                if(result!=null&&!result.equals(url))return null;result=url;
            }
        }
        return result;
    }
    static String generatedPoster(String url) {
        if (VideoFrameThumbnail.fourAllowed()) VideoFrameThumbnail.request(url);
        String frame = FRAME_POSTERS.get(VideoFrameThumbnail.currentVariant() + ":" + url);
        return frame != null ? frame : POSTERS.get(url);
    }
    public static boolean isVideo(String url) { return DirectVideoUrls.supported(url); }

    public static String[] postIds(String body) {
        LinkedHashSet<String> ids = new LinkedHashSet<>();
        if (body == null) return new String[0];
        Matcher matcher = POST.matcher(body);
        while (matcher.find() && ids.size() < 8) ids.add(matcher.group(1));
        return ids.toArray(new String[0]);
    }

    public static String[] directVideos(String body) {
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        if (body == null) return new String[0];
        Matcher matcher = DIRECT.matcher(body);
        while (matcher.find() && urls.size() < 8) {
            String url = matcher.group().replace("&amp;", "&");
            // Only the recognized, exact media host is repaired. Keep the
            // response text unchanged and always fetch the video over HTTPS.
            int host = url.toLowerCase(java.util.Locale.ROOT).indexOf("video.twimg.com/");
            url = "https://" + url.substring(host);
            if (validMedia(url, true)) urls.add(url);
        }
        return urls.toArray(new String[0]);
    }

    private static boolean validMedia(String url, boolean video) {
        try {
            URI uri = URI.create(url);
            return "https".equalsIgnoreCase(uri.getScheme()) && uri.getUserInfo() == null
                    && uri.getPort() == -1
                    && (video ? "video.twimg.com".equalsIgnoreCase(uri.getHost())
                        || ("i.imgur.com".equalsIgnoreCase(uri.getHost())
                            && uri.getPath() != null && uri.getPath().matches("(?i)/[A-Za-z0-9]+\\.mp4"))
                        || (uri.getHost() != null && (uri.getHost().endsWith(".cdninstagram.com") || uri.getHost().endsWith(".fbcdn.net")))
                        : "pbs.twimg.com".equalsIgnoreCase(uri.getHost()))
                    && uri.getPath() != null
                    && uri.getPath().matches(video ? "(?i).+\\.mp4" : "(?i).+\\.(jpg|jpeg|png|webp|gif)");
        } catch (IllegalArgumentException error) { return false; }
    }

    public static String[] fromJson(String json, String expectedId) throws JSONException {
        JSONObject post = new JSONObject(json);
        if (!expectedId.equals(post.optString("id_str"))) return new String[0];
        JSONArray media = post.optJSONArray("mediaDetails");
        if (media == null || media.length() == 0) media = post.optJSONArray("photos");
        LinkedHashSet<String> urls = new LinkedHashSet<>();
        if (media == null || media.length()==0){
            media=new JSONArray();JSONObject video=post.optJSONObject("video");if(video!=null)media.put(video);
        }
        for (int i = 0; i < media.length() && i < 16; i++) {
            JSONObject item = media.optJSONObject(i);
            if (item == null) continue;
            String thumbnail = item.optString("media_url_https");
            if (thumbnail.isEmpty()) thumbnail = item.optString("url");
            if (!validMedia(thumbnail,false)) thumbnail=item.optString("poster",thumbnail);
            String normalizedThumbnail = TwimgImageUrls.canonical(thumbnail);
            if (normalizedThumbnail != null) thumbnail = normalizedThumbnail;
            JSONObject info = item.optJSONObject("video_info");
            JSONArray variants = info == null ? item.optJSONArray("variants") : info.optJSONArray("variants");
            String best = null;
            long bitrate = -1;
            if (variants != null) for (int j = 0; j < variants.length(); j++) {
                JSONObject variant = variants.optJSONObject(j);
                if (variant == null || !"video/mp4".equals(variant.optString("content_type",variant.optString("type")))) continue;
                String url = variant.optString("url",variant.optString("src"));
                long rate = variant.optLong("bitrate", 0);
                if (validMedia(url, true) && rate > bitrate) { best = url; bitrate = rate; }
            }
            if (best != null) {
                if (validMedia(thumbnail, false)) {
                    POSTERS.put(best, thumbnail);
                    urls.add(thumbnail);
                }
                urls.add(best);
            } else if (validMedia(thumbnail, false)) urls.add(thumbnail);
        }
        return urls.toArray(new String[0]);
    }
}
