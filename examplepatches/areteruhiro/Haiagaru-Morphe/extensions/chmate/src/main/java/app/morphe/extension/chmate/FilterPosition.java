package app.morphe.extension.chmate;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/** One bounded, filter-specific anchor restoration; never changes filtering or network requests. */
public final class FilterPosition {
    private static final ArrayList<WeakReference<Object>> fragments = new ArrayList<>();
    private static final WeakHashMap<View, Pending> pending = new WeakHashMap<>();
    private static final java.util.HashMap<Class<?>, Field> responseFields = new java.util.HashMap<>();
    private FilterPosition() {}

    public static void register(Object fragment) {
        PopularReplies.register(fragment);
        fragments.removeIf(ref -> ref.get() == null || ref.get() == fragment);
        fragments.add(new WeakReference<>(fragment));
    }

    public static void beforeModel(Object model) {
        if (!Haiagaru.keepQuickFilterPosition()) return;
        for (WeakReference<Object> ref : new ArrayList<>(fragments)) {
            Object fragment = ref.get();
            if (fragment == null) continue;
            try {
                if (QuickFilterToolbar.findResponseViewModel(fragment) == model) beforeFragment(fragment);
            } catch (Exception error) { Log.w("Haiagaru", "Filter model unavailable", error); }
        }
    }

    public static void beforeFragment(Object fragment) {
        beforeFragment(fragment, false);
    }

    static void beforeFragment(Object fragment, boolean required) {
        if (!required && !Haiagaru.keepQuickFilterPosition()) return;
        try {
            View root = (View) fragment.getClass().getMethod("getView").invoke(fragment);
            View list = findList(root);
            if (list == null || !list.isShown()) return;
            Pending previous = pending.remove(list);
            if (previous != null) previous.close();
            Pending next = new Pending(list, required);
            if (next.anchor < 0) return;
            pending.put(list, next);
            if (next.adapter instanceof ListAdapter) ((ListAdapter) next.adapter).registerDataSetObserver(next.observer);
            list.getViewTreeObserver().addOnPreDrawListener(next);
            list.addOnAttachStateChangeListener(next);
            next.handler.postDelayed(next.timeout, 3000);
        } catch (Exception error) { Log.w("Haiagaru", "Unable to retain filter position", error); }
    }

