package app.zonghome.extension;

import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.WeakHashMap;

/** Bound rows own offer styling. Prevent update crossfades without disabling movement animations. */
final class BundleVisuals {
    private static final WeakHashMap<View, WeakReference<Object>> APPLIED=new WeakHashMap<>();
    private static final HashMap<Class<?>,Method[]> LIST_METHODS=new HashMap<>();
    static boolean isOfferList(View view) {
        String name=ViewNames.name(view);
        return name.equals("recyclerBundle") || name.equals("rvDetails") ||
            name.equals("rvSummary") || name.equals("rvDynamicSearch");
    }
    static void stabilizeParent(View view) {
        for(View current=view;current!=null;current=current.getParent() instanceof View?(View)current.getParent():null)
            if(isOfferList(current)){stabilize(current);return;}
    }
    static void stabilize(View list) {
        Method[] access=LIST_METHODS.get(list.getClass());
        if(access==null) {
            try { access=new Method[]{list.getClass().getMethod("getItemAnimator")}; }
            catch(NoSuchMethodException ignored) { access=new Method[0]; }
            LIST_METHODS.put(list.getClass(),access);
        }
        if(access.length==0)return;
        try {
            Object animator=access[0].invoke(list);
            if(animator==null)return;
            WeakReference<Object> previous=APPLIED.get(list);
            if(previous!=null && previous.get()==animator)return;
            Method setter=animator.getClass().getMethod("setSupportsChangeAnimations",boolean.class);
            setter.setAccessible(true); // The app obfuscates the animator superclass name.
            setter.invoke(animator,false);
            APPLIED.put(list,new WeakReference<>(animator));
        } catch(ReflectiveOperationException | SecurityException ignored) { }
    }
}
