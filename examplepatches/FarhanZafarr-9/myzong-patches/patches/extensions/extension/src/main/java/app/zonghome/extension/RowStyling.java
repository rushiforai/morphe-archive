package app.zonghome.extension;

import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;
import java.lang.reflect.Field;
import java.util.HashMap;

public final class RowStyling {
    private RowStyling() {}
    private static final HashMap<Class<?>, Field> ROOT_FIELDS = new HashMap<>();
    private static final WeakHashMap<View, Pending> PENDING = new WeakHashMap<>();
    public static void onBound(Object holder) {
        if (holder == null) return;
        Class<?> type = holder.getClass();
        Field field = ROOT_FIELDS.get(type);
        if (!ROOT_FIELDS.containsKey(type)) {
            try { field = type.getField("itemView"); }
            catch (NoSuchFieldException ignored) {
                for (Class<?> parent = type.getSuperclass(); parent != null && field == null; parent = parent.getSuperclass()) {
                    if (!parent.getName().startsWith("androidx.recyclerview.widget.RecyclerView$")) continue;
                    for (Field candidate : parent.getDeclaredFields()) {
                        if (candidate.getType() == View.class) { candidate.setAccessible(true); field = candidate; break; }
                    }
                }
            }
            ROOT_FIELDS.put(type, field);
        }
        if (field == null) return;
        try {
            View view = (View)field.get(holder);
            onInflatedView(view);
            if (view != null && !PENDING.containsKey(view)) {
                Pending pending = new Pending(view);
                PENDING.put(view, pending);
                view.addOnAttachStateChangeListener(pending);
                pending.attach(view);
            }
        }
        catch (IllegalAccessException ignored) { }
    }
    private static final class Pending implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        private final WeakReference<View> root;
        private ViewTreeObserver observer;
        Pending(View view) { root = new WeakReference<>(view); }
        void attach(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = view.getViewTreeObserver();
            observer.removeOnPreDrawListener(this);
            observer.addOnPreDrawListener(this);
        }
        void detach() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
            View view = root.get();
            if (view != null) { view.removeOnAttachStateChangeListener(this); PENDING.remove(view); }
        }
        @Override public boolean onPreDraw() {
            View view = root.get();
            detach();
            if (view != null) onInflatedView(view);
            return true;
        }
        @Override public void onViewAttachedToWindow(View view) { attach(view); }
        @Override public void onViewDetachedFromWindow(View view) { detach(); }
    }
    public static void onInflatedView(View view) {
        if (view == null) return;
        CharcoalTheme.onBoundView(view);
        if (NavigationStyle.shapes()) MaterialShapes.apply(view);
    }
}