    static View findList(View root) {
        return findList(root,true);
    }
    /** Fragment binding may run before its response list becomes visible. */
    static View findListForBinding(View root) {
        return findList(root,false);
    }
    private static View findList(View root,boolean visibleOnly) {
        if (root == null) return null;
        if (root instanceof ListView) return root;
        for (Class<?> type = root.getClass(); type != null; type = type.getSuperclass())
            if (type.getName().equals("androidx.recyclerview.widget.RecyclerView")) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findList(group.getChildAt(i),visibleOnly);
                if (found != null && (!visibleOnly||found.isShown())) return found;
            }
        }
        return null;
    }

    /** Explicit user-requested navigation only; never used when simply closing a popup. */
    static boolean jumpToResponse(Object fragment,int number) throws Exception {
        return jumpToResponse(fragment, number, 0);
    }

    static boolean jumpToResponse(Object fragment,int number,int offset) throws Exception {
        View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
        View list=findList(root);
        if(list==null)return false;
        Object adapter=call(list,"getAdapter",new Class<?>[0]);
        if(adapter==null)return false;
        Method item=list instanceof ListView?adapter.getClass().getMethod("getItem",int.class):findItem(adapter);
        item.setAccessible(true);
        int count=((Number)call(adapter,list instanceof ListView?"getCount":"getItemCount",new Class<?>[0])).intValue();
        for(int i=0;i<count;i++) {
            Object row=item.invoke(adapter,i);
            if(row==null)continue;
            for(Class<?> type=row.getClass();type!=null;type=type.getSuperclass())for(Field field:type.getDeclaredFields()) {
                String name=field.getType().getName();
                if(!name.equals("o.processAdDisplayErrorPostbackForUserError")&&!name.equals("o.BouncyCastleSocketAdapterCompanion")&&!name.equals("o.KeJ11"))continue;
                field.setAccessible(true);Object response=field.get(row);if(response==null)continue;
                String key=name.equals("o.BouncyCastleSocketAdapterCompanion")?"l":"o";
                if(((Number)ResponseArchiveEntry.field(response,key)).intValue()!=number)continue;
                if(list instanceof ListView)((ListView)list).setSelectionFromTop(i,offset);
                else {
                    Object manager=call(list,"getLayoutManager",new Class<?>[0]);
                    if(item.getReturnType().getName().equals("o.zzadi")) {
                        call(list,"scrollToPosition",new Class<?>[]{int.class},i);
                        Field pendingOffset=inheritedField(manager.getClass(),"k");
                        pendingOffset.setAccessible(true);pendingOffset.setInt(manager,offset);list.requestLayout();
                    } else call(manager,"c",new Class<?>[]{int.class,int.class},i,offset);
                }
                return true;
            }
        }
        return false;
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }

    private static Field inheritedField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try { return current.getDeclaredField(name); }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static final class Pending implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        final View list;
        final Object adapter;
        final boolean required;
        final Method item, count;
        final List<Object> before;
        final Object firstRow;
        final int anchor, offset;
        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable timeout = this::close;
        boolean closed;
        boolean changed;
        final android.database.DataSetObserver observer = new android.database.DataSetObserver() {
            @Override public void onChanged() { changed = true; }
            @Override public void onInvalidated() { close(); }
        };

        Pending(View list, boolean required) throws Exception {
            this.required = required;
            this.list = list;
            adapter = call(list, "getAdapter", new Class<?>[0]);
            if (adapter == null) throw new IllegalStateException("Response adapter missing");
            boolean legacy = list instanceof ListView;
            count = adapter.getClass().getMethod(legacy ? "getCount" : "getItemCount");
            item = legacy ? adapter.getClass().getMethod("getItem", int.class) : findItem(adapter);
            count.setAccessible(true);
            item.setAccessible(true);
            before = rows();
            firstRow = before.isEmpty() ? null : item.invoke(adapter, 0);
            ViewGroup group = (ViewGroup) list;
            int position = -1, top = 0;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child.getBottom() <= list.getPaddingTop()) continue;
                int index = legacy ? ((ListView) list).getPositionForView(child)
                        : (Integer) call(list, "getChildAdapterPosition", new Class<?>[]{View.class}, child);
                if (index >= 0 && index < before.size() && before.get(index) != null) {
                    position = index;
                    top = child.getTop() - list.getPaddingTop();
                    break;
                }
            }
            anchor = position;
            offset = top;
        }

        private List<Object> rows() throws Exception {
            int size = (Integer) count.invoke(adapter);
            ArrayList<Object> result = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                if (adapter instanceof ListAdapter) {
                    long id = ((ListAdapter) adapter).getItemId(i);
                    result.add(id > 0 ? Long.valueOf(id) : null);
                } else result.add(responseKey(item.invoke(adapter, i)));
            }
            return result;
        }

        @Override public boolean onPreDraw() {
            if (closed) return true;
            if ((!required && !Haiagaru.keepQuickFilterPosition()) || !list.isShown()) { close(); return true; }
            try {
                if (call(list, "getAdapter", new Class<?>[0]) != adapter) { close(); return true; }
                List<Object> after = rows();
                if (!changed && before.equals(after) && (after.isEmpty() || item.invoke(adapter, 0) == firstRow))
                    return true; // Wait for the asynchronous native list commit.
                int target = FilterPositionAnchor.nearest(before, after, anchor);
                close();
                if (target < 0) return true; // No responses remain; leave the native empty state alone.
                int top = before.get(anchor).equals(after.get(target)) ? offset : 0;
                if (list instanceof ListView) ((ListView) list).setSelectionFromTop(target, top);
                else {
                    Object manager = call(list, "getLayoutManager", new Class<?>[0]);
                    if (item.getReturnType().getName().equals("o.zzadi")) {
                        // 242 inlined scrollToPositionWithOffset. The native scroll call
                        // invalidates saved state; k is its verified pending offset field.
                        call(list, "scrollToPosition", new Class<?>[]{int.class}, target);
                        Field pendingOffset = inheritedField(manager.getClass(), "k");
                        pendingOffset.setAccessible(true);
                        pendingOffset.setInt(manager, top);
                        list.requestLayout();
                    } else {
                        call(manager, "c", new Class<?>[]{int.class, int.class}, target, top);
                    }
                }
                return false; // Apply the new anchor before displaying a frame at response 1.
            } catch (Exception error) {
                close();
                Log.w("Haiagaru", "Unable to restore filter position", error);
                return true;
            }
        }

        void close() {
            if (closed) return;
            closed = true;
            handler.removeCallbacks(timeout);
            if (adapter instanceof ListAdapter) ((ListAdapter) adapter).unregisterDataSetObserver(observer);
            if (list.getViewTreeObserver().isAlive()) list.getViewTreeObserver().removeOnPreDrawListener(this);
            list.removeOnAttachStateChangeListener(this);
            if (pending.get(list) == this) pending.remove(list);
        }
        @Override public void onViewDetachedFromWindow(View view) { close(); }
        @Override public void onViewAttachedToWindow(View view) {}
    }

    static Method findItem(Object adapter) throws Exception {
        // Exact typed accessors verified against the supported original APKs.
        for (Method method : adapter.getClass().getDeclaredMethods()) {
            if (method.getParameterTypes().length == 1 && method.getParameterTypes()[0] == int.class
                    && !method.getReturnType().isPrimitive() && method.getReturnType() != Object.class
                    && !method.getReturnType().getName().startsWith("java.")) {
                String type = method.getReturnType().getName();
                if (type.equals("o.Scopes") || type.equals("o.zzadi")) return method;
            }
        }
        throw new IllegalStateException("Native response-list item accessor missing");
    }

    /** A row's response object is shared across filtering; header/ad rows have no such field. */
    private static Object responseKey(Object row) {
        if (row == null) return null;
        Class<?> type = row.getClass();
        if (!responseFields.containsKey(type)) {
            Field response = null;
            for (Field field : type.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                String name = field.getType().getName();
                if (!name.equals("o.setDislikeWidth") && !name.equals("o.KeJ11")) continue;
                field.setAccessible(true);
                response = field;
                break;
            }
            responseFields.put(type, response);
        }
        Field field = responseFields.get(type);
        try { return field == null ? null : field.get(row); }
        catch (IllegalAccessException ignored) {}
        return null;
    }

}
