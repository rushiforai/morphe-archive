"""Exercise the production settings and resume helper on a JVM with a fake Android API."""
from pathlib import Path
from subprocess import run
from tempfile import TemporaryDirectory

here = Path(__file__).resolve().parent
stubs = {
    "android.content.Context": "public class Context {}",
    "android.app.Activity": """public class Activity extends android.content.Context {
        public boolean isFinishing() { return false; }
        public boolean isDestroyed() { return false; }
    }""",
    "android.app.Service": "public class Service extends android.content.Context {}",
    "android.content.Intent": """public class Intent {
        public static final int FLAG_ACTIVITY_NO_ANIMATION = 0x10000;
        private final java.util.Map<String, Boolean> flags = new java.util.HashMap<>();
        public Intent putExtra(String key, boolean value) { flags.put(key, value); return this; }
        public boolean getBooleanExtra(String key, boolean fallback) { return flags.getOrDefault(key, fallback); }
        public Intent addFlags(int flag) { return this; }
    }""",
    "android.content.SharedPreferences": """public interface SharedPreferences {
        String getString(String key, String fallback);
        boolean getBoolean(String key, boolean fallback);
        Editor edit();
        void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener);
        interface OnSharedPreferenceChangeListener {
            void onSharedPreferenceChanged(SharedPreferences preferences, String key);
        }
        interface Editor {
            Editor putString(String key, String value);
            Editor putBoolean(String key, boolean value);
            void apply();
        }
    }""",
    "android.os.Looper": "public class Looper { public static Looper getMainLooper() { return new Looper(); } }",
    "android.os.Handler": """public class Handler {
        private static final java.util.Queue<Runnable> queue = new java.util.ArrayDeque<>();
        public Handler(Looper looper) {}
        public void post(Runnable work) { queue.add(work); }
        public void postDelayed(Runnable work, long delay) { post(work); }
        public static void drain() { while (!queue.isEmpty()) queue.remove().run(); }
    }""",
    "android.util.Log": """public class Log {
        public static void i(String tag, String msg) {}
        public static void w(String tag, String msg) {}
        public static void w(String tag, String msg, Throwable error) { throw new AssertionError(msg, error); }
    }""",
    "android.preference.PreferenceManager": """public class PreferenceManager {
        public static android.content.SharedPreferences stored;
        public static android.content.SharedPreferences getDefaultSharedPreferences(android.content.Context c) {
            return stored;
        }
    }""",
    "android.preference.PreferenceActivity": """public class PreferenceActivity extends android.app.Activity {
        public ListPreference row;
        public Preference findPreference(CharSequence key) { return row; }
    }""",
    "android.preference.Preference": """public class Preference {
        public interface Change { boolean change(Preference pref, Object value); }
    }""",
    "android.preference.ListPreference": """public class ListPreference extends Preference {
        public CharSequence[] labels, codes;
        public CharSequence summary;
        public String value;
        public boolean enabled, persistent = true;
        public Change listener;
        public void setEnabled(boolean next) { enabled = next; }
        public void setEntries(CharSequence[] entries) { labels = entries; }
        public void setEntryValues(CharSequence[] values) { codes = values; }
        public void setPersistent(boolean next) { persistent = next; }
        public void setValue(String next) { value = next; }
        public CharSequence getEntry() { return labels[findIndexOfValue(value)]; }
        public int findIndexOfValue(String value) {
            for (int i = 0; i < codes.length; i++) if (codes[i].equals(value)) return i;
            return -1;
        }
        public void setSummary(CharSequence next) { summary = next; }
        public void setOnPreferenceChangeListener(Change next) { listener = next; }
    }""",
    "e.e.a.PanelUi": """public class PanelUi {
        public static String language = "ja";
        public static String tr(android.content.Context c, String ja, String en, String zh) {
            return language.equals("ja") ? ja : language.equals("en") ? en : zh;
        }
    }""",
    "e.e.a.PlaybackReturn": """public class PlaybackReturn {
        static Object automaticVideo;
        static java.lang.ref.Reference<?> active;
    }""",
    "e.e.a.PopupReturn244": "public class PopupReturn244 { static Object pending; }",
    "e.e.a.PlayerGestures219": """public class PlayerGestures219 {
        static boolean fullscreen;
        static void fullscreen(android.app.Activity activity, Object owner, boolean selected) {
            fullscreen = selected;
        }
    }""",
    "com.sauzask.nicoid.NicoidVideoActivity": """public class NicoidVideoActivity
        extends android.app.Activity {
        public static class Fragment {
            public boolean B0, C0;
            public final e.e.a.AppResume253Test.Player a0 = new e.e.a.AppResume253Test.Player();
        }
        public final Fragment v = new Fragment();
    }""",
    "e.e.a.Dev111": "public class Dev111 { static void suppressAutoReturn() {} }",
    "e.e.a.Dev115": """public class Dev115 {
        static android.content.Intent returned, unrelated;
        static int calls;
        static boolean rejectFirst;
        static boolean seamlessReturn(android.app.Service owner) {
            calls++;
            unrelated = new android.content.Intent();
            AppResume253.prepareReturn(new android.app.Service(), unrelated);
            if (rejectFirst && calls == 1) return false;
            returned = new android.content.Intent().putExtra("nicoid_portrait_restore", true);
            AppResume253.prepareReturn(owner, returned);
            return true;
        }
    }""",
}

with TemporaryDirectory() as temporary:
    root = Path(temporary)
    sources = []
    for name, code in stubs.items():
        package, leaf = name.rsplit(".", 1)
        file = root.joinpath(*package.split("."), leaf + ".java")
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(f"package {package};\n{code}\n", encoding="utf-8")
        sources.append(file)
    run(["javac", "-d", root, *sources, here / "AppResume253Test.java",
         here.parent / "java/e/e/a/AppResume253.java"], check=True)
    run(["java", "-cp", root, "e.e.a.AppResume253Test"], check=True)
