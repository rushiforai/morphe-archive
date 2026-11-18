"""Verify Mobile Home uses the same configured-row contract as the TV repair."""
from pathlib import Path
import subprocess
import tempfile
import unittest
ROOT=Path(__file__).resolve().parents[1]
SOURCE=ROOT/'extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar'
class WuplayMobileHomeSnapshotTests(unittest.TestCase):
    def test_configured_rows_precede_legacy_flags_and_keep_native_access(self):
        files = {
            'android/content/Context.java': 'package android.content; public class Context { public Context getApplicationContext(){return this;} }',
            'android/util/Log.java': 'package android.util; public class Log { public static int w(String t,String m){return 0;} }',
            'kotlin/Unit.java': 'package kotlin; public class Unit { public static final Unit INSTANCE=new Unit(); }',
            'kotlin/coroutines/CoroutineContext.java': 'package kotlin.coroutines; public interface CoroutineContext {}',
            'kotlin/coroutines/Continuation.java': '''package kotlin.coroutines; public interface Continuation<T> {
CoroutineContext getContext(); void resumeWith(Object result); }''',
            'kotlin/coroutines/intrinsics/CoroutineSingletons.java': 'package kotlin.coroutines.intrinsics; public enum CoroutineSingletons {COROUTINE_SUSPENDED}',
            'kotlin/coroutines/jvm/internal/ContinuationImpl.java': '''package kotlin.coroutines.jvm.internal;
import kotlin.coroutines.*; public abstract class ContinuationImpl implements Continuation<Object> {
final Continuation<Object> completion; final CoroutineContext context;
public ContinuationImpl(Continuation<Object> c,CoroutineContext x){completion=c;context=x;}
public CoroutineContext getContext(){return context;}public void resumeWith(Object value){completion.resumeWith(invokeSuspend(value));}
protected abstract Object invokeSuspend(Object value); }''',
            'kotlinx/coroutines/JobKt.java': '''package kotlinx.coroutines;
public class JobKt {public static Job SupervisorJob$default(){return new Job();}
public static class Job implements kotlin.coroutines.CoroutineContext {public void cancel(java.util.concurrent.CancellationException e){}} }''',
            'kotlinx/coroutines/flow/Flow.java': 'package kotlinx.coroutines.flow; public interface Flow {Object value();}',
            'kotlinx/coroutines/flow/FlowKt.java': '''package kotlinx.coroutines.flow;
public class FlowKt {public static Object first(Flow flow,kotlin.coroutines.Continuation continuation){return flow.value();}}''',
            'nl/johninnl/wuplaycar/SnapshotProbe.java': '''package nl.johninnl.wuplaycar;
import java.util.*;import kotlinx.coroutines.flow.Flow;import kotlin.coroutines.jvm.internal.ContinuationImpl;
public class SnapshotProbe {
public static class Profile {public String id="active",name="Active",profileKey="key";public boolean hasPinSet=false;}
public static class Definition {public int id,homeOrder;public String name,source,sourceId;public boolean showHome;
Definition(int id,String name,String source,boolean home,int order){this.id=id;this.name=name;this.source=source;showHome=home;homeOrder=order;}}
public static class Screen {public String systemKey;public List<Integer> rowCatalogIds;
Screen(String key,List<Integer> ids){systemKey=key;rowCatalogIds=ids;}}
public static class Repository {public List<Definition> values=new ArrayList<>();public Flow definitions=()->values;
public List<Screen> screenValues=new ArrayList<>();public Flow screens=()->screenValues;
public Object awaitSchemaReady(ContinuationImpl continuation){return new Object();}}
public static class Settings {public Profile current=new Profile();public Flow activeProfile=()->current;public Flow activeProfileId=()->current.id;}
public static class Container {public Repository catalogRepository=new Repository();public Settings userSettingsRepository=new Settings();public Object addonRepository=new Object(),metaRepository=new Object();}
public static class App extends android.content.Context {public Container container=new Container();public Container getContainer(){return container;}}
public static boolean isHome(NativeData api,int id)throws Exception {for(NativeData.Catalog row:api.catalogs())if(Integer.valueOf(id).equals(NativeCalls.field(row.value,"id")))return true;return false;}
public static void main(String[] args)throws Exception {
App app=new App();Definition hidden=new Definition(1,"Discover only","preset",false,0);
Definition later=new Definition(2,"Home later","preset",true,2),earlier=new Definition(3,"Home first","addon",true,1);
app.container.catalogRepository.values.addAll(List.of(hidden,later,earlier,new Definition(4,"Navigation","hub",true,0)));
NativeData api=new NativeData(app);List<NativeData.Catalog> snapshot=api.catalogs();
if(snapshot.size()!=2||!snapshot.get(0).title.equals("Home first")||!snapshot.get(1).title.equals("Home later"))throw new AssertionError("Snapshot admitted non-Home catalogs or lost Home order");
int key=(Integer)NativeCalls.field(snapshot.get(0).value,"id");if(!isHome(api,key))throw new AssertionError("Selected Home catalog missing");
earlier.showHome=false;if(isHome(api,key))throw new AssertionError("Visibility changed during fetch but stale catalog remained eligible");
if(api.catalogs().size()!=1)throw new AssertionError("Removed Home catalog stayed selectable");
Repository repo=app.container.catalogRepository;
repo.screenValues.add(new Screen("library",List.of(2)));
Screen home=new Screen("home",new ArrayList<>(List.of(1,3,999,4,1)));repo.screenValues.add(home);
snapshot=api.catalogs();
if(snapshot.size()!=2||!snapshot.get(0).title.equals("Discover only")||!snapshot.get(1).title.equals("Home first"))throw new AssertionError("Explicit Home rows must override false flags, preserve order, skip missing/navigation rows and avoid duplicates");
if(!isHome(api,key))throw new AssertionError("False legacy flag overrode Home screen membership");
NativeData.Catalog retained=snapshot.get(1);home.rowCatalogIds=List.of(1);try{api.items(retained,0);throw new AssertionError("Removed catalog still fetched");}catch(java.util.concurrent.CancellationException expected){}if(isHome(api,key))throw new AssertionError("Removed screen row stayed eligible during fetch");
home.rowCatalogIds=List.of();if(!api.catalogs().isEmpty())throw new AssertionError("Explicit empty Home fell back to defaults");
home.rowCatalogIds=null;if(api.catalogs().size()!=1)throw new AssertionError("Unconfigured Home lost legacy fallback");
repo.screenValues.clear();if(api.catalogs().size()!=1)throw new AssertionError("Missing Home lost legacy fallback");
repo.values.add(new Definition(5,"Watchlist","watchlist",false,0));repo.values.add(new Definition(6,"All Movies","library",false,0));
home.rowCatalogIds=List.of(6,5);repo.screenValues.add(home);snapshot=api.catalogs();
if(snapshot.size()!=2||!snapshot.get(0).source.equals("library")||!snapshot.get(1).source.equals("watchlist"))throw new AssertionError("Home content rows were excluded by source");
repo.values.clear();int[] ids={872447,872448,725338,1144042,883359,883360,883361,883362,725339,725340};
String[] names={"Trending Movies","Trending Shows","Trending Today","Trending This Week","Top Rated Movies TMDB","Top Rated Shows TMDB","Popular Movies Trakt","Popular Shows Trakt","Latest on Digital","Latest Shows"};
List<Integer> order=new ArrayList<>();for(int id:ids)order.add(id);home.rowCatalogIds=order;
for(int i=ids.length-1;i>=0;i--)repo.values.add(new Definition(ids[i],names[i],"preset",false,0));
snapshot=api.catalogs();if(snapshot.size()!=10)throw new AssertionError("Expected all ten configured Home rows");
for(int i=0;i<10;i++)if(!snapshot.get(i).title.equals(names[i]))throw new AssertionError("Home order mismatch at "+i);
app.container.userSettingsRepository.current.hasPinSet=true;try{api.catalogs();throw new AssertionError("PIN gate bypassed");}catch(NativeData.PinRequired expected){}
api.close();
} }
''',
        }
        with tempfile.TemporaryDirectory() as directory:
            out=Path(directory)
            for name,text in files.items():
                path=out/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text)
            sources=['NativeData','NativeCalls','ProfileAccess','CatalogWindow','NativeMetadata','CarStreamPolicy','StreamRateProbe']
            command=['javac','-d',str(out),*[str(SOURCE/(name+'.java')) for name in sources],*[str(p) for p in out.rglob('*.java')]]
            compiled=subprocess.run(command,capture_output=True,text=True)
            self.assertEqual(compiled.returncode,0,compiled.stderr)
            result=subprocess.run(['java','-cp',str(out),'nl.johninnl.wuplaycar.SnapshotProbe'],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
