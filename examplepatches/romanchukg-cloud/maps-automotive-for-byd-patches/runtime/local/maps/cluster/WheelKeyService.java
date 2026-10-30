// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.accessibilityservice.AccessibilityService;
import android.content.Intent;
import android.media.AudioManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Toast;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/** Key-only accessibility service: no window content, gesture injection, or key rewriting.
 * Its one action is the system Back that closes compact Gemini on a second Gemini press. */
public final class WheelKeyService extends AccessibilityService {
    private static volatile WheelKeyService current;
    private final Handler ui=new Handler(Looper.getMainLooper());
    private HandlerThread observerThread;
    private Handler observer;
    private volatile Map<Integer,String> devices=Collections.emptyMap();
    private volatile boolean audioSafe;
    private volatile long audioAt,deviceDue;
    private volatile boolean alive;
    // Long.MAX_VALUE denotes the explicit custom-key mode; it has no elapsed timeout.
    private volatile long modeEndsAt,modeGeneration;
    private static volatile String lastControl="No assigned control key observed yet.";
    private static final WheelKeyPolicy.Recent recent=new WheelKeyPolicy.Recent();
    private final GeminiVoiceKeys voiceKeys=new GeminiVoiceKeys();
    private volatile boolean geminiAvailable;private volatile long geminiAt;
    private long geminiDue;
    private WheelKeyPolicy policy;
    private WheelKeyPolicy.Bindings policyBindings;
    @Override public void onCreate(){
        super.onCreate();ClusterZoomTrace.init();current=this;alive=true;
        WheelServiceSetup.init(getApplication());GeminiLaunch.init(this);
        observerThread=new HandlerThread("MapsWheelState");observerThread.start();observer=new Handler(observerThread.getLooper());observer.post(refresh);
    }
    private final Runnable refresh=new Runnable(){public void run(){
        if(!alive)return;long now=SystemClock.uptimeMillis();
        try {
            AudioManager manager=(AudioManager)getSystemService(AUDIO_SERVICE);
            audioSafe=manager!=null&&manager.getMode()==AudioManager.MODE_NORMAL&&!manager.isBluetoothScoOn();
            audioAt=SystemClock.uptimeMillis();
        }catch(RuntimeException unavailable){audioSafe=false;audioAt=0;}
        if(now>=geminiDue){geminiAvailable=GeminiLaunch.available(WheelKeyService.this);geminiDue=now+4000;}
        geminiAt=SystemClock.uptimeMillis();
        if(now>=deviceDue){
            Map<Integer,String> next=new HashMap<>();
            try{for(int id:InputDevice.getDeviceIds()){InputDevice device=InputDevice.getDevice(id);if(device!=null&&device.getName()!=null)next.put(id,device.getName());}devices=Collections.unmodifiableMap(next);}
            catch(RuntimeException unavailable){devices=Collections.emptyMap();}
            deviceDue=now+4000;
        }
        final long observedGeneration=modeGeneration;
        if(modeEndsAt!=0&&(!audioSafe||!ClusterZoom.ready()||!WheelServiceSetup.enabled()))scheduleEndMode(observedGeneration);
        if(alive)observer.postDelayed(this,500);
    }};
    @Override protected void onServiceConnected(){super.onServiceConnected();WheelServiceSetup.serviceConnected(true);}
    @Override protected boolean onKeyEvent(KeyEvent event){
        long now=SystemClock.uptimeMillis();String name=devices.get(event.getDeviceId());if(name==null)deviceDue=0;
        WheelKeyPolicy.Event pressed=new WheelKeyPolicy.Event(event.getAction(),event.getKeyCode(),event.getScanCode(),event.getDeviceId(),name,event.getDownTime(),event.getRepeatCount(),event.isCanceled());
        // Assigning a button comes first, so the pressed key never also zooms, changes volume or opens Gemini.
        WheelKeyPolicy.Learning.Capture capture=WheelServiceSetup.learning.handle(pressed,now);
        if(capture.binding!=null)WheelServiceSetup.learned(capture.role,capture.binding);
        boolean consumed=capture.consume||dispatch(event,now,name);
        recent.add(System.currentTimeMillis(),pressed,consumed);
        return consumed;
    }
    private boolean dispatch(KeyEvent event,long now,String name){
        WheelKeyPolicy.Bindings assigned=WheelServiceSetup.bindings();int code=event.getKeyCode();
        if(WheelServiceSetup.enabled()&&(code==assigned.mode.code||code==assigned.in.code||code==assigned.out.code)&&event.getAction()==KeyEvent.ACTION_DOWN&&event.getRepeatCount()==0){
            String device=name==null?"unknown device":name.replaceAll("[\\p{Cntrl}]", "?");
            if(device.length()>64)device=device.substring(0,64);
            lastControl="code "+event.getKeyCode()+", scan "+event.getScanCode()+", "+device;
        }
        boolean voiceSafe=audioSafe&&audioAt>0&&now>=audioAt&&now-audioAt<1500;
        int voice=voiceKeys.handle(WheelServiceSetup.geminiBinding(),event.getAction(),event.getKeyCode(),event.getScanCode(),event.getDeviceId(),name,event.getDownTime(),event.getRepeatCount(),event.isCanceled(),
            GeminiLaunch.wheelEnabled(),geminiAvailable&&geminiAt>0&&now>=geminiAt&&now-geminiAt<1500,voiceSafe,now);
        if(voice==GeminiVoiceKeys.OPEN)ui.post(()->{
            long at=SystemClock.uptimeMillis();
            if(alive&&GeminiLaunch.wheelEnabled()&&audioSafe&&audioAt>0&&at>=audioAt&&at-audioAt<1500)GeminiLaunch.open(this);
        });
        if(voice!=GeminiVoiceKeys.PASS)return true;
        WheelKeyPolicy.Bindings bindings=WheelServiceSetup.bindings();
        if(policy==null||policyBindings!=bindings){
            if(policy==null)policy=new WheelKeyPolicy(bindings);else policy.updateBindings(bindings);
            policyBindings=bindings;modeEndsAt=0;modeGeneration++;
        }
        boolean safe=audioSafe&&audioAt>0&&now>=audioAt&&now-audioAt<1500;
        WheelKeyPolicy.Event key=new WheelKeyPolicy.Event(event.getAction(),event.getKeyCode(),event.getScanCode(),event.getDeviceId(),name,event.getDownTime(),event.getRepeatCount(),event.isCanceled());
        boolean before=policy.mode(now),cameraReady=ClusterZoom.ready(),enabled=WheelServiceSetup.enabled();
        final boolean trace=enabled&&ClusterZoomTrace.candidate(event.getAction(),event.getKeyCode(),event.getRepeatCount());
        final int traceCode=event.getKeyCode(),traceScan=event.getScanCode();final boolean matched=bindings.role(key)!=0;
        WheelKeyPolicy.Result result=policy.handle(key,enabled,cameraReady,safe,now);modeEndsAt=policy.deadline();if(before!=result.mode)modeGeneration++;
        if(result.mode&&!before)ui.post(()->{if(alive&&WheelServiceSetup.enabled())Toast.makeText(this,"Cluster zoom on",Toast.LENGTH_SHORT).show();});
        else if(before&&!result.mode&&result.consume&&bindings.role(key)==1&&event.getAction()==KeyEvent.ACTION_DOWN&&event.getRepeatCount()==0)ui.post(()->{if(alive)Toast.makeText(this,"Volume controls restored",Toast.LENGTH_SHORT).show();});
        if(result.delta!=0){final int delta=result.delta;final long activation=modeGeneration;ui.post(()->{
            long at=SystemClock.uptimeMillis();
            boolean stepAllowed=alive&&modeEndsAt!=0&&modeGeneration==activation&&WheelServiceSetup.enabled()&&audioSafe&&audioAt>0&&at>=audioAt&&at-audioAt<1500&&ClusterZoom.ready();
            if(stepAllowed)ClusterZoom.step(delta);
            if(trace)ClusterZoomTrace.record(ClusterZoom.diagnosticSnapshot(),"wheel",traceCode,traceScan,delta,enabled,cameraReady,safe,matched,result.consume,result.mode,stepAllowed?ClusterZoom.diagnosticWriter():"ui_gate_rejected",at);
        });}
        else if(trace)ClusterZoomTrace.record(ClusterZoom.diagnosticSnapshot(),"wheel",traceCode,traceScan,0,enabled,cameraReady,safe,matched,result.consume,result.mode,result.consume?"not_requested":"passed_through",now);
        return result.consume;
    }
    public static String lastKey(){return lastControl;}
    /** UI thread. Global Back closes the compact Gemini window that covers Maps. */
    static boolean back(){WheelKeyService service=current;try{return service!=null&&service.alive&&service.performGlobalAction(GLOBAL_ACTION_BACK);}catch(RuntimeException e){return false;}}
    public static String recentKeys(){return recent.describe(java.util.TimeZone.getDefault());}
    public static boolean modeActive(){WheelKeyService service=current;return service!=null&&service.alive&&WheelServiceSetup.enabled()&&service.modeEndsAt!=0;}
    private void scheduleEndMode(long generation){ui.post(()->{if(alive&&current==this&&modeGeneration==generation){modeEndsAt=0;modeGeneration++;if(policy!=null)policy.endMode();}});}
    static void endMode(){WheelKeyService service=current;if(service!=null)service.scheduleEndMode(service.modeGeneration);}
    /** Invalidate queued steps before an owned OEM projection is replaced or an OEM layout changes on UI. */
    static void endModeNow(){
        if(Looper.myLooper()!=Looper.getMainLooper()){endMode();return;}
        WheelKeyService service=current;
        if(service!=null&&service.alive){service.modeEndsAt=0;service.modeGeneration++;if(service.policy!=null)service.policy.endMode();}
    }
    @Override public void onAccessibilityEvent(AccessibilityEvent event){}
    @Override public void onInterrupt(){endMode();}
    @Override public boolean onUnbind(Intent intent){WheelServiceSetup.learning.disconnected();modeEndsAt=0;modeGeneration++;if(current==this)WheelServiceSetup.serviceConnected(false);voiceKeys.disconnected();if(policy!=null)policy.disconnected();return super.onUnbind(intent);}
    @Override public void onDestroy(){
        alive=false;audioSafe=false;modeEndsAt=0;modeGeneration++;
        if(observer!=null)observer.removeCallbacksAndMessages(null);
        if(observerThread!=null)observerThread.quitSafely();
        if(current==this){current=null;WheelServiceSetup.serviceConnected(false);}
        voiceKeys.disconnected();if(policy!=null)policy.disconnected();super.onDestroy();
    }
}
