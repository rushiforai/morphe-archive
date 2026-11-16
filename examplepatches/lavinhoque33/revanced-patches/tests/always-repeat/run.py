#!/usr/bin/env python3
# Copyright (C) 2026 lavinhoque33
# Licensed under the GNU General Public License v3.0 or later.
# Written by lavinhoque33, 2026-11-13.
"""Compile the actual repeat extension against deterministic playback/settings test boundaries."""
import os
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[2]
MAIN = ROOT / "extensions/shared/src/main/java/app/morphe/extension"
BOUNDARIES = {
    "shared/utils/Utils.java": """
package app.morphe.extension.shared.utils;
public class Utils {}
""",
    "youtube/settings/Settings.java": """
package app.morphe.extension.youtube.settings;
public class Settings {
    public static final Flag ALWAYS_REPEAT = new Flag();
    public static final Flag ALWAYS_REPEAT_PAUSE = new Flag();
    public static class Flag {
        public boolean value;
        public boolean get() { return value; }
    }
}
""",
    "youtube/shared/VideoInformation.java": """
package app.morphe.extension.youtube.shared;
import java.util.ArrayList;
import java.util.List;
public class VideoInformation {
    public static final List<String> calls = new ArrayList<>();
    public static boolean supported = true;
    public static boolean seekSucceeds = true;
    public static boolean playing = true;
    public static boolean controllerPlaying = true;
    public static long position = 12345;
    public static boolean overrideVideoTime(long time) {
        calls.add("seek:" + time);
        if (seekSucceeds) position = time;
        return seekSucceeds;
    }
    public static boolean isPauseVideoSupported() { return supported; }
    public static boolean pauseVideo() {
        calls.add("controllerPause");
        controllerPlaying = false;
        playing = false;
        return true;
    }
    public static boolean setPlayerPlaying(boolean value) {
        calls.add("backendPlaying:" + value);
        playing = value;
        return true;
    }
    public static void userPlay() {
        // Stock 21.39: Laold.ay(true,false) returns if Laoko.i already equals true.
        if (controllerPlaying) return;
        controllerPlaying = true;
        playing = true;
    }
}
""",
    "youtube/utils/VideoUtils.java": """
package app.morphe.extension.youtube.utils;
import app.morphe.extension.youtube.shared.VideoInformation;
public class VideoUtils {
    public static void pauseMedia() {
        VideoInformation.calls.add("focus");
    }
}
""",
}


def main():
    java_home = os.environ.get("JAVA_HOME")

    def tool(name):
        return str(Path(java_home) / "bin" / name) if java_home else name

    with tempfile.TemporaryDirectory(prefix="rvx-repeat-tests-") as directory:
        output = Path(directory)
        sources = []
        for relative, content in BOUNDARIES.items():
            source = output / relative
            source.parent.mkdir(parents=True, exist_ok=True)
            source.write_text(content)
            sources.append(source)
        sources.extend((MAIN / "youtube/patches/utils/AlwaysRepeatPatch.java",
                        Path(__file__).with_name("AlwaysRepeatPatchTest.java")))
        subprocess.run([tool("javac"), "-d", str(output), *map(str, sources)], check=True)
        subprocess.run([tool("java"), "-cp", str(output), "AlwaysRepeatPatchTest"], check=True)


if __name__ == "__main__":
    main()
