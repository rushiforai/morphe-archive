import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Default video quality: runs Rumble's start-source chooser with fake sources, after the extension heard from the
 * player's video load whether its video is live, and the extension's cap. Metered networks can't be faked under
 * app_process, so the cap is checked on the extension's own function.
 */
public final class QualityProbe {
    private static final String PLAYBACK = "io.github.jordanwoodson.extension.shared.rumble.RumblePlayback";

    private static Method choose;
    private static Method resolution;
    private static Object chooser;
    private static List<Object> sources;

    public static void main(String[] args) {
        ProbeSupport.run("start source, live streams, data saver, cap and the source and live bridges", QualityProbe::run);
    }

    private static void run() throws Exception {
        // The start-source chooser (sources, height, allowAuto, data saver), a source's height getter and the video
        // the player loads, as the patch matched them. The source class is the chooser's return type; its
        // constructor is (url, type, height, bitrate, quality text, bitrate text, force M3U8).
        choose = ProbeSupport.method("rumble.default_video_quality.chooser", "LTg/g;->c(Ljava/util/List;IZZ)LWg/m;");
        resolution = ProbeSupport.method("rumble.default_video_quality.source_height", "LWg/m;->g()I");
        Class<?> videoType = ProbeSupport.method("rumble.default_video_quality.video_load",
                "Lcom/rumble/videoplayer/player/a;->F4(LUg/s;)LWg/m;").getParameterTypes()[0];
        Field status = ProbeSupport.field(videoType,
                ProbeSupport.fieldName("rumble.default_video_quality.live_status", "LUg/s;->x:LUg/h;"));
        Constructor<?> source = choose.getReturnType().getConstructor(String.class, String.class, int.class, int.class,
                String.class, String.class, boolean.class);
        sources = new ArrayList<>();
        Object auto = source.newInstance("https://example.invalid/auto.m3u8", "hls", 0, 0, "Auto", "", true);
        sources.add(auto);
        for (int height : new int[] {1080, 720, 480, 360}) {
            sources.add(source.newInstance("https://example.invalid/" + height + ".mp4", "mp4", height,
                    height * 1000, height + "p", "", false));
        }
        chooser = ProbeSupport.allocate(choose.getDeclaringClass());
        Object vod = video(videoType, status, "ENDED");
        Object live = video(videoType, status, "LIVE");
        Method loading = method("loadingVideo", Object.class);

        // The choice starts at Rumble's default (the quality option's default): nothing changes until a quality
        // is chosen. Rumble starts on Auto where it may, else at the source nearest 720p.
        if ("0".equals(setting("video_quality"))) {
            ProbeSupport.check(choose(720, true, false) == auto, "Rumble's default must start on Auto");
            ProbeSupport.check(height(choose(720, false, false)) == 720, "Rumble's default without Auto: 720p");
        }

        int quality = 1080;
        ProbeSupport.setting("video_quality", String.valueOf(quality));
        loading.invoke(null, vod);
        ProbeSupport.check(height(choose(720, true, false)) == quality, "a VOD must start at " + quality + ", not Auto");
        // The Shorts cache calls the chooser without a video load, and Shorts pass their own height.
        ProbeSupport.check(height(choose(480, false, false)) == quality, "a Short must start at " + quality);
        ProbeSupport.check(height(choose(720, true, true)) == 360, "data saver must keep the lowest source");

        // Live streams keep Auto unless Live streams too is on. The load's answer is for its one chooser call.
        loading.invoke(null, live);
        ProbeSupport.check(choose(720, true, false) == auto, "a live stream must stay on Auto");
        ProbeSupport.check(height(choose(720, true, false)) == quality, "the live answer must not outlive its call");
        ProbeSupport.setting("video_quality_live", "true");
        loading.invoke(null, live);
        ProbeSupport.check(height(choose(720, true, false)) == quality, "Live streams too must start at " + quality);
        ProbeSupport.setting("video_quality_live", "false");
        loading.invoke(null, (Object) null);
        ProbeSupport.check(height(choose(720, true, false)) == quality, "no video counts as not live");

        ProbeSupport.setting("video_quality", "0");
        loading.invoke(null, vod);
        ProbeSupport.check(choose(720, true, false) == auto, "Rumble's default must start on Auto again");
        ProbeSupport.setting("video_quality", String.valueOf(quality));

        // Not capped: the default quality or Rumble's choice (-1).
        Method startHeight = method("startHeight", List.class, int.class, boolean.class, boolean.class);
        ProbeSupport.check(Integer.valueOf(quality).equals(startHeight.invoke(null, sources, 720, true, false)),
                "the default quality without a cap");
        ProbeSupport.check(Integer.valueOf(-1).equals(startHeight.invoke(null, sources, 720, true, true)),
                "data saver leaves Rumble's choice");
        ProbeSupport.check(!Boolean.TRUE.equals(method("capActive").invoke(null)), "no cap without a metered network");

        // The cap: (base, cap, heights) -> height. A base of 0 is Auto.
        Method capped = method("cappedHeight", int.class, int.class, int[].class);
        int[] all = {0, 1080, 720, 480, 360};
        expect(capped, 480, 1080, 480, all);
        expect(capped, 720, 720, 1080, all);
        expect(capped, 360, 1080, 480, new int[] {0, 1080, 720, 360});
        expect(capped, 720, 480, 480, new int[] {1080, 720});
        expect(capped, 480, 0, 480, all);
        expect(capped, 360, 360, 480, all);
        expect(capped, 480, 1080, 480, new int[0]);

        // The bridged getters read the real source and video.
        Object height = method("sourceHeight", Object.class).invoke(null, sources.get(2));
        ProbeSupport.check(Integer.valueOf(720).equals(height), "sourceHeight bridge must read 720, got " + height);
        Object liveStatus = method("liveStatus", Object.class).invoke(null, live);
        ProbeSupport.check(liveStatus instanceof Enum && "LIVE".equals(((Enum<?>) liveStatus).name()),
                "liveStatus bridge must read LIVE, got " + liveStatus);
    }

    private static Object choose(int height, boolean allowAuto, boolean lowQuality) throws Exception {
        return choose.invoke(chooser, sources, height, allowAuto, lowQuality);
    }

    private static int height(Object source) throws Exception {
        return (int) resolution.invoke(source);
    }

    /** A video with only its livestream status set (an enum: UNKNOWN, ENDED, OFFLINE, LIVE). */
    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object video(Class<?> type, Field status, String name) throws Exception {
        Object video = ProbeSupport.allocate(type);
        status.set(video, Enum.valueOf((Class) status.getType(), name));
        return video;
    }

    private static void expect(Method capped, int expected, int base, int cap, int[] heights) throws Exception {
        Object got = capped.invoke(null, base, cap, heights);
        ProbeSupport.check(Integer.valueOf(expected).equals(got), "cap " + cap + ", base " + base + ", heights "
                + Arrays.toString(heights) + ": expected " + expected + ", got " + got);
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
