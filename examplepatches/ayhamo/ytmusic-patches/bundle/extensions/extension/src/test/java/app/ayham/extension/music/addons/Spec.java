package app.ayham.extension.music.addons;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Map;

import app.ayham.extension.music.automix.Json;

/** The shared addon spec files (spec/addons), found by walking up as SpecFixturesTest does (/spec in the Docker build). */
final class Spec {
    private Spec() {
    }

    static File dir() {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File s = new File(d, "spec/addons");
            if (s.isDirectory()) return s;
        }
        throw new AssertionError("spec/addons not found above " + new File("").getAbsolutePath());
    }

    @SuppressWarnings("unchecked")
    static Map<String, Object> read(String name) {
        try {
            File f = new File(dir(), name);
            return (Map<String, Object>) Json.parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
        } catch (java.io.IOException e) {
            throw new AssertionError(e);
        }
    }

    /** A target as the spec files write it. */
    static TrackMatcher.Target target(Object json) {
        Map<?, ?> m = (Map<?, ?>) json;
        TrackMatcher.Target t = new TrackMatcher.Target();
        t.title = (String) m.get("title");
        t.artist = (String) m.get("artist");
        t.album = (String) m.get("album");
        t.isrc = (String) m.get("isrc");
        t.durationSec = m.get("durationSec") instanceof Number ? ((Number) m.get("durationSec")).doubleValue() : null;
        t.isExplicit = (Boolean) m.get("isExplicit");
        t.isVideo = Boolean.TRUE.equals(m.get("isVideo"));
        return t;
    }

    /** Numbers as doubles, so 128 and 128.0 compare equal; lists and maps element by element (order kept). */
    static boolean same(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) return ((Number) a).doubleValue() == ((Number) b).doubleValue();
        if (a instanceof java.util.List && b instanceof java.util.List) {
            java.util.List<?> x = (java.util.List<?>) a, y = (java.util.List<?>) b;
            if (x.size() != y.size()) return false;
            for (int i = 0; i < x.size(); i++) if (!same(x.get(i), y.get(i))) return false;
            return true;
        }
        if (a instanceof Map && b instanceof Map) {
            java.util.List<Object> ka = new java.util.ArrayList<Object>(((Map<?, ?>) a).keySet());
            java.util.List<Object> kb = new java.util.ArrayList<Object>(((Map<?, ?>) b).keySet());
            if (!ka.equals(kb)) return false;
            for (Object k : ka) if (!same(((Map<?, ?>) a).get(k), ((Map<?, ?>) b).get(k))) return false;
            return true;
        }
        return a == null ? b == null : a.equals(b);
    }
}
