"""Exercise the production in-app row against the verified Compose ABI boundary."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/wuplay/src/main/java/nl/johninnl/wuplay/NativeChannelSettings.java'


class WuplayNativeSettingsTests(unittest.TestCase):
    def test_appends_native_row_and_opens_internal_selector(self):
        self.assertTrue(SOURCE.exists(), 'In-app Wuplay channel setting is not implemented')
        files = {
            'android/content/Context.java': '''package android.content; public class Context {
public Intent launched; public void startActivity(Intent intent){launched=intent;} }''',
            'android/content/Intent.java': '''package android.content; public class Intent {
public static final int FLAG_ACTIVITY_NEW_TASK=0x10000000; public final Class<?> target;
public Intent(Context c,Class<?> cls){target=cls;} public Intent addFlags(int flags){return this;} }''',
            'nl/johninnl/wuplay/CatalogSettingsActivity.java': 'package nl.johninnl.wuplay; public class CatalogSettingsActivity {}',
            'kotlin/Unit.java': 'package kotlin; public class Unit {public static final Unit INSTANCE=new Unit();}',
            'kotlin/jvm/functions/Function0.java': 'package kotlin.jvm.functions; public interface Function0 {Object invoke();}',
            'kotlin/jvm/functions/Function3.java': 'package kotlin.jvm.functions; public interface Function3 {Object invoke(Object a,Object b,Object c);}',
            'androidx/compose/ui/Modifier.java': 'package androidx.compose.ui; public interface Modifier {}',
            'androidx/compose/ui/focus/FocusRequester.java': 'package androidx.compose.ui.focus; public class FocusRequester {}',
            'androidx/compose/runtime/ProvidableCompositionLocal.java': 'package androidx.compose.runtime; public class ProvidableCompositionLocal {}',
            'androidx/compose/runtime/GapComposer.java': '''package androidx.compose.runtime; public class GapComposer {
public final android.content.Context context=new android.content.Context();public Object consume(ProvidableCompositionLocal local){return context;} }''',
            'androidx/compose/ui/platform/AndroidCompositionLocals_androidKt.java': '''package androidx.compose.ui.platform;
public class AndroidCompositionLocals_androidKt {public static final androidx.compose.runtime.ProvidableCompositionLocal LocalContext=new androidx.compose.runtime.ProvidableCompositionLocal();}''',
            'androidx/compose/foundation/lazy/LazyListIntervalContent.java': '''package androidx.compose.foundation.lazy;
import java.util.*;import kotlin.jvm.functions.Function3;public class LazyListIntervalContent {
public final List<String> keys=new ArrayList<>();public Function3 content;
public void item(Object key,String type,Function3 callback){keys.add((String)key);content=callback;} }''',
            'app/wuplay/androidtv/ui/screens/settings/SettingRowKt.java': '''package app.wuplay.androidtv.ui.screens.settings;
import kotlin.jvm.functions.Function0;import androidx.compose.runtime.GapComposer;import androidx.compose.ui.Modifier;import androidx.compose.ui.focus.FocusRequester;
public class SettingRowKt {public static String title,description;public static Function0 click,back;
public static void SettingRow(String t,String v,Function0 c,Modifier m,String d,FocusRequester f,Function0 a,Function0 b,boolean first,boolean last,GapComposer composer,int changed,int defaults){
if(first||!last)throw new AssertionError("New final row must allow Up and stop Down");title=t;description=d;click=c;back=a;} }''',
            'nl/johninnl/wuplay/SettingsProbe.java': '''package nl.johninnl.wuplay;
import androidx.compose.foundation.lazy.LazyListIntervalContent;import androidx.compose.runtime.GapComposer;
import app.wuplay.androidtv.ui.screens.settings.SettingRowKt;
public class SettingsProbe {static boolean backed;public static void main(String[] args){LazyListIntervalContent scope=new LazyListIntervalContent();scope.keys.add("native-before");
NativeChannelSettings.appendRow(scope,(kotlin.jvm.functions.Function0)()->{backed=true;return kotlin.Unit.INSTANCE;});if(scope.keys.size()!=2||!scope.keys.get(0).equals("native-before"))throw new AssertionError("Native items changed");
if(!scope.keys.get(1).equals("morphe-wuplay-tv-channels"))throw new AssertionError("Unstable settings row key");
GapComposer composer=new GapComposer();scope.content.invoke(null,composer,0);
if(!SettingRowKt.title.equals("TV channels")||!SettingRowKt.description.contains("Home"))throw new AssertionError("Missing in-app setting");
SettingRowKt.back.invoke();if(!backed)throw new AssertionError("Native Left/Back action lost");
SettingRowKt.click.invoke();if(composer.context.launched==null||composer.context.launched.target!=CatalogSettingsActivity.class)throw new AssertionError("Selector not opened inside Wuplay");} }''',
        }
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)
            for name, text in files.items():
                path = out / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text)
            command = ['javac', '-d', str(out), str(SOURCE)] + [str(p) for p in out.rglob('*.java')]
            compiled = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(compiled.returncode, 0, compiled.stderr)
            executed = subprocess.run(['java', '-cp', str(out), 'nl.johninnl.wuplay.SettingsProbe'], capture_output=True, text=True)
            self.assertEqual(executed.returncode, 0, executed.stderr)
