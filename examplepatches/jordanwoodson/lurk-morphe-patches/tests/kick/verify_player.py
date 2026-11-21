#!/usr/bin/env python3
"""Run production KickPlayer Java with boundary doubles; no Android device is needed.

Usage: python3 tests/kick/verify_player.py
Requires the configured JDK. Generated sources/classes live under $MORPHE_WORK (default ~/build/lurk-morphe-patches)
and are removed on Linux. Checks the decision tables of the mobile-data quality ceiling, normal latency,
background audio and Fill screen; the hooks themselves are checked on a device (Fill screen's also by
bin/test-kick on ART). The bridges, which the patches fill with calls into Kick's player, are filled here with
calls into small doubles: a player is the list of its tracks' heights, a video size an int[] {width, height}
and a video source a map whose "live" entry is its live configuration.
"""
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

STUBS = {
    "android/content/Context.java": "package android.content; public class Context { }",
    "android/content/ContextWrapper.java": """
        package android.content;
        public class ContextWrapper extends Context {
            private final Context base;
            public ContextWrapper(Context base) { this.base = base; }
            public Context getBaseContext() { return base; }
        }
    """,
    "android/content/res/Configuration.java": """
        package android.content.res;
        public class Configuration {
            public static final int ORIENTATION_PORTRAIT = 1;
            public static final int ORIENTATION_LANDSCAPE = 2;
            public int orientation;
        }
    """,
    "android/content/res/Resources.java": """
        package android.content.res;
        public class Resources {
            public final Configuration configuration = new Configuration();
            public Configuration getConfiguration() { return configuration; }
        }
    """,
    "android/app/Activity.java": """
        package android.app;
        public class Activity extends android.content.ContextWrapper {
            public boolean pip;
            public int orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
            public Activity() { super(null); }
            public boolean isInPictureInPictureMode() { return pip; }
            public android.content.res.Resources getResources() {
                android.content.res.Resources resources = new android.content.res.Resources();
                resources.configuration.orientation = orientation;
                return resources;
            }
        }
    """,
    "android/os/Looper.java": """
        package android.os;
        public class Looper { public static Looper getMainLooper() { return new Looper(); } }
    """,
    "android/os/Handler.java": """
        package android.os;
        public class Handler {
            public Handler(Looper looper) { }
            public boolean post(Runnable r) { return true; }
            public boolean postDelayed(Runnable r, long delay) { return true; }
        }
    """,
    "android/view/ViewParent.java": "package android.view; public interface ViewParent { }",
    "android/view/View.java": """
        package android.view;
        public class View implements ViewParent {
            public int orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
            public android.content.Context context = new android.content.Context();
            public View parent;
            public ViewParent getParent() { return parent; }
            public android.content.Context getContext() { return context; }
            public android.content.res.Resources getResources() {
                android.content.res.Resources resources = new android.content.res.Resources();
                resources.configuration.orientation = orientation;
                return resources;
            }
        }
    """,
    "io/github/jordanwoodson/extension/shared/Logger.java": """
        package io.github.jordanwoodson.extension.shared;
        public class Logger { public static void d(String message) { } }
    """,
    "io/github/jordanwoodson/extension/shared/Network.java": """
        package io.github.jordanwoodson.extension.shared;
        public class Network {
            public static boolean metered;
            public static boolean isMetered(android.content.Context context) { return metered; }
        }
    """,
    "io/github/jordanwoodson/extension/shared/SleepTimer.java": """
        package io.github.jordanwoodson.extension.shared;
        public class SleepTimer {
            public static void setPauseAction(Runnable action) { }
            public static void onPlay(Object player) { }
            public static void onStop(Object player) { }
            public static java.util.List<Object> started() { return new java.util.ArrayList<>(); }
        }
    """,
    "io/github/jordanwoodson/extension/shared/settings/Settings.java": """
        package io.github.jordanwoodson.extension.shared.settings;
        public class Settings {
            public static final java.util.Map<String, String> values = new java.util.HashMap<>();
            public static boolean isRegistered(String key) { return values.containsKey(key); }
            public static boolean isEnabled(String key) { return Boolean.parseBoolean(values.getOrDefault(key, "true")); }
            public static int getInt(String key) { return Integer.parseInt(values.getOrDefault(key, "0")); }
        }
    """,
}

