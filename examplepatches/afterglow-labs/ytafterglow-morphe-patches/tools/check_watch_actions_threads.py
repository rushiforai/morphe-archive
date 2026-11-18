#!/usr/bin/env python3
"""Run the actual observation/refresh code against the captured native lock order."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
JDK = Path(os.environ.get("JDK", "/usr/lib/jvm/java-17-openjdk-amd64"))
SOURCE = Path(os.environ.get("WATCH_ACTIONS_SOURCE", str(EXT / "playback/WatchActions.java")))
STUBS = {
    "android/os/Looper.java": """package android.os;
public final class Looper { public static Looper getMainLooper() { return new Looper(); } }
""",
    "android/os/Handler.java": """package android.os;
import java.util.concurrent.ConcurrentLinkedQueue;
public final class Handler {
 private static final ConcurrentLinkedQueue<Runnable> tasks = new ConcurrentLinkedQueue<>();
 public Handler(Looper looper) {}
 public boolean post(Runnable task) { tasks.add(task); return true; }
 public void removeCallbacks(Runnable task) { tasks.removeIf(x -> x == task); }
 public static void drain() {
  for (int i=0; i<100; i++) { Runnable task=tasks.poll(); if (task==null) return; task.run(); }
  throw new AssertionError("Unbounded callback replay");
 }
}
""",
    "app/afterglow/extension/Afterglow.java": """package app.afterglow.extension;
public final class Afterglow {
 public static void error(String where, Throwable error) { throw new AssertionError(where, error); }
}
""",
    "app/afterglow/extension/InstalledTweaks.java": """package app.afterglow.extension;
public final class InstalledTweaks {
 public static boolean enabled = true;
 public static boolean has(String name) { return enabled; }
}
""",
    "app/afterglow/extension/settings/AfterglowPrefs.java": """package app.afterglow.extension.settings;
import java.util.ArrayList;
public final class AfterglowPrefs {
 public interface Listener { void onChanged(String key); }
 private static final ArrayList<Listener> listeners = new ArrayList<>();
 public static void addListener(Listener listener) { listeners.add(listener); }
 public static void changed(String key) { for (Listener listener:listeners) listener.onChanged(key); }
}
""",
    "app/afterglow/extension/settings/LiteMode.java": """package app.afterglow.extension.settings;
public final class LiteMode {
 public static final String KEY = "liteMode";
 public static volatile boolean hidden;
 public static boolean effectiveBool(String key) { return hidden; }
}
""",
}
with tempfile.TemporaryDirectory(prefix="afterglow-actions-thread-") as out:
    out = Path(out)
    sources = []
    for relative, text in STUBS.items():
        path = out / "src" / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text)
        sources.append(path)
    source = out / "src/app/afterglow/extension/playback/WatchActions.java"
    source.parent.mkdir(parents=True, exist_ok=True)
    source.write_text(SOURCE.read_text())
    sources += [source, EXT / "playback/WatchActionsController.java", EXT / "litho/LithoContext.java",
                ROOT / "tools/jvm/WatchActionsThreadTest.java"]
    subprocess.run([str(JDK / "bin/javac"), "-encoding", "UTF-8", "-d", str(out)]
                   + list(map(str, sources)), check=True)
    subprocess.run([str(JDK / "bin/java"), "-cp", str(out), "WatchActionsThreadTest"], check=True, timeout=15)
