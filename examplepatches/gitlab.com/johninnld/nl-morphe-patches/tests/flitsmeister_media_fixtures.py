"""Declarative ART fixtures for Flitsmeister's functional broadcast callbacks.

The runner replaces each Java callback skeleton with the actual production or
emitted smali body. Receiver helpers/private lambdas below preserve the shipped
code; only Android/executor, volume-state and tracker dependencies are synthetic.
The requirements sticky-broadcast helper is an explicit framework boundary stub.
These cases establish delegation, deferral and error behavior, not real Android
broadcast delivery, Looper concurrency, AudioManager behavior or car acceptance.
"""


CALLBACKS = {
    'media-network': {
        'constant': 'mediaNetworkCallbackCode',
        'owner': 'androidx/media3/common/util/NetworkTypeObserver$Receiver',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public this$0:Landroidx/media3/common/util/NetworkTypeObserver;',
        'helpers': '''
.method public static synthetic a(Landroidx/media3/common/util/NetworkTypeObserver$Receiver;Landroid/content/Context;)V
 .locals 0
 invoke-direct {p0, p1}, Landroidx/media3/common/util/NetworkTypeObserver$Receiver;->lambda$onReceive$0(Landroid/content/Context;)V
 return-void
.end method
.method public static synthetic execute$001(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
 .locals 1
 invoke-interface/range {p0 .. p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
 return-void
.end method
.method private synthetic lambda$onReceive$0(Landroid/content/Context;)V
 .locals 0
 iget-object p0, p0, Landroidx/media3/common/util/NetworkTypeObserver$Receiver;->this$0:Landroidx/media3/common/util/NetworkTypeObserver;
 invoke-static {p0, p1}, Landroidx/media3/common/util/NetworkTypeObserver;->access$200(Landroidx/media3/common/util/NetworkTypeObserver;Landroid/content/Context;)V
 return-void
.end method
''',
    },
    'media-volume': {
        'constant': 'mediaVolumeCallbackCode',
        'owner': 'androidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public this$0:Landroidx/media3/exoplayer/StreamVolumeManager;',
        'helpers': '''
.method public static synthetic a(Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;)V
 .locals 0
 invoke-direct {p0}, Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;->lambda$onReceive$0()V
 return-void
.end method
.method private synthetic lambda$onReceive$0()V
 .locals 2
 iget-object v0, p0, Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;->this$0:Landroidx/media3/exoplayer/StreamVolumeManager;
 invoke-static {v0}, Landroidx/media3/exoplayer/StreamVolumeManager;->access$100(Landroidx/media3/exoplayer/StreamVolumeManager;)Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;
 move-result-object v0
 if-nez v0, :active
 return-void
 :active
 iget-object v0, p0, Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;->this$0:Landroidx/media3/exoplayer/StreamVolumeManager;
 invoke-static {v0}, Landroidx/media3/exoplayer/StreamVolumeManager;->access$000(Landroidx/media3/exoplayer/StreamVolumeManager;)Landroidx/media3/common/util/BackgroundThreadStateHandler;
 move-result-object v0
 invoke-virtual {v0}, Landroidx/media3/common/util/BackgroundThreadStateHandler;->get()Ljava/lang/Object;
 move-result-object v0
 check-cast v0, Landroidx/media3/exoplayer/StreamVolumeManager$StreamVolumeState;
 iget v0, v0, Landroidx/media3/exoplayer/StreamVolumeManager$StreamVolumeState;->streamType:I
 iget-object v1, p0, Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;->this$0:Landroidx/media3/exoplayer/StreamVolumeManager;
 invoke-static {v1}, Landroidx/media3/exoplayer/StreamVolumeManager;->access$000(Landroidx/media3/exoplayer/StreamVolumeManager;)Landroidx/media3/common/util/BackgroundThreadStateHandler;
 move-result-object v1
 iget-object p0, p0, Landroidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver;->this$0:Landroidx/media3/exoplayer/StreamVolumeManager;
 invoke-static {p0, v0}, Landroidx/media3/exoplayer/StreamVolumeManager;->access$200(Landroidx/media3/exoplayer/StreamVolumeManager;I)Landroidx/media3/exoplayer/StreamVolumeManager$StreamVolumeState;
 move-result-object p0
 invoke-virtual {v1, p0}, Landroidx/media3/common/util/BackgroundThreadStateHandler;->setStateInBackground(Ljava/lang/Object;)V
 return-void
.end method
.method public static synthetic runInBackground$001(Landroidx/media3/common/util/BackgroundThreadStateHandler;Ljava/lang/Runnable;)V
 .locals 1
 invoke-virtual/range {p0 .. p1}, Landroidx/media3/common/util/BackgroundThreadStateHandler;->runInBackground(Ljava/lang/Runnable;)V
 return-void
.end method
''',
    },
    'media-requirements': {
        'constant': 'mediaRequirementsCallbackCode',
        'owner': 'androidx/media3/exoplayer/scheduler/RequirementsWatcher$DeviceStatusChangeReceiver',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '''.field public this$0:Landroidx/media3/exoplayer/scheduler/RequirementsWatcher;
.field public initialSticky:Z''',
        # Framework boundary: stand in for BroadcastReceiver's final sticky API.
        'helpers': '''
.method public static synthetic isInitialStickyBroadcast$001(Landroid/content/BroadcastReceiver;)Z
 .locals 1
 check-cast p0, Landroidx/media3/exoplayer/scheduler/RequirementsWatcher$DeviceStatusChangeReceiver;
 iget-boolean v0, p0, Landroidx/media3/exoplayer/scheduler/RequirementsWatcher$DeviceStatusChangeReceiver;->initialSticky:Z
 return v0
.end method
''',
    },
    'work-tracker': {
        'constant': 'workTrackerCallbackCode',
        'owner': 'androidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker$broadcastReceiver$1',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public this$0:Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker;',
        'helpers': '''
.method public static synthetic getClass$001(Ljava/lang/Object;)Ljava/lang/Class;
 .locals 1
 invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
 move-result-object v0
 return-object v0
.end method
.method public static synthetic getClass$002(Ljava/lang/Object;)Ljava/lang/Class;
 .locals 1
 invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
 move-result-object v0
 return-object v0
.end method
.method public static synthetic onBroadcastReceive$003(Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker;Landroid/content/Intent;)V
 .locals 1
 invoke-virtual/range {p0 .. p1}, Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker;->onBroadcastReceive(Landroid/content/Intent;)V
 return-void
.end method
''',
    },
}


