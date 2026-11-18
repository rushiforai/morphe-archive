#!/usr/bin/env python3
"""Exercise the real AI command/router with bounded native fixtures and view lifecycle stubs."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
ANDROID = Path(os.environ.get('ANDROID_JAR', str(Path.home() / 'Android/Sdk/platforms/android-36/android.jar')))
STUBS = {
    'android/view/View.java': '''package android.view;
public class View { public boolean attached=true,shown=true,enabled=true,clicked=false; public View root=this;
 public boolean isAttachedToWindow(){return attached;} public boolean isShown(){return shown;}
 public boolean isEnabled(){return enabled;} public View getRootView(){return root;}
 public boolean performClick(){clicked=true;return true;} }''',
    'android/view/Window.java': '''package android.view; public class Window {
 public View decor=new View(); public View getDecorView(){return decor;} }''',
    'android/app/Activity.java': '''package android.app; public class Activity {
 public boolean finishing,destroyed; public android.view.Window window=new android.view.Window();
 public boolean isFinishing(){return finishing;} public boolean isDestroyed(){return destroyed;}
 public android.view.Window getWindow(){return window;} }''',
    'app/afterglow/extension/Afterglow.java': '''package app.afterglow.extension; public final class Afterglow {
 public static android.app.Activity activity; public static android.app.Activity mainActivity(){return activity;}
 public static void error(String label,Throwable error){} }''',
}
with tempfile.TemporaryDirectory(prefix='afterglow-ai-home-') as directory:
    temp = Path(directory)
    sources = []
    for name, content in STUBS.items():
        file = temp / name; file.parent.mkdir(parents=True, exist_ok=True); file.write_text(content); sources.append(file)
    classes = temp / 'classes'; classes.mkdir()
    subprocess.run(['javac', '-encoding', 'UTF-8', '-classpath', str(ANDROID), '-sourcepath', str(EXT), '-d', str(classes),
                    *map(str, sources), str(ROOT / 'tools/jvm/AiHomeTest.java')], check=True)
    subprocess.run(['java', '-cp', os.pathsep.join(map(str, [classes, ANDROID])),
                    'app.afterglow.extension.destinations.AiHomeTest'], check=True, timeout=30)
