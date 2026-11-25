"""Run the production native snapshot bridge against deterministic repository flows."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/wuplay/src/main/java/nl/johninnl/wuplay'


class WuplayHomeSnapshotTests(unittest.TestCase):
    def test_screen_rows_override_legacy_flags_and_preserve_order(self):
        files = {
            'android/app/Application.java': 'package android.app; public class Application {}',
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
            'nl/johninnl/wuplay/SnapshotProbe.java': '''package nl.johninnl.wuplay;
import java.util.*;import kotlinx.coroutines.flow.Flow;import kotlin.coroutines.jvm.internal.ContinuationImpl;
public class SnapshotProbe {
public static class Profile {public String id="default",name="Default";}
public static class Definition {public int id,homeOrder;public String name,source,sourceId;public boolean showHome;
Definition(int id,String name,String source,boolean home,int order){this.id=id;this.name=name;this.source=source;showHome=home;homeOrder=order;}}
public static class Screen {public String systemKey;public List<Integer> rowCatalogIds;
Screen(String key,List<Integer> ids){systemKey=key;rowCatalogIds=ids;}}
public static class Repository {public List<Definition> values=new ArrayList<>();public Flow definitions=()->values;
public List<Screen> screenValues=new ArrayList<>();public Flow screens=()->screenValues;
public Object awaitSchemaReady(ContinuationImpl continuation){return new Object();}}
public static class Settings {public Flow profiles=()->List.of(new Profile());public Flow activeProfileId=()->"default";}
public static class Container {public Repository catalogRepository=new Repository();public Settings userSettingsRepository=new Settings();}
public static class App extends android.app.Application {public Container container=new Container();public Container getContainer(){return container;}}
public static void main(String[] args)throws Exception {
App app=new App();Definition hidden=new Definition(1,"Discover only","preset",false,0);
Definition later=new Definition(2,"Home later","preset",true,2),earlier=new Definition(3,"Home first","addon",true,1);
app.container.catalogRepository.values.addAll(List.of(hidden,later,earlier,new Definition(4,"Navigation","hub",true,0)));
NativeCatalogs api=new NativeCatalogs(app);NativeCatalogs.Snapshot snapshot=api.snapshot();
if(snapshot.definitions.size()!=2||!snapshot.definitions.get(0).name.equals("Home first")||!snapshot.definitions.get(1).name.equals("Home later"))throw new AssertionError("Snapshot admitted non-Home catalogs or lost Home order");
String key=snapshot.definitions.get(0).key;if(!api.isHome("default",key))throw new AssertionError("Selected Home catalog missing");
earlier.showHome=false;if(api.isHome("default",key))throw new AssertionError("Visibility changed during fetch but stale catalog remained eligible");
if(api.snapshot().definitions.size()!=1)throw new AssertionError("Removed Home catalog stayed selectable");
Repository repo=app.container.catalogRepository;
repo.screenValues.add(new Screen("library",List.of(2)));
Screen home=new Screen("home",new ArrayList<>(List.of(1,3,999,4,1)));repo.screenValues.add(home);
snapshot=api.snapshot();
if(snapshot.definitions.size()!=2||!snapshot.definitions.get(0).name.equals("Discover only")||!snapshot.definitions.get(1).name.equals("Home first"))throw new AssertionError("Explicit Home rows must override false flags, preserve order, skip missing/navigation rows and avoid duplicates");
if(!api.isHome("default",key))throw new AssertionError("False legacy flag overrode Home screen membership");
home.rowCatalogIds=List.of(1);if(api.isHome("default",key))throw new AssertionError("Removed screen row stayed eligible during fetch");
home.rowCatalogIds=List.of();if(!api.snapshot().definitions.isEmpty())throw new AssertionError("Explicit empty Home fell back to defaults");
home.rowCatalogIds=null;if(api.snapshot().definitions.size()!=1)throw new AssertionError("Unconfigured Home lost legacy fallback");
repo.screenValues.clear();if(api.snapshot().definitions.size()!=1)throw new AssertionError("Missing Home lost legacy fallback");
repo.values.add(new Definition(5,"Watchlist","watchlist",false,0));repo.values.add(new Definition(6,"All Movies","library",false,0));
home.rowCatalogIds=List.of(6,5);repo.screenValues.add(home);snapshot=api.snapshot();
if(snapshot.definitions.size()!=2||!snapshot.definitions.get(0).source.equals("library")||!snapshot.definitions.get(1).source.equals("watchlist"))throw new AssertionError("Home content rows were excluded by source");
repo.values.clear();int[] ids={872447,872448,725338,1144042,883359,883360,883361,883362,725339,725340};
String[] names={"Trending Movies","Trending Shows","Trending Today","Trending This Week","Top Rated Movies TMDB","Top Rated Shows TMDB","Popular Movies Trakt","Popular Shows Trakt","Latest on Digital","Latest Shows"};
List<Integer> order=new ArrayList<>();for(int id:ids)order.add(id);home.rowCatalogIds=order;
for(int i=ids.length-1;i>=0;i--)repo.values.add(new Definition(ids[i],names[i],"preset",false,0));
snapshot=api.snapshot();if(snapshot.definitions.size()!=10)throw new AssertionError("Expected all ten configured Home rows");
for(int i=0;i<10;i++)if(!snapshot.definitions.get(i).name.equals(names[i]))throw new AssertionError("Home order mismatch at "+i);
} }
''',
        }
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)
            for name, text in files.items():
                path = out / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(text)
            command = ['javac', '-d', str(out), str(SOURCE / 'NativeCatalogs.java'), str(SOURCE / 'CatalogPolicy.java')]
            command += [str(p) for p in out.rglob('*.java')]
            compiled = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(compiled.returncode, 0, compiled.stderr)
            result = subprocess.run(['java', '-cp', str(out), 'nl.johninnl.wuplay.SnapshotProbe'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
