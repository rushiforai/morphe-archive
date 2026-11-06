import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Default video quality: runs Rumble's start-source chooser with fake sources, and the extension's
 * cap and live defaults. Metered networks can't be faked under app_process, so the cap is checked on
 * the extension's own function.
 */
public final class QualityProbe {
    private static final String PLAYBACK = "io.github.jordanwoodson.extension.shared.rumble.RumblePlayback";

    public static void main(String[] args) {
        ProbeSupport.run("start source, live default, cap and source height bridge", QualityProbe::run);
    }

    private static void run() throws Exception {
        // The start-source chooser and a source's height getter, as the patch matched them. The source class is
        // the chooser's return type; its constructor is (url, type, height, bitrate, label, ..., isAuto?).
        Method choose = ProbeSupport.method("rumble.default_video_quality.chooser",
                "LMg/e;->a(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;IZZZ)LPg/l;");
        Method resolution = ProbeSupport.method("rumble.default_video_quality.source_height", "LPg/l;->f()I");
        Class<?> sourceType = choose.getReturnType();
        Constructor<?> source = sourceType.getConstructor(String.class, String.class, int.class, int.class,
                String.class, String.class, boolean.class);
        List<Object> sources = new ArrayList<>();
        Object auto = source.newInstance("https://example.invalid/auto.m3u8", "hls", 0, 0, "Auto", "", false);
        sources.add(auto);
        for (int height : new int[] {1080, 720, 480, 360}) {
            sources.add(source.newInstance("https://example.invalid/" + height + ".mp4", "mp4", height,
                    height * 1000, height + "p", "", false));
        }
        Object chooser = ProbeSupport.allocate(choose.getDeclaringClass());

        // The choice starts at Rumble's default (the quality option's default): nothing changes until a
        // quality is chosen.
        Object picked;
        if ("0".equals(setting("video_quality"))) {
            picked = choose.invoke(chooser, sources, null, null, 480, false, false, false);
            ProbeSupport.check(((int) resolution.invoke(picked)) == 480, "Rumble's default must use the preferred 480p");
        }
        // Nothing picked, 1080p chosen: the default quality.
        int quality = 1080;
        ProbeSupport.setting("video_quality", String.valueOf(quality));
        picked = choose.invoke(chooser, sources, null, null, 480, false, false, false);
        ProbeSupport.check(((int) resolution.invoke(picked)) == quality, "VOD must start at " + quality);
        // Picked in the player: kept.
        picked = choose.invoke(chooser, sources, 720, 720_000, 480, false, false, false);
        ProbeSupport.check(((int) resolution.invoke(picked)) == 720, "a picked 720p must be kept");
        // Live with Auto: Auto, while not capped.
        picked = choose.invoke(chooser, sources, null, null, 480, true, false, true);
        ProbeSupport.check(picked == auto, "live with Auto must stay Auto");
        // Rumble's default: the preferred height.
        ProbeSupport.setting("video_quality", "0");
        picked = choose.invoke(chooser, sources, null, null, 480, false, false, false);
        ProbeSupport.check(((int) resolution.invoke(picked)) == 480, "Rumble's default must use the preferred 480p");
        ProbeSupport.setting("video_quality", String.valueOf(quality));

        // Live streams too: the DataStore default.
        Method liveDefault = method("liveUsesAutoByDefault");
        ProbeSupport.check(Boolean.TRUE.equals(liveDefault.invoke(null)), "live switch off must keep Auto");
        ProbeSupport.setting("video_quality_live", "true");
        ProbeSupport.check(Boolean.FALSE.equals(liveDefault.invoke(null)), "live switch on must start at the quality");
        ProbeSupport.setting("video_quality", "0");
        ProbeSupport.check(Boolean.TRUE.equals(liveDefault.invoke(null)), "Rumble's default quality keeps live Auto");
        ProbeSupport.setting("video_quality", String.valueOf(quality));

        // Not capped: the same values as before the cap existed.
        Method startHeight = method("startHeight", List.class, Integer.class, Integer.class, int.class);
        Integer saved = Integer.valueOf(720);
        ProbeSupport.check(startHeight.invoke(null, sources, saved, 1, 480) == saved, "a pick stays the same instance");
        ProbeSupport.check(Integer.valueOf(quality).equals(startHeight.invoke(null, sources, null, null, 480)),
                "nothing picked starts at the default quality");
        ProbeSupport.check(!Boolean.TRUE.equals(method("capActive").invoke(null)), "no cap without a metered network");

        // The cap: (saved, preferred, wifi, cap, heights) -> height.
        Method capped = method("cappedHeight", Integer.class, int.class, int.class, int.class, int[].class);
        int[] all = {0, 1080, 720, 480, 360};
        expect(capped, 480, null, 480, 1080, 480, all);
        expect(capped, 720, 720, 480, 1080, 1080, all);
        expect(capped, 480, 1080, 480, 1080, 480, all);
        expect(capped, 360, null, 480, 1080, 480, new int[] {0, 1080, 720, 360});
        expect(capped, 720, null, 480, 1080, 480, new int[] {1080, 720});
        expect(capped, 480, 0, 480, 1080, 480, all);
        expect(capped, 360, null, 360, 0, 480, all);
        expect(capped, 480, null, 480, 0, 480, new int[0]);

        // The bridged getter reads the real source.
        Object height = method("sourceHeight", Object.class).invoke(null, sources.get(2));
        ProbeSupport.check(Integer.valueOf(720).equals(height), "sourceHeight bridge must read 720, got " + height);
    }

    private static void expect(Method capped, int expected, Integer saved, int preferred, int wifi, int cap,
                               int[] heights) throws Exception {
        Object got = capped.invoke(null, saved, preferred, wifi, cap, heights);
        ProbeSupport.check(Integer.valueOf(expected).equals(got), "cap " + cap + ", saved " + saved + ", preferred "
                + preferred + ", wifi " + wifi + ", heights " + Arrays.toString(heights) + ": expected "
                + expected + ", got " + got);
    }

    private static Method method(String name, Class<?>... types) throws Exception {
        Method m = Class.forName(PLAYBACK).getDeclaredMethod(name, types);
        m.setAccessible(true);
        return m;
    }

    /** The patch-time default of a setting, before the probe changes it. */
    private static String setting(String key) throws Exception {
        org.json.JSONArray settings = ProbeSupport.registry().getJSONArray("settings");
        for (int i = 0; i < settings.length(); i++) {
            if (key.equals(settings.getJSONObject(i).getString("key"))) {
                return settings.getJSONObject(i).getString("default");
            }
        }
        throw new AssertionError(key + " is not registered");
    }
}
