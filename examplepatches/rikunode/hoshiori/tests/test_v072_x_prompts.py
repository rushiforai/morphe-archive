"""Execute the production X CSS helper against minimal Android API doubles."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
HELPER = ROOT / "extensions/adblock/src/main/java/dev/rikunode/adblock/XAppPromptCss.java"
STUBS = {
    "android/content/Context.java": """
package android.content;
public abstract class Context {
 public static final int MODE_PRIVATE=0;
 public abstract SharedPreferences getSharedPreferences(String name,int mode);
}
""",
    "android/content/SharedPreferences.java": """
package android.content;
public interface SharedPreferences { boolean getBoolean(String key,boolean fallback); }
""",
    "android/webkit/WebView.java": """
package android.webkit;
import android.content.Context;
public class WebView {
 public Context context;
 public String script;
 public Context getContext(){return context;}
 public void evaluateJavascript(String s,Object callback){script=s;}
}
""",
    "org/json/JSONObject.java": r'''
package org.json;
public class JSONObject {
 public static String quote(String s){return "\"" + s.replace("\\","\\\\").replace("\"","\\\"") + "\"";}
}
''',
    "dev/rikunode/adblock/XProbe.java": """
package dev.rikunode.adblock;
import android.content.*;
import android.webkit.WebView;
public class XProbe {
 static Context prefs(Boolean value,boolean fail) {
  return new Context(){public SharedPreferences getSharedPreferences(String name,int mode){
   if(!name.equals("hoshiori_settings"))throw new AssertionError(name);
   return (key,fallback)->{
    if(!key.equals("hideXAppPrompts"))throw new AssertionError(key);
    if(fail)throw new IllegalStateException("test");
    return value==null?fallback:value;
   };
  }};
 }
 static void check(boolean expected, Context context){
  if(XAppPromptCss.enabled(context)!=expected)throw new AssertionError("wrong default");
  WebView w=new WebView();w.context=context;XAppPromptCss.inject(w);
  if(w.script==null||!w.script.contains("if(!"+expected+"||"))throw new AssertionError("wrong injection");
  System.out.println((expected?"ON ":"OFF ")+w.script);
 }
 public static void main(String[] args){
  check(false,null);check(false,prefs(null,false));check(false,prefs(false,false));
  check(false,prefs(true,true));check(true,prefs(true,false));
 }
}
""",
}

class XAppPromptTests(unittest.TestCase):
    def test_runtime_defaults_and_injection(self):
        jdk = Path(os.environ["JAVA_HOME"]) / "bin" if os.environ.get("JAVA_HOME") else None
        javac = str(jdk / "javac") if jdk else shutil.which("javac")
        java = str(jdk / "java") if jdk else shutil.which("java")
        self.assertTrue(javac and java, "JDK required")
        with tempfile.TemporaryDirectory() as temp:
            directory = Path(temp)
            for name, content in STUBS.items():
                p = directory / name
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_text(content, encoding="utf-8")
            subprocess.run([javac, "-encoding", "UTF-8", "-d", temp,
                            str(HELPER), *map(str, directory.rglob("*.java"))], check=True)
            lines = subprocess.check_output([java, "-cp", temp, "dev.rikunode.adblock.XProbe"],
                                            text=True).splitlines()
        self.assertEqual([x.split(" ", 1)[0] for x in lines], ["OFF"] * 4 + ["ON"])
        for line in lines:
            self.assertIn("ct=post-modal", line)
            self.assertIn("ct=post-timeline", line)
            self.assertIn("location.hostname!=='x.com'", line)
            self.assertIn("location.hostname!=='twitter.com'", line)
            self.assertIn("if(s)s.remove();return;", line)
        self.assertIn('toggle("Xのアプリ誘導を非表示", "hideXAppPrompts", false)',
                      (ROOT / "extensions/settings/src/main/java/dev/rikunode/settings/HoshioriSettingsActivity.java").read_text(encoding="utf-8"))

    def test_hook_independent_of_ads(self):
        patch = (ROOT / "patches/src/main/kotlin/dev/rikunode/hatenabookmark/BlockAdsInAppBrowserPatch.kt").read_text(encoding="utf-8")
        self.assertLess(patch.index("->injectXAppPromptCss("), patch.index("if (blockInAppBrowserAds == false) return@execute"))
        self.assertIn('if (blockInAppBrowserAds == false) "" else', patch)
        self.assertLess(patch.index("if (blockInAppBrowserAds == false) return@execute"), patch.index("val intercept = ImmutableMethod"))
