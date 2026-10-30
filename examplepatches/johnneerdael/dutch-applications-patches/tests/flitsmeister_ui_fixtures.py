"""ART fixtures for shortcut completion and Compose dock-state callbacks.

The runner injects the production/emitted callback body into the receiver. The
shortcut's six-argument helper is an explicit synthetic send boundary, so no
system service or actual shortcut is invoked. A real IntentSender identity is
constructed through its Parcelable creator with a local Binder token only.
Dock-state parsing reproduces the exact shipped nullable-Intent/nonzero-state
logic; the receiver's setDocked helper is preserved and its state owner is fake.
These cases do not establish launcher, Binder-delivery or Compose rendering
behavior on a real application.
"""


CALLBACKS = {
    'shortcut': {
        'constant': 'shortcutCallbackCode',
        'owner': 'androidx/core/content/pm/ShortcutManagerCompat$1',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public val$callback:Landroid/content/IntentSender;',
        'helpers': '''
.method public static synthetic sendIntent$001(Landroid/content/IntentSender;Landroid/content/Context;ILandroid/content/Intent;Landroid/content/IntentSender$OnFinished;Landroid/os/Handler;)V
 .locals 0
 invoke-static/range {p0 .. p5}, Lfixtures/ShortcutBoundary;->send(Landroid/content/IntentSender;Landroid/content/Context;ILandroid/content/Intent;Landroid/content/IntentSender$OnFinished;Landroid/os/Handler;)V
 return-void
.end method
''',
    },
    'dock': {
        'constant': 'dockCallbackCode',
        'owner': 'androidx/compose/ui/adaptive/MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1',
        'signature': 'onReceive(Landroid/content/Context;Landroid/content/Intent;)V',
        'registers': 8,
        'parent': 'android/content/BroadcastReceiver',
        'fields': '.field public $scope:Landroidx/compose/ui/adaptive/UiMediaScopeImpl;',
        'helpers': '''
.method public static synthetic setDocked$001(Landroidx/compose/ui/adaptive/UiMediaScopeImpl;Z)V
 .locals 1
 invoke-virtual/range {p0 .. p1}, Landroidx/compose/ui/adaptive/UiMediaScopeImpl;->setDocked(Z)V
 return-void
.end method
''',
    },
}


JAVA = {
    'fixtures/ShortcutBoundary.java': '''package fixtures;
public final class ShortcutBoundary {
 public static int calls,lastResultCode;
 public static android.content.IntentSender lastCallback;
 public static android.content.Context lastContext;
 public static android.content.Intent lastIntent;
 public static android.content.IntentSender.OnFinished lastFinished;
 public static android.os.Handler lastHandler;
 public static Throwable failure;
 public static void reset() {
  calls=0;lastResultCode=Integer.MIN_VALUE;lastCallback=null;lastContext=null;
  lastIntent=null;lastFinished=null;lastHandler=null;failure=null;
 }
 public static void send(android.content.IntentSender callback,android.content.Context context,
   int resultCode,android.content.Intent intent,android.content.IntentSender.OnFinished finished,
   android.os.Handler handler) throws android.content.IntentSender.SendIntentException {
  calls++;lastCallback=callback;lastContext=context;lastResultCode=resultCode;
  lastIntent=intent;lastFinished=finished;lastHandler=handler;
  if(failure instanceof android.content.IntentSender.SendIntentException)
   throw (android.content.IntentSender.SendIntentException)failure;
  if(failure instanceof RuntimeException)throw (RuntimeException)failure;
  if(failure instanceof Error)throw (Error)failure;
 }
}''',
    'androidx/core/content/pm/ShortcutManagerCompat$1.java': '''package androidx.core.content.pm;
public class ShortcutManagerCompat$1 extends android.content.BroadcastReceiver {
 public android.content.IntentSender val$callback;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
}''',
    'androidx/compose/ui/adaptive/UiMediaScopeImpl.java': '''package androidx.compose.ui.adaptive;
public class UiMediaScopeImpl {
 public boolean docked;
 public int writes;
 public void setDocked(boolean value) { docked=value;writes++; }
}''',
    'androidx/compose/ui/adaptive/MediaQuery_androidKt.java': '''package androidx.compose.ui.adaptive;
public final class MediaQuery_androidKt {
 // Exact logic from shipped access$isDocked -> private isDocked (Compose UI 1.12.1).
 public static boolean access$isDocked(android.content.Intent intent) { return isDocked(intent); }
 private static boolean isDocked(android.content.Intent intent) {
  if(intent==null)return false;
  return intent.getIntExtra("android.intent.extra.DOCK_STATE",0)!=0;
 }
}''',
    'androidx/compose/ui/adaptive/MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1.java': '''package androidx.compose.ui.adaptive;
public class MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1 extends android.content.BroadcastReceiver {
 public UiMediaScopeImpl $scope;
 public void onReceive(android.content.Context context,android.content.Intent intent) {}
}''',
}