JAVA = {
    'fixtures/DeferredExecutor.java': '''package fixtures;
public final class DeferredExecutor implements java.util.concurrent.Executor {
 public final java.util.ArrayDeque<Runnable> tasks = new java.util.ArrayDeque<>();
 public int executions;
 public void execute(Runnable task) { tasks.addLast(task); }
 public int pending() { return tasks.size(); }
 public void drain() {
  while (!tasks.isEmpty()) { Runnable task=tasks.removeFirst(); executions++; task.run(); }
 }
}''',
    'androidx/media3/common/util/NetworkTypeObserver.java': '''package androidx.media3.common.util;
public class NetworkTypeObserver {
 public final fixtures.DeferredExecutor backgroundExecutor=new fixtures.DeferredExecutor();
 public final java.util.ArrayList<android.content.Context> contexts=new java.util.ArrayList<>();
 public RuntimeException failure;
 public static java.util.concurrent.Executor access$100(NetworkTypeObserver owner) {
  return owner.backgroundExecutor;
 }
 public static void access$200(NetworkTypeObserver owner,android.content.Context context) {
  if(owner.failure!=null)throw owner.failure;
  owner.contexts.add(context);
 }
}''',
    'androidx/media3/common/util/NetworkTypeObserver$Receiver.java': '''package androidx.media3.common.util;
public class NetworkTypeObserver$Receiver extends android.content.BroadcastReceiver {
 public NetworkTypeObserver this$0;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
 public static void a(NetworkTypeObserver$Receiver receiver,android.content.Context context) {}
}''',
    'androidx/media3/common/util/b.java': '''package androidx.media3.common.util;
public final class b implements Runnable {
 public final NetworkTypeObserver$Receiver a;
 public final android.content.Context b;
 public b(NetworkTypeObserver$Receiver receiver,android.content.Context context) { a=receiver;b=context; }
 public void run() { NetworkTypeObserver$Receiver.a(a,b); }
}''',
    'androidx/media3/common/util/BackgroundThreadStateHandler.java': '''package androidx.media3.common.util;
public class BackgroundThreadStateHandler {
 public final fixtures.DeferredExecutor executor=new fixtures.DeferredExecutor();
 public Object state;
 public int writes;
 public Object get() { return state; }
 public void setStateInBackground(Object value) { state=value;writes++; }
 public void runInBackground(Runnable task) { executor.execute(task); }
}''',
    'androidx/media3/exoplayer/StreamVolumeManager.java': '''package androidx.media3.exoplayer;
public class StreamVolumeManager {
 public StreamVolumeManager$VolumeChangeReceiver receiver;
 public final androidx.media3.common.util.BackgroundThreadStateHandler stateHandler=
  new androidx.media3.common.util.BackgroundThreadStateHandler();
 public int generations,lastStreamType,nextVolume;
 public boolean nextMuted;
 public RuntimeException failure;
 public static class StreamVolumeState {
  public final int streamType,volume;
  public final boolean muted;
  public StreamVolumeState(int streamType,int volume,boolean muted) {
   this.streamType=streamType;this.volume=volume;this.muted=muted;
  }
 }
 public static androidx.media3.common.util.BackgroundThreadStateHandler access$000(StreamVolumeManager owner) {
  return owner.stateHandler;
 }
 public static StreamVolumeManager$VolumeChangeReceiver access$100(StreamVolumeManager owner) {
  return owner.receiver;
 }
 public static StreamVolumeState access$200(StreamVolumeManager owner,int streamType) {
  owner.generations++;owner.lastStreamType=streamType;
  if(owner.failure!=null)throw owner.failure;
  return new StreamVolumeState(streamType,owner.nextVolume,owner.nextMuted);
 }
}''',
    'androidx/media3/exoplayer/StreamVolumeManager$VolumeChangeReceiver.java': '''package androidx.media3.exoplayer;
public class StreamVolumeManager$VolumeChangeReceiver extends android.content.BroadcastReceiver {
 public StreamVolumeManager this$0;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
 public static void a(StreamVolumeManager$VolumeChangeReceiver receiver) {}
}''',
    'androidx/media3/exoplayer/l2.java': '''package androidx.media3.exoplayer;
public final class l2 implements Runnable {
 public final StreamVolumeManager$VolumeChangeReceiver a;
 public l2(StreamVolumeManager$VolumeChangeReceiver receiver) { a=receiver; }
 public void run() { StreamVolumeManager$VolumeChangeReceiver.a(a); }
}''',
    'androidx/media3/exoplayer/scheduler/RequirementsWatcher.java': '''package androidx.media3.exoplayer.scheduler;
public class RequirementsWatcher {
 public int checks;
 public RuntimeException failure;
 public static void access$200(RequirementsWatcher owner) {
  if(owner.failure!=null)throw owner.failure;
  owner.checks++;
 }
}''',
    'androidx/media3/exoplayer/scheduler/RequirementsWatcher$DeviceStatusChangeReceiver.java': '''package androidx.media3.exoplayer.scheduler;
public class RequirementsWatcher$DeviceStatusChangeReceiver extends android.content.BroadcastReceiver {
 public RequirementsWatcher this$0;
 public boolean initialSticky;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
}''',
    'androidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker.java': '''package androidx.work.impl.constraints.trackers;
public class BroadcastReceiverConstraintTracker {
 public final java.util.ArrayList<android.content.Intent> received=new java.util.ArrayList<>();
 public RuntimeException failure;
 public void onBroadcastReceive(android.content.Intent intent) {
  if(failure!=null)throw failure;
  received.add(intent);
 }
}''',
    'androidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker$broadcastReceiver$1.java': '''package androidx.work.impl.constraints.trackers;
public class BroadcastReceiverConstraintTracker$broadcastReceiver$1 extends android.content.BroadcastReceiver {
 public BroadcastReceiverConstraintTracker this$0;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
}''',
}


