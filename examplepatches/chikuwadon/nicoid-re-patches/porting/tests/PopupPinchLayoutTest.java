import e.e.a.PopupPinchLayout;
import android.view.*;
import android.content.SharedPreferences;
import java.util.*;

/** Stub-host event-routing checks. These do not substitute for Android device testing. */
public class PopupPinchLayoutTest {
    public static class Prefs implements SharedPreferences, SharedPreferences.Editor {
        public final Map<String,Integer> values = new HashMap<>();
        public int saves;
        public Editor edit() { return this; }
        public Editor putInt(String k, int v) { values.put(k,v); return this; }
        public void apply() { saves++; }
    }
    public static class Renderer { public View a = new View(); }
    public static class Service {
        public View e = new View(), w = new View(), a;
        public int o = 1440, p = 2560, l = 24;
        public float T = 60, S = 810, f0 = 360;
        public WindowManager.LayoutParams U = new WindowManager.LayoutParams();
        public Prefs Q = new Prefs();
        public int updates;
        public WindowManager b = (root, params) -> updates++;
        public static Renderer k0 = new Renderer();
        public static float w0;
        public static int u0, v0;
    }
    static void check(boolean result, String message) {
        if (!result) throw new AssertionError(message);
    }
    static MotionEvent event(int action, int index, int[] ids, float... xs) {
        float[] ys = new float[ids.length]; Arrays.fill(ys,180);
        return new MotionEvent(action,index,ids,xs,ys);
    }
    public static void main(String[] args) {
        PopupPinchLayout root = new PopupPinchLayout(new android.content.Context(),null);
        Service s = new Service(); s.a = root; root.bind(s);
        root.dispatchTouchEvent(event(0,0,new int[]{7},100));
        root.dispatchTouchEvent(event(2,0,new int[]{7},120));
        root.dispatchTouchEvent(event(1,0,new int[]{7},120));
        check(root.forwarded.equals(Arrays.asList(0,2,1)), "single finger/corner unchanged");
        root.forwarded.clear();
        root.dispatchTouchEvent(event(0,0,new int[]{7},220));
        root.dispatchTouchEvent(event(5,1,new int[]{7,11},220,420));
        check(root.forwarded.equals(Arrays.asList(0,3)), "child gesture cancelled");
        check(s.f0==0, "legacy corner state cleared");
        root.dispatchTouchEvent(event(2,0,new int[]{11,7},520,120)); // swapped pointer indexes
        check(s.e.getHeight()==720 && s.e.getWidth()==1280, "stable IDs and pinch out");
        root.dispatchTouchEvent(event(5,2,new int[]{7,11,15},120,520,600));
        root.dispatchTouchEvent(event(6,2,new int[]{7,11,15},120,520,600));
        root.dispatchTouchEvent(event(2,0,new int[]{7,11},270,370));
        check(s.e.getHeight()==180 && s.e.getWidth()==320, "third finger ignored/pinch in");
        int count=s.updates;
        root.dispatchTouchEvent(event(6,1,new int[]{7,11},270,370));
        root.dispatchTouchEvent(event(2,0,new int[]{7},900));
        root.dispatchTouchEvent(event(1,0,new int[]{7},900));
        check(count==s.updates, "no jump after finger lift");
        check(root.forwarded.equals(Arrays.asList(0,3)), "no click/seek after pinch");
        check(s.Q.saves==1 && s.Q.values.get("pop_poh")==180 && s.Q.values.get("pop_ivw")==320,
                "save final bounds once");
        root.dispatchTouchEvent(event(0,0,new int[]{9},150));
        root.dispatchTouchEvent(event(1,0,new int[]{9},150));
        check(root.forwarded.equals(Arrays.asList(0,3,0,1)), "normal input restored");
        root.dispatchTouchEvent(event(0,0,new int[]{7},100));
        root.dispatchTouchEvent(event(5,1,new int[]{7,11},100,300));
        root.dispatchTouchEvent(event(3,0,new int[]{7,11},100,300));
        check(s.Q.saves==1, "cancel before movement does not save");
        System.out.println("Popup event routing: single finger, cancellation, stable IDs, third finger, lift, save and reset passed.");
    }
}
