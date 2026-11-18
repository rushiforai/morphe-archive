#!/usr/bin/env python3
"""Compile the production TikTok hook and exercise layout/queue regressions with Android fakes."""
from pathlib import Path
import subprocess
import tempfile
ROOT = Path(__file__).resolve().parents[1]
SOURCES = {
    'android/os/SystemClock.java': """
package android.os;
public class SystemClock {
    public static long now;
    public static long uptimeMillis() { return now; }
}
""",
    'android/view/ViewTreeObserver.java': """
package android.view;
public class ViewTreeObserver {
    public interface OnPreDrawListener { boolean onPreDraw(); }
    public java.util.List<OnPreDrawListener> listeners = new java.util.ArrayList<>();
    public void addOnPreDrawListener(OnPreDrawListener l) { listeners.add(l); }
    public void removeOnPreDrawListener(OnPreDrawListener l) { listeners.remove(l); }
    public boolean isAlive() { return true; }
    public void draw() { for (OnPreDrawListener l : new java.util.ArrayList<>(listeners)) l.onPreDraw(); }
}
""",
    'android/view/View.java': """
package android.view;
public class View {
    public interface OnAttachStateChangeListener {
        void onViewAttachedToWindow(View v); void onViewDetachedFromWindow(View v);
    }
    public int top, height, width, paddingTop, paddingBottom, screenOffset;
    public Object parent;
    public float translationY;
    public float getTranslationY() { return translationY; }
    public boolean attached = true, focus = true, acceptsPosts = true;
    public java.util.List<Runnable> callbacks = new java.util.ArrayList<>();
    public ViewTreeObserver observer = new ViewTreeObserver();
    public java.util.List<OnAttachStateChangeListener> attach = new java.util.ArrayList<>();
    public int getTop() { return top; } public int getBottom() { return top + height; }
    public int getHeight() { return height; } public int getWidth() { return width; }
    public int getPaddingTop() { return paddingTop; } public int getPaddingBottom() { return paddingBottom; }
    public Object getParent() { return parent; }
    public void getLocationOnScreen(int[] xy) { xy[0] = 0; xy[1] = top + screenOffset; }
    public boolean postDelayed(Runnable r, long delay) {
        if (!acceptsPosts) return false;
        callbacks.add(r); return true;
    }
    public boolean removeCallbacks(Runnable r) { return callbacks.remove(r); }
    public void expire() {
        android.os.SystemClock.now += 1001;
        for (Runnable r : new java.util.ArrayList<>(callbacks)) r.run();
    }
    public boolean isShown() { return attached; } public boolean isAttachedToWindow() { return attached; } public boolean hasWindowFocus() { return focus; }
    public ViewTreeObserver getViewTreeObserver() { return observer; }
    public void addOnAttachStateChangeListener(OnAttachStateChangeListener l) { attach.add(l); }
    public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l) { attach.remove(l); }
    public void detach() {
        attached = false;
        for (OnAttachStateChangeListener l : new java.util.ArrayList<>(attach)) l.onViewDetachedFromWindow(this);
    }
}
""",
    'androidx/recyclerview/widget/RecyclerView.java': """
package androidx.recyclerview.widget;
import android.view.View;
public class RecyclerView extends View {
    public static class LayoutManager { public int count=150; public int getItemCount(){return count;} }
    public LinearLayoutManager lm=new LinearLayoutManager();
    public int state, shift, scrollCalls;
    public boolean stable=true;
    public long changedId;
    public java.util.List<View> children=new java.util.ArrayList<>();
    public int getScrollState(){return state;}
    public LayoutManager getLayoutManager(){return lm;}
    public int getChildCount(){return children.size();}
    public View getChildAt(int i){return children.get(i);}
    public int getChildAdapterPosition(View v){return children.contains(v)?20+children.indexOf(v)+shift:-1;}
    public long getChildItemId(View v){return stable?100+children.indexOf(v)+changedId:-1;}
    public void scrollBy(int x,int y){scrollCalls++; for(View v:children)v.top-=y;}
}
""",
    'androidx/recyclerview/widget/LinearLayoutManager.java': """
package androidx.recyclerview.widget;
public class LinearLayoutManager extends RecyclerView.LayoutManager {
    public int first=20;
    public int findFirstVisibleItemPosition(){return first;}
}
""",
    'HookTest.java': """
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import pl.dudek.extension.tiktok.KeepDmScrollPosition;
public class HookTest {
    static int checks;
    static void check(boolean ok,String name){checks++;if(!ok)throw new AssertionError(name);}
    static RecyclerView list(boolean history){
        RecyclerView r=new RecyclerView();r.width=400;r.height=800;r.lm.first=history?20:0;
        for(int i=0;i<3;i++){View v=new View();v.top=-40+300*i;v.height=300;v.parent=r;r.children.add(v);}
        KeepDmScrollPosition.attach(r);r.observer.draw();return r;
    }
    static float y(RecyclerView r){return r.children.get(0).top+r.children.get(0).translationY+r.top+r.screenOffset;}
    static void resize(RecyclerView r,int delta){r.height+=delta;for(View v:r.children)v.top+=delta;}
    public static void main(String[]args){
        check(!KeepDmScrollPosition.shouldSkipAutoScroll(null),"null list");
        RecyclerView r=list(true);
        check(KeepDmScrollPosition.shouldSkipAutoScroll(r),"ordinary message in history");
        check(KeepDmScrollPosition.shouldSkipAutoScroll(r),"reply and subsequent queued requests");
        r.observer.draw();check(KeepDmScrollPosition.shouldSkipAutoScroll(r),"delayed request after frame");
        KeepDmScrollPosition.attach(r);check(r.observer.listeners.size()==1,"idempotent attach");
        KeepDmScrollPosition.requestLatest();check(!KeepDmScrollPosition.shouldSkipAutoScroll(r),"explicit latest allowed");
        check(KeepDmScrollPosition.shouldSkipAutoScroll(r),"permission consumed");
        r.detach();check(!KeepDmScrollPosition.shouldSkipAutoScroll(r),"detached list");
        check(r.observer.listeners.isEmpty()&&r.attach.isEmpty(),"listeners removed");
        r=list(false);r.lm.first=1;r.shift++;r.lm.count++;
        check(!KeepDmScrollPosition.shouldSkipAutoScroll(r),"bottom insertion uses pre-update position");r.detach();
        r=list(false);resize(r,60);r.observer.draw();check(r.scrollCalls==0,"bottom resize unchanged");r.detach();
        for(boolean stable:new boolean[]{true,false}){
            r=list(true);r.stable=stable;r.observer.draw();float start=y(r);
            // Plain/multiline input collapse plus insertion at position zero.
            r.shift++;r.lm.count++;resize(r,60);r.observer.draw();
            check(y(r)==start,"composer collapse with insert stable="+stable);
            resize(r,-200);r.observer.draw();check(y(r)==start,"keyboard opening stable="+stable);
            r.paddingBottom+=30;for(View v:r.children)v.top-=30;r.observer.draw();
            check(y(r)==start,"bottom inset stable="+stable);r.detach();
        }
        r=list(true);float commitY=y(r);
        KeepDmScrollPosition.shouldSkipAutoScroll(r);
        r.shift++;r.lm.count++;for(View v:r.children)v.top+=45;r.observer.draw();
        check(y(r)==commitY,"dataset shift without viewport resize");
        for(View v:r.children)v.top+=20;r.observer.draw();
        check(y(r)==commitY,"delayed dataset movement");
        KeepDmScrollPosition.navigateToMessage();for(View v:r.children)v.top-=100;r.observer.draw();
        check(y(r)==commitY-100,"explicit navigation cancels commit anchor");r.detach();
        r=list(true);float start=y(r);resize(r,60);for(View v:r.children)v.translationY=-60;r.observer.draw();
        check(y(r)==start,"resize initially hidden by item animation");
        for(View v:r.children)v.translationY=-30;r.observer.draw();check(y(r)==start,"animation halfway");
        for(View v:r.children)v.translationY=0;r.observer.draw();check(y(r)==start,"animation completion");
        r.state=1;for(View v:r.children)v.top-=70;r.observer.draw();
        check(y(r)==start-70,"manual drag wins");r.state=0;r.observer.draw();
        resize(r,40);r.observer.draw();check(y(r)==start-70,"anchor follows new manual position");r.detach();
        r=list(true);resize(r,60);r.changedId++;r.observer.draw();check(r.scrollCalls==0,"rebound stable ID rejected");r.detach();
        r=list(true);KeepDmScrollPosition.navigateToMessage();resize(r,60);r.observer.draw();
        check(r.scrollCalls==0,"quote/search navigation wins");r.detach();
        r=list(true);KeepDmScrollPosition.requestLatest();r.state=1;r.observer.draw();r.state=0;r.observer.draw();
        check(KeepDmScrollPosition.shouldSkipAutoScroll(r),"drag cancels pending latest request");r.detach();
        r=list(true);r.width=600;resize(r,60);r.observer.draw();check(r.scrollCalls==0,"rotation does not restore old geometry");r.detach();
        r=list(true);r.focus=false;resize(r,60);r.observer.draw();check(r.scrollCalls==0,"focus loss");r.detach();
        r=list(true);r.children.clear();check(!KeepDmScrollPosition.shouldSkipAutoScroll(r),"empty list initial load");r.detach();
        System.out.println("PASS: "+checks+" TikTok queue, viewport, animation, navigation and lifecycle checks");
    }
}
""",
}
with tempfile.TemporaryDirectory(prefix='dudeks-tiktok-hook-') as temp:
    folder=Path(temp)
    files=[]
    for name,source in SOURCES.items():
        p=folder/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(source);files.append(str(p))
    production=ROOT/'extensions/tiktok/src/main/java/pl/dudek/extension/tiktok/KeepDmScrollPosition.java'
    subprocess.run(['javac','-d',str(folder),*files,str(production)],check=True)
    subprocess.run(['java','-cp',str(folder),'HookTest'],check=True)
