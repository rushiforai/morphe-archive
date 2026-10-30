// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.util.Log;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Fixed, bounded, value-free camera/input diagnostics. Native reads belong to the UI owner. */
final class ClusterZoomTrace {
    static final class Snapshot {
        final String fields;
        Snapshot(String fields){this.fields=fields;}
    }
    static final Snapshot EMPTY=new Snapshot("source=unknown bind_main=unknown bind_cluster=unknown backend_main=unknown backend_cluster=unknown family=unknown case=-1 root_id=-1 root_name=unknown root_state=-1 root_attached=false root_shown=false root_w=0 root_h=0 renderer_id=-1 renderer_name=unknown renderer_state=-1 renderer_attached=false renderer_shown=false renderer_w=0 renderer_h=0 activity_main=unknown activity_cluster=unknown stage=not_prepared reason=not_prepared error=none ready=false");
    private static final Object RATE=new Object();
    private static long window=Long.MIN_VALUE;
    private static int count;
    private static volatile ThreadPoolExecutor logger;
    private ClusterZoomTrace(){}
    /** Called by service onCreate or the explicit manual UI action, never initialized in onKeyEvent. */
    static synchronized void init(){
        if(logger!=null)return;
        ThreadPoolExecutor next=new ThreadPoolExecutor(1,1,0,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<Runnable>(16),task->{Thread thread=new Thread(task,"MapsZoomTrace");thread.setDaemon(true);return thread;},new ThreadPoolExecutor.DiscardPolicy());
        next.prestartCoreThread();logger=next;
    }
    static boolean candidate(int action,int code,int repeat){return action==0&&repeat==0&&(code==305||code==291||code==292);}
    static String displayName(String value,int id){
        if(id<0||value==null)return "unknown";
        if(value.startsWith("shared_")&&value.contains("XDJAScreenProjection")){
            if(value.endsWith("_0"))return "byd_shared_0";
            if(value.endsWith("_1"))return "byd_shared_1";
            return "byd_shared_other";
        }
        if(value.equals("fission_bg_xdjaVirtualSurface"))return "byd_fission";
        if(value.startsWith("Overlay #"))return "lab_overlay";
        return id==0?"display_0":"display_other";
    }
    static String token(String value){return value!=null&&value.matches("[A-Za-z][A-Za-z0-9_]{0,63}")?value:"unknown";}
    static String format(Snapshot snapshot,String origin,int code,int scan,int direction,boolean enabled,boolean ready,boolean audio,boolean matched,boolean consume,boolean mode,String writer){
        return "zoom_attempt origin="+token(origin)+" code="+code+" scan="+scan+" direction="+direction+" enabled="+enabled+" ready_before="+ready+" audio="+audio+" binding="+matched+" consume="+consume+" mode="+mode+" writer="+token(writer)+" "+snapshot.fields;
    }
    static void record(Snapshot snapshot,String origin,int code,int scan,int direction,boolean enabled,boolean ready,boolean audio,boolean matched,boolean consume,boolean mode,String writer,long now){
        ThreadPoolExecutor target=logger;if(target==null||snapshot==null)return;
        synchronized(RATE){if(window==Long.MIN_VALUE||now<window||now-window>=1000){window=now;count=0;}if(++count>8)return;}
        target.execute(()->Log.i("MapsZoomAttempt",format(snapshot,origin,code,scan,direction,enabled,ready,audio,matched,consume,mode,writer)));
    }
}
