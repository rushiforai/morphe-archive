from pathlib import Path
import subprocess,tempfile,re,shutil,sys
repo=Path(__file__).resolve().parents[2]
revision=repo/'porting/revisions'/('v1.10.4' if len(sys.argv)<2 else sys.argv[1])
def method(source,start):
 s=source.index(start); a=source.index('{',s); depth=1;b=a+1
 while depth:
  if source[b]=='{':depth+=1
  elif source[b]=='}':depth-=1
  b+=1
 return source[s:b]
with tempfile.TemporaryDirectory() as temp:
 p=Path(temp)
 classes=p/'classes';classes.mkdir()
 javac=['java','com.sun.tools.javac.Main','--release','8','-d',str(classes)]
 src=revision/'java/e/e/a'
 subprocess.run(javac+[str(src/'Dev117.java'),str(src/'PlaylistUrlParser.java'),str(revision/'PlaylistUrlParserTest.java'),str(Path(__file__).with_name('Regression136.java'))],check=True)
 for name in ['PlaylistUrlParserTest','Regression136']:
  subprocess.run(['java','-cp',str(classes),'e.e.a.'+name],check=True)
 # Exercise the actual screen-off decision and gesture execution methods with JVM stand-ins.
 audio=method((src/'Dev119.java').read_text(),'public static boolean shouldRetain(')
 execute=method((src/'Dev118.java').read_text(),'private static void execute(')
 harness=r"""
import java.lang.ref.WeakReference;
public class Lifecycle136 {
 static String mapped;
 static int actions, checks;
 static class Activity {}
 static class View { static final int FOCUS_DOWN=130; }
 static class ScrollView {
  boolean attached=true; int y=180;
  boolean isAttachedToWindow(){return attached;}
  void scrollTo(int x,int next){y=next;}
  void smoothScrollTo(int x,int next){y=next;}
  void fullScroll(int direction){y=999;}
 }
 static class State {
  final WeakReference<ScrollView> scroll; final int originalScroll=40;
  State(ScrollView v){scroll=new WeakReference<>(v);}
 }
 static String action(Activity a,String g){return mapped;}
 static Object reflect(Object owner,String name,Class<?>[] signature,Object... values){actions++;return null;}
 static class Log {static void w(String a,String b,Exception e){throw new AssertionError(e);}}
 static void check(boolean yes){if(!yes)throw new AssertionError("check "+checks);checks++;}
 public static void main(String[] args) {
  for(int flags=0;flags<16;flags++) {
   boolean enabled=(flags&1)!=0,interactive=(flags&2)!=0,playing=(flags&4)!=0,finishing=(flags&8)!=0;
   check(shouldRetain(enabled,interactive,playing,finishing)==(flags==5));
  }
  Activity a=new Activity();ScrollView view=new ScrollView();State s=new State(view);
  mapped="";execute(a,s,"UD");check(view.y==180&&actions==0);
  mapped="top";execute(a,s,"UD");check(view.y==0);
  mapped="bottom";execute(a,s,"UD");check(view.y==999);
  mapped="next";execute(a,s,"UD");check(view.y==40&&actions==1);
  view.attached=false;view.y=90;execute(a,s,"UD");check(view.y==90);
  System.out.println("PASS screen-off truth table and gesture execution "+checks+" checks");
 }
"""
 # Reflection target is used only for named app actions. Top/bottom cases avoid external classes.
 execute=execute.replace('android.util.Log.w','Log.w')
 (p/'GestureControls110.java').write_text("package e.e.a; public class GestureControls110 {}")
 (p/'Lifecycle136.java').write_text(harness+audio+'\n'+execute+'\n}')
 subprocess.run(javac+[str(p/'Lifecycle136.java'),str(p/'GestureControls110.java')],check=True)
 subprocess.run(['java','-cp',str(classes),'Lifecycle136'],check=True)
# Guard Activity reachability and theme factory for these new paths.
gesture=(src/'Dev118.java').read_text()
assert 'final WeakReference<ScrollView> scroll;' in gesture and 'WeakReference<View> trace;' in gesture
for name in ['Dev113','Dev114']:
 text=(src/(name+'.java')).read_text()
 assert 'new AlertDialog.Builder(' not in text
 assert 'Dev112.builder(activity)' in text and 'Dev112.show(dialog)' in text
print('PASS lifecycle ownership and shared dialog factory source checks')
