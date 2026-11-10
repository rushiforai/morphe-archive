package app.tikkamasalla.stremio.introskip;

import com.google.common.collect.ImmutableList;

import java.lang.reflect.Method;

/**
 * Standalone (no JUnit): the audio readout over a REAL Guava ImmutableList, as Media3's Tracks.getGroups() returns.
 * Its runtime class (RegularImmutableList) is package-private, so reflection on that class throws IllegalAccessException.
 * Group types are the real Media3 ones: C.TRACK_TYPE_AUDIO = 1, C.TRACK_TYPE_VIDEO = 2 (a selected video group has no language).
 * Exit 1 on any failure.
 */
public class TvAudioGuavaReadSelfTest {
    private static int fails, total;

    private static void check(String name, boolean ok) {
        total++;
        if (!ok) fails++;
        System.out.println((ok ? "ok   " : "FAIL ") + name);
    }

    public static class Format { public String language; public int channelCount; }

    public static class Group {
        public final int length = 1;
        final int type; final boolean selected; final Format format = new Format();
        Group(int type, boolean selected, String lang, int ch) { this.type = type; this.selected = selected; format.language = lang; format.channelCount = ch; }
        public int getType() { return type; }
        public Format getTrackFormat(int i) { return format; }
        public boolean isTrackSelected(int i) { return selected; }
    }

    public static class Tracks {
        final ImmutableList<Group> groups;
        Tracks(Group... g) { groups = ImmutableList.copyOf(g); }
        public ImmutableList<Group> getGroups() { return groups; }
    }

    public static class Engine {
        final Tracks tracks;
        Engine(Tracks t) { tracks = t; }
        public Tracks getCurrentTracks() { return tracks; }
    }

    public static void main(String[] args) throws Exception {
        Tracks t = new Tracks(new Group(2, true, null, 0), new Group(1, false, "uk", 6), new Group(1, true, "en", 6));
        Class<?> listClass = t.getGroups().getClass();
        check("1 the list really is a package-private Guava class", !java.lang.reflect.Modifier.isPublic(listClass.getModifiers()));
        boolean direct = false;
        try { listClass.getMethod("size").invoke(t.getGroups()); direct = true; } catch (IllegalAccessException expected) { /* the old way */ }
        check("2 calling size() on the runtime class fails (the old defect)", !direct);
        try {
            Method viaPublic = IntroSkipBridge.publicMethod(listClass, "get", int.class);
            check("3 the lookup lands on a public declaring class", java.lang.reflect.Modifier.isPublic(viaPublic.getDeclaringClass().getModifiers())
                    && viaPublic.invoke(t.getGroups(), 2) != null);
            Method m = IntroSkipBridge.class.getDeclaredMethod("readAudio", Object[].class);
            m.setAccessible(true);
            String[] got = (String[]) m.invoke(null, (Object) new Object[]{new Engine(t)});
            check("4 selected audio is read through a real ImmutableList", got[0].equals("eng") && got[1].equals("6"));
            String[] none = (String[]) m.invoke(null, (Object) new Object[]{new Engine(new Tracks(new Group(1, false, "en", 2), new Group(2, true, null, 0)))});
            check("5 no audio group selected reads as unknown", none[0].isEmpty());
            String[] opaque = (String[]) m.invoke(null, (Object) new Object[]{new Object()});
            check("6 a root without Media3 methods reads as unknown", opaque[0].isEmpty());
        } catch (Throwable stubs) {
            Throwable c = stubs.getCause() != null ? stubs.getCause() : stubs;
            System.out.println("SKIP readout checks 3-6 (bridge needs the Android runtime: " + c + ")");
        }
        System.out.println("TOTAL " + (total - fails) + "/" + total);
        if (fails > 0) System.exit(1);
    }
}
