"""Executable integration tests using the ACTUAL staged production Java.

Android APIs are lightweight test doubles; this is not an Android device test.
The trace writer race is reproduced by blocking the file system through a FIFO.
"""
from pathlib import Path
from tempfile import TemporaryDirectory
import importlib.util
import re
import subprocess

ROOT=Path(__file__).resolve().parents[1]
REVISIONS=ROOT.parent
BASE=REVISIONS/"v2.0.0-dev.1/java/e/e/a"
spec=importlib.util.spec_from_file_location("dev7_source",ROOT/"patch_207.py")
module=importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

def run(*command):
    completed=subprocess.run([str(p) for p in command],check=True,
                             capture_output=True,text=True,timeout=15)
    if completed.stdout.strip():print(completed.stdout.strip())

def java(path,name,source):
    dest=path/name
    dest.parent.mkdir(parents=True,exist_ok=True)
    dest.write_text(source)
    return dest

with TemporaryDirectory(prefix="nicoid-dev7-") as tmp:
    temp=Path(tmp)
    stage=temp/"stage"
    module.stage(BASE,stage)

    scroll=temp/"scroll"
    stubs={
      "android/os/Looper.java":'package android.os;public class Looper{private static final Looper M=new Looper();public static Looper getMainLooper(){return M;}public static Looper myLooper(){return M;}}',
      "android/os/SystemClock.java":'package android.os;public class SystemClock{public static long now=0;public static long uptimeMillis(){return now;}}',
      "android/os/Handler.java":'package android.os;import java.util.*;public class Handler{public static final ArrayDeque<Runnable> Q=new ArrayDeque<>();public Handler(Looper l){}public boolean post(Runnable r){Q.addLast(r);return true;}public boolean postDelayed(Runnable r,long n){Q.addLast(r);return true;}public void removeCallbacks(Runnable r){Q.removeIf(x->x==r);}public static void drain(int n){while(n-->0&&!Q.isEmpty())Q.pollFirst().run();}}',
      "android/util/Log.java":'package android.util;public class Log{public static int w(String a,String b,Throwable c){return 0;}}',
      "android/view/View.java":'package android.view;public class View{public int height=600,top=0;public boolean visible=true;public boolean isShown(){return visible;}public boolean isAttachedToWindow(){return true;}public int getTop(){return top;}public int getHeight(){return height;}}',
      "android/widget/ListView.java":'package android.widget;import android.view.View;public class ListView extends View{public int count=10,first=0,selections=0,selected=-1;public View child=new View();public int getCount(){return count;}public int getFirstVisiblePosition(){return first;}public View getChildAt(int n){return n==0?child:null;}public void setSelectionFromTop(int p,int t){selected=p;first=p;selections++;child.top=t;}}',
      "ScrollCase.java":"""import android.widget.ListView;import android.os.Handler;import e.e.a.SmoothTabRestore204;
public class ScrollCase{
 static void check(boolean b,String msg){if(!b)throw new AssertionError(msg);}
 public static void main(String[] args){
  ListView list=new ListView();list.count=5;
  SmoothTabRestore204.restoreList(list,70,-8);
  check(SmoothTabRestore204.restoring(list),"waiting restore");
  SmoothTabRestore204.restoreList(list,0,0);
  check(!SmoothTabRestore204.restoring(list),"top cancels stale restore");
  list.count=90;Handler.drain(30);
  check(list.selections==0,"stale callback cannot move visible list");
  ListView reused=new ListView();reused.count=100;reused.first=41;
  SmoothTabRestore204.restoreList(reused,0,0);
  check(reused.first==0&&reused.selections==1,"one jump from deep list to top");
  ListView partial=new ListView();partial.count=10;
  SmoothTabRestore204.restoreList(partial,60,-12);Handler.drain(1);
  check(partial.selections==0,"no partial page jumps");
  partial.count=100;Handler.drain(5);
  check(partial.selected==60&&partial.selections==1,"one final jump");
  SmoothTabRestore204.restoreList(partial,60,-12);
  check(partial.selections==1,"idempotent duplicate");
  System.out.println("PASS: 7 executable native-list state assertions");
 }
}"""
    }
    scroll_paths=[java(scroll,k,v) for k,v in stubs.items()]
    run("javac","--release","8","-d",temp/"scroll-classes",*scroll_paths,
        REVISIONS/"v2.0.1-dev.4/java/e/e/a/ScrollRestorePolicy204.java",
        REVISIONS/"v2.0.1-dev.5/java/e/e/a/ScrollRestorePolicy205.java",
        ROOT/"java/e/e/a/SmoothTabRestore204.java")
    run("java","-cp",temp/"scroll-classes","ScrollCase")

    diag=temp/"diagnostics"
    diag_paths=[
      java(diag,"android/content/Context.java",'package android.content;import java.io.File;public class Context{public Context getApplicationContext(){return this;}public File getFilesDir(){return new File(System.getProperty("java.io.tmpdir"));}}'),
      java(diag,"android/net/Uri.java",'package android.net;public class Uri{public String getPath(){return "";}}'),
      java(diag,"TraceCase.java","""import java.io.*;import java.nio.file.*;import java.lang.reflect.*;import e.e.a.NicoliveDiagnostics;
public class TraceCase{
 static void check(boolean b,String message){if(!b)throw new AssertionError(message);}
 static void flush()throws Exception{Method m=NicoliveDiagnostics.class.getDeclaredMethod("persist");m.setAccessible(true);m.invoke(null);}
 public static void main(String[] args)throws Exception{
  Path directory=Files.createTempDirectory("nicoid-trace-race");
  File out=directory.resolve("events.log").toFile();
  Path pipe=directory.resolve("events.log.tmp");
  check(new ProcessBuilder("mkfifo",pipe.toString()).start().waitFor()==0,"FIFO available");
  Field file=NicoliveDiagnostics.class.getDeclaredField("destination");file.setAccessible(true);file.set(null,out);
  Field dirty=NicoliveDiagnostics.class.getDeclaredField("dirty");dirty.setAccessible(true);
  NicoliveDiagnostics.record("AUDIT","first");
  final Throwable[] problem={null};
  Thread worker=new Thread(()->{try{flush();}catch(Throwable t){problem[0]=t;}});
  worker.start();Thread.sleep(150);
  check(worker.isAlive(),"write blocked after snapshot");
  NicoliveDiagnostics.record("AUDIT","second");
  try(InputStream stream=new FileInputStream(pipe.toFile())){byte[] b=new byte[1024];check(stream.read(b)>0,"first snapshot exists");}
  worker.join(2000);
  check(!worker.isAlive()&&problem[0]==null,"writer completes");
  check(dirty.getBoolean(null),"second event remains queued for persistence");
  flush();
  check(Files.readString(out.toPath()).contains("second"),"second event persisted");
  Method sanitize=NicoliveDiagnostics.class.getDeclaredMethod("sanitize",String.class,int.class);
  sanitize.setAccessible(true);
  String result=(String)sanitize.invoke(null,"https://example.com?key=secret cookie=private",190);
  check(!result.contains("secret")&&!result.contains("private"),"private values removed");
  System.out.println("PASS: concurrent trace durability and secret redaction");
 }
}""")
    ]
    run("javac","--release","11","-d",temp/"diag-classes",*diag_paths,stage/"NicoliveDiagnostics.java")
    run("java","-cp",temp/"diag-classes","TraceCase")

    source=(stage/"NicoliveData.java").read_text()
    match=re.search(r'public static byte\[\] frame\(InputStream in\)throws IOException\{[^\r\n]+',source)
    if not match:raise AssertionError("Production frame parser changed without updating tests")
    frame=temp/"frame"
    parsed=java(frame,"FrameUnderTest.java",'import java.io.*;public class FrameUnderTest{'+match.group(0)+'}')
    test=java(frame,"FrameCase.java","""import java.io.*;
public class FrameCase{
 static void check(boolean ok){if(!ok)throw new AssertionError();}
 static void bad(InputStream input)throws Exception{
  try{FrameUnderTest.frame(input);throw new AssertionError("unbounded or malformed frame accepted");}
  catch(IOException expected){}
 }
 public static void main(String[] args)throws Exception{
  check(FrameUnderTest.frame(new ByteArrayInputStream(new byte[0]))==null);
  check(new String(FrameUnderTest.frame(new ByteArrayInputStream(new byte[]{3,65,66,67})),"UTF-8").equals("ABC"));
  bad(new ByteArrayInputStream(new byte[]{2,65}));
  bad(new ByteArrayInputStream(new byte[]{(byte)0x81,(byte)0x80,0x40}));
  bad(new InputStream(){boolean first=true;public int read(){if(first){first=false;return 1;}return 0;}
       public int read(byte[] b,int off,int n){return 0;}});
  System.out.println("PASS: normal, truncated, oversized and stalled network frame cases");
 }
}""")
    run("javac","--release","8","-d",temp/"frame-classes",parsed,test)
    run("java","-cp",temp/"frame-classes","FrameCase")
print("PASS: all v2.0.1-dev.7 executable source regressions")