PROBE_MEMBERS = '''
 static android.content.Context mediaContext() { return new android.content.ContextWrapper(null); }
 static android.content.BroadcastReceiver networkReceiver(androidx.media3.common.util.NetworkTypeObserver owner) {
  androidx.media3.common.util.NetworkTypeObserver$Receiver receiver=
   new androidx.media3.common.util.NetworkTypeObserver$Receiver();
  receiver.this$0=owner;return receiver;
 }
 static android.content.BroadcastReceiver volumeReceiver(androidx.media3.exoplayer.StreamVolumeManager owner) {
  androidx.media3.exoplayer.StreamVolumeManager$VolumeChangeReceiver receiver=
   new androidx.media3.exoplayer.StreamVolumeManager$VolumeChangeReceiver();
  receiver.this$0=owner;owner.receiver=receiver;return receiver;
 }
 static android.content.BroadcastReceiver requirementsReceiver(
   androidx.media3.exoplayer.scheduler.RequirementsWatcher owner,boolean sticky) {
  androidx.media3.exoplayer.scheduler.RequirementsWatcher$DeviceStatusChangeReceiver receiver=
   new androidx.media3.exoplayer.scheduler.RequirementsWatcher$DeviceStatusChangeReceiver();
  receiver.this$0=owner;receiver.initialSticky=sticky;return receiver;
 }
 static android.content.BroadcastReceiver trackerReceiver(
   androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker owner) {
  androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker$broadcastReceiver$1 receiver=
   new androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker$broadcastReceiver$1();
  receiver.this$0=owner;return receiver;
 }
 static void mediaNetwork() {
  test("network refresh is deferred and forwards the same context",()->{
   androidx.media3.common.util.NetworkTypeObserver owner=new androidx.media3.common.util.NetworkTypeObserver();
   android.content.Context context=mediaContext();
   networkReceiver(owner).onReceive(context,new android.content.Intent("fixture.network"));
   check(owner.backgroundExecutor.pending()==1,"network task was not enqueued exactly once");
   check(owner.contexts.isEmpty(),"network refresh ran synchronously");
   owner.backgroundExecutor.drain();
   check(owner.contexts.size()==1&&owner.contexts.get(0)==context,"network context was lost or replaced");
   check(owner.backgroundExecutor.executions==1,"network task was duplicated");
  });
  test("network broadcasts preserve task and context order",()->{
   androidx.media3.common.util.NetworkTypeObserver owner=new androidx.media3.common.util.NetworkTypeObserver();
   android.content.BroadcastReceiver receiver=networkReceiver(owner);
   android.content.Context first=mediaContext(),second=mediaContext();
   receiver.onReceive(first,null);receiver.onReceive(second,null);
   check(owner.backgroundExecutor.pending()==2&&owner.contexts.isEmpty(),"network scheduling was collapsed");
   owner.backgroundExecutor.drain();
   check(owner.contexts.size()==2&&owner.contexts.get(0)==first&&owner.contexts.get(1)==second,
    "network contexts arrived out of order");
  });
  test("network provider failure remains a deferred failure",()->{
   androidx.media3.common.util.NetworkTypeObserver owner=new androidx.media3.common.util.NetworkTypeObserver();
   RuntimeException expected=new IllegalStateException("fixture network failure");owner.failure=expected;
   networkReceiver(owner).onReceive(mediaContext(),null);
   check(owner.backgroundExecutor.pending()==1,"failing network task was discarded");
   try{owner.backgroundExecutor.drain();throw new AssertionError("network failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"network failure was replaced");}
   check(owner.contexts.isEmpty(),"failed network refresh was recorded as successful");
  });
 }
 static void mediaVolume() {
  test("volume callback schedules the shipped state refresh",()->{
   androidx.media3.exoplayer.StreamVolumeManager owner=new androidx.media3.exoplayer.StreamVolumeManager();
   Object before=new androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState(3,7,false);
   owner.stateHandler.state=before;owner.nextVolume=9;owner.nextMuted=true;
   volumeReceiver(owner).onReceive(null,null);
   check(owner.stateHandler.executor.pending()==1,"volume refresh was not enqueued");
   check(owner.generations==0&&owner.stateHandler.writes==0,"volume refresh ran synchronously");
   owner.stateHandler.executor.drain();
   androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState after=
    (androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState)owner.stateHandler.state;
   check(owner.generations==1&&owner.stateHandler.writes==1,"volume refresh was skipped or duplicated");
   check(after!=before&&after.streamType==3&&after.volume==9&&after.muted,"generated volume state was not retained");
  });
  test("volume task observes release before execution",()->{
   androidx.media3.exoplayer.StreamVolumeManager owner=new androidx.media3.exoplayer.StreamVolumeManager();
   Object before=new androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState(3,7,false);
   owner.stateHandler.state=before;
   volumeReceiver(owner).onReceive(null,null);owner.receiver=null;
   owner.stateHandler.executor.drain();
   check(owner.generations==0&&owner.stateHandler.writes==0&&owner.stateHandler.state==before,
    "released receiver still refreshed volume");
  });
  test("volume task reads the current stream type when it runs",()->{
   androidx.media3.exoplayer.StreamVolumeManager owner=new androidx.media3.exoplayer.StreamVolumeManager();
   owner.stateHandler.state=new androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState(3,7,false);
   volumeReceiver(owner).onReceive(null,null);
   owner.stateHandler.state=new androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState(5,4,true);
   owner.stateHandler.executor.drain();
   check(owner.lastStreamType==5,"volume task used a stale captured stream type");
  });
  test("volume generation failure does not publish a success state",()->{
   androidx.media3.exoplayer.StreamVolumeManager owner=new androidx.media3.exoplayer.StreamVolumeManager();
   Object before=new androidx.media3.exoplayer.StreamVolumeManager.StreamVolumeState(3,7,false);
   owner.stateHandler.state=before;
   RuntimeException expected=new IllegalStateException("fixture volume failure");owner.failure=expected;
   volumeReceiver(owner).onReceive(null,null);
   try{owner.stateHandler.executor.drain();throw new AssertionError("volume failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"volume failure was replaced");}
   check(owner.stateHandler.writes==0&&owner.stateHandler.state==before,"failed volume refresh changed state");
  });
 }
 static void mediaRequirements() {
  test("initial sticky requirement broadcast is skipped",()->{
   androidx.media3.exoplayer.scheduler.RequirementsWatcher owner=
    new androidx.media3.exoplayer.scheduler.RequirementsWatcher();
   owner.failure=new IllegalStateException("initial sticky must not query requirements");
   requirementsReceiver(owner,true).onReceive(null,null);
   check(owner.checks==0,"initial sticky broadcast repeated requirement evaluation");
  });
  test("non-sticky requirement broadcasts invoke the real check boundary",()->{
   androidx.media3.exoplayer.scheduler.RequirementsWatcher owner=
    new androidx.media3.exoplayer.scheduler.RequirementsWatcher();
   android.content.BroadcastReceiver receiver=requirementsReceiver(owner,false);
   receiver.onReceive(mediaContext(),new android.content.Intent("fixture.requirements"));
   receiver.onReceive(null,null);
   check(owner.checks==2,"requirement rechecks were skipped or duplicated");
  });
  test("requirement provider failure remains visible",()->{
   androidx.media3.exoplayer.scheduler.RequirementsWatcher owner=
    new androidx.media3.exoplayer.scheduler.RequirementsWatcher();
   RuntimeException expected=new IllegalStateException("fixture requirements failure");owner.failure=expected;
   try{requirementsReceiver(owner,false).onReceive(null,null);throw new AssertionError("requirements failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"requirements failure was replaced");}
   check(owner.checks==0,"failed requirement check recorded success");
  });
 }
 static void workTracker() {
  test("work tracker forwards the original intent and its data",()->{
   androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker owner=
    new androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker();
   android.content.Intent intent=new android.content.Intent("fixture.work").putExtra("fixture","unchanged");
   trackerReceiver(owner).onReceive(mediaContext(),intent);
   check(owner.received.size()==1&&owner.received.get(0)==intent,"work tracker replaced or lost its intent");
   check("unchanged".equals(owner.received.get(0).getStringExtra("fixture")),"work intent data was changed");
  });
  test("work tracker rejects null context before delegation",()->{
   androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker owner=
    new androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker();
   try{trackerReceiver(owner).onReceive(null,new android.content.Intent("fixture.work"));
    throw new AssertionError("null work context accepted");}
   catch(NullPointerException expected){}
   check(owner.received.isEmpty(),"null-context work event reached tracker");
  });
  test("work tracker rejects null intent before delegation",()->{
   androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker owner=
    new androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker();
   try{trackerReceiver(owner).onReceive(mediaContext(),null);throw new AssertionError("null work intent accepted");}
   catch(NullPointerException expected){}
   check(owner.received.isEmpty(),"null work intent reached tracker");
  });
  test("work tracker preserves provider failure",()->{
   androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker owner=
    new androidx.work.impl.constraints.trackers.BroadcastReceiverConstraintTracker();
   RuntimeException expected=new IllegalStateException("fixture tracker failure");owner.failure=expected;
   try{trackerReceiver(owner).onReceive(mediaContext(),new android.content.Intent("fixture.work"));
    throw new AssertionError("tracker failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"tracker failure was replaced");}
   check(owner.received.isEmpty(),"failed tracker event recorded success");
  });
 }
'''


CASES = {
    'media-network': 'mediaNetwork()',
    'media-volume': 'mediaVolume()',
    'media-requirements': 'mediaRequirements()',
    'work-tracker': 'workTracker()',
}
