"""Exercise the production menu publisher against a paired Menu/Action fixture."""
from pathlib import Path
import subprocess
from tempfile import TemporaryDirectory

HERE = Path(__file__).resolve().parent
SOURCES = {
    "android.app.Activity": """public class Activity {
        public boolean account;
        public final java.util.Set<String> hidden = new java.util.HashSet<>();
        public final java.util.List<Integer> order = new java.util.ArrayList<>();
    }""",
    "android.content.SharedPreferences": """public interface SharedPreferences {
        boolean getBoolean(String key, boolean fallback);
    }""",
    "android.view.Menu": """public interface Menu {
        MenuItem add(int group, int id, int order, CharSequence title);
        void clear();
    }""",
    "android.view.MenuItem": """public interface MenuItem {
        int getOrder();
        int getItemId();
        CharSequence getTitle();
        boolean isEnabled();
        MenuItem setEnabled(boolean enabled);
        MenuItem setOnMenuItemClickListener(Click listener);
        interface Click { boolean click(MenuItem item); }
    }""",
    "e.e.a.MenuOptions119": """final class MenuOptions119 {
        static android.content.SharedPreferences prefs(android.app.Activity a) {
            return (key, fallback) -> !a.hidden.contains(key) && fallback;
        }
        static String key(int id) { return "video_menu_visible_" + id; }
    }""",
    "e.e.a.MenuEditor120": """final class MenuEditor120 {
        static java.util.List<Integer> order(android.app.Activity a) { return a.order; }
    }""",
    "e.e.a.AccountRemoval227": """final class AccountRemoval227 {
        static int kind(android.app.Activity a) { return a.account ? 1 : 0; }
    }""",
    "e.e.a.ListActions": """final class ListActions {
        static final class Action {
            final int id;
            final String title;
            final boolean enabled;
            final Runnable run;
            Action(android.view.MenuItem item, Runnable run) {
                id = item.getItemId();
                title = item.getTitle().toString();
                enabled = item.isEnabled();
                this.run = run;
            }
        }
    }""",
}

with TemporaryDirectory() as folder:
    out = Path(folder)
    files = []
    for key, source in SOURCES.items():
        package, name = key.rsplit(".", 1)
        file = out.joinpath(*package.split("."), name + ".java")
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(f"package {package};\n{source}\n", encoding="utf-8")
        files.append(file)
    subprocess.run(["javac", "-d", out, *files,
                    HERE / "VideoMenu274Test.java",
                    HERE.parent / "java/e/e/a/VideoMenu274.java"], check=True)
    subprocess.run(["java", "-cp", out, "e.e.a.VideoMenu274Test"], check=True)
