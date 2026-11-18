package app.revanced.extension.rif;

import android.net.Uri;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Helpers for the "Fix comment video links" patch.
 */
public final class VideoLinks {

    private static final String TAG = "RifVideoLinks";
    private static final Pattern ID = Pattern.compile("[A-Za-z0-9]+");

    private VideoLinks() {}

    /**
     * Called at the start of rif's player-link video loader result handler (free j2.a$b,
     * Platinum k2.a$b) with the parsed video, which is null when rif found no metadata.
     *
     * rif resolves reddit.com/link/{id}/video/{mediaId}/player by looking {id} up as a post
     * via /api/info and reading its media_metadata. For a video embedded in a comment, {id}
     * is the comment, and the API exposes no media for comments at all, so that always
     * fails ("error retrieving Reddit video metadata"). The streams themselves are public,
     * at v.redd.it/link/{id}/asset/{mediaId}/, so in that case build rif's video object
     * pointing at them; rif then plays it like any other Reddit video.
     *
     * @param loader the loader instance (holds the player link as its own Uri field)
     * @return the parsed video if rif found one, else a video for the link's streams, or null
     */
    public static Object orStreamFallback(Object loader, Object parsed) {
        if (parsed != null) return parsed;
        try {
            Uri link = ownUriField(loader);
            if (link == null) return null;
            List<String> segments = link.getPathSegments();
            if (segments.size() < 4 || !"link".equals(segments.get(0)) || !"video".equals(segments.get(2))) {
                return null;
            }
            String id = segments.get(1), mediaId = segments.get(3);
            if (!ID.matcher(id).matches() || !ID.matcher(mediaId).matches()) return null;

            String base = "https://v.redd.it/link/" + id + "/asset/" + mediaId + "/";
            String json = "{\"dash_url\":\"" + base + "DASHPlaylist.mpd\","
                    + "\"hls_url\":\"" + base + "HLSPlaylist.m3u8\",\"is_gif\":false}";
            // Let rif's own JSON mapper build the model: its JSON field names are the same in
            // every rif build, unlike its (obfuscated) setters.
            Class<?> model = Class.forName("com.andrewshu.android.reddit.things.objects.ThreadMediaRedditVideo");
            Class<?> loganSquare = Class.forName("com.bluelinelabs.logansquare.LoganSquare");
            return loganSquare.getMethod("parse", String.class, Class.class).invoke(null, json, model);
        } catch (Throwable t) {
            Log.w(TAG, "comment video fallback failed", t);
            return null;
        }
    }

    /** The loader's own (not inherited) instance field of type Uri: the player link. */
    private static Uri ownUriField(Object loader) throws IllegalAccessException {
        for (Field field : loader.getClass().getDeclaredFields()) {
            if (field.getType() == Uri.class && !Modifier.isStatic(field.getModifiers())) {
                field.setAccessible(true);
                return (Uri) field.get(loader);
            }
        }
        return null;
    }
}
