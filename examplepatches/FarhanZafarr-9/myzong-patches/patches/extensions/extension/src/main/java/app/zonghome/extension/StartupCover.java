package app.zonghome.extension;

import android.app.Activity;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;

/** Brief brand cover over the real Home window while its first bindings settle. */
public final class StartupCover {
    private StartupCover() {}
    public static void show(Activity activity) {
        if(activity==null || activity.isFinishing())return;
        View decor=activity.getWindow().getDecorView();if(!(decor instanceof ViewGroup))return;
        ViewGroup host=(ViewGroup)decor;
        for(int i=0;i<host.getChildCount();i++)if(host.getChildAt(i) instanceof Cover)return;
        Cover cover=new Cover(activity,host);
        host.addView(cover,new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT));
    }
    private static final class Cover extends FrameLayout implements ViewTreeObserver.OnPreDrawListener {
        private static final long MINIMUM_MS=450,MAXIMUM_MS=1800;
        private final ViewGroup host;
        private final int loaderId;
        private long started;
        private int cleanFrames;
        private boolean attached,finishing;
        private ViewTreeObserver observer;
        private final Runnable finish=new Runnable(){@Override public void run(){dismiss();}};
        private final Runnable pulse=new Runnable(){@Override public void run(){
            if(!attached)return;
            if(SystemClock.uptimeMillis()-started>=MAXIMUM_MS){dismiss();return;}
            host.invalidate();postDelayed(this,16);
        }};
        Cover(Activity activity,ViewGroup host) {
            super(activity);this.host=host;
            loaderId=getResources().getIdentifier("loader_gif","id",activity.getPackageName());
            setBackgroundColor(CharcoalTheme.BG);setClickable(true);setFocusable(true);
            setElevation(1000*getResources().getDisplayMetrics().density);
            ImageView logo=new ImageView(activity);
            logo.setImageResource(activity.getApplicationInfo().icon);
            logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
            int side=Math.round(96*getResources().getDisplayMetrics().density);
            addView(logo,new FrameLayout.LayoutParams(side,side,Gravity.CENTER));
        }
        @Override protected void onAttachedToWindow() {
            super.onAttachedToWindow();attached=true;started=SystemClock.uptimeMillis();
            observer=host.getViewTreeObserver();if(observer.isAlive())observer.addOnPreDrawListener(this);
            post(pulse);
        }
        @Override public boolean onPreDraw() {
            if(!attached || finishing)return true;
            long elapsed=SystemClock.uptimeMillis()-started;
            View loader=loaderId==0?null:host.findViewById(loaderId);
            boolean loading=loader!=null && loader.isShown();
            if(elapsed>=MINIMUM_MS && !loading && !host.isLayoutRequested())cleanFrames++;else cleanFrames=0;
            if(cleanFrames>=3 || elapsed>=MAXIMUM_MS){finishing=true;post(finish);}
            return true;
        }
        private void dismiss() {
            if(!attached)return;
            if(getParent() instanceof ViewGroup)((ViewGroup)getParent()).removeView(this);
        }
        @Override protected void onDetachedFromWindow() {
            attached=false;removeCallbacks(pulse);removeCallbacks(finish);
            if(observer!=null && observer.isAlive())observer.removeOnPreDrawListener(this);
            observer=null;super.onDetachedFromWindow();
        }
    }
}
