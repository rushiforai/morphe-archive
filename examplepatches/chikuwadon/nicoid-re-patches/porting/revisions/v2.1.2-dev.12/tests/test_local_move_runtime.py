"""Exercise the same-count selection race across both move dialogs."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess

source = Path(__file__).resolve().parents[1] / 'MoveConfirm212.java'
stubs = {
    'android.content.Context': '''
        public android.content.res.Resources getResources(){return new android.content.res.Resources();}
    ''',
    'android.content.res.Resources': '''
        public Config getConfiguration(){return new Config();}
        public static class Config { public java.util.Locale locale=java.util.Locale.ENGLISH; }
    ''',
    'android.app.Activity': '''
        public boolean destroyed;
        public boolean isFinishing(){return false;}
        public boolean isDestroyed(){return destroyed;}
    ''',
    'android.app.AlertDialog': '''
        public static Runnable confirm;
        public static class Builder {
            public Builder(android.content.Context context){}
            public interface Click {void accept(Object dialog,int which);}
            public Builder setTitle(String title){return this;}
            public Builder setMessage(String text){return this;}
            public Builder setNegativeButton(String text,Click listener){return this;}
            public Builder setPositiveButton(String text,Click listener){confirm=()->listener.accept(null,0);return this;}
            public void show(){}
        }
    ''',
    'android.preference.PreferenceManager': '''
        public static PreferenceManager getDefaultSharedPreferences(android.content.Context context){return new PreferenceManager();}
        public String getString(String name,String fallback){return fallback;}
    ''',
    'android.util.Log': 'public static int w(String tag,String message,Throwable error){throw new AssertionError(error);}',
    'android.widget.Toast': '''
        public static final int LENGTH_SHORT=0;
        public static Toast makeText(android.content.Context context,String message,int duration){return new Toast();}
        public void show(){}
    ''',
    'org.json.JSONObject': '''
        public JSONObject(String text){}
        public JSONArray optJSONArray(String name){return null;}
        public String optString(String name){return "";}
        public String optString(String name,String fallback){return fallback;}
    ''',
    'org.json.JSONArray': '''
        public int length(){return 0;}
        public JSONObject optJSONObject(int index){return null;}
    ''',
    'e.e.a.Scenario': '''
        static class Page {
            final android.app.Activity a=new android.app.Activity();
            final java.util.Set<String> selected=new java.util.HashSet<>();
            String folder="source";
        }
        static int moves;
        static void check(boolean value){if(!value)throw new AssertionError();}
        public static void main(String[] args){
            Page page=new Page();page.selected.add("first");
            java.util.function.Consumer<String> picker=MoveConfirm212.wrapLocal(page, id->moves++);
            page.selected.clear();page.selected.add("other");
            picker.accept("");
            check(android.app.AlertDialog.confirm==null);
            page.selected.clear();page.selected.add("first");picker.accept("");
            check(android.app.AlertDialog.confirm!=null);
            page.selected.clear();page.selected.add("other");
            android.app.AlertDialog.confirm.run();
            check(moves==0);
            page.selected.clear();page.selected.add("first");picker.accept("");
            page.folder="different";android.app.AlertDialog.confirm.run();
            check(moves==0);
            page.folder="source";picker.accept("");android.app.AlertDialog.confirm.run();
            check(moves==1);
            picker.accept("");page.a.destroyed=true;android.app.AlertDialog.confirm.run();
            check(moves==1);
        }
    ''',
}
with TemporaryDirectory(prefix='nicoid-local-move-') as d:
    work = Path(d)
    files = []
    for full_name, body in stubs.items():
        package, name = full_name.rsplit('.', 1)
        path = work.joinpath(*package.split('.'), name + '.java')
        path.parent.mkdir(parents=True, exist_ok=True)
        inheritance = ' extends android.content.Context' if name == 'Activity' else ''
        path.write_text(f'package {package}; public class {name}{inheritance} {{ {body} }}')
        files.append(str(path))
    out = work / 'classes'
    out.mkdir()
    subprocess.run(['javac', '--release', '8', '-d', str(out), str(source), *files], check=True)
    subprocess.run(['java', '-cp', str(out), 'e.e.a.Scenario'], check=True)
print('PASS: same-count replacement, folder changes, activity destruction and valid moves')
