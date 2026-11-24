package app.morphe.extension.chmate;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.graphics.Rect;
import android.widget.ListView;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Retain the current viewport across a display-only asynchronous preview resize. */
final class XPostPreviewPosition {
    static final String ENABLED="previewScrollPositionRetention";
    private static final WeakHashMap<View, Anchor> PENDING = new WeakHashMap<>();
    private static final WeakHashMap<View,Long> INTERACTIONS=new WeakHashMap<>();
    private static final WeakHashMap<View,Boolean> WATCHED=new WeakHashMap<>();
    private static final WeakHashMap<View,Long> OPENED=new WeakHashMap<>();
    static void opening(View list){
        if(list==null)return;
        if(!WATCHED.containsKey(list)){
            WATCHED.put(list,true);
            list.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener(){
                public void onViewAttachedToWindow(View view){opening(view);}
                public void onViewDetachedFromWindow(View view){cancel(view);}
            });
        }
        Anchor previous=PENDING.get(list);if(previous!=null)previous.close();
        INTERACTIONS.remove(list);
        OPENED.put(list,android.os.SystemClock.uptimeMillis());
    }
    private static boolean enabled(View view){
        android.content.SharedPreferences prefs = FeatureSwitches.prefs(view.getContext());
        return prefs.getBoolean(ENABLED, true) && ReadingPosition.defaultEnabled(prefs);
    }
    static boolean hasUserInteraction(View list){return INTERACTIONS.containsKey(list);}
    static void onTouch(View body,android.view.MotionEvent event){
        // Reading-position recovery also needs to yield to touches when the
        // separate preview-resize retention switch is disabled.
        if(event.getActionMasked()!=android.view.MotionEvent.ACTION_DOWN&&event.getActionMasked()!=android.view.MotionEvent.ACTION_MOVE)return;
        for(ViewParent parent=body.getParent();parent instanceof View;parent=parent.getParent()){
            View view=(View)parent;
            if(view instanceof ListView||isRecycler(view)){
                INTERACTIONS.put(view,android.os.SystemClock.uptimeMillis());Anchor pending=PENDING.get(view);if(pending!=null)pending.close();return;
            }
        }
    }
    private static boolean isRecycler(View view){for(Class<?> type=view.getClass();type!=null;type=type.getSuperclass())if(type.getName().equals("androidx.recyclerview.widget.RecyclerView"))return true;return false;}
    static boolean interacting(View view){
        if(view.isPressed())return true;
        Long last=INTERACTIONS.get(view);if(last!=null&&android.os.SystemClock.uptimeMillis()-last<800)return true;
        if(isRecycler(view))try{return ((Number)call(view,"getScrollState",new Class<?>[0])).intValue()!=0;}catch(Exception ignored){}
        return false;
    }

    static void beforeChange(View body) {
        // Initial binding/refresh belongs to native restoration, not preview resizing.
        if(body.getHeight()==0||!body.isShown())return;
        for (ViewParent parent = body.getParent(); parent instanceof View; parent = parent.getParent()) {
            View view = (View) parent;
            boolean recycler = false;
            for (Class<?> type = view.getClass(); type != null; type = type.getSuperclass())
                if (type.getName().equals("androidx.recyclerview.widget.RecyclerView")) recycler = true;
            if (!(view instanceof ListView) && !recycler) continue;
            beforeListChange(view);
            return;
        }
    }

    /** All display-only resizes share one anchor, including native thumbnail rebinds. */
    static void beforeListChange(View view) {
        if(!(view instanceof ViewGroup)||!view.isShown()||!enabled(view)||interacting(view)||ReadingPosition.nativeRestoring(view)||FilterPosition.changing(view))return;
        Long opened=OPENED.get(view);
        // Initial endpoint frames still belong to native unread restoration.
        if(opened!=null&&android.os.SystemClock.uptimeMillis()-opened<1500
                &&(!view.canScrollVertically(-1)||!view.canScrollVertically(1)))return;
        Anchor existing=PENDING.get(view);
        if(existing!=null){existing.changed();return;}
        try{
            Anchor anchor=new Anchor((ViewGroup)view);
            if(anchor.position<0||anchor.adapter==null)return;
            PENDING.put(view,anchor);
            ReadingPosition.previewCaptured(view);
            view.getViewTreeObserver().addOnPreDrawListener(anchor);
            anchor.changed();
        }catch(Exception ignored){/* Unsupported lists keep native scrolling. */}
    }
    static boolean pending(View view){return PENDING.containsKey(view);}
    static void cancel(View view){Anchor anchor=PENDING.get(view);if(anchor!=null)anchor.close();}

    static void settingsChanged(){
        for(Anchor anchor:new java.util.ArrayList<>(PENDING.values()))if(anchor!=null)anchor.close();
        PENDING.clear();
        INTERACTIONS.clear();
    }

    private static Object call(Object target, String name, Class<?>[] types, Object... args) throws Exception {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, args);
    }

    private static final class Anchor implements ViewTreeObserver.OnPreDrawListener {
        final ViewGroup list;
        final Object adapter;
        final int count, position, top, responseNumber;
        final boolean bottom;
        final int width,height,viewportTop,viewportBottom;
        final long started=android.os.SystemClock.uptimeMillis();
        long quietUntil,deadline;
        int corrections;
        boolean closed,correcting;
        final Runnable timeout=this::expire;
        Anchor(ViewGroup list) throws Exception {
            this.list = list;
            adapter = call(list, "getAdapter", new Class<?>[0]);
            count = count();
            width=list.getWidth();height=list.getHeight();
            int[] bounds=viewport(list);viewportTop=bounds[0];viewportBottom=bounds[1];
            bottom = list.canScrollVertically(-1) && !list.canScrollVertically(1);
            View first=null;
            for(int i=0;i<list.getChildCount();i++)if(list.getChildAt(i).getBottom()>viewportTop){first=list.getChildAt(i);break;}
            position = first == null ? -1 : list instanceof ListView
                    ? ((ListView) list).getPositionForView(first)
                    : (Integer) call(list, "getChildAdapterPosition", new Class<?>[]{View.class}, first);
            top = first == null ? 0 : first.getTop() - list.getPaddingTop();
            int response=-1;
            if(position>=0)try{
                Method item=list instanceof ListView?adapter.getClass().getMethod("getItem",int.class):FilterPosition.findItem(adapter);
                item.setAccessible(true);response=ReadingPosition.number(ReadingPosition.response(item.invoke(adapter,position)));
            }catch(Exception ignored){}
            responseNumber=response;
        }
        int count() throws Exception {
            return (Integer) call(adapter, list instanceof ListView ? "getCount" : "getItemCount", new Class<?>[0]);
        }
        void changed(){
            long now=android.os.SystemClock.uptimeMillis();quietUntil=now+150;deadline=Math.min(started+8000,now+2400);
            list.removeCallbacks(timeout);list.postDelayed(timeout,Math.max(1,deadline-now));
            list.postInvalidateDelayed(160);
        }
        void expire(){if(android.os.SystemClock.uptimeMillis()>=deadline)close();}
        int index(View child)throws Exception{return list instanceof ListView?((ListView)list).getPositionForView(child):(Integer)call(list,"getChildAdapterPosition",new Class<?>[]{View.class},child);}
        View child(int position)throws Exception{for(int i=0;i<list.getChildCount();i++)if(index(list.getChildAt(i))==position)return list.getChildAt(i);return null;}
        int responseAt(int position)throws Exception{
            Method item=list instanceof ListView?adapter.getClass().getMethod("getItem",int.class):FilterPosition.findItem(adapter);
            item.setAccessible(true);return ReadingPosition.number(ReadingPosition.response(item.invoke(adapter,position)));
        }
        void scroll(int target,int offset)throws Exception{
            if(list instanceof ListView)((ListView)list).setSelectionFromTop(target,offset);
            else{
                Object manager=call(list,"getLayoutManager",new Class<?>[0]);
                call(list,"scrollToPosition",new Class<?>[]{int.class},target);
                java.lang.reflect.Field field=null;
                for(Class<?> type=manager.getClass();type!=null&&field==null;type=type.getSuperclass())try{field=type.getDeclaredField("k");}catch(NoSuchFieldException ignored){}
                if(field==null)throw new NoSuchFieldException("native pending offset");
                field.setAccessible(true);field.setInt(manager,offset);list.requestLayout();
            }
            correcting=true;
        }
        @Override public boolean onPreDraw() {
            if (closed) return true;
            if (!enabled(list)) { close(); return true; }
            long now=android.os.SystemClock.uptimeMillis();
            if(now>=deadline){close();return true;}
            if(list.isLayoutRequested())return !correcting;
            correcting=false;
            try {
                int[] bounds=viewport(list);
                int currentCount=count();
                if (!list.isShown() || interacting(list) || ReadingPosition.nativeRestoring(list)||FilterPosition.changing(list)
                        ||width!=list.getWidth()||height!=list.getHeight()||bounds[0]!=viewportTop||bounds[1]!=viewportBottom
                        || adapter != call(list, "getAdapter", new Class<?>[0]) || currentCount!=count||position>=currentCount
                        ||(responseNumber>0&&responseAt(position)!=responseNumber)){close();return true;}
                View first=child(position);
                int target = position, offset = top;
                if (bottom && currentCount > 0) {
                    View last=child(currentCount-1);
                    target = currentCount - 1;
                    if(last==null){if(++corrections>8){close();return true;}scroll(target,0);return false;}
                    offset = viewportBottom-list.getPaddingTop()-last.getHeight();
                    if(Math.abs(last.getBottom()-viewportBottom)<=1){if(now>=quietUntil)close();return true;}
                }else if(first!=null&&Math.abs(first.getTop()-list.getPaddingTop()-top)<=1){
                    if(now>=quietUntil)close();return true;
                }
                if(++corrections>8){close();return true;}
                scroll(target,offset);
                return false;
            } catch (Exception ignored) { close();return true; }
        }
        void close() {
            if (closed) return;
            closed = true;
            list.removeCallbacks(timeout);
            if (list.getViewTreeObserver().isAlive()) list.getViewTreeObserver().removeOnPreDrawListener(this);
            if (PENDING.get(list) == this) PENDING.remove(list);
            ReadingPosition.afterMediaRefresh(list);
        }
    }
    /** Clip once to the actual window, without subtracting an already applied navigation inset. */
    private static int[] viewport(View list){
        int top=list.getPaddingTop(),bottom=list.getHeight()-list.getPaddingBottom();
        int[] origin=new int[2];list.getLocationOnScreen(origin);
        Rect visible=new Rect(),window=new Rect();list.getWindowVisibleDisplayFrame(window);
        if(list.getLocalVisibleRect(visible)){top=Math.max(top,visible.top);bottom=Math.min(bottom,visible.bottom);}
        if(!window.isEmpty()){top=Math.max(top,window.top-origin[1]);bottom=Math.min(bottom,window.bottom-origin[1]);}
        return new int[]{top,Math.max(top,bottom)};
    }
}