PROBE_MEMBERS = '''
 static android.content.Context uiContext() { return new android.content.ContextWrapper(null); }
 static android.content.IntentSender shortcutSender() {
  android.os.Parcel parcel=android.os.Parcel.obtain();
  try {
   parcel.writeStrongBinder(new android.os.Binder());
   parcel.setDataPosition(0);
   android.content.IntentSender sender=android.content.IntentSender.CREATOR.createFromParcel(parcel);
   check(sender!=null,"local IntentSender fixture could not be constructed");
   return sender;
  } finally { parcel.recycle(); }
 }
 static android.content.BroadcastReceiver shortcutReceiver(android.content.IntentSender sender) {
  androidx.core.content.pm.ShortcutManagerCompat$1 receiver=new androidx.core.content.pm.ShortcutManagerCompat$1();
  receiver.val$callback=sender;return receiver;
 }
 static android.content.BroadcastReceiver dockReceiver(androidx.compose.ui.adaptive.UiMediaScopeImpl scope) {
  androidx.compose.ui.adaptive.MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1 receiver=
   new androidx.compose.ui.adaptive.MediaQuery_androidKt$obtainUiMediaScope$4$1$receiver$1();
  receiver.$scope=scope;return receiver;
 }
 static void shortcut() {
  test("shortcut completion preserves callback and context identity",()->{
   fixtures.ShortcutBoundary.reset();
   android.content.IntentSender callback=shortcutSender();
   android.content.Context context=uiContext();
   android.content.Intent incoming=new android.content.Intent("fixture.shortcut.result").putExtra("private","incoming");
   shortcutReceiver(callback).onReceive(context,incoming);
   check(fixtures.ShortcutBoundary.calls==1,"shortcut completion was skipped or duplicated");
   check(fixtures.ShortcutBoundary.lastCallback==callback,"shortcut callback identity changed");
   check(fixtures.ShortcutBoundary.lastContext==context,"shortcut context identity changed");
   check(fixtures.ShortcutBoundary.lastResultCode==0,"shortcut result code was not zero");
   check(fixtures.ShortcutBoundary.lastIntent==null,"incoming shortcut intent was forwarded");
   check(fixtures.ShortcutBoundary.lastFinished==null&&fixtures.ShortcutBoundary.lastHandler==null,
    "shortcut optional callback or handler was invented");
  });
  test("shortcut completion attempts each broadcast independently",()->{
   fixtures.ShortcutBoundary.reset();
   android.content.IntentSender callback=shortcutSender();
   android.content.BroadcastReceiver receiver=shortcutReceiver(callback);
   android.content.Context first=uiContext(),second=uiContext();
   receiver.onReceive(first,null);receiver.onReceive(second,null);
   check(fixtures.ShortcutBoundary.calls==2,"shortcut callbacks were collapsed or repeated");
   check(fixtures.ShortcutBoundary.lastContext==second&&fixtures.ShortcutBoundary.lastCallback==callback,
    "second shortcut completion used stale arguments");
  });
  test("shortcut ignores only the declared send failure",()->{
   fixtures.ShortcutBoundary.reset();
   fixtures.ShortcutBoundary.failure=new android.content.IntentSender.SendIntentException("fixture cancelled sender");
   shortcutReceiver(shortcutSender()).onReceive(uiContext(),new android.content.Intent("fixture.shortcut"));
   check(fixtures.ShortcutBoundary.calls==1,"failed shortcut send was not attempted exactly once");
  });
  test("shortcut preserves an unexpected runtime failure",()->{
   fixtures.ShortcutBoundary.reset();
   RuntimeException expected=new IllegalStateException("fixture runtime send failure");
   fixtures.ShortcutBoundary.failure=expected;
   try{shortcutReceiver(shortcutSender()).onReceive(uiContext(),null);
    throw new AssertionError("unexpected shortcut runtime failure swallowed");}
   catch(RuntimeException actual){check(actual==expected,"shortcut runtime failure replaced");}
   check(fixtures.ShortcutBoundary.calls==1,"shortcut failure skipped or retried the send");
  });
  test("shortcut preserves an unexpected Error",()->{
   fixtures.ShortcutBoundary.reset();
   Error expected=new LinkageError("fixture send linkage failure");fixtures.ShortcutBoundary.failure=expected;
   try{shortcutReceiver(shortcutSender()).onReceive(uiContext(),null);
    throw new AssertionError("unexpected shortcut Error swallowed");}
   catch(Error actual){check(actual==expected,"shortcut Error replaced");}
   check(fixtures.ShortcutBoundary.calls==1,"shortcut Error skipped or retried the send");
  });
 }
 static void dock() {
  test("dock callback handles all defined and unknown integer states",()->{
   int[] states={0,1,2,3,4,99,-1,Integer.MAX_VALUE};
   for(int state:states){
    androidx.compose.ui.adaptive.UiMediaScopeImpl scope=new androidx.compose.ui.adaptive.UiMediaScopeImpl();
    scope.docked=state==0;
    dockReceiver(scope).onReceive(null,new android.content.Intent("fixture.dock")
     .putExtra("android.intent.extra.DOCK_STATE",state));
    check(scope.writes==1,"dock state was not assigned exactly once: "+state);
    check(scope.docked==(state!=0),"wrong dock state for integer "+state);
   }
  });
  test("missing dock extra clears previously docked state",()->{
   androidx.compose.ui.adaptive.UiMediaScopeImpl scope=new androidx.compose.ui.adaptive.UiMediaScopeImpl();
   scope.docked=true;
   dockReceiver(scope).onReceive(uiContext(),new android.content.Intent("fixture.dock.no-extra"));
   check(scope.writes==1&&!scope.docked,"missing dock state did not default to undocked");
  });
  test("null dock intent clears state without a context guard",()->{
   androidx.compose.ui.adaptive.UiMediaScopeImpl scope=new androidx.compose.ui.adaptive.UiMediaScopeImpl();
   scope.docked=true;
   dockReceiver(scope).onReceive(null,null);
   check(scope.writes==1&&!scope.docked,"null dock intent did not update state to false");
  });
  test("dock transitions update the same scope repeatedly",()->{
   androidx.compose.ui.adaptive.UiMediaScopeImpl scope=new androidx.compose.ui.adaptive.UiMediaScopeImpl();
   android.content.BroadcastReceiver receiver=dockReceiver(scope);
   receiver.onReceive(null,new android.content.Intent().putExtra("android.intent.extra.DOCK_STATE",2));
   check(scope.docked,"car dock state was not applied");
   receiver.onReceive(null,new android.content.Intent().putExtra("android.intent.extra.DOCK_STATE",0));
   check(!scope.docked,"undocking left stale dock state");
   receiver.onReceive(null,new android.content.Intent().putExtra("android.intent.extra.DOCK_STATE",99));
   check(scope.docked&&scope.writes==3,"subsequent dock state was lost or duplicated");
  });
 }
'''


CASES = {
    'shortcut': 'shortcut()',
    'dock': 'dock()',
}
