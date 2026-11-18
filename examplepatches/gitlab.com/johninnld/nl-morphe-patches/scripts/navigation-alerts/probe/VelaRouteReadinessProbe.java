package nl.johninnl.warningprobe.route;

import android.app.Instrumentation;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** Existing Vela route/session/guide only; no navigation or audio state is fabricated. */
public final class VelaRouteReadinessProbe {
    private static final String CONTROLLED_TEXT="Controlled native guidance for the synthetic route test. Continue along the route. This long native instruction will be stopped by a real external emergency warning before it completes. Continue along the current road and follow the route.";
    public static JSONObject prepareActualRoute(Instrumentation probe,long timeout)throws Exception{
        Class<?> runtime=probe.getTargetContext().getClassLoader().loadClass("nl.johninnl.vela.TelemetryRuntime");
        probe.getTargetContext().startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("google.navigation:q=52.3791,4.9003&mode=d")).setPackage("app.vela").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        long end=SystemClock.elapsedRealtime()+timeout;Set<String> clicked=new HashSet<>();JSONObject result=new JSONObject();
        while(SystemClock.elapsedRealtime()<end){result=routeSnapshot(runtime);if(result.optBoolean("actual_route_ready"))return result;
            AccessibilityNodeInfo root=probe.getUiAutomation().getRootInActiveWindow();if(root!=null&&root.getPackageName()!=null&&"app.vela".contentEquals(root.getPackageName())){List<AccessibilityNodeInfo> nodes=new ArrayList<>();collect(root,nodes);for(AccessibilityNodeInfo node:nodes){String label=node.getText()==null?"":node.getText().toString();if(!label.equals("Start")&&!label.equals("Start navigation"))continue;if(!node.isEnabled()||clicked.contains(label))continue;AccessibilityNodeInfo control=node;while(control!=null&&!control.isClickable())control=control.getParent();boolean handled=control!=null&&control.performAction(AccessibilityNodeInfo.ACTION_CLICK);if(!handled){android.graphics.Rect bounds=new android.graphics.Rect();node.getBoundsInScreen(bounds);probe.getUiAutomation().injectInputEvent(android.view.MotionEvent.obtain(SystemClock.uptimeMillis(),SystemClock.uptimeMillis(),android.view.MotionEvent.ACTION_DOWN,bounds.centerX(),bounds.centerY(),0),true);probe.getUiAutomation().injectInputEvent(android.view.MotionEvent.obtain(SystemClock.uptimeMillis(),SystemClock.uptimeMillis(),android.view.MotionEvent.ACTION_UP,bounds.centerX(),bounds.centerY(),0),true);handled=true;}if(handled){clicked.add(label);Bundle status=new Bundle();status.putString("stage","VELA_ORIGINAL_ROUTE_CONTROL");status.putString("detail",label);probe.sendStatus(0,status);SystemClock.sleep(300);break;}}}
            SystemClock.sleep(100);
        }
        return result.put("actual_route_ready",false);
    }
    public static JSONObject routeSnapshot(Class<?> runtime)throws Exception{
        Object session=field(runtime,"navSession").get(null);JSONObject result=new JSONObject().put("native_session_present",session!=null).put("actual_route_ready",false);if(session==null)return result;
        Object state=call(read(session,"f"),"getValue"),route=read(state,"d"),nav=read(state,"e");boolean active=(Boolean)read(state,"a"),paused=(Boolean)read(state,"b"),arrived=(Boolean)read(state,"c");result.put("session_class",session.getClass().getName()).put("state_class",state.getClass().getName()).put("native_navigation_active",active).put("native_navigation_paused",paused).put("native_arrived",arrived).put("current_route_present",route!=null).put("current_step_present",nav!=null).put("current_instruction",String.valueOf(read(state,"f")));if(route!=null){result.put("route_class",route.getClass().getName()).put("route_identity",System.identityHashCode(route)).put("polyline_points",((List<?>)call(route,"getPolyline")).size());}if(nav!=null)result.put("nav_state_class",nav.getClass().getName()).put("spoken_indices",String.valueOf(read(nav,"h")));return result.put("actual_route_ready",active&&!paused&&!arrived&&route!=null&&nav!=null&&result.optInt("polyline_points")>=2);
    }
    public static final class Witness {
        final Object guide;final TextToSpeech engine;final UtteranceProgressListener original;final List<JSONObject> events=Collections.synchronizedList(new ArrayList<>());volatile String controlledId="";public volatile String regeneratedId="";volatile long externalDone=-1;public boolean restored;
        Witness(Object guide,TextToSpeech engine,UtteranceProgressListener original){this.guide=guide;this.engine=engine;this.original=original;}
    }
    public static Witness beginOnActualGuide(Instrumentation probe,Class<?> runtime)throws Exception{
        Object guide=field(runtime,"voice").get(null);if(guide==null)throw new IllegalStateException("Actual Vela guide missing");TextToSpeech engine=(TextToSpeech)read(guide,"b");if(engine==null)throw new IllegalStateException("Actual selected system voice missing");long end=SystemClock.elapsedRealtime()+10000;while((engine.isSpeaking()||((Number)read(guide,"s")).intValue()!=0||!((Collection<?>)read(guide,"g")).isEmpty())&&SystemClock.elapsedRealtime()<end)SystemClock.sleep(20);if(engine.isSpeaking()||((Number)read(guide,"s")).intValue()!=0||!((Collection<?>)read(guide,"g")).isEmpty())throw new IllegalStateException("Original route speech did not become idle");UtteranceProgressListener original=null;for(Field f:TextToSpeech.class.getDeclaredFields())if(UtteranceProgressListener.class.isAssignableFrom(f.getType())){f.setAccessible(true);Object value=f.get(engine);if(value!=null){original=(UtteranceProgressListener)value;break;}}if(original==null||!original.getClass().getName().equals("vy4"))throw new IllegalStateException("Cannot forward the same original native listener");Witness witness=new Witness(guide,engine,original);
        engine.setOnUtteranceProgressListener(new UtteranceProgressListener(){
            private void event(String id,String kind){try{long now=SystemClock.elapsedRealtime();witness.events.add(new JSONObject().put("id",id).put("event",kind).put("elapsed_ms",now));if(kind.equals("start")&&id!=null&&id.matches("vela--?[0-9]+")){if(id.equals("vela-"+CONTROLLED_TEXT.hashCode()))witness.controlledId=id;else if(witness.externalDone>=0&&now>=witness.externalDone&&!id.equals("vela-"+CONTROLLED_TEXT.hashCode()))witness.regeneratedId=id;}if(kind.equals("done")&&id!=null&&id.startsWith("vela-warning-"))witness.externalDone=now;}catch(Exception e){throw new IllegalStateException(e);}}
            @Override public void onStart(String id){event(id,"start");witness.original.onStart(id);}
            @Override public void onDone(String id){event(id,"done");witness.original.onDone(id);}
            @Override public void onStop(String id,boolean interrupted){event(id,interrupted?"stop_interrupted":"stop");witness.original.onStop(id,interrupted);}
            @Override public void onError(String id){event(id,"error");witness.original.onError(id);}
            @Override public void onError(String id,int code){event(id,"error_"+code);witness.original.onError(id,code);}
            @Override public void onBeginSynthesis(String id,int rate,int format,int channels){witness.original.onBeginSynthesis(id,rate,format,channels);}
            @Override public void onAudioAvailable(String id,byte[] data){witness.original.onAudioAvailable(id,data);}
        });
        onMain(probe,()->method(guide.getClass(),"j",String.class,boolean.class,boolean.class).invoke(guide,CONTROLLED_TEXT,false,false));end=SystemClock.elapsedRealtime()+7000;while(witness.controlledId.isEmpty()&&SystemClock.elapsedRealtime()<end)SystemClock.sleep(10);if(witness.controlledId.isEmpty())throw new IllegalStateException("Actual native guidance did not start");return witness;
    }
    public static JSONObject snapshot(Witness witness,Class<?> runtime)throws Exception{return new JSONObject().put("actual_route",routeSnapshot(runtime)).put("controlled_native_id",witness.controlledId).put("regenerated_native_id",witness.regeneratedId).put("external_done_elapsed_ms",witness.externalDone).put("events",new JSONArray(witness.events)).put("original_listener_restored",witness.restored);}
    public static void close(Witness witness){if(witness!=null&&!witness.restored){witness.engine.setOnUtteranceProgressListener(witness.original);witness.restored=true;}}
    private interface Action{void run()throws Exception;}
    private static void onMain(Instrumentation probe,Action action)throws Exception{AtomicReference<Throwable> error=new AtomicReference<>();probe.runOnMainSync(()->{try{action.run();}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new IllegalStateException(error.get());}
    private static Object read(Object value,String name)throws Exception{return field(value.getClass(),name).get(value);}
    private static Object call(Object value,String name)throws Exception{return method(value.getClass(),name).invoke(value);}
    private static Field field(Class<?> owner,String name)throws Exception{for(Class<?> c=owner;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static Method method(Class<?> owner,String name,Class<?>...types)throws Exception{for(Class<?> c=owner;c!=null;c=c.getSuperclass())try{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(name);}
    private static void collect(AccessibilityNodeInfo root,List<AccessibilityNodeInfo> nodes){nodes.add(root);for(int i=0;i<root.getChildCount();i++){AccessibilityNodeInfo child=root.getChild(i);if(child!=null)collect(child,nodes);}}
}
