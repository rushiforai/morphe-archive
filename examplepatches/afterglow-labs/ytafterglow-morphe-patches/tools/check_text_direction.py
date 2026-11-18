#!/usr/bin/env python3
"""Verify native-direction preservation, window inheritance and startup failure recovery."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
ANDROID = Path(os.environ.get('ANDROID_JAR', str(Path.home() / 'Android/Sdk/platforms/android-36/android.jar')))
STUBS = {
    'android/text/TextDirectionHeuristic.java': 'package android.text; public interface TextDirectionHeuristic {}',
    'android/text/TextDirectionHeuristics.java': '''package android.text; public final class TextDirectionHeuristics {
 public static final TextDirectionHeuristic LTR=new TextDirectionHeuristic(){}; }''',
    'android/view/View.java': '''package android.view; public class View {
 public static final int TEXT_DIRECTION_LTR=3; public int direction=7,layoutDirection=1,calls;
 public void setTextDirection(int value){direction=value;calls++;} }''',
    'android/view/Window.java': '''package android.view; public class Window {public View decor=new View(); public View getDecorView(){return decor;} }''',
    'android/app/Activity.java': '''package android.app; public class Activity {public android.view.Window window=new android.view.Window(); public android.view.Window getWindow(){return window;} }''',
    'app/afterglow/extension/Afterglow.java': '''package app.afterglow.extension; public final class Afterglow {public static int errors;public static void error(String label,Throwable error){errors++;}}''',
    'app/afterglow/extension/InstalledTweaks.java': '''package app.afterglow.extension; public final class InstalledTweaks {public static boolean installed;public static boolean has(String key){if(!key.equals("interface-layout"))throw new AssertionError(key);return installed;}}''',
    'app/afterglow/extension/settings/AfterglowPrefs.java': '''package app.afterglow.extension.settings; public final class AfterglowPrefs {public static boolean enabled,fail;public static int reads;public static boolean getBool(String key){reads++;if(!key.equals("disableRTL"))throw new AssertionError(key);if(fail)throw new IllegalStateException("storage");return enabled;}}''',
}
with tempfile.TemporaryDirectory(prefix='afterglow-text-direction-') as directory:
    temp=Path(directory);sources=[]
    for name, content in STUBS.items():
        file=temp/name;file.parent.mkdir(parents=True,exist_ok=True);file.write_text(content);sources.append(file)
    classes=temp/'classes';classes.mkdir()
    subprocess.run(['javac','-encoding','UTF-8','-classpath',str(ANDROID),'-sourcepath',str(EXT),'-d',str(classes),
                    *map(str,sources),str(ROOT/'tools/jvm/TextDirectionTest.java')],check=True)
    subprocess.run(['java','-cp',os.pathsep.join(map(str,[classes,ANDROID])),
                    'app.afterglow.extension.interfaceui.TextDirectionTest'],check=True,timeout=30)