PROBE = """
import io.github.jordanwoodson.extension.shared.Network;
import io.github.jordanwoodson.extension.shared.kick.KickPlayer;
import io.github.jordanwoodson.extension.shared.settings.Settings;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlayerProbe {
    /** A player, as the bridges see it: Kick's list of its video tracks, here their heights. */
    static final List<Integer> STREAM = List.of(1080, 720, 480, 360, 160);
    static final List<Integer> NO_720 = List.of(1080, 936, 480);
    static final List<Integer> NO_160 = List.of(1080, 720, 480, 360);

    static int checks;
    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
        checks++;
    }
    static int[] size(int width, int height) { return new int[]{width, height}; }
    static String ceiling(List<Integer> player, int[] size) {
        int[] result = (int[]) KickPlayer.maxResolution(player, size);
        return result == null ? "none" : result[0] + "x" + result[1];
    }

    public static void main(String[] args) {
        int lurk = Integer.parseInt(args[0]);
        String max = Integer.MAX_VALUE + "x";
        // Not registered (Default video quality left out) or "Same as on Wi-Fi": every value passes through.
        Network.metered = true;
        check(ceiling(STREAM, null).equals("none") && ceiling(STREAM, size(1280, 720)).equals("1280x720"),
            "unregistered changed a ceiling");
        Settings.values.put("quality_metered", "0");
        check(ceiling(STREAM, size(1280, 720)).equals("1280x720"), "Same as on Wi-Fi changed a ceiling");
        // 480p cap on a metered network: the starting ceiling (none, or the tallest track up to 720 or the Lurk height)
        // is capped, keeping its shape; picks pass.
        Settings.values.put("quality_metered", "480");
        check(ceiling(STREAM, null).equals(max + "480"), "no ceiling isn't capped");
        check(ceiling(STREAM, size(1280, 720)).equals("854x480"), "Kick's 720 start isn't capped");
        check(ceiling(STREAM, size(1920, 1080)).equals(lurk == 1080 ? "854x480" : "1920x1080"),
            "1080 handled wrongly for Lurk height " + lurk);
        check(ceiling(STREAM, size(640, 360)).equals("640x360") && ceiling(STREAM, size(284, 160)).equals("284x160"),
            "a lower pick changed");
        // Without a 720 track Kick starts at the tallest one below it: 480, which the cap keeps.
        check(ceiling(NO_720, size(854, 480)).equals("854x480"), "the 480 start on a stream without 720");
        check(ceiling(NO_720, size(1664, 936)).equals(lurk == 1080 ? "1664x936" : "1664x936"), "a 936 pick changed");
        // A cap above the start keeps the start.
        Settings.values.put("quality_metered", "720");
        check(ceiling(STREAM, size(1280, 720)).equals("1280x720") && ceiling(STREAM, null).equals(max + "720"),
            "720 cap");
        check(ceiling(STREAM, size(1920, 1080)).equals(lurk == 1080 ? "1280x720" : "1920x1080"),
            "720 cap on the Lurk height");
        // With every track taller than the Lurk height, Lurk's reducer starts at the lowest track (Kick's sets none):
        // that start is capped, the same size picked elsewhere passes.
        Settings.values.put("quality_metered", "160");
        check(ceiling(NO_160, size(640, 360)).equals(lurk == 160 ? "285x160" : "640x360"),
            "the lowest-track start handled wrongly for Lurk height " + lurk);
        check(ceiling(STREAM, size(284, 160)).equals("284x160") && ceiling(NO_160, null).equals(max + "160"),
            "160 cap");
        check(ceiling(NO_160, size(1280, 720)).equals("285x160"), "Kick's 720 start isn't capped at 160");
        // Wi-Fi: nothing changes.
        Network.metered = false;
        Settings.values.put("quality_metered", "160");
        check(ceiling(STREAM, null).equals("none") && ceiling(STREAM, size(1280, 720)).equals("1280x720"),
            "unmetered changed a ceiling");

        // Normal latency: off keeps Kick's live configuration; on drops it; a source without one stays as it is.
        Map<String, Object> live = new HashMap<>();
        live.put("live", "configuration");
        KickPlayer.normalLatency(live);
        check(live.containsKey("live"), "live configuration dropped while unregistered");
        Settings.values.put("normal_latency", "false");
        KickPlayer.normalLatency(live);
        check(live.containsKey("live"), "live configuration dropped while off");
        Settings.values.put("normal_latency", "true");
        KickPlayer.normalLatency(live);
        check(!live.containsKey("live"), "live configuration kept while on");
        KickPlayer.normalLatency(new HashMap<String, Object>());
        KickPlayer.normalLatency(null);

        // Background audio: on (and unregistered) keeps Kick's staysActiveInBackground; off makes Kick pause on leaving.
        check(KickPlayer.staysActive(true) && !KickPlayer.staysActive(false), "changed while unregistered");
        Settings.values.put("background_audio", "true");
        check(KickPlayer.staysActive(true) && !KickPlayer.staysActive(false), "changed while on");
        Settings.values.put("background_audio", "false");
        check(!KickPlayer.staysActive(true) && !KickPlayer.staysActive(false), "kept playing while off");
        // Automatic picture-in-picture: the switch only turns Kick's auto-enter off.
        Settings.values.put("no_auto_pip", "false");
        check(KickPlayer.autoEnterPip(true) && !KickPlayer.autoEnterPip(false), "auto-enter changed while off");
        Settings.values.put("no_auto_pip", "true");
        check(!KickPlayer.autoEnterPip(true) && !KickPlayer.autoEnterPip(false), "auto-enter kept while on");
        Settings.values.remove("no_auto_pip");
        check(KickPlayer.autoEnterPip(true), "unregistered switch turned auto-enter off");

        // Fill screen: ZOOM only in landscape, outside picture-in-picture, when FIT would leave side bars around a
        // video wider than tall. Kick's other modes, vertical videos and a frame narrower than the video keep theirs.
        int fit = 0, zoom = 4, fill = 3;
        float video = 16 / 9f, screen = 20 / 9f;
        android.view.View frame = new android.view.View();
        frame.orientation = android.content.res.Configuration.ORIENTATION_LANDSCAPE;
        check(KickPlayer.resizeMode(frame, fit, video, screen) == fit, "filled while unregistered");
        Settings.values.put("fill_screen", "false");
        check(KickPlayer.resizeMode(frame, fit, video, screen) == fit, "filled while off");
        Settings.values.put("fill_screen", "true");
        check(KickPlayer.resizeMode(frame, fit, video, screen) == zoom, "not filled in landscape");
        check(KickPlayer.resizeMode(frame, fill, video, screen) == fill, "changed Kick's FILL");
        check(KickPlayer.resizeMode(null, fit, video, screen) == fit, "filled without a view");
        check(KickPlayer.resizeMode(frame, fit, 9 / 16f, screen) == fit, "filled a vertical video");
        check(KickPlayer.resizeMode(frame, fit, video, 1066 / 720f) == fit, "filled next to the chat");
        check(KickPlayer.resizeMode(frame, fit, video, video) == fit, "filled a view of the video's shape");
        // The frame is made with the application context: the activity is its parent's (Kick's player view's).
        android.app.Activity activity = new android.app.Activity();
        activity.orientation = android.content.res.Configuration.ORIENTATION_LANDSCAPE;
        android.view.View playerView = new android.view.View();
        playerView.context = new android.content.ContextWrapper(activity);
        frame.parent = playerView;
        check(KickPlayer.resizeMode(frame, fit, video, screen) == zoom, "not filled in an activity");
        activity.pip = true;
        check(KickPlayer.resizeMode(frame, fit, video, screen) == fit, "filled in picture-in-picture");
        activity.pip = false;
        activity.orientation = android.content.res.Configuration.ORIENTATION_PORTRAIT;
        check(KickPlayer.resizeMode(frame, fit, video, screen) == fit, "filled in portrait");
        System.out.println("PASS: " + checks + " player decision-table assertions (Lurk height " + lurk + ")");
    }
}
"""

