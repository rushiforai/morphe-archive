"""Run the production native snapshot bridge against deterministic repository flows."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/wuplay/src/main/java/nl/johninnl/wuplay'


class WuplayHomeSnapshotTests(unittest.TestCase):
    def test_snapshot_and_post_fetch_check_use_native_home_flag(self):
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
public static class Definition {public int id,homeOrder;public String name,source;public boolean showHome;
Definition(int id,String name,String source,boolean home,int order){this.id=id;this.name=name;this.source=source;showHome=home;homeOrder=order;}}
public static class Repository {public List<Definition> values=new ArrayList<>();public Flow definitions=()->values;
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
