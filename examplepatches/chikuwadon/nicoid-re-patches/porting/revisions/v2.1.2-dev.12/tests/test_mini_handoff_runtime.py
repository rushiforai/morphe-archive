"""Run delayed cleanup against both active mini-player owners."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess

source = Path(__file__).resolve().parents[1] / 'MiniGhost272.java'
stubs = {
    'android.os.Looper': 'public static Looper getMainLooper(){return new Looper();}',
    'android.os.Handler': '''
        public static Runnable pending;
        public Handler(Looper looper){}
        public boolean postDelayed(Runnable task,long delay){pending=task;return true;}
        public boolean post(Runnable task){return true;}''',
    'android.app.Activity': '''
        public boolean isDestroyed(){return false;}
        public Window getWindow(){return new Window();}
        public static class Window { public android.view.View getDecorView(){return null;} }''',
    'android.view.View': '''
        public Object getTag(){return null;}
        public ViewParent getParent(){return null;}''',
    'android.view.ViewGroup': '''
        public int getChildCount(){return 0;}
        public View getChildAt(int index){return null;}
        public void removeViewAt(int index){}''',
    'android.util.Log': '''
        public static int i(String tag,String message){return 0;}
        public static int w(String tag,String message,Throwable error){return 0;}''',
    'e.e.a.DirectBackground235': 'public static Scenario.Session active;',
    'e.e.a.MiniSession225': 'public static Scenario.Session active;',
    'e.e.a.Scenario': '''
        static class Session {
            final Object video;
            boolean closing;
            int stops;
            Session(Object video){this.video=video;}
            void close(boolean stop){if(stop)stops++;}
        }
        static void check(boolean value){if(!value)throw new AssertionError();}
        public static void main(String[] args) {
            Object video=new Object();
            Session old=new Session(video), peer=new Session(video), fresh=new Session(video);
            DirectBackground235.active=old;
            MiniSession225.active=peer;
            MiniGhost272.schedule(old, false);
            android.os.Handler.pending.run();
            check(peer.stops==0);
            MiniGhost272.schedule(old, true);
            MiniSession225.active=fresh;
            android.os.Handler.pending.run();
            check(peer.stops==0 && fresh.stops==0);
            MiniSession225.active=peer;
            MiniGhost272.schedule(old, true);
            android.os.Handler.pending.run();
            check(old.stops==0 && peer.stops==1);
            MiniSession225.active=new Session(new Object());
            MiniGhost272.schedule(old, true);
            android.os.Handler.pending.run();
            check(MiniSession225.active.stops==0);
        }''',
}
with TemporaryDirectory(prefix='nicoid-mini-test-') as d:
    work = Path(d)
    files = []
    for full_name, body in stubs.items():
        package, name = full_name.rsplit('.', 1)
        path = work.joinpath(*package.split('.'), name + '.java')
        path.parent.mkdir(parents=True, exist_ok=True)
        inheritance = ' extends View implements ViewParent' if name == 'ViewGroup' else ''
        path.write_text(f'package {package}; public class {name}{inheritance} {{ {body} }}')
        files.append(str(path))
    parent = work / 'android/view/ViewParent.java'
    parent.write_text('package android.view; public interface ViewParent {}')
    out = work / 'classes'
    out.mkdir()
    subprocess.run(['javac', '--release', '8', '-d', str(out), str(source), *files, str(parent)], check=True)
    subprocess.run(['java', '-cp', str(out), 'e.e.a.Scenario'], check=True)
print('PASS: stop versus handoff, concurrent owner replacement, same-session and unrelated playback')
