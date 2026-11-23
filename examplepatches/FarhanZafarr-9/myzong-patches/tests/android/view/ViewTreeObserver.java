package android.view;
import java.util.ArrayList;
public class ViewTreeObserver {
    public interface OnPreDrawListener { boolean onPreDraw(); }
    public final ArrayList<OnPreDrawListener> listeners = new ArrayList<>();
    public boolean isAlive() { return true; }
    public void addOnPreDrawListener(OnPreDrawListener l) { listeners.add(l); }
    public void removeOnPreDrawListener(OnPreDrawListener l) { listeners.remove(l); }
    public boolean draw() {
        boolean draw=true;
        for(OnPreDrawListener l:new ArrayList<>(listeners)) draw &= l.onPreDraw();
        return draw;
    }
}
