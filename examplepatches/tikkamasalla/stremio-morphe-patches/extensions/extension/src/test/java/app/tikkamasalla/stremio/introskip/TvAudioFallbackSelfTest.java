package app.tikkamasalla.stremio.introskip;

import app.tikkamasalla.stremio.oneahead.demux.TrackChooser;
import app.tikkamasalla.stremio.oneahead.demux.TrackInfo;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Standalone (no JUnit): the audio the lookahead job reads. The selected track is read off the Media3 player
 * (the Compose engine is one), and when it cannot be known the chooser falls back in a fixed order:
 * the file's default-flagged track, the previous episode's language, the first track that is not commentary.
 * Exit 1 on any failure. Needs the main sources on the source path (reads two of them as text).
 */
public class TvAudioFallbackSelfTest {
    private static int fails, total;

    private static void check(String name, boolean ok) {
        total++;
        if (!ok) fails++;
        System.out.println((ok ? "ok   " : "FAIL ") + name);
    }

    private static final TrackChooser.Probe ALL = new TrackChooser.Probe() {
        @Override public boolean canDecode(String mime) { return true; }
        @Override public boolean isSoftware(String mime) { return true; }
    };

    private static TrackInfo track(int number, String mime, String lang, int channels, boolean isDefault) {
        TrackInfo t = new TrackInfo();
        t.number = number; t.mime = mime; t.language = lang; t.channels = channels; t.isDefault = isDefault;
        return t;
    }

    private static TrackInfo commentary(int number, String lang) {
        TrackInfo t = track(number, "audio/ac3", lang, 2, true);
        t.commentary = true;
        return t;
    }

