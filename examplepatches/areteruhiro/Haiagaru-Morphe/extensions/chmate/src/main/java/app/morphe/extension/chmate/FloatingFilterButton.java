package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.util.*;

/** In-app overlay only. No SYSTEM_ALERT_WINDOW permission or background window. */
final class FloatingFilterButton {
    private static final Map<View,WeakReference<Binding>> bindings=new WeakHashMap<>();
    static void iconsChanged(){
        new android.os.Handler(android.os.Looper.getMainLooper()).post(()->{
            for(WeakReference<Binding> ref:new ArrayList<>(bindings.values())){
                Binding binding=ref.get();if(binding!=null&&!binding.closed)binding.updateIcon();
            }
        });
    }
    static void update(Object owner) {
        try {
            Activity activity=(Activity)owner.getClass().getMethod("getActivity").invoke(owner);
            View root=(View)owner.getClass().getMethod("getView").invoke(owner);
            if(activity==null||root==null)return;
            Binding current=bindings.containsKey(root)?bindings.get(root).get():null;
            if(!QuickFilterOptions.bottom()||!FeatureSwitches.enabled("floatingQuickFilterButton",false)) {
                if(current!=null)current.close();return;
            }
            if(current==null){current=new Binding(activity,root,owner);bindings.put(root,new WeakReference<>(current));}
            current.layout();
        }catch(ReflectiveOperationException|RuntimeException ignored) { }
    }
    private static final class Binding implements View.OnAttachStateChangeListener,ViewTreeObserver.OnGlobalLayoutListener {
        final View root;final FrameLayout host;final Button button;final SharedPreferences prefs;
        final WeakReference<Object> owner;boolean closed,dragging,moved;float downX,downY,startX,startY;
        final android.os.Handler handler=new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable hold;
        Binding(Activity activity,View root,Object owner) {
            this.root=root;this.owner=new WeakReference<>(owner);
            host=activity.findViewById(android.R.id.content);
            prefs=activity.getSharedPreferences(WacchoiSearchOptions.PREFS,0);
            button=new Button(activity);button.setText("フィルター");button.setContentDescription("フィルター。長押ししてドラッグで位置変更");
            updateIcon();
            hold=()->{dragging=true;button.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);};
            button.setTag("haiagaru.floatingFilter");
            host.addView(button,new FrameLayout.LayoutParams(-2,-2));
            button.setOnClickListener(v->{Object target=this.owner.get();if(target!=null)ExtraQuickFilters.open(target);});
            button.setOnTouchListener((view,event)->touch(event));
            root.addOnAttachStateChangeListener(this);root.getViewTreeObserver().addOnGlobalLayoutListener(this);
        }
        void updateIcon(){
            android.graphics.drawable.Drawable icon=ToolbarIcons.preview(button.getContext(),
                    ToolbarIcons.index(ToolbarIcons.FLOATING_FILTER),button.getCurrentTextColor());
            int size=Math.round(24*button.getResources().getDisplayMetrics().density);
            icon.setBounds(0,0,size,size);
            button.setCompoundDrawablesRelative(icon,null,null,null);
            button.setCompoundDrawablePadding(Math.round(8*button.getResources().getDisplayMetrics().density));
        }
        boolean touch(MotionEvent e) {
            switch(e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX=e.getRawX();downY=e.getRawY();startX=button.getX();startY=button.getY();dragging=false;moved=false;
                    button.getParent().requestDisallowInterceptTouchEvent(true);button.setPressed(true);
                    handler.postDelayed(hold,ViewConfiguration.getLongPressTimeout());return true;
                case MotionEvent.ACTION_MOVE:
                    float dx=e.getRawX()-downX,dy=e.getRawY()-downY;
                    if(Math.hypot(dx,dy)>ViewConfiguration.get(button.getContext()).getScaledTouchSlop()){moved=true;if(!dragging)handler.removeCallbacks(hold);}
                    if(dragging)place(startX+dx,startY+dy);return true;
                case MotionEvent.ACTION_UP:
                    if(dragging)save();else if(!moved)button.performClick();
                    // fall through: canceled gestures never invoke the filter.
                case MotionEvent.ACTION_CANCEL:
                    handler.removeCallbacks(hold);button.setPressed(false);if(button.getParent()!=null)button.getParent().requestDisallowInterceptTouchEvent(false);dragging=false;return true;
                default:return true;
            }
        }
        void place(float x,float y){button.setX(Math.max(0,Math.min(x,host.getWidth()-button.getWidth())));button.setY(Math.max(0,Math.min(y,host.getHeight()-button.getHeight())));}
        void save(){prefs.edit().putFloat("floatingFilterX",button.getX()/Math.max(1,host.getWidth()-button.getWidth()))
                .putFloat("floatingFilterY",button.getY()/Math.max(1,host.getHeight()-button.getHeight())).apply();}
        void layout(){
            if(closed)return;
            button.setVisibility(root.isShown()?View.VISIBLE:View.GONE);
            if(!dragging)place(prefs.getFloat("floatingFilterX",1f)*Math.max(0,host.getWidth()-button.getWidth()),
                    prefs.getFloat("floatingFilterY",.85f)*Math.max(0,host.getHeight()-button.getHeight()));
        }
        public void onGlobalLayout(){layout();}
        public void onViewAttachedToWindow(View view){layout();}
        public void onViewDetachedFromWindow(View view){close();}
        void close(){if(closed)return;closed=true;handler.removeCallbacks(hold);root.removeOnAttachStateChangeListener(this);
            if(root.getViewTreeObserver().isAlive())root.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            host.removeView(button);bindings.remove(root);}
    }
    private FloatingFilterButton(){}
}
