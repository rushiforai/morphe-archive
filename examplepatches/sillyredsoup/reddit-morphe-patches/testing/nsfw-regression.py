#!/usr/bin/env python3
"""Exercise screen ownership and account-sync acknowledgements without network timing.

Android/Compose fixtures model only the calls needed here. The emulator checks
the real app separately. --baseline runs the same checks against Git HEAD.
"""
import argparse
from pathlib import Path
import subprocess
import tempfile

repo = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser()
parser.add_argument('--baseline', action='store_true')
args = parser.parse_args()
extension = 'extensions/extension/src/main/java/local/reddit/extension/RedditMode.java'
source = (subprocess.check_output(['git', 'show', f'HEAD:{extension}'], cwd=repo).decode()
          if args.baseline else (repo / extension).read_text())
fixtures = {
    'android/content/SharedPreferences.java': '''package android.content;
public interface SharedPreferences {
 boolean getBoolean(String name, boolean fallback);
 Editor edit();
 interface Editor { Editor putBoolean(String name, boolean value); void apply(); }
}''',
    'android/content/Context.java': '''package android.content;
public class Context {
 private boolean state;
 public android.content.res.Resources getResources() { return null; }
 public SharedPreferences getSharedPreferences(String name, int mode) {
  return new SharedPreferences() {
   public boolean getBoolean(String key, boolean fallback) { return state; }
   public Editor edit() { return new Editor() {
    public Editor putBoolean(String key, boolean value) { state = value; return this; }
    public void apply() {}
   }; }
  };
 }
}''',
    'android/app/Activity.java': '''package android.app;
public class Activity extends android.content.Context {}''',
    'android/widget/Toast.java': '''package android.widget;
public class Toast {
 public static final int LENGTH_SHORT=0, LENGTH_LONG=1;
 public static final java.util.List<String> messages=new java.util.ArrayList<>();
 private final String message;
 public Toast(String message) { this.message=message; }
 public static Toast makeText(android.content.Context c, CharSequence s, int length) {
  return new Toast(s.toString());
 }
 public void show() { messages.add(message); }
}''',
    'android/os/Looper.java': '''package android.os;
public class Looper { public static Looper getMainLooper() { return new Looper(); } }''',
    'android/os/Handler.java': '''package android.os;
public class Handler {
 private static final java.util.List<Runnable> tasks=new java.util.ArrayList<>();
 private static final java.util.List<Runnable> timers=new java.util.ArrayList<>();
 public Handler(Looper looper) {}
 public boolean post(Runnable task) { tasks.add(task); return true; }
 public boolean postDelayed(Runnable task,long delay) { timers.add(task); return true; }
 public void removeCallbacks(Runnable task) { timers.remove(task); }
 public static void drain() { while (!tasks.isEmpty()) tasks.remove(0).run(); }
 public static void expire() {
  for (Runnable task:new java.util.ArrayList<>(timers)) task.run();
  drain();
 }
}''',
    'hx/g.java': '''package hx; public class g {}''',
    'hx/b.java': '''package hx; public class b {}''',
    'android/util/Log.java': '''package android.util;
public class Log {
 public static int w(String tag, String message) { return 0; }
 public static int i(String tag, String message) { return 0; }
}''',
    'androidx/compose/runtime/o1.java': '''package androidx.compose.runtime;
public class o1 {
 private Object value;
 public o1(Object value) { this.value=value; }
 public Object getValue() { return value; }
 public void setValue(Object value) { this.value=value; }
}''',
    'androidx/compose/runtime/j.java': '''package androidx.compose.runtime;
public class j { public static o1 B(Object value) { return new o1(value); } }''',
    'com/reddit/launch/bottomnav/BottomNavScreen.java': '''package com.reddit.launch.bottomnav;
public class BottomNavScreen {
 public int activityLookups;
 public int refreshCalls;
 public android.app.Activity activity;
 public android.app.Activity H3() { activityLookups++; return activity; }
 public Object getCurrentScreen() { refreshCalls++; return null; }
}''',
    'Regression.java': '''import com.reddit.launch.bottomnav.BottomNavScreen;
import local.reddit.extension.RedditMode;
import kotlin.jvm.functions.Function0;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import wl3.a;
import android.os.Handler;
import android.widget.Toast;
public class Regression {
 public static class Descriptor { public String a="NSFW"; }
 public static class Click implements Function0<Object> {
  public final BottomNavScreen owner;
  Click(BottomNavScreen owner) { this.owner=owner; }
  public Object invoke() { throw new AssertionError("Original tab action ran"); }
 }
 public static class Repository {
  public boolean show, blur;
  public int showWrites;
  public boolean delayed;
  public final java.util.List<a<Object>> pending=new java.util.ArrayList<>();
  // Simulate the asynchronous account getter lagging behind the button.
  public boolean i() { return false; }
  public Object y(boolean value, ContinuationImpl continuation) {
   show=value; showWrites++;
   Object result=sync(new Patch(value,null),new Frame(new Frame(continuation)));
   return delayed ? result : new hx.g();
  }
  public Object q(boolean value, SuspendLambda continuation) {
   blur=value; return sync(new Patch(null,value),continuation);
  }
  private Object sync(Patch patch,a<Object> continuation) {
   a<Object> watched=RedditMode.watchSettingsSync(this,patch,continuation);
   Object result;
   if (delayed) { pending.add(watched); result=CoroutineSingletons.COROUTINE_SUSPENDED; }
   else result=new hx.g();
   RedditMode.finishSettingsSync(watched,result);
   return result;
  }
  public void reply(int index,boolean success) {
   pending.get(index).resumeWith(success ? new hx.g() : new hx.b()); Handler.drain();
  }
 }
 public static class Patch {
  final Boolean show,blur;
  Patch(Boolean show,Boolean blur) { this.show=show; this.blur=blur; }
  public Boolean getOver18() { return show; }
  public Boolean getNoProfanity() { return blur; }
 }
 public static class Frame extends ContinuationImpl {
  Frame(a<Object> completion) { super(completion); }
  protected Object invokeSuspend(Object result) { return result; }
 }
 private static void check(boolean value,String message) {
  if (!value) throw new AssertionError(message);
 }
 public static class Tab {
  public final String a;
  public final Object b;
  public Tab(String label,Object content) { a=label; b=content; }
 }
 public static void main(String[] args) {
  if (args[0].equals("own_slot")) {
   for (boolean inboxVisible:new boolean[]{true,false}) {
    Tab home=new Tab("Home",new Object()), inbox=new Tab("Inbox",new Object());
    java.util.List<Tab> tabs=new java.util.ArrayList<>();
    tabs.add(home); if (inboxVisible) tabs.add(inbox);
    int count=tabs.size();
    RedditMode.addButton(tabs); RedditMode.addButton(tabs);
    check(tabs.size()==count+1,"NSFW tab missing or duplicated");
    check(tabs.get(0)==home && tabs.get(1).a.equals("NSFW"),"Wrong NSFW position");
    check(!inboxVisible || tabs.contains(inbox),"Inbox overwritten");
    check(RedditMode.tabLabel(new Descriptor(),"Home").equals("NSFW"),"Copied Home label remains");
   }
   java.util.List<Tab> tabs=new java.util.ArrayList<>();
   tabs.add(new Tab("Home",new Object())); tabs.add(new Tab("Vertical",new Object()));
   RedditMode.addButton(tabs);
   check(tabs.get(2).a.equals("NSFW"),"NSFW order depends on patch order");
  } else if (args[0].equals("owner") || args[0].equals("rewrap")) {
   BottomNavScreen owner=new BottomNavScreen(), other=new BottomNavScreen();
   RedditMode.initialize(owner, null);
   Function0<?> click=RedditMode.wrapClick(new Descriptor(), new Click(owner));
   if (args[0].equals("rewrap")) click=RedditMode.wrapClick(new Descriptor(),click);
   RedditMode.initialize(other, null);
   owner.activityLookups=0; other.activityLookups=0;
   click.invoke();
   if (owner.activityLookups != 1 || other.activityLookups != 0)
    throw new AssertionError("Click used a later unrelated navigation screen");
  } else if (args[0].equals("state")) {
   BottomNavScreen owner=new BottomNavScreen(); owner.activity=new android.app.Activity();
   Repository repository=new Repository();
   RedditMode.initialize(owner, null); RedditMode.rememberRepository(repository);
   Function0<?> click=RedditMode.wrapClick(new Descriptor(), new Click(owner));
   click.invoke();
   Handler.drain();
   if (!repository.show || repository.blur) throw new AssertionError("Enable failed");
   click.invoke();
   Handler.drain();
   if (repository.show || !repository.blur || repository.showWrites != 2)
    throw new AssertionError("Second click repeated enable while account getter lagged");
   check(Toast.messages.isEmpty(),"Normal toggles displayed a toast");
  } else {
   BottomNavScreen owner=new BottomNavScreen(); owner.activity=new android.app.Activity();
   Repository repository=new Repository(); repository.delayed=!args[0].equals("immediate");
   RedditMode.initialize(owner,null); RedditMode.rememberRepository(repository);
   Function0<?> click=RedditMode.wrapClick(new Descriptor(),new Click(owner));
   click.invoke(); Handler.drain();
   check(Toast.messages.isEmpty(),"Normal update displayed a toast");
   if (args[0].equals("immediate")) {
    check(owner.refreshCalls==1,"Immediate return did not refresh");
   } else if (args[0].equals("async")) {
    check(owner.refreshCalls==0,"Refreshed before server response");
    repository.reply(0,true);
    check(owner.refreshCalls==0,"Refreshed before blur acknowledgement");
    repository.reply(1,true);
    check(owner.refreshCalls==1,"Confirmed update did not refresh feed");
   } else if (args[0].equals("failure")) {
    // The public over18 setter can still return success after this failure.
    repository.reply(0,false);
    repository.reply(1,true);
    check(owner.refreshCalls==0,"Rejected account update refreshed feed");
    check(Toast.messages.stream().anyMatch(s -> s.contains("update failed")),"Failure toast missing");
   } else if (args[0].equals("queued")) {
    click.invoke(); Handler.drain();
    check(repository.pending.size()==2,"Concurrent update started before previous one completed");
    repository.reply(0,true); repository.reply(1,true);
    check(owner.refreshCalls==0,"Superseded mode refreshed feed");
    check(repository.pending.size()==4 && !repository.show && repository.blur,"Queued mode not applied");
    repository.reply(2,true); repository.reply(3,true);
    check(owner.refreshCalls==1,"Latest mode did not refresh");
   } else if (args[0].equals("queued_failure")) {
    click.invoke(); Handler.drain();
    repository.reply(0,false);
    check(repository.pending.size()==2,"Queued mode started before other request finished");
    repository.reply(1,true);
    check(repository.pending.size()==4,"Queued mode not started after rejection");
    check(owner.refreshCalls==0,"Rejected obsolete mode refreshed");
    repository.reply(2,true); repository.reply(3,true);
    check(owner.refreshCalls==1,"Queued mode did not recover from rejection");
   } else if (args[0].equals("timeout")) {
    Handler.expire();
    check(owner.refreshCalls==0,"Timed-out update refreshed");
    check(Toast.messages.size()==1 && Toast.messages.get(0).contains("timed out"),"Timeout toast missing");
    click.invoke(); Handler.drain();
    repository.reply(0,true); repository.reply(1,true);
    check(owner.refreshCalls==0,"Late obsolete response refreshed");
    repository.reply(2,true); repository.reply(3,true);
    check(owner.refreshCalls==1,"Timeout left button unusable");
    check(Toast.messages.size()==1,"Successful retry displayed a toast");
   }
   if (!args[0].equals("failure") && !args[0].equals("timeout"))
    check(Toast.messages.isEmpty(),"Normal usage displayed a toast");
  }
  System.out.println("PASS " + args[0]);
 }
}''',
    'local/reddit/extension/RedditMode.java': source,
}
with tempfile.TemporaryDirectory(prefix='reddit-nsfw-regression-') as tmp:
    root = Path(tmp)
    files = []
    for name, text in fixtures.items():
        file = root / name
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(text)
        files.append(str(file))
    files += [str(repo / 'build-support/reddit-api/wl3/a.java')]
    files += [str(p) for p in (repo / 'build-support/reddit-api/kotlin/coroutines/jvm/internal').glob('*.java')]
    jars = [repo / '.local-tools/morphe-desktop.jar', repo / '.local-tools/android.jar']
    cp = ':'.join(str(p) for p in jars)
    subprocess.run(['javac', '-cp', cp, '-d', str(root / 'classes'), *files], check=True)
    failures = 0
    for case in ('own_slot', 'owner', 'rewrap', 'state', 'immediate', 'async', 'failure', 'queued', 'queued_failure', 'timeout'):
        result = subprocess.run(['java', '-cp', f'{root / "classes"}:{cp}', 'Regression', case])
        failures += result.returncode != 0
    raise SystemExit(bool(failures))
