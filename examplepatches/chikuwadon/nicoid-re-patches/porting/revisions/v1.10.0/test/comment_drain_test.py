#!/usr/bin/env python3
"""Verify the actual stop helper wakes a sleeping worker before acquiring its monitor."""
from pathlib import Path
import tempfile,subprocess,sys
r=Path(__file__).resolve().parents[1]
sources={
'android/view/View.java':'package android.view;public class View{}',
'android/view/ViewGroup.java':'package android.view;public class ViewGroup extends View{public View child;public int getChildCount(){return child==null?0:1;}public View getChildAt(int i){return child;}}',
'e/e/a/u.java':'package e.e.a;public class u extends android.view.View{public boolean u;public Thread t;}',
'e/e/a/DrainTest.java':'''package e.e.a;import java.util.concurrent.*;public class DrainTest{public static void main(String[] args)throws Exception{u view=new u();CountDownLatch entered=new CountDownLatch(1);view.t=new Thread(()->{while(!view.u){synchronized(view){entered.countDown();try{Thread.sleep(10000);}catch(InterruptedException expected){}}}});view.t.setDaemon(true);view.t.start();if(!entered.await(1,TimeUnit.SECONDS))throw new AssertionError("Worker did not start");long before=System.nanoTime();CommentTransfer245.stop(view);long elapsed=TimeUnit.NANOSECONDS.toMillis(System.nanoTime()-before);if(elapsed>1000)throw new AssertionError("Stop waited for the frame sleep: "+elapsed);if(!view.u)throw new AssertionError("Missing stop state");view.t.join(1000);if(view.t.isAlive())throw new AssertionError("Worker did not exit");android.view.ViewGroup parent=new android.view.ViewGroup();u child=new u();parent.child=child;CommentTransfer245.stop(parent);if(!child.u)throw new AssertionError("Missing child stop");CommentTransfer245.stop(null);System.out.println("CommentDrainTest: 5 checks passed");}}'''
}
with tempfile.TemporaryDirectory() as d:
 t=Path(d)
 for n,s in sources.items():
  p=t/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s)
 subprocess.run(['java','-jar',str(Path(sys.argv[1]).resolve()),'-1.8','-warn:none','-d',str(t/'classes'),*map(str,t.rglob('*.java')),str(r/'src/e/e/a/CommentTransfer245.java')],check=True)
 subprocess.run(['java','-cp',str(t/'classes'),'e.e.a.DrainTest'],check=True,timeout=5)
