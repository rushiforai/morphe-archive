package e.e.a;

import android.util.Log;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/** A return may use only the playback generation present at foreground entry.
 *  A just-launched popup must not be mistaken for the previous background session. */
public final class ResumeGuard273 {
    private static WeakReference<Object> capturedService = new WeakReference<>(null);
    private static WeakReference<Object> capturedState = new WeakReference<>(null);
    private static final String TAG="nicoid-resume-guard";
    private ResumeGuard273() {}

    private static Object readStatic(String owner, String name) {
        try {
            Class<?> cls=Class.forName(owner);
            for (Class<?> c=cls;c!=null;c=c.getSuperclass()) try {
                Field f=c.getDeclaredField(name);f.setAccessible(true);
                Object value=f.get(null);
                return value instanceof Reference ? ((Reference<?>)value).get() : value;
            } catch(NoSuchFieldException ignored) {}
        } catch(Exception ignored) {}
        return null;
    }

    private static Object state() {
        return readStatic("e.e.a.DirectBackground235","active");
    }
    private static Object readInstance(Object owner, String name) {
        if(owner==null)return null;
        for(Class<?> c=owner.getClass();c!=null;c=c.getSuperclass())try {
            Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner);
        }catch(Exception ignored){}
        return null;
    }

    /** Called once as the app enters foreground, before any delayed retry. */
    public static boolean capture(Object existingService) {
        Object existingState=state();
        capturedService=new WeakReference<>(existingService);
        capturedState=new WeakReference<>(existingState);
        boolean accepted=existingService!=null || existingState!=null;
        Log.i(TAG,"Foreground playback captured: service="+(existingService!=null)
                +" pendingState="+(existingState!=null)+" accepted="+accepted);
        return accepted;
    }

    /** The first captured generation must still be the generation being returned. */
    public static boolean matches(Object serviceNow) {
        Object service=capturedService.get();
        Object pending=capturedState.get();
        if(service==null && pending==null)return false;
        if(service!=null && service!=serviceNow)return false;
        if(pending!=null && pending!=state())return false;
        // A state that was still preparing its service may only return the
        // service produced by *that* state, never a later independent popup.
        if(service==null && pending!=null && serviceNow!=null
                && readInstance(pending,"service")!=serviceNow)return false;
        if(service==null && serviceNow==null)return pending!=null;
        return true;
    }
}
