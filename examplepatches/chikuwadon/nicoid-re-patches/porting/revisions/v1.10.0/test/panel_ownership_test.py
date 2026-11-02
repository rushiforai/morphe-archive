#!/usr/bin/env python3
"""Exercise production playback-panel ownership and padding with JVM View doubles."""
from pathlib import Path
import subprocess,tempfile,sys
r=Path(__file__).resolve().parents[1]
sources={
'android/R.java':'package android;public class R{public static class id{public static int content=1;}}',
'android/app/Activity.java':'package android.app;import android.view.*;public class Activity{public ViewGroup content=new ViewGroup();@SuppressWarnings("unchecked")public <T extends View>T findViewById(int id){return (T)content;}}',
'android/view/View.java':'''package android.view;public class View{private Object tag;ViewGroup parent;private int bottom;public Object getParent(){return parent;}public Object getTag(){return tag;}public void setTag(Object t){tag=t;}public int getPaddingBottom(){return bottom;}public int getPaddingTop(){return 0;}public int getPaddingLeft(){return 0;}public int getPaddingRight(){return 0;}public void setPadding(int l,int t,int r,int b){bottom=b;}}''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View{private ArrayList<View> children=new ArrayList<>();public void addView(View v){if(v.parent!=null)throw new AssertionError("Already attached");children.add(v);v.parent=this;}public void removeView(View v){children.remove(v);if(v.parent==this)v.parent=null;}public void removeViewAt(int n){removeView(children.get(n));}public int getChildCount(){return children.size();}public View getChildAt(int n){return children.get(n);}}''',
'e/e/a/PlaybackBar221.java':'package e.e.a;public class PlaybackBar221{static int removed;static void remove(){removed++;}}',
'e/e/a/DirectBackground235.java':'''package e.e.a;public class DirectBackground235{static class State{int detached;android.app.Activity a;android.view.View p;void detach(){detached++;PlaybackPanels113.release(a,p);}}}''',
'e/e/a/MiniSession225.java':'''package e.e.a;public class MiniSession225{static class Session{int detached;android.app.Activity a;android.view.View p;void detach(){detached++;PlaybackPanels113.release(a,p);}}}''',
'e/e/a/PanelOwnershipTest.java':'''package e.e.a;import android.app.*;import android.view.*;public class PanelOwnershipTest{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("Panel check "+checks);}static View panel(Activity a){View p=new View();p.setTag("nicoid-retained-mini-player");a.content.addView(p);return p;}public static void main(String[] args){Activity a=new Activity();View body=new View();body.setPadding(0,0,0,7);a.content.addView(body);MiniSession225.Session old=new MiniSession225.Session();View first=panel(a);old.a=a;old.p=first;PlaybackPanels113.claim(a,first,body,64,old);check(body.getPaddingBottom()==71);check(PlaybackPanels113.PANELS.size()==1);
View second=panel(a);DirectBackground235.State current=new DirectBackground235.State();current.a=a;current.p=second;PlaybackPanels113.claim(a,second,body,64,current);check(first.getParent()==null);check(old.detached==1);check(second.getParent()==a.content);check(body.getPaddingBottom()==71);
// A late pause/destroy callback from the replaced owner cannot release the new reservation.
PlaybackPanels113.release(a,first);check(second.getParent()==a.content);check(body.getPaddingBottom()==71);PlaybackPanels113.claim(a,second,body,64,current);check(second.getParent()==a.content);check(body.getPaddingBottom()==71);
// Independent Activities keep separate ownership and padding.
Activity other=new Activity();View otherBody=new View();other.content.addView(otherBody);View third=panel(other);PlaybackPanels113.claim(other,third,otherBody,56,new Object());check(body.getPaddingBottom()==71);check(otherBody.getPaddingBottom()==56);PlaybackPanels113.release(a,second);check(body.getPaddingBottom()==7);check(second.getParent()==null);check(otherBody.getPaddingBottom()==56);PlaybackPanels113.release(other,third);check(PlaybackPanels113.PANELS.isEmpty());check(otherBody.getPaddingBottom()==0);
System.out.println("PanelOwnershipTest: "+checks+" checks passed");}}'''
}
with tempfile.TemporaryDirectory() as d:
 t=Path(d)
 for name,source in sources.items():
  p=t/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source)
 subprocess.run(['java','-jar',str(Path(sys.argv[1]).resolve()),'-1.8','-warn:none','-d',str(t/'classes'),*map(str,t.rglob('*.java')),str(r/'src/e/e/a/PlaybackPanels113.java')],check=True)
 subprocess.run(['java','-cp',str(t/'classes'),'e.e.a.PanelOwnershipTest'],check=True)
