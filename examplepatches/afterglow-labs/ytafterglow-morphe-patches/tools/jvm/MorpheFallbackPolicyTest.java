package app.afterglow.extension.navigation;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public final class MorpheFallbackPolicyTest {
    private static final Map<String, Object> PREFS = new HashMap<>();
    private static boolean failReads;
    private static int checks;

    private static void check(String name, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(name + ": " + actual + " != " + expected);
    }
    private static byte[] text(int number, String value) { return bytes(number, value.getBytes(StandardCharsets.UTF_8)); }
    private static byte[] bytes(int number, byte[] value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        varint(out, ((long) number << 3) | 2); varint(out, value.length); out.writeBytes(value);
        return out.toByteArray();
    }
    private static void varint(ByteArrayOutputStream out, long value) {
        do { int low = (int) (value & 127); value >>>= 7; out.write(low | (value == 0 ? 0 : 128)); } while (value != 0);
    }
    private static byte[] join(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] part : parts) out.writeBytes(part);
        return out.toByteArray();
    }
    private static String encoded(byte[] entity) { return Base64.getUrlEncoder().withoutPadding().encodeToString(entity); }
    private static byte[] endpoint(byte[] entity) { return text(1, encoded(entity)); }
    private static String link(byte[] entity) { return MorpheFallbackShareEntity.url(endpoint(entity)); }

    public static void main(String[] args) throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, values) -> {
                    if (!method.getName().equals("getBoolean")) throw new AssertionError(method.getName());
                    if (failReads) throw new IllegalStateException("unavailable preferences");
                    return (Boolean) PREFS.getOrDefault((String) values[0], values[1]);
                });
        Field store = AfterglowPrefs.class.getDeclaredField("prefs");
        store.setAccessible(true); store.set(null, preferences);

        check("album default OFF", false, AfterglowPrefs.descriptor("fixAlbums").defaultValue);
        check("share default OFF", false, AfterglowPrefs.descriptor("nativeShare").defaultValue);
        String album = "https://yt3.ggpht.com/channel=a%2Fb?x=%20#crop";
        PREFS.put("fixAlbums", true); PREFS.put("nativeShare", true);
        check("unselected album keeps URL", album, MorpheFallbackAlbumCovers.overrideImageURL(album));
        check("unselected share cannot intercept", false, MorpheFallbackNativeShare.isEnabled());
        InstalledTweaks.mark("fix-albums"); InstalledTweaks.mark("native-share");
        PREFS.clear();
        check("selected album remains default OFF", album, MorpheFallbackAlbumCovers.overrideImageURL(album));
        check("selected share remains default OFF", false, MorpheFallbackNativeShare.isEnabled());
        PREFS.put("fixAlbums", true);
        check("album preserves encoded suffix", "https://yt4.ggpht.com/channel=a%2Fb?x=%20#crop",
                MorpheFallbackAlbumCovers.overrideImageURL(album));
        check("googleusercontent remains same CDN family", "https://yt4.googleusercontent.com/a",
                MorpheFallbackAlbumCovers.replacement("https://yt3.googleusercontent.com/a"));
        check("port and scheme retained", "http://yt4.ggpht.com:8080/a",
                MorpheFallbackAlbumCovers.replacement("http://yt3.ggpht.com:8080/a"));
        check("case insensitive exact host", "HTTPS://yt4.ggpht.com/a",
                MorpheFallbackAlbumCovers.replacement("HTTPS://YT3.GGPHT.COM/a"));
        for (String value : new String[]{null, "", "not a URL", "https://yt4.ggpht.com/a",
                "https://lh3.googleusercontent.com/a", "https://play-lh.googleusercontent.com/a",
                "https://yt3.ggpht.com.example.org/a", "https://example.org/yt3.ggpht.com/a",
                "https://yt3.ggpht.com@example.org/a", "https://user@yt3.ggpht.com/a",
                "https://i.ytimg.com/vi/video/default.jpg", "//yt3.ggpht.com/a"}) {
            check("unchanged host " + value, value, MorpheFallbackAlbumCovers.replacement(value));
        }
        PREFS.put("fixAlbums", false);
        check("live album OFF", album, MorpheFallbackAlbumCovers.overrideImageURL(album));
        PREFS.put("fixAlbums", true); PREFS.put("liteModeEnabled", true);
        check("Lite Mode leaves album choice", "https://yt4.ggpht.com/channel=a%2Fb?x=%20#crop",
                MorpheFallbackAlbumCovers.overrideImageURL(album));

        check("fixed video wire fixture", "https://youtube.com/watch?v=abcdefghijk",
                MorpheFallbackShareEntity.fromSerialized("CgthYmNkZWZnaGlqaw=="));
        check("video", "https://youtube.com/watch?v=video_01", link(text(1, "video_01")));
        check("playlist", "https://youtube.com/playlist?list=PLvideo", link(text(2, "PLvideo")));
        check("favorites", "https://youtube.com/playlist?list=FLvideo", link(text(2, "FLvideo")));
        check("mix playnext", "https://youtube.com/playlist?list=RDvideo&playnext=1", link(text(2, "RDvideo")));
        check("channel", "https://youtube.com/channel/UCvideo", link(text(3, "UCvideo")));
        check("post", "https://youtube.com/post/Ugkx-post", link(text(6, "Ugkx-post")));
        check("clip", "https://youtube.com/clip/Ugkx-clip", link(bytes(8, text(1, "Ugkx-clip"))));
        check("iOS playlist precedence", "https://youtube.com/playlist?list=PLvideo",
                link(join(text(1, "video_01"), text(2, "PLvideo"))));
        check("iOS post precedence", "https://youtube.com/post/post01",
                link(join(text(6, "post01"), text(3, "UCvideo"))));
        check("Shorts metadata preserves video", "https://youtube.com/watch?v=video_01",
                link(join(text(1, "video_01"), new byte[]{80, 1, 96, 0, (byte) 160, 1, 1})));
        check("percent-encoded padding", "https://youtube.com/watch?v=abcdefghijk",
                MorpheFallbackShareEntity.fromSerialized("CgthYmNkZWZnaGlqaw%3D%3D"));
        check("base64 whitespace", "https://youtube.com/watch?v=abcdefghijk",
                MorpheFallbackShareEntity.fromSerialized("CgthYmNk\nZWZnaGlqaw=="));
        for (byte[] entity : new byte[][]{text(1, ""), text(1, "video&si=bad"), text(1, "video/other"),
                join(text(1, "video01"), text(1, "video02")), bytes(18, text(1, "comment")),
                join(text(1, "video01"), new byte[]{32, 5}), new byte[]{0}, new byte[]{10, 5, 65},
                new byte[]{11}, new byte[]{10, (byte) 255}, new byte[]{10, 1, (byte) 255},
                bytes(8, new byte[]{8, 1}), bytes(8, join(text(1, "clip"), text(2, "extra")))}) {
            check("unknown or malformed entity stays native", null, link(entity));
        }
        for (String malformed : new String[]{null, "", "%", "%gg", "*bad*", "A", "===="}) {
            check("malformed serialization " + malformed, null, MorpheFallbackShareEntity.fromSerialized(malformed));
        }
        for (byte[] malformed : new byte[][]{null, new byte[0], new byte[]{0}, new byte[]{8, 1},
                join(endpoint(text(1, "one")), endpoint(text(1, "two"))), new byte[128 * 1024 + 1]}) {
            check("malformed endpoint stays native", null, MorpheFallbackShareEntity.url(malformed));
        }
        byte[] manyFields = new byte[514];
        for (int i = 0; i < manyFields.length; i += 2) { manyFields[i] = 80; manyFields[i + 1] = 1; }
        check("field-count limit", null, link(manyFields));
        for (int i = 1; i < 12; i++) {
            byte[] truncated = java.util.Arrays.copyOf(text(1, "abcdefghijk"), i);
            check("truncated ID payload " + i, null, link(truncated));
        }

        byte[] share = endpoint(text(1, "video_01"));
        check("no activity/context preserves native", false, MorpheFallbackNativeShare.openSystemShareSheet(share));
        PREFS.put("nativeShare", true);
        Activity activity = new Activity(); Afterglow.activity = activity;
        int[] dismissals = new int[2];
        MorpheFallbackNativeShare.ActionSheetController firstSheet = () -> dismissals[0]++;
        MorpheFallbackNativeShare.setActionSheetController(firstSheet);
        check("chooser accepted", true, MorpheFallbackNativeShare.openSystemShareSheet(share));
        Intent chooser = activity.lastIntent;
        check("chooser action", "android.intent.action.CHOOSER", chooser.action);
        check("share intent action", Intent.ACTION_SEND, chooser.target.action);
        check("share MIME", "text/plain", chooser.target.type);
        check("share URL", "https://youtube.com/watch?v=video_01", chooser.target.extras.get(Intent.EXTRA_TEXT));
        check("activity chooser avoids new task", Intent.FLAG_ACTIVITY_NO_USER_ACTION, chooser.flags);
        check("placeholder not dismissed during native call", 0, dismissals[0]);
        Afterglow.pending.remove(0).run();
        check("same native show dismissed later", 1, dismissals[0]);
        check("chooser stays on screen after native placeholder cleanup", chooser, activity.lastIntent);
        check("second chooser accepted", true, MorpheFallbackNativeShare.openSystemShareSheet(share));
        MorpheFallbackNativeShare.setActionSheetController(firstSheet);
        Afterglow.pending.remove(0).run();
        check("same controller reused by new sheet is untouched", 1, dismissals[0]);
        check("third chooser accepted", true, MorpheFallbackNativeShare.openSystemShareSheet(share));
        MorpheFallbackNativeShare.setActionSheetController(() -> dismissals[1]++);
        Afterglow.pending.remove(0).run();
        check("replaced controller cancels older dismissal", 1, dismissals[0]);
        check("new controller untouched", 0, dismissals[1]);

        activity.failStart = true;
        check("launch failure preserves native flow", false, MorpheFallbackNativeShare.openSystemShareSheet(share));
        check("failed chooser does not dismiss native sheet", 0, Afterglow.pending.size());
        activity.failStart = false; activity.finishing = true;
        Context application = new Context(); Afterglow.application = application;
        check("finishing activity uses application context", true, MorpheFallbackNativeShare.openSystemShareSheet(share));
        check("fallback chooser task flags", Intent.FLAG_ACTIVITY_NO_USER_ACTION | Intent.FLAG_ACTIVITY_NEW_TASK,
                application.lastIntent.flags);
        Afterglow.pending.clear(); activity.finishing = false; activity.destroyed = true;
        check("destroyed activity uses application context", true, MorpheFallbackNativeShare.openSystemShareSheet(share));
        Afterglow.pending.clear(); Afterglow.activity = null; Afterglow.application = null;
        check("enabled but missing context stays native", false, MorpheFallbackNativeShare.openSystemShareSheet(share));
        Afterglow.activity = activity; activity.destroyed = false;
        check("unsupported entity stays native", false, MorpheFallbackNativeShare.openSystemShareSheet(endpoint(bytes(18, text(1, "comment")))));
        PREFS.put("nativeShare", false);
        check("live share OFF", false, MorpheFallbackNativeShare.openSystemShareSheet(share));
        PREFS.put("nativeShare", "malformed");
        check("wrong preference type defaults OFF", false, MorpheFallbackNativeShare.isEnabled());
        failReads = true;
        check("unavailable share preference stays native", false, MorpheFallbackNativeShare.isEnabled());
        check("unavailable album preference keeps URL", album, MorpheFallbackAlbumCovers.overrideImageURL(album));
        failReads = false;
        PREFS.put("nativeShare", true);
        check("live preference recovery", true, MorpheFallbackNativeShare.isEnabled());
        PREFS.clear();
        check("reset share OFF", false, MorpheFallbackNativeShare.isEnabled());
        check("reset album OFF", album, MorpheFallbackAlbumCovers.overrideImageURL(album));
        System.out.println(checks + " temporary Morphe adapter checks passed");
    }
}
