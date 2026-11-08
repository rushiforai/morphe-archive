package app.morphe.extension.boost;

import android.view.View;
import android.view.ViewTreeObserver;
import java.util.ArrayList;
import java.util.WeakHashMap;

/**
 * One pre-draw listener per window for short per-row checks. Rows enter and leave the
 * viewport constantly, and ViewTreeObserver copies its listener list after each change.
 */
final class FrameBus implements ViewTreeObserver.OnPreDrawListener {
    private static final WeakHashMap<ViewTreeObserver,FrameBus> BUSES=new WeakHashMap<>();
    private final ArrayList<ViewTreeObserver.OnPreDrawListener> listeners=new ArrayList<>();
    private boolean dispatching,removed;
    private FrameBus() { }
    /** Returns the observer the listener joined, or null while the view has no window. */
    static ViewTreeObserver add(View view,ViewTreeObserver.OnPreDrawListener listener) {
        if(!view.isAttachedToWindow())return null;
        ViewTreeObserver tree=view.getViewTreeObserver();FrameBus bus=BUSES.get(tree);
        if(bus==null){bus=new FrameBus();BUSES.put(tree,bus);tree.addOnPreDrawListener(bus);}
        if(!bus.listeners.contains(listener))bus.listeners.add(listener);
        return tree;
    }
    static void remove(ViewTreeObserver tree,ViewTreeObserver.OnPreDrawListener listener) {
        FrameBus bus=tree==null ? null:BUSES.get(tree);if(bus==null)return;
        int index=bus.listeners.indexOf(listener);if(index<0)return;
        if(bus.dispatching){bus.listeners.set(index,null);bus.removed=true;}
        else bus.listeners.remove(index);
    }
    @Override public boolean onPreDraw() {
        dispatching=true;
        for(int index=0;index<listeners.size();index++){ViewTreeObserver.OnPreDrawListener listener=listeners.get(index);if(listener!=null)listener.onPreDraw();}
        dispatching=false;
        if(removed){removed=false;for(int index=listeners.size()-1;index>=0;index--)if(listeners.get(index)==null)listeners.remove(index);}
        return true;
    }
}
