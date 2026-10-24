package app.morphe.extension.chmate;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewConfiguration;
import android.widget.LinearLayout;

/** Thread-side tools share the native tab order; HOME tools retain browser-history gestures. */
final class NativeToolTabSwipeLayout extends LinearLayout {
    private final Activity host;
    private final Object fragment;
    private final android.os.Handler mainHandler=new android.os.Handler(android.os.Looper.getMainLooper());
    private final float minimum,slop;
    private float startX,startY;
    private boolean threadSide,tracking,consumed;
    private int direction;

    NativeToolTabSwipeLayout(Activity host,Object fragment){
        super(host);this.host=host;this.fragment=fragment;
        minimum=96*getResources().getDisplayMetrics().density;
        slop=ViewConfiguration.get(host).getScaledTouchSlop();
    }
    static boolean ownsHistoryGesture(View view){
        for(View current=view;current!=null;){
            if(current instanceof NativeToolTabSwipeLayout)return ((NativeToolTabSwipeLayout)current).threadSide;
            ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;
        }
        return false;
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event){
        int action=event.getActionMasked();
        if(action==MotionEvent.ACTION_DOWN){
            threadSide=NativeToolTabs.isSelectedThreadTool(host,fragment);
            tracking=threadSide;consumed=false;direction=0;
            startX=event.getX();startY=event.getY();
        }
        if(action==MotionEvent.ACTION_POINTER_DOWN||event.getPointerCount()!=1)tracking=false;
        if(tracking&&!consumed&&(action==MotionEvent.ACTION_MOVE||action==MotionEvent.ACTION_UP)){
            float dx=event.getX()-startX,dy=event.getY()-startY;
            // Keep vertical scrolling, selection/long press and multi-touch with the original child.
            if(Math.abs(dy)>slop&&Math.abs(dy)>=Math.abs(dx)*0.45f
                    ||event.getEventTime()-event.getDownTime()>ViewConfiguration.getLongPressTimeout())tracking=false;
            else if(Math.abs(dx)>=minimum&&Math.abs(dy)<Math.abs(dx)*0.45f){
                consumed=true;direction=dx<0?1:-1;
                MotionEvent cancel=MotionEvent.obtain(event);cancel.setAction(MotionEvent.ACTION_CANCEL);
                try{super.dispatchTouchEvent(cancel);}finally{cancel.recycle();}
            }
        }
        if(consumed){
            if(action==MotionEvent.ACTION_UP){
                int offset=direction;boolean navigate=tracking;tracking=false;consumed=false;
                if(navigate)mainHandler.post(()->NativeToolTabs.moveThreadTool(host,fragment,offset));
            }else if(action==MotionEvent.ACTION_CANCEL){tracking=false;consumed=false;}
            return true;
        }
        if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)tracking=false;
        return super.dispatchTouchEvent(event);
    }
}