# What the patches' bridges do at patch time, here with the probe's doubles.
BRIDGES = {
    "private static Context playerContext(Object player) {": "return new Context();",
    "private static List<?> videoTracks(Object player) {": "return (List<?>) player;",
    "private static int trackHeight(Object track) {": "return (Integer) track;",
    "private static int sizeWidth(Object size) {": "return ((int[]) size)[0];",
    "private static int sizeHeight(Object size) {": "return ((int[]) size)[1];",
    "private static Object videoSize(int width, int height) {": "return new int[]{width, height};",
    "private static Object liveConfiguration(Object source) {": "return ((java.util.Map<?, ?>) source).get(\"live\");",
    "private static void clearLiveConfiguration(Object source) {": "((java.util.Map<?, ?>) source).remove(\"live\");",
}


def java_tool(name):
    java_home = os.environ.get("JAVA_HOME")
    candidate = Path(java_home) / "bin" / name if java_home else None
    return str(candidate) if candidate and candidate.is_file() else shutil.which(name) or name


def run(output, repo, lurk_height):
    sources = []
    for name, content in STUBS.items():
        source = output / name
        source.parent.mkdir(parents=True, exist_ok=True)
        source.write_text(content, encoding="utf-8")
        sources.append(str(source))
    player = (repo / "extensions/shared/src/main/java/io/github/jordanwoodson/extension/shared/kick/KickPlayer.java")
    text = player.read_text(encoding="utf-8")
    if lurk_height:
        # What the Default video quality patch's bridge does at patch time.
        text, count = re.subn(r"(private static int lurkHeight\(\) \{\s*return )0;", rf"\g<1>{lurk_height};", text)
        assert count == 1, "lurkHeight stub not found"
    for signature, body in BRIDGES.items():
        text, count = re.subn(re.escape(signature) + r"\s*(?:return [^;]*;\s*)?\}", signature + " " + body + " }", text)
        assert count == 1, f"bridge stub not found: {signature}"
    copy = output / "io/github/jordanwoodson/extension/shared/kick/KickPlayer.java"
    copy.parent.mkdir(parents=True, exist_ok=True)
    copy.write_text(text, encoding="utf-8")
    (output / "PlayerProbe.java").write_text(PROBE, encoding="utf-8")
    classes = output / "classes"
    subprocess.run([java_tool("javac"), "-d", str(classes), *sources, str(copy), str(output / "PlayerProbe.java")],
                   check=True)
    subprocess.run([java_tool("java"), "-XX:-UsePerfData", "-cp", str(classes), "PlayerProbe", str(lurk_height)],
                   check=True)


def main():
    repo = Path(__file__).resolve().parents[2]
    scratch = Path(os.environ.get("MORPHE_WORK", Path.home() / "build/lurk-morphe-patches")) / "kick-tests"
    scratch.mkdir(parents=True, exist_ok=True)
    for lurk_height in (0, 1080, 160):
        output = Path(tempfile.mkdtemp(prefix="player-", dir=scratch))
        try:
            run(output, repo, lurk_height)
        finally:
            if sys.platform == "darwin":
                print(f"Test files retained on macOS: {output}")
            else:
                shutil.rmtree(output)


if __name__ == "__main__":
    main()
