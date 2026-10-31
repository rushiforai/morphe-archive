package software.santodan.extension.nuviobuttons;

import software.santodan.nuvio.NuvioNative;

import java.util.HashMap;
import java.util.Map;

/** Native vectors are safe to cache; player painters, callbacks and composers are never cached. */
final class ButtonsIcons {
    private static final Map<String, Object> cached = new HashMap<>();
    static boolean hasIntroDb(ClassLoader loader) {
        try { Class.forName("software.santodan.extension.nuviointro.NuvioIntroDb", false, loader); return true; }
        catch (ClassNotFoundException absent) { return false; }
    }
    static synchronized Object icon(ClassLoader loader, String id) throws Exception {
        if (cached.containsKey(id)) return cached.get(id);
        Object result;
        if (id.equals("introdb")) {
            result = loader.loadClass("software.santodan.extension.nuviointro.NuvioIntroDb")
                .getMethod("settingsIcon", ClassLoader.class).invoke(null, loader);
        } else if (id.equals("subtitles") || id.equals("episodes") || id.equals("aspect")) {
            result = inlineIcon(loader, id);
        } else {
            String owner, method;
            switch (id) {
                case "play": owner = NuvioNative.ICON_MEDIA_NAME; method = "u"; break;
                case "next": owner = NuvioNative.ICON_NEXT_NAME; method = "v"; break;
                case "audio": owner = NuvioNative.ICON_AUDIO_NAME; method = "e"; break;
                case "sources": case "engine": owner = NuvioNative.RESOURCE_HELPER_NAME; method = "V"; break;
                case "party": owner = NuvioNative.ICON_PARTY_ROUNDED_NAME; method = "o"; break;
                case "speed": owner = NuvioNative.ICON_SPEED_NAME; method = "n"; break;
                case "external": owner = NuvioNative.ICON_EXTERNAL_NAME; method = "h"; break;
                case "info": owner = NuvioNative.ICON_MEDIA_NAME; method = "q"; break;
                case "report": owner = NuvioNative.ICON_PARTY_NAME; method = "j"; break;
                case "chapters": return inlineIcon(loader, "chapters");
                default: throw new IllegalArgumentException(id);
            }
            result = NuvioPlaybackButtons.method(loader.loadClass(owner), method, 0).invoke(null);
        }
        cached.put(id, result);
        return result;
    }
    private static Object inlineIcon(ClassLoader loader, String id) throws Exception {
        String owner = id.equals("subtitles") ? NuvioNative.ICON_PARTY_NAME : id.equals("episodes") ? NuvioNative.ICON_EXTERNAL_NAME : id.equals("chapters") ? NuvioNative.ICON_CHAPTERS_NAME : NuvioNative.ICON_ASPECT_NAME;
        String field = id.equals("subtitles") ? "d" : id.equals("chapters") ? "c" : id.equals("episodes") ? "b" : "a";
        java.lang.reflect.Field nativeCache = loader.loadClass(owner).getDeclaredField(field);
        nativeCache.setAccessible(true);
        Object existing = nativeCache.get(null);
        if (existing != null) return existing;
        // These native glyphs are initialized inline by the player, with no callable factory.
        // Supply the same caption/list/aspect symbols when Settings opens before playback.
        Object vector = loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME).getDeclaredConstructor(String.class, float.class, float.class,
            float.class, float.class, long.class, int.class, boolean.class, int.class)
            .newInstance("Santodan.Playback." + id, 24f, 24f, 24f, 24f, 0L, 0, false, 96);
        Object path = loader.loadClass("io.sentry.d2").getDeclaredConstructor(int.class).newInstance(1);
        if (id.equals("episodes") || id.equals("chapters")) {
            for (int y : new int[]{5, 11, 17}) {
                polygon(path, 3,y, 5,y, 5,y+2, 3,y+2);
                polygon(path, 7,y, 21,y, 21,y+2, 7,y+2);
            }
        } else if (id.equals("aspect")) {
            polygon(path, 3,3, 21,3, 21,5, 3,5);
            polygon(path, 3,19, 21,19, 21,21, 3,21);
            polygon(path, 3,5, 5,5, 5,19, 3,19);
            polygon(path, 19,5, 21,5, 21,19, 19,19);
            polygon(path, 7,7, 12,7, 12,9, 9,9, 9,12, 7,12);
            polygon(path, 17,17, 12,17, 12,15, 15,15, 15,12, 17,12);
        } else {
            polygon(path, 3,3, 21,3, 21,5, 3,5);
            polygon(path, 3,19, 21,19, 21,21, 3,21);
            polygon(path, 3,5, 5,5, 5,19, 3,19);
            polygon(path, 19,5, 21,5, 21,19, 19,19);
            for (int x : new int[]{7, 13}) polygon(path, x,8, x+4,8, x+4,10, x+2,10,
                x+2,14, x+4,14, x+4,16, x,16);
        }
        java.lang.reflect.Field black = loader.loadClass(NuvioNative.COLOR_NAME).getDeclaredField("b"); black.setAccessible(true);
        Object brush = loader.loadClass("e2.a1").getDeclaredConstructor(long.class).newInstance(black.get(null));
        java.lang.reflect.Field nodes = path.getClass().getDeclaredField("b"); nodes.setAccessible(true);
        NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME), "a", 4).invoke(null, vector, nodes.get(path), 0, brush);
        return NuvioPlaybackButtons.method(loader.loadClass(NuvioNative.VECTOR_BUILDER_NAME), "b", 0).invoke(vector);
    }
    private static void polygon(Object path, float... points) throws Exception {
        NuvioPlaybackButtons.method(path.getClass(), "o", 2).invoke(path, points[0], points[1]);
        for (int i = 2; i < points.length; i += 2)
            NuvioPlaybackButtons.method(path.getClass(), "m", 2).invoke(path, points[i], points[i+1]);
        NuvioPlaybackButtons.method(path.getClass(), "e", 0).invoke(path);
    }
}
