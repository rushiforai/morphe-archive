#!/usr/bin/env python3
"""Exercise exact owner identity, mixed commands, live role binding and native view recycling."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
ANDROID = Path(os.environ.get('ANDROID_JAR', str(Path.home() / 'Android/Sdk/platforms/android-36/android.jar')))
STUBS = {
    'android/content/res/Resources.java': 'package android.content.res; public class Resources { public int getIdentifier(String name,String type,String pkg){if(!name.equals("afterglow_shorts_subscriptions_role"))throw new AssertionError(name);return 77;} }',
    'android/content/Context.java': 'package android.content; public class Context {public android.content.res.Resources getResources(){return new android.content.res.Resources();} public String getPackageName(){return "test";} }',
    'android/view/View.java': '''package android.view; public class View {
 public final java.util.Map<Integer,Object> tags=new java.util.HashMap<>(); public int visibility=0;
 public Object clickListener=new Object(),longClickListener=new Object();
 public Object getTag(int id){return tags.get(id);} public void setTag(int id,Object value){tags.put(id,value);} }''',
    'app/afterglow/extension/Afterglow.java': '''package app.afterglow.extension; public final class Afterglow {
 public static int errors; public static android.content.Context context(){return new android.content.Context();}
 public static void error(String label,Throwable error){errors++;} }''',
    'app/afterglow/extension/InstalledTweaks.java': '''package app.afterglow.extension; public final class InstalledTweaks {
 public static boolean installed=true,fail; public static boolean has(String key){if(!key.equals("shorts-layout"))throw new AssertionError(key);if(fail)throw new IllegalStateException("storage");return installed;} }''',
    'app/afterglow/extension/navigation/ShortsHeaderBindings.java': '''package app.afterglow.extension.navigation; public final class ShortsHeaderBindings {
 public interface TagBuilder {void afterglow_putShortsTag(int id,Object value);} }''',
    'app/afterglow/extension/playback/PlayerOverlay.java': '''package app.afterglow.extension.playback; import android.view.View; public final class PlayerOverlay {
 public static int binds,unbinds; public static boolean enabled; public static final java.util.Map<View,Integer> bound=new java.util.IdentityHashMap<>();
 public static void bind(View v,String key,String owner){if(!key.equals("hideShortsSubscriptions")||!owner.equals("shorts-layout"))throw new AssertionError(key);binds++;bound.putIfAbsent(v,v.visibility);if(enabled)v.visibility=8;}
 public static void unbind(View v,String owner){if(!owner.equals("shorts-layout"))throw new AssertionError(owner);unbinds++;Integer original=bound.remove(v);if(original!=null)v.visibility=original;}
 public static void setEnabled(boolean value){enabled=value;for(var e:bound.entrySet())e.getKey().visibility=value?8:e.getValue();} }''',
}
with tempfile.TemporaryDirectory(prefix='afterglow-shorts-subscriptions-') as directory:
    temp = Path(directory); sources = []
    for name, content in STUBS.items():
        file = temp/name; file.parent.mkdir(parents=True, exist_ok=True); file.write_text(content); sources.append(file)
    classes = temp/'classes'; classes.mkdir()
    subprocess.run(['javac', '-encoding', 'UTF-8', '-classpath', str(ANDROID), '-sourcepath', str(EXT), '-d', str(classes),
                    *map(str, sources), str(ROOT/'tools/jvm/ShortsSubscriptionsBindingsTest.java')], check=True)
    subprocess.run(['java', '-cp', os.pathsep.join(map(str, [classes, ANDROID])),
                    'app.afterglow.extension.interfaceui.ShortsSubscriptionsBindingsTest'], check=True, timeout=30)
