package app.morphe.extension.chmate;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.ListView;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Retain the current viewport across a display-only asynchronous preview resize. */
final class XPostPreviewPosition {
    private static final WeakHashMap<View, Anchor> PENDING = new WeakHashMap<>();
    private static final WeakHashMap<View,Long> INTERACTIONS=new WeakHashMap<>();
    static void onTouch(View body,android.view.MotionEvent event){
        if(event.getActionMasked()!=android.view.MotionEvent.ACTION_DOWN&&event.getActionMasked()!=android.view.MotionEvent.ACTION_MOVE)return;
        for(ViewParent parent=body.getParent();parent instanceof View;parent=parent.getParent()){
            View view=(View)parent;
            if(view instanceof ListView||isRecycler(view)){
                INTERACTIONS.put(view,android.os.SystemClock.uptimeMillis());Anchor pending=PENDING.get(view);if(pending!=null)pending.close();return;
            }
        }
    }
    private static boolean isRecycler(View view){for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("androidx.recyclerview.widget.RecyclerView"))return true;return false;}
    private static boolean interacting(View view){
        Long last=INTERACTIONS.get(view);if(last!=null&&android.os.SystemClock.uptimeMillis()-last<800)return true;
        if(isRecycler(view))try{return ((Number)call(view,"getScrollState",new Class<?>[0])).intValue()!=0;}catch(Exception ignored){}
        return false;
    }

    static void beforeChange(View body) {
        // Initial binding/refresh belongs to native restoration, not preview resizing.
        if(body.getHeight()==0||!body.isShown()||body.isLayoutRequested())return;
        for (ViewParent parent = body.getParent(); parent instanceof View; parent = parent.getParent()) {
            View view = (View) parent;
            boolean recycler = false;
            for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass())
                if (type.getName().equals("androidx.recyclerview.widget.RecyclerView")) recycler = true;
            if (!(view instanceof ListView) && !recycler) continue;
            if (PENDING.containsKey(view) || !view.isShown() || view.isLayoutRequested() || interacting(view)) return;
            try {
                Anchor anchor = new Anchor((ViewGroup) view);
                if (anchor.position < 0) return;
                PENDING.put(view, anchor);
                view.getViewTreeObserver().addOnPreDrawListener(anchor);
                view.postDelayed(anchor::close, 500);
            } catch (Exception ignored) { /* Unsupported list: leave native scrolling untouched. */ }
            return;
        }
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }

    private static final class Anchor implements ViewTreeObserver.OnPreDrawListener {
        final ViewGroup list;
        final Object adapter;
        final int count, position, top;
        final boolean bottom;
        final View lastRow;
        boolean closed;
        Anchor(ViewGroup list) throws Exception {
            this.list = list;
            adapter = call(list, "getAdapter", new Class<?>[0]);
            count = count();
            bottom = list.canScrollVertically(-1) && !list.canScrollVertically(1);
            lastRow = list.getChildCount() == 0 ? null : list.getChildAt(list.getChildCount() - 1);
            View first = list.getChildCount() == 0 ? null : list.getChildAt(0);
            position = first == null ? -1 : list instanceof ListView
                    ? ((ListView) list).getFirstVisiblePosition()
                    : (Integer) call(list, "getChildAdapterPosition", new Class<?>[]{View.class}, first);
            top = first == null ? 0 : first.getTop() - list.getPaddingTop();
        }
        int count() throws Exception {
            return (Integer) call(adapter, list instanceof ListView ? "getCount" : "getItemCount", new Class<?>[0]);
        }
        @Override public boolean onPreDraw() {
            if (closed) return true;
            if (list.isLayoutRequested()) return true;
            close();
            try {
                if (!list.isShown() || interacting(list) || adapter != call(list, "getAdapter", new Class<?>[0]) || count != count()) return true;
                View first=list.getChildCount()==0?null:list.getChildAt(0);
                int current=first==null?-1:list instanceof ListView?((ListView)list).getFirstVisiblePosition():(Integer)call(list,"getChildAdapterPosition",new Class<?>[]{View.class},first);
                if(current!=position)return true;
                if(!bottom&&first!=null&&first.getTop()-list.getPaddingTop()==top)return true;
                int target = position, offset = top;
                if (bottom && count > 0) {
                    View last = lastRow;
                    if (last == null) return true;
                    int lastPosition = list instanceof ListView ? ((ListView) list).getPositionForView(last)
                            : (Integer) call(list, "getChildAdapterPosition", new Class<?>[]{View.class}, last);
                    if (lastPosition != count - 1) return true;
                    target = count - 1;
                    offset = list.getHeight() - list.getPaddingBottom() - list.getPaddingTop() - last.getHeight();
                    if(Math.abs(last.getBottom()-(list.getHeight()-list.getPaddingBottom()))<=1)return true;
                }
                if (list instanceof ListView) ((ListView) list).setSelectionFromTop(target, offset);
                else {
                    Object manager = call(list, "getLayoutManager", new Class<?>[0]);
                    call(list, "scrollToPosition", new Class<?>[]{int.class}, target);
                    // 242's inlined LinearLayoutManager pending offset, same binding as FilterPosition.
                    java.lang.reflect.Field field = manager.getClass().getDeclaredField("k");
                    field.setAccessible(true);
                    field.setInt(manager, offset);
                    list.requestLayout();
                }
                return false;
            } catch (Exception ignored) { return true; }
        }
        void close() {
            if (closed) return;
            closed = true;
            if (list.getViewTreeObserver().isAlive()) list.getViewTreeObserver().removeOnPreDrawListener(this);
            if (PENDING.get(list) == this) PENDING.remove(list);
        }
    }
}
