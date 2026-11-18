"""Exercise settings integration with Brother's AndroidX-style ViewGroup.

Run from the repository root with a JDK in JAVA_HOME. Android classes are
small test doubles; the AndroidX layout deliberately does not extend LinearLayout.
"""
import os
import pathlib
import subprocess
import tempfile

root = pathlib.Path(__file__).resolve().parents[1]
source = root / 'extensions/extension/src/main/java/app/template/extension/extension/SettingsIntegration.java'
files = {
'android/content/Context.java': '''package android.content; public class Context { public Context getApplicationContext(){return this;} public String getPackageName(){return "example";} public android.content.res.Resources getResources(){return new android.content.res.Resources();} public void startActivity(Intent i){} }''',
'android/content/Intent.java': '''package android.content; public class Intent { public Intent(Context c,Class<?> k){} }''',
'android/content/res/Resources.java': '''package android.content.res; public class Resources { public int getIdentifier(String n,String t,String p){return 1;} public android.util.DisplayMetrics getDisplayMetrics(){return new android.util.DisplayMetrics();} }''',
'android/util/DisplayMetrics.java': '''package android.util; public class DisplayMetrics { public float density=1; }''',
'android/app/Activity.java': '''package android.app; public class Activity extends android.content.Context { public android.view.View screen; public android.view.View findViewById(int id){return screen;} }''',
'android/view/View.java': '''package android.view; public class View { Object tag; public View(){} public View(android.content.Context c){} public void setBackgroundColor(int color){} public void setTag(Object t){tag=t;} public View findViewWithTag(Object t){return t.equals(tag)?this:null;} public interface OnClickListener {void onClick(View v);} public void setOnClickListener(OnClickListener l){} }''',
'android/view/ViewGroup.java': '''package android.view; import java.util.*; public class ViewGroup extends View { public final ArrayList<View> children=new ArrayList<>(); public int getChildCount(){return children.size();} public View getChildAt(int i){return children.get(i);} public void addView(View v){children.add(v);} public void addView(View v,int i){children.add(i,v);} public void addView(View v,android.widget.LinearLayout.LayoutParams p){children.add(v);} public void removeView(View v){children.remove(v);} public View findViewWithTag(Object t){for(View v:children){View x=v.findViewWithTag(t);if(x!=null)return x;}return super.findViewWithTag(t);} }''',
'android/widget/LinearLayout.java': '''package android.widget; public class LinearLayout extends android.view.ViewGroup { public static final int VERTICAL=1; public static class LayoutParams {public static final int MATCH_PARENT=-1; public int topMargin; public LayoutParams(int w,int h){}} public LinearLayout(android.content.Context c){} public void setOrientation(int o){} public void setPadding(int a,int b,int c,int d){} }''',
'android/widget/TextView.java': '''package android.widget; public class TextView extends android.view.View { public TextView(android.content.Context c){} public void setText(String s){} public void setTextSize(int n){} public void setTextColor(int c){} public void setTypeface(Object f,int style){} }''',
'android/widget/Button.java': '''package android.widget; public class Button extends TextView { public Button(android.content.Context c){super(c);} }''',
'android/widget/Switch.java': '''package android.widget; public class Switch extends TextView { public Switch(android.content.Context c){super(c);} public void setChecked(boolean b){} public interface Listener {void onCheckedChanged(Switch b,boolean c);} public void setOnCheckedChangeListener(Listener l){} }''',
'app/template/extension/extension/AutoCache.java': '''package app.template.extension.extension; public class AutoCache { public static void init(android.content.Context c){} public static boolean enabled(){return true;} public static void setEnabled(boolean b){} }''',
'app/template/extension/extension/CacheSettingsActivity.java': '''package app.template.extension.extension; public class CacheSettingsActivity {}''',
'SettingsLayoutTest.java': '''import android.app.Activity; import android.view.View; import android.view.ViewGroup; import app.template.extension.extension.SettingsIntegration; public class SettingsLayoutTest { public static void main(String[] args) { Activity a=new Activity(); ViewGroup scroll=new ViewGroup(); ViewGroup androidXLinearLayoutCompat=new ViewGroup(); View brotherOriginal=new View(); androidXLinearLayoutCompat.addView(brotherOriginal); scroll.addView(androidXLinearLayoutCompat); a.screen=scroll; SettingsIntegration.attach(a); if(androidXLinearLayoutCompat.getChildCount()!=2 || androidXLinearLayoutCompat.getChildAt(0)!=brotherOriginal) throw new AssertionError("controls must follow Brother settings"); SettingsIntegration.attach(a); if(androidXLinearLayoutCompat.getChildCount()!=2 || androidXLinearLayoutCompat.getChildAt(0)!=brotherOriginal) throw new AssertionError("duplicate or misplaced controls on resume"); System.out.println("Settings layout checks passed"); } }''',
}
with tempfile.TemporaryDirectory() as directory:
    base=pathlib.Path(directory)
    for name, content in files.items():
        p=base/name; p.parent.mkdir(parents=True,exist_ok=True); p.write_text(content,encoding='utf-8')
    javac=pathlib.Path(os.environ['JAVA_HOME'])/'bin/javac.exe'
    java=pathlib.Path(os.environ['JAVA_HOME'])/'bin/java.exe'
    subprocess.run([str(javac),'-d',str(base/'classes'),str(source),*[str(p) for p in base.rglob('*.java')]],check=True)
    subprocess.run([str(java),'-cp',str(base/'classes'),'SettingsLayoutTest'],check=True)

# Catch mojibake in navigation symbols and preserve the details entry.
settings = (root / 'extensions/extension/src/main/java/app/template/extension/extension/CacheSettingsActivity.java').read_text(encoding='utf-8')
assert 'â€' not in settings, 'navigation labels contain mojibake'
assert 'Timing details and help' not in settings

assert "Reset timing comparison" not in settings
assert "Uncached replay result" not in settings
assert "Stop uncached measurement" not in settings
assert "View differences" not in settings

assert 'menu.getMenu().add("What is this fix?")' not in settings
assert 'infoTouch.setContentDescription("What is this fix?")' in settings
assert 'infoTouch.setOnClickListener(v->openFixExplanation())' in settings
assert "https://github.com/pholcroft/brother-morphe-patches#how-it-works-and-limitations" in settings
assert "Intent.ACTION_VIEW" in settings

assert "Refresh status" not in settings
assert "liveCheckEnabled" not in settings
integration = source.read_text(encoding="utf-8")
assert "Check printer readiness" not in integration
cache = (root / "extensions/extension/src/main/java/app/template/extension/extension/AutoCache.java").read_text(encoding="utf-8")
assert "Readiness.maybeCheck" not in cache

patch = (root / "patches/src/main/kotlin/app/template/patches/brother/AutomaticCachePatch.kt").read_text(encoding="utf-8")
assert "ReplayDiffActivity" in patch
assert "lookup(Ljava/lang/Object;Ljava/lang/Object;II)" in patch


diagnostics = (root / "extensions/extension/src/main/java/app/template/extension/extension/DiagnosticsActivity.java").read_text(encoding="utf-8")
assert "CAPTURING-PRINTER-TRAFFIC.md" not in diagnostics
assert ".setNeutralButton(\"Read guide\"" not in diagnostics
assert "https://github.com/pholcroft/brother-morphe-patches/issues" in diagnostics

assert "Printer options for " not in settings
history = (root / "extensions/extension/src/main/java/app/template/extension/extension/ActivityHistoryActivity.java").read_text(encoding="utf-8")
assert "Clear saved printer data" in history
assert "Delete all activity" in history
