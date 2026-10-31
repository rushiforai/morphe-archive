"""Execute actual entry/model/host Java against real wire fixtures; native calls are simulated."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision27-host';assert not work.exists();work.mkdir()
tree=ast.parse((home/'Verification/check_native_host.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs.pop('app/bdcrusher/ytmusic/lyrics/HostCheck.java')
stubs['android/os/Handler.java']=stubs['android/os/Handler.java'].replace('public void postDelayed','public void post(Runnable r){queue.add(r);}public void postDelayed')
stubs['app/morphe/extension/music/shared/VideoInformation.java']=stubs['app/morphe/extension/music/shared/VideoInformation.java'].replace('gF2KuOJLEQE','MYal8NoVQXs')
stubs['app/morphe/extension/music/patches/lyrics/LyricsManager.java']='''package app.morphe.extension.music.patches.lyrics;public class LyricsManager{static LyricsManager i=new LyricsManager();public static String committed="MYal8NoVQXs";public static LyricsManager getInstance(){return i;}public app.morphe.extension.music.patches.lyrics.model.TrackInfo getCurrentTrack(){return new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Synthetic","Artist","",0);}public String getCommittedVideoId(){return committed;}}'''
stubs['app/bdcrusher/ytmusic/lyrics/ReplayCheck.java']=r'''
package app.bdcrusher.ytmusic.lyrics;
import java.nio.file.*;import java.util.*;import java.nio.charset.StandardCharsets;
import android.app.Activity;import android.os.Handler;import android.widget.FrameLayout;
import app.morphe.extension.music.shared.VideoInformation;import app.morphe.extension.music.patches.lyrics.LyricsManager;import app.morphe.extension.music.settings.Settings;
public class ReplayCheck {
 static int count,refreshes;static byte[] rendered;
 static IdentityHashMap<Object,Map<String,byte[]>> definitions=new IdentityHashMap<>();
 static class Panel {String id;android.view.View root;Panel(String id,android.view.View root){this.id=id;this.root=root;}}
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);count++;System.out.println("PASS: "+why);}
 static byte[] getDefinition(Object owner,String id){return definitions.getOrDefault(owner,Map.of()).get(id);}
 static void register(Object owner,byte[] bytes){definitions.computeIfAbsent(owner,k->new HashMap<>()).put(NativeLyricsHost.ID,bytes);}
 static void replay(Object owner){refreshes++;Object model=LyricsEntryButton.originalModel(owner);LyricsEntryButton.captureModel(owner,model,(byte[])model);rendered=LyricsEntryButton.rewrite(owner,(byte[])model);}
 static byte[] recording(byte[] original,String before,String after){byte[] copy=original.clone(),a=before.getBytes(StandardCharsets.US_ASCII),b=after.getBytes(StandardCharsets.US_ASCII);for(int i=0;i<=copy.length-a.length;i++){boolean match=true;for(int j=0;j<a.length;j++)if(copy[i+j]!=a[j])match=false;if(match)System.arraycopy(b,0,copy,i,b.length);}return copy;}
 static byte[] at(byte[] bytes,int...path){for(int f:path)bytes=new ProtoWire(bytes).child(f);return bytes;}
 static boolean enabled(byte[] bytes){
  List<byte[]> rows=new ArrayList<>();find(bytes,rows,0);
  if(rows.size()!=1)return false;ProtoWire row=new ProtoWire(rows.get(0));List<ProtoWire.Field> buttons=new ArrayList<>();for(var f:row.fields)if(f.number==4)buttons.add(f);
  if(buttons.size()<2)return false;
  try{ProtoWire vm=new ProtoWire(at(buttons.get(1).data,10,461054335));return NativeActionModel.contains(vm.child(2),"_quote_")&&vm.one(14)==null&&vm.one(4)!=null;}catch(IllegalArgumentException bad){return false;}
 }
 static void find(byte[] bytes,List<byte[]> rows,int depth){if(depth>18)return;ProtoWire p;try{p=new ProtoWire(bytes);}catch(Exception bad){return;}boolean quote=false,like=false;for(var f:p.fields)if(f.number==4&&f.wire==2){like|=NativeActionModel.contains(f.data,"_thumb_up_");try{quote|=NativeActionModel.contains(at(f.data,10,461054335,2),"_quote_");}catch(Exception ignored){}}
  if(quote&&like){rows.add(bytes);return;}for(var f:p.fields)if(f.wire==2)find(f.data,rows,depth+1);
 }
 public static void main(String[] args)throws Exception {
  byte[] original=Files.readAllBytes(Path.of(args[0])),related=Files.readAllBytes(Path.of(args[1]));
  check("MYal8NoVQXs".equals(NativeActionModel.recording(original)),"real LikeEndpoint recording is decoded from actual wire fixture");
  byte[] patched=NativeActionModel.enable(original);check(enabled(patched),"real server native row enables Lyrics in second position");
  byte[] row=at(original,172660663,1,168777401,5,389155117);
  byte[] client=ProtoWire.message(ProtoWire.blob(9,ProtoWire.message(ProtoWire.blob(75,row))));
  check(enabled(NativeActionModel.enable(client)),"client-generated envelope without template URI still uses native Lyrics VM");
  check(Arrays.equals(client,ProtoWire.message(ProtoWire.blob(9,ProtoWire.message(ProtoWire.blob(75,row))))),"input client model remains immutable");
  byte[] duplicated=ProtoWire.message(ProtoWire.blob(9,row),ProtoWire.blob(75,row));check(NativeActionModel.enable(duplicated)==duplicated,"ambiguous native rows fail closed");
  byte[] unrelated=ProtoWire.message(ProtoWire.blob(7,"not an action bar".getBytes()));check(NativeActionModel.enable(unrelated)==unrelated,"unrelated native model is unchanged");
  Activity activity=new Activity();Object owner=new Object();String id=VideoInformation.id;
  LyricsEntryButton entry=new LyricsEntryButton();LyricsEntryButton.capturePresenter(owner);LyricsEntryButton.captureIdentity(owner,id);Handler.drain();
  LyricsEntryButton.captureModel(owner,client,client);check(LyricsEntryButton.rewrite(owner,client)==client,"before provider result native disabled model is preserved");
  entry.update(activity,id);check(refreshes==1&&enabled(rendered),"late lyrics replay client native model with NO response object or panel definition");
  check(LyricsEntryButton.originalModel(owner)==client,"replay never replaces remembered original with modified model");
  entry.update(activity,id);check(refreshes==1,"steady availability does not replay the row repeatedly");
  Object unrelatedPresenter=new Object();LyricsEntryButton.capturePresenter(unrelatedPresenter);LyricsEntryButton.captureIdentity(unrelatedPresenter,"other-video");Handler.drain();entry.update(activity,id);
  check(refreshes==1,"a later unrelated presenter does not replace current presenter");
  entry.hideButton();check(refreshes==2&&rendered==client,"turning availability off restores original native model");
  entry.update(activity,id);check(enabled(rendered)&&refreshes==3,"availability can enable again without refetching native response");
  VideoInformation.id="sN_tJ8d3c0I";entry.trackChanged("sN_tJ8d3c0I");check(refreshes==3,"metadata switching tracks never replays the previous track to restore its button");VideoInformation.id=id;entry.trackChanged(id);entry.update(activity,id);
  Settings.LYRICS_ENABLED.value=false;entry.hideButton();check(rendered==client&&refreshes==4,"disabling lyrics restores native model before clearing identity");Settings.LYRICS_ENABLED.value=true;
  String next="gF2KuOJLEQE";VideoInformation.id=next;LyricsManager.committed=next;entry.trackChanged(next);LyricsEntryButton.captureIdentity(owner,next);Handler.drain();entry.update(activity,next);
  check(refreshes==4&&LyricsEntryButton.originalModel(owner)==null,"track switch cannot replay previous track's action model");
  LyricsEntryButton.captureModel(owner,original,original);check(LyricsEntryButton.originalModel(owner)==null&&LyricsEntryButton.rewrite(owner,original)==original,"late previous-recording native row cannot become the current row");
  byte[] nextModel=recording(original,"MYal8NoVQXs",next);LyricsEntryButton.captureModel(owner,nextModel,nextModel);check(enabled(LyricsEntryButton.rewrite(owner,nextModel)),"lyrics arriving before the new model enable it on first native render");
  LyricsManager.committed="stale";check(LyricsEntryButton.rewrite(owner,nextModel)==nextModel,"stale metadata keeps model unchanged");LyricsManager.committed=next;
  LyricsEntryButton.captureModel(owner,new Object(),new byte[2_000_001]);check(LyricsEntryButton.originalModel(owner)==nextModel&&LyricsEntryButton.rewrite(owner,nextModel)==nextModel,"oversized native model cannot replace cache or enable the action");
  Object controller=new Object(),nonMusic=new Object();NativeLyricsHost.captureController(controller);NativeLyricsHost.captureController(nonMusic);
  definitions.put(controller,new HashMap<>(Map.of("music-related-panel",related)));
  check(NativeLyricsHost.prepare(next)&&getDefinition(controller,NativeLyricsHost.ID)!=null,"a later non-Music controller cannot block registering the real Music panel");
  ProtoWire real=new ProtoWire(getDefinition(controller,NativeLyricsHost.ID));real.put(ProtoWire.blob(3,ProtoWire.message(ProtoWire.blob(7,"synthetic old content".getBytes()))));real.put(ProtoWire.number(17,777));
  definitions.get(controller).put(NativeLyricsHost.ID,real.bytes());check(NativeLyricsHost.prepare("native-template"),"real native Lyrics definition can supply session presentation");
  Object warm=new Object();NativeLyricsHost.captureController(warm);ProtoWire liveRelated=new ProtoWire(related);liveRelated.put(ProtoWire.blob(41,"current-native-palette".getBytes()));definitions.put(warm,new HashMap<>(Map.of("music-related-panel",liveRelated.bytes())));NativeLyricsHost.prepare("warm-fallback");
  ProtoWire warmPanel=new ProtoWire(getDefinition(warm,NativeLyricsHost.ID));check(warmPanel.one(17).value==777&&warmPanel.one(3)==null,"warm fallback preserves real Lyrics presentation without previous lyric content");
  check(Arrays.equals(warmPanel.one(41).data,"current-native-palette".getBytes()),"warm fallback binds the CURRENT native palette, not cached song color");
  Object emptyNative=new Object();NativeLyricsHost.captureController(emptyNative);ProtoWire emptyDefinition=new ProtoWire(NativePanelWire.presentation(real.bytes()));emptyDefinition.put(ProtoWire.number(17,888));definitions.put(emptyNative,new HashMap<>(Map.of(NativeLyricsHost.ID,emptyDefinition.bytes(),"music-related-panel",related)));NativeLyricsHost.prepare("pending-native-content");check(new ProtoWire(getDefinition(emptyNative,NativeLyricsHost.ID)).one(17).value==888,"first native Lyrics definition is preserved even before its content loads");
  FrameLayout body=new FrameLayout(activity);NativeLyricsHost.onNativePanelChanged(controller,new Panel(NativeLyricsHost.ID,body));Handler.drain();
  check(NativeLyricsHost.isOpen()&&body.getChildCount()==1,"actual host still attaches renderer only to native Lyrics body");
  for(int n=0;n<100;n++)NativeLyricsHost.onNativeLayout();check(Handler.queue.size()==1,"one hundred native layout notifications coalesce to one pending attachment");Handler.drain();
  NativeLyricsHost.onNativePanelChanged(nonMusic,null);Handler.drain();check(NativeLyricsHost.isOpen(),"unrelated controller closing does not close active Lyrics ownership");
  NativeLyricsHost.onNativePanelChanged(controller,null);Handler.drain();check(!NativeLyricsHost.isOpen(),"real Lyrics controller close releases ownership");
  entry.hideButton();VideoInformation.id=next;LyricsManager.committed=next;entry.trackChanged(next);LyricsEntryButton.captureIdentity(owner,next);Handler.drain();LyricsEntryButton.captureModel(owner,nextModel,nextModel);
  int beforePending=refreshes;entry.orderWhilePending(next);byte[] pending=rendered;
  check(!enabled(pending)&&pending!=nextModel,"pending lookup moves native Lyrics second without enabling its command");
  List<byte[]> pendingRows=new ArrayList<>();find(pending,pendingRows,0);ProtoWire pendingRow=new ProtoWire(pendingRows.get(0));List<ProtoWire.Field> pendingButtons=new ArrayList<>();for(var f:pendingRow.fields)if(f.number==4)pendingButtons.add(f);
  check(NativeActionModel.contains(at(pendingButtons.get(1).data,10,461054335,2),"_quote_"),"pending native row has Lyrics immediately after native voting controls");
  entry.orderWhilePending(next);check(refreshes==beforePending+1,"repeated pending notification causes no render loop");
  entry.update(activity,next);check(enabled(rendered)&&refreshes==beforePending+2,"positive lookup promotes pending native model to enabled");
  entry.hideButton();check(rendered==nextModel,"definite empty or disabled lookup restores original model");
  Files.writeString(Path.of(args[2]),"{\"passed\":true,\"checks\":"+count+",\"nativeProxiesSimulated\":true,\"phoneVerified\":false}");
 }
}
'''
src=home/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics'
actual=[src/n for n in ('NativeActionModel.java','ProtoWire.java','NativePanelWire.java','NativeLyricsHost.java','LyricsEntryButton.java')]
files=[]
for name,content in stubs.items():
    p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
for p in actual:
    s=p.read_text(encoding='utf-8')
    if p.name=='NativeLyricsHost.java':
        s=s.replace('private static byte[] nativeDefinition(Object owner,String id){return null;}','private static byte[] nativeDefinition(Object owner,String id){return ReplayCheck.getDefinition(owner,id);}')
        s=s.replace('private static void registerNative(Object owner,byte[] definition){}','private static void registerNative(Object owner,byte[] definition){ReplayCheck.register(owner,definition);}')
        s=s.replace('private static View panelRoot(Object value){return null;}','private static View panelRoot(Object value){return ((ReplayCheck.Panel)value).root;}')
        s=s.replace('private static String panelId(Object value){return null;}','private static String panelId(Object value){return ((ReplayCheck.Panel)value).id;}')
    if p.name=='LyricsEntryButton.java':s=s.replace('private static void refreshNative(Object owner){}','private static void refreshNative(Object owner){ReplayCheck.replay(owner);}')
    out=work/p.name;out.write_text(s,encoding='utf-8');files.append(out)
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');classes=work/'classes';classes.mkdir()
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(classes),*map(str,files)],env=env,cwd=work,check=True)
report=work/'verification.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(classes),'app.bdcrusher.ytmusic.lyrics.ReplayCheck',str(home/'Inputs/native-video-actionbar-element.pb'),str(home/'Inputs/native-music-related-panel.pb'),str(report)],cwd=work,env=env,check=True)
data=json.loads(report.read_text(encoding='utf-8'));data['actualSourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