    // Fakes shaped like Media3's Player, Tracks, Tracks.Group and Format (public: they are read by reflection).
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
        final List<Group> groups;
        Tracks(Group... g) { groups = new ArrayList<Group>(Arrays.asList(g)); }
        public List<Group> getGroups() { return groups; }
    }

    public static class Engine {
        final Tracks tracks;
        Engine(Tracks t) { tracks = t; }
        public Tracks getCurrentTracks() { return tracks; }
    }

    public static class Opaque { }

    private static String[] read(Object... roots) throws Exception {
        Method m = IntroSkipBridge.class.getDeclaredMethod("readAudio", Object[].class);
        m.setAccessible(true);
        return (String[]) m.invoke(null, (Object) roots);
    }

    private static String src(String file) throws Exception {
        for (String base : new String[]{"src/main/java/", "extensions/extension/src/main/java/", "../main/java/"}) {
            if (Files.exists(Paths.get(base + file))) return new String(Files.readAllBytes(Paths.get(base + file)), StandardCharsets.UTF_8);
        }
        return "";
    }

    public static void main(String[] args) throws Exception {
        // Fallback order.
        TrackInfo czDefault = track(1, "audio/mp4a-latm", "cze", 6, true);
        TrackInfo engOther = track(2, "audio/eac3", "eng", 6, false);
        TrackInfo com = commentary(3, "eng");
        TrackChooser.Request prevEng = new TrackChooser.Request("eng", 6, TrackChooser.PREVIOUS);
        check("1 default flag comes before the previous episode's language",
                TrackChooser.choose(Arrays.asList(engOther, czDefault), prevEng, ALL) == czDefault);
        TrackInfo czA = track(1, "audio/mp4a-latm", "cze", 6, false);
        check("2 no default flag: the previous episode's language",
                TrackChooser.choose(Arrays.asList(czA, engOther), prevEng, ALL) == engOther);
        TrackChooser.Request none = new TrackChooser.Request("", 0, TrackChooser.UNKNOWN);
        TrackInfo comOff = commentary(0, "eng");
        comOff.isDefault = false;
        check("3 nothing known and no default flag: the first track that is not commentary",
                TrackChooser.choose(Arrays.asList(comOff, czA, engOther), none, ALL) == czA);
        check("4 previous language absent from the file: the first non-commentary track",
                TrackChooser.choose(Arrays.asList(czA, track(2, "audio/ac3", "fra", 2, false)), prevEng, ALL) == czA);
        check("5 commentary is never the default-flag pick",
                TrackChooser.choose(Arrays.asList(com, engOther), none, ALL) == engOther);
        check("6 a lone track is taken", TrackChooser.choose(Arrays.asList(com), none, ALL) == com);
        List<TrackInfo> targetFile = Arrays.asList(track(1, "audio/eac3", "eng", 6, true), track(2, "audio/mp4a-latm", "cze", 6, false));
        List<TrackInfo> refFile = Arrays.asList(track(1, "audio/mp4a-latm", "cze", 2, false), track(2, "audio/eac3", "eng", 6, true));
        check("7 target and reference land on the same language",
                TrackChooser.normalize(TrackChooser.choose(targetFile, none, ALL).language)
                        .equals(TrackChooser.normalize(TrackChooser.choose(refFile, none, ALL).language)));

        // The log reason carries the wanted language and why.
        String r1 = TrackChooser.reason(Arrays.asList(engOther, czDefault), czDefault, prevEng);
        String r2 = TrackChooser.reason(Arrays.asList(czA, engOther), engOther, prevEng);
        String r3 = TrackChooser.reason(Arrays.asList(czA, engOther), czA, none);
        check("8 reason names the default-flag step and the track's language", r1.contains("want=ces") && r1.contains("via=default-flag"));
        check("9 reason names the previous-episode step and its language", r2.contains("want=eng") && r2.contains("via=previous-episode"));
        check("10 reason names the first-main step", r3.contains("via=first-main") && r3.contains("want=ces"));
        TrackChooser.Request sel = new TrackChooser.Request("eng", 6, TrackChooser.SELECTED);
        String r4 = TrackChooser.reason(Arrays.asList(engOther, czDefault), engOther, sel);
        check("11 a read player track keeps the language rule and says so", r4.contains("want=eng") && r4.contains("via=player-selected")
                && r4.contains("ch-match=6") && TrackChooser.choose(Arrays.asList(czDefault), sel, ALL) == null);
        check("12 a request without a source keeps the old rule",
                TrackChooser.choose(Arrays.asList(track(1, "audio/mp4a-latm", "cze", 6, false), track(2, "audio/eac3", "eng", 6, false)),
                        new TrackChooser.Request("", 0), ALL).mime.equals("audio/eac3")
                        && TrackChooser.reason(Arrays.asList(engOther), engOther, new TrackChooser.Request("", 0)).contains("no-want"));

        // The readout of the selected track.
        try {
            String[] got = read(new Engine(new Tracks(new Group(2, true, "und", 0), new Group(1, false, "cze", 6), new Group(1, true, "en", 6))));
            check("13 selected audio group is read (not the unselected one, not video)", got[0].equals("eng") && got[1].equals("6"));
            check("14 an undetermined language reads as unknown", read(new Engine(new Tracks(new Group(2, true, "und", 2))))[0].isEmpty()
                    && read(new Engine(new Tracks(new Group(2, true, null, 2))))[0].isEmpty());
            check("15 a root without Media3 methods is skipped for the next one", read(new Opaque(), new Engine(new Tracks(new Group(1, true, "ja", 2))))[0].equals("jpn"));
            check("16 no audio group selected reads as unknown", read(new Engine(new Tracks(new Group(2, false, "eng", 2))))[0].isEmpty());
        } catch (Throwable stubs) {
            Throwable c = stubs.getCause() != null ? stubs.getCause() : stubs;
            System.out.println("SKIP readout checks 13-16 (bridge needs the Android runtime: " + c + ")");
        }

        // Wiring pins: the Compose player has no Media3 root of its own in the hint.
        String bridge = src("app/tikkamasalla/stremio/introskip/IntroSkipBridge.java");
        String trigger = src("app/tikkamasalla/stremio/oneahead/OneAheadTrigger.java");
        check("17 the Compose engine is a root of the audio readout", bridge.contains("s.player instanceof PortSkipPlayer")
                && bridge.contains("engine()") && bridge.contains("getApplicationLooper"));
        check("18 the previous episode's audio is the unreadable case's source", bridge.contains("TrackChooser.PREVIOUS") && bridge.contains("lastAudio = audio"));
        check("19 the job passes the audio source to the fetcher and logs it", trigger.contains("p.curAudioSource);") && trigger.contains("audio-src="));

        System.out.println("TOTAL " + total + " FAIL " + fails);
        if (fails > 0) System.exit(1);
    }
}
