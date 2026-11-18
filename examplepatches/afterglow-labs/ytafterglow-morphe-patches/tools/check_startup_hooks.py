#!/usr/bin/env python3
"""Check startup owner isolation, native passthrough, preference recovery and launch routing."""
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
EXT = ROOT / "extensions/extension/src/main/java/app/afterglow/extension"
STUBS = {
    "android/content/Intent.java": """package android.content;
public class Intent { private String action; public Intent(String a){action=a;}
public String getAction(){return action;} public Intent setAction(String a){action=a;return this;} }
""",
    "app/afterglow/extension/Afterglow.java": """package app.afterglow.extension;
public final class Afterglow { public static int errors; public static void error(String where,Throwable error){errors++;} }
""",
    "app/afterglow/extension/diagnostics/DebugLog.java": """package app.afterglow.extension.diagnostics;
public final class DebugLog { public static void write(String category,String message){} }
""",
    "app/afterglow/extension/settings/AfterglowPrefs.java": """package app.afterglow.extension.settings;
import java.util.HashMap; import java.util.Map;
public final class AfterglowPrefs { private static final Map<String,Object> values=new HashMap<>();
public static boolean failReads; public static boolean getBool(String key){if(failReads)throw new IllegalStateException();return Boolean.TRUE.equals(values.get(key));}
public static void setBool(String key,boolean value){values.put(key,value);}
public static String getString(String key){return (String)values.get(key);} public static void setString(String key,String value){values.put(key,value);} }
""",
    "app/afterglow/extension/settings/TabStore.java": """package app.afterglow.extension.settings;
public final class TabStore {public static String currentStartupTab(){return AfterglowPrefs.getString("startupTab");}}
""",
    "app/afterglow/extension/navigation/ShortsHooks.java": """package app.afterglow.extension.navigation;
public final class ShortsHooks {public static final String SHORTS_ONLY_MODE="shortsOnlyMode";}
""",
}
with tempfile.TemporaryDirectory(prefix="afterglow-startup-") as temporary:
    out=Path(temporary); sources=[]
    for name,text in STUBS.items():
        path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text);sources.append(path)
    sources += [EXT/"InstalledTweaks.java",EXT/"settings/LiteMode.java",EXT/"navigation/Gate.java",
                EXT/"navigation/StartupHooks.java",EXT/"navigation/StartupPage.java",ROOT/"tools/jvm/StartupHooksTest.java"]
    subprocess.run(["javac","-encoding","UTF-8","-d",str(out)]+list(map(str,sources)),check=True)
    subprocess.run(["java","-cp",str(out),"StartupHooksTest"],check=True)
