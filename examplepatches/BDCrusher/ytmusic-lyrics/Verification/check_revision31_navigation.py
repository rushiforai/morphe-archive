"""Actual transparent-only helper against explicit Android window/inset state boundaries."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];work=h/'Verification/revision31-navigation';assert not work.exists();work.mkdir()
tree=ast.parse((h/'Verification/check_revision27_bars_final.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs['android/view/View.java']=stubs['android/view/View.java'].replace('public static int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=16;', 'public static int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR=16;public static final Object commonToken=new Object();public Object token=commonToken;public Object getWindowToken(){return token;}')
stubs['app/bdcrusher/ytmusic/lyrics/BarsCheck.java']=r'''package app.bdcrusher.ytmusic.lyrics;
import android.view.*;import android.app.Activity;import android.graphics.*;import app.morphe.extension.shared.Utils;
public class BarsCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 public static void main(String[] args)throws Exception{
  View view=new View(),body=new View();view.parent=body;
  for(int sdk:new int[]{26,28,29,30,36}){
   android.os.Build.VERSION.SDK_INT=sdk;Utils.activity=new Activity();Window w=Utils.activity.window;int original=w.color,divider=w.divider,flags=w.decor.flags,appearance=w.controller.appearance;
   LyricsSystemBars.sync(view,true);check(w.color==0&&w.decor.overlay.drawables.isEmpty(),"transparent with no panel background or opaque overlay on API"+sdk);
   check(w.decor.flags==flags&&w.controller.appearance==appearance,"native navigation buttons and appearance remain untouched on API"+sdk);
   check(sdk<28?w.divider==divider:w.divider==0,"divider APIs are correctly gated on API"+sdk);
   check(sdk<29?w.contrast:!w.contrast,"contrast scrim APIs are correctly gated on API"+sdk);
   int writes=w.writes;for(int n=0;n<100;n++)LyricsSystemBars.sync(view,true);check(w.writes==writes,"unchanged transparent state causes no repeated native writes on API"+sdk);
   LyricsSystemBars.release(view);check(w.color==original&&w.divider==divider&&w.contrast,"close restores exact native navigation state on API"+sdk);
  }
  android.os.Build.VERSION.SDK_INT=36;Utils.activity=new Activity();Window w=Utils.activity.window;int original=w.color;
  w.controller.appearance|=16;int light=w.controller.appearance;LyricsSystemBars.sync(view,true);check(w.controller.appearance==light,"light navigation icon mode is inherited");
  w.controller.appearance&=~16;int dark=w.controller.appearance;LyricsSystemBars.release(view);check(w.controller.appearance==dark,"new native icon theme is not overwritten on close");
  LyricsSystemBars.sync(view,true);w.color=0xff335577;w.divider=0xffabcdef;w.contrast=true;LyricsSystemBars.sync(view,true);check(w.color==0&&w.divider==0&&!w.contrast,"native theme changes cannot reintroduce an opaque Lyrics bar");LyricsSystemBars.release(view);check(w.color==0xff335577&&w.divider==0xffabcdef&&w.contrast,"latest native theme is restored on close");
  LyricsSystemBars.sync(view,true);View replacement=new View();replacement.parent=body;LyricsSystemBars.sync(replacement,true);LyricsSystemBars.release(view);check(w.color==0,"old renderer detachment cannot restore over the replacement");LyricsSystemBars.release(replacement);check(w.color==0xff335577,"replacement renderer releases its own window state");
  for(Insets insets:new Insets[]{new Insets(48,0,0),new Insets(0,48,0),new Insets(0,0,24)}){w.decor.insets.nav=insets;LyricsSystemBars.sync(view,true);check(w.color==0,"side and gesture navigation use the same transparent path");LyricsSystemBars.release(view);}
  w.decor.insets.nav=new Insets(0,0,48);LyricsSystemBars.sync(view,true);w.decor.focus=false;LyricsSystemBars.sync(view,true);check(w.color==0xff335577,"loss of window focus restores original native state");w.decor.focus=true;
  LyricsSystemBars.sync(view,true);w.decor.insets.nav=new Insets(0,0,0);LyricsSystemBars.sync(view,true);check(w.color==0xff335577,"hidden system navigation is left under native control");w.decor.insets.nav=new Insets(0,0,48);
  LyricsSystemBars.sync(view,true);Activity old=Utils.activity;Utils.activity=new Activity();Utils.activity.window.decor.token=new Object();int unrelated=Utils.activity.window.color;LyricsSystemBars.sync(view,true);check(Utils.activity.window.color==unrelated&&old.window.color==0xff335577,"a different activity token cannot be recolored by an old lyric renderer");Utils.activity=old;
  LyricsSystemBars.sync(view,true);LyricsSystemBars.sync(view,false);check(w.color==0xff335577,"inactive Lyrics restores native state");
  check(Bitmap.allocations==0&&w.decor.overlay.drawables.isEmpty(),"transparency performs no background sampling or protection painting");
  check(java.util.Arrays.stream(LyricsSystemBars.class.getDeclaredMethods()).filter(m->m.getName().equals("sync")).allMatch(m->m.getParameterCount()==2),"there is no selectable opaque/matching API");
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),"{\"passed\":true,\"checks\":"+checks+",\"androidWindowStateSimulated\":true,\"phoneVerified\":false}");
 }
}'''
files=[]
for name,content in stubs.items():
    p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics/LyricsSystemBars.java';files.append(src)
out=work/'classes';out.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files)],env=env,cwd=work,check=True)
report=work/'verification.json';subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out),'app.bdcrusher.ytmusic.lyrics.BarsCheck',str(report)],env=env,cwd=work,check=True)
root=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics'
assert 'transparentNavigation' not in (root/'BetterLyricsPanelView.java').read_text(encoding='utf-8')
assert 'transparentNavigation' not in (root/'LyricsSettingsPage.java').read_text(encoding='utf-8')
data=json.loads(report.read_text(encoding='utf-8'));data['checks']+=2;data['legacyPreferenceIgnored']=True;data['toggleRemoved']=True;data['actualSourceSha256']={n:hashlib.sha256((root/n).read_bytes()).hexdigest() for n in ('LyricsSystemBars.java','BetterLyricsPanelView.java','LyricsSettingsPage.java')};report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
