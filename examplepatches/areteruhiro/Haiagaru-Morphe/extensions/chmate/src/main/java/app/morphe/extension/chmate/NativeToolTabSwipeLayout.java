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
    private final NativeToolTabChMateGestures chMateGestures;
    private final android.os.Handler mainHandler=new android.os.Handler(android.os.Looper.getMainLooper());
    private final float minimum,slop;
    private float startX,startY;
    private boolean threadSide,tracking,consumed;
    private int direction;

    NativeToolTabSwipeLayout(Activity host,Object fragment){
        super(host);this.host=host;this.fragment=fragment;
        minimum=96*getResources().getDisplayMetrics().density;
        slop=ViewConfiguration.get(host).getScaledTouchSlop();
        chMateGestures=new NativeToolTabChMateGestures(host,fragment,this);
    }
    static boolean ownsHistoryGesture(View view){
        for(View current=view;current!=null;){
            if(current instanceof NativeToolTabSwipeLayout){
                NativeToolTabSwipeLayout layout=(NativeToolTabSwipeLayout)current;
                return NativeToolTabChMateGestures.enabled(layout.host)||layout.threadSide;
            }
            ViewParent parent=current.getParent();current=parent instanceof View?(View)parent:null;
        }
        return false;
    }
    @Override public void onWindowFocusChanged(boolean focus){
        super.onWindowFocusChanged(focus);
        if(!focus)chMateGestures.cancel();
        if(focus)post(()->NativeToolTabs.restoreToolVisibility(this));
    }
    @Override protected void onDetachedFromWindow(){chMateGestures.cancel();super.onDetachedFromWindow();}
    boolean dispatchChildTouchEvent(MotionEvent event){return super.dispatchTouchEvent(event);}
    @Override public boolean dispatchKeyEvent(android.view.KeyEvent event){
        if(event.getKeyCode()==android.view.KeyEvent.KEYCODE_BACK&&isShown()
                &&NativeToolTabs.isArchiveFragment(fragment)){
            if(event.getAction()==android.view.KeyEvent.ACTION_UP&&!event.isCanceled())
                mainHandler.post(()->NativeToolTabs.closeCurrentTab(host,fragment));
            return true;
        }
        return super.dispatchKeyEvent(event);
    }
    boolean closeArchiveOnBack(android.view.KeyEvent event){
        if(!isShown()||!NativeToolTabs.isArchiveFragment(fragment))return false;
        if(event.getAction()==android.view.KeyEvent.ACTION_UP&&!event.isCanceled())
            mainHandler.post(()->NativeToolTabs.closeCurrentTab(host,fragment));
        return true;
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event){
        if(NativeToolTabChMateGestures.enabled(host)){
            tracking=false;consumed=false;threadSide=false;
            if(chMateGestures.dispatch(event))return true;
            return super.dispatchTouchEvent(event);
        }
        chMateGestures.cancel();
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
