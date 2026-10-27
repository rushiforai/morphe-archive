package app.morphe.extension.chmate;

import android.content.Context;
import java.lang.reflect.*;
import java.util.concurrent.atomic.AtomicBoolean;

/** Runs against a local delayed-header server. No public website or authentication data. */
public final class GifLoadingCancellationFixture {
    public static volatile String result="";
    public static void pinch(android.app.Activity activity,float x,float y) {
        long now=android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent.PointerProperties[] p=new android.view.MotionEvent.PointerProperties[2];
        android.view.MotionEvent.PointerCoords[] c=new android.view.MotionEvent.PointerCoords[2];
        for(int i=0;i<2;i++){p[i]=new android.view.MotionEvent.PointerProperties();p[i].id=i;p[i].toolType=1;
            c[i]=new android.view.MotionEvent.PointerCoords();c[i].x=x+(i==0?-20:20);c[i].y=y;c[i].pressure=1;c[i].size=1;}
        int[] actions={0,261,2,262,1};
        for(int i=0;i<actions.length;i++){
            int count=i==0||i==4?1:2;
            if(i==2){c[0].x=x-100;c[1].x=x+100;}
            android.view.MotionEvent event=android.view.MotionEvent.obtain(now,now+i*80,actions[i],count,p,c,0,0,1,1,0,0,0x1002,0);
            try{activity.dispatchTouchEvent(event);}finally{event.recycle();}
        }
    }
    public static void start(Context context,String url) {
        result="";AtomicBoolean cancelled=new AtomicBoolean();
        Thread worker=new Thread(()->{
            long start=System.nanoTime();
            try {
                ClassLoader loader=context.getClassLoader();
                Class<?> policy=Class.forName("app.morphe.extension.chmate.GifFileCache$Cancellation",true,loader);
                Object stop=Proxy.newProxyInstance(loader,new Class<?>[]{policy},(p,m,a)->{
                    if(m.getName().equals("getAsBoolean"))return cancelled.get();
                    if(m.getName().equals("hashCode"))return System.identityHashCode(p);
                    if(m.getName().equals("equals"))return a!=null&&p==a[0];
                    return "LocalGifCancellation";
                });
                Class<?> media=Class.forName("app.morphe.extension.chmate.GifMediaLoader",true,loader);
                Method load=media.getDeclaredMethod("load",Context.class,String.class,int.class,boolean.class,policy);load.setAccessible(true);
                load.invoke(null,context,url,1024*1024,true,stop);
                result="FAIL cancelled download returned a file";
            }catch(Throwable error){
                Throwable cause=error instanceof InvocationTargetException?error.getCause():error;
                long millis=(System.nanoTime()-start)/1000000;
                result=cancelled.get()&&cause instanceof java.io.IOException&&millis<4000
                        ?"PASS cancellation while waiting for response headers: "+millis+" ms"
                        :"FAIL "+millis+" ms "+cause;
            }
        },"LocalGifCancellationFixture");worker.start();
        Thread timer=new Thread(()->{try{Thread.sleep(250);}catch(InterruptedException ignored){}cancelled.set(true);},"LocalGifCancellationTimer");timer.setDaemon(true);timer.start();
    }
}
