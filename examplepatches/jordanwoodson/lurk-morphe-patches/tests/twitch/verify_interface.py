#!/usr/bin/env python3
"""Exercise the real Twitch UI extension with small platform-boundary doubles."""
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

def main():
    repo = Path(__file__).resolve().parents[2]
    root = Path(os.environ.get("MORPHE_WORK", Path.home() / "build/lurk-morphe-patches")) / "twitch-interface"
    root.mkdir(parents=True, exist_ok=True)
    output = Path(tempfile.mkdtemp(prefix="java-", dir=root))
    try:
        stubs = {
            "android/os/Bundle.java": """
                package android.os;
                public class Bundle {
                    private final java.util.Map<String,Object> values = new java.util.HashMap<>();
                    public void putString(String key, String value) { values.put(key, value); }
                    public void putSerializable(String key, java.io.Serializable value) { values.put(key, value); }
                    public Object get(String key) { return values.get(key); }
                    public String getString(String key) { return (String) values.get(key); }
                }
            """,
            "kotlin/enums/EnumEntries.java": "package kotlin.enums; public interface EnumEntries<E extends Enum<E>> extends java.util.List<E> {}",
            "io/github/jordanwoodson/extension/shared/settings/Settings.java": """
                package io.github.jordanwoodson.extension.shared.settings;
                public final class Settings {
                    public static boolean enabled;
                    public static int defaultTab;
                    public static int getInt(String key) {
                        if (!key.equals("default_tab")) throw new AssertionError("Unexpected key " + key);
                        return defaultTab;
                    }
                    public static boolean isEnabled(String key) {
                        if (!key.equals("hide_clips") && !key.equals("hide_tipping") && !key.equals("hide_subscription_upsells"))
                            throw new AssertionError("Unexpected key " + key);
                        return enabled;
                    }
                }
            """,
            "tv/twitch/android/models/feed/DiscoveryFeedPage.java": """
                package tv.twitch.android.models.feed;
                public class DiscoveryFeedPage implements java.io.Serializable {
                    public static final class FeedLocationPage extends DiscoveryFeedPage {
                        private final Object location;
                        public FeedLocationPage(Object location) { this.location = location; }
                        public Object getFeedLocation() { return location; }
                    }
                }
            """,
            "tv/twitch/android/models/feed/FeedLocation.java": """
                package tv.twitch.android.models.feed;
                public class FeedLocation {
                    public static final class Clips { }
                    public static final class ClipsCategory { }
                    public static final class Live { }
                }
            """,
        }
        sources = []
        for name, content in stubs.items():
            path = output / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
            sources.append(str(path))
        sources += [str(repo / "tests/twitch/InterfaceProbe.java"), str(repo / "extensions/shared/src/main/java/io/github/jordanwoodson/extension/shared/twitch/TwitchInterface.java")]
        java_bin = Path(os.environ["JAVA_HOME"]) / "bin" if os.environ.get("JAVA_HOME") else None
        def tool(name):
            return str(java_bin / name) if java_bin else shutil.which(name) or name
        subprocess.run([tool("javac"), "-d", str(output / "classes"), *sources], check=True)
        subprocess.run([tool("java"), "-XX:-UsePerfData", "-cp", str(output / "classes"), "InterfaceProbe"], check=True)
    finally:
        if sys.platform == "darwin":
            print(f"Retained on macOS: {output}")
        else:
            shutil.rmtree(output)

if __name__ == "__main__":
    main()
