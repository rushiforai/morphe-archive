package nl.johninnl.warningprobe.integration;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.media.AudioFormat;
import java.io.ByteArrayOutputStream;
import android.view.View;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Observe only the real Vela receiver graph. No event, grant, source flag or speaker is constructed. */
public final class IntegratedVelaReceiverProbe extends Instrumentation {
    private Bundle args;
    private final Map<String,Map<?,?>> diagnosticArchive=new java.util.LinkedHashMap<>();
    private final Set<String> eligibleEventKeys=new HashSet<>();
    private final Map<String,Set<String>> eventStages=new java.util.LinkedHashMap<>();
    private int expectedCount=1;
    private String expectedTerminal="";
    private File cancelFile;
    private TextToSpeech observedEngine;private UtteranceProgressListener observedOriginal;
    private final Map<String,PcmSignal> pcmSignals=new java.util.concurrent.ConcurrentHashMap<>();
    private static final int MAX_PCM=2*1024*1024;
    private void checkCancellation(){if(cancelFile!=null&&cancelFile.exists())throw new IllegalStateException("Controller requested private cancellation; restoring actual session/preferences");}
    @Override public void onCreate(Bundle args){super.onCreate(args);this.args=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        JSONObject report=new JSONObject();Bundle output=new Bundle();Activity activity=null;SharedPreferences prefs=null;Map<String,Object> original=null;
        Class<?> telemetry=null,diagnostics=null;File folder=null;Object productionConnection=null;
        try{
            if(!"true".equals(args.getString("reviewed_synthetic_choices")))throw new IllegalArgumentException("Explicit reviewed_synthetic_choices=true is required");
            String mode=args.getString("mode","");if(!mode.equals("VOICE")&&!mode.equals("TONE")&&!mode.equals("SILENT"))throw new IllegalArgumentException("Explicit VOICE/TONE/SILENT mode is required");
            String type=args.getString("expected_native_type","");if(type.isEmpty())throw new IllegalArgumentException("Expected native type required");
            expectedCount=Integer.parseInt(args.getString("expected_event_count","1"));if(expectedCount<1||expectedCount>200)throw new IllegalArgumentException("Measured announcement count must be1..200");
            expectedTerminal=args.getString("expected_terminal",mode.equals("SILENT")?"SCHEDULER_USER_MUTED":"SCHEDULER_COMPLETED");
            if(!java.util.Arrays.asList("SCHEDULER_COMPLETED","SCHEDULER_USER_MUTED","SCHEDULER_CANCELLED","SCHEDULER_INTERRUPTED").contains(expectedTerminal))throw new IllegalArgumentException("Unsupported expected terminal");
            Context context=getTargetContext();String pkg=context.getPackageName();if(!pkg.equals("app.vela"))throw new IllegalArgumentException("Unexpected target");
            ClassLoader loader=context.getClassLoader();telemetry=Class.forName("nl.johninnl.vela.TelemetryRuntime",true,loader);diagnostics=Class.forName("nl.johninnl.navigation.alerts.WarningDiagnostics",true,loader);
            prefs=context.getSharedPreferences("vela_settings",Context.MODE_PRIVATE);original=copy(prefs.getAll());
            // Genuine native engine selection is consumed by the real ViewModel lifecycle below.
            if(!prefs.edit().putString("voice_engine","com.google.android.tts").putBoolean("car_speed_on",true).commit())throw new IllegalStateException("Reviewed native settings did not persist");
            report.put("preferences_before_sha256",fingerprint(original)).put("process_uid",android.os.Process.myUid()).put("target_uid",context.getApplicationInfo().uid).put("target_package",pkg);
            report.put("choices",new JSONObject().put("provider","nl.flitsmeister").put("mode",mode).put("categories","ALL").put("reviewed",true).put("widget",true).put("native_engine","com.google.android.tts"));
            folder=new File(context.getExternalFilesDir(null),"native-warning-integrated");if(!folder.exists()&&!folder.mkdirs())throw new IllegalStateException("Output folder");
            String cancelToken=args.getString("cancel_token","");if(!cancelToken.isEmpty()){if(!cancelToken.matches("[A-Za-z0-9_-]{1,80}"))throw new IllegalArgumentException("Invalid private cancel token");cancelFile=new File(folder,"cancel-"+cancelToken+".request");if(cancelFile.exists())throw new IllegalStateException("Private cancellation token reused");report.put("private_cancel_path",cancelFile.getAbsolutePath());}
            Intent launch=context.getPackageManager().getLaunchIntentForPackage(pkg);if(launch==null)throw new IllegalStateException("No genuine launcher Activity");launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity=startActivitySync(launch);final Activity actualActivity=activity;final Class<?> actualTelemetry=telemetry;
            long initUntil=SystemClock.elapsedRealtime()+10000;
            while(SystemClock.elapsedRealtime()<initUntil&&(field(telemetry,"scheduler").get(null)==null||field(telemetry,"voice").get(null)==null)){checkCancellation();SystemClock.sleep(20);}
            if(field(telemetry,"scheduler").get(null)==null||field(telemetry,"voice").get(null)==null)throw new IllegalStateException("Genuine Activity/ViewModel lifecycle did not initialize the receiver graph and selected native guide");
            if("true".equals(args.getString("capture_pcm")))onMain(()->installPcmObserver(actualTelemetry));
            onMain(()->{
                Object choices=field(actualTelemetry,"warningPreferences").get(null);Class<?> modes=Class.forName("nl.johninnl.navigation.alerts.WarningAudioOwner$Mode",true,loader);
                method(choices.getClass(),"mode",modes).invoke(choices,enumValue(modes,mode));method(choices.getClass(),"categories",int.class).invoke(choices,127);method(choices.getClass(),"confirm").invoke(choices);
                method(actualTelemetry,"select",String.class).invoke(null,"nl.flitsmeister");
                method(actualTelemetry,"warningChoicesChanged").invoke(null);
            });
            report.put("selection_at_elapsed_ms",SystemClock.elapsedRealtime()).put("activity",activity.getClass().getName());
            boolean ready=false;long readyUntil=SystemClock.elapsedRealtime()+20000;
            while(SystemClock.elapsedRealtime()<readyUntil){checkCancellation();Object session=field(telemetry,"semantic").get(null);if(session!=null&&"ready".equals(method(session.getClass(),"state").invoke(session))){report.put("capture_complete",method(session.getClass(),"captureComplete").invoke(session));if(report.optBoolean("capture_complete")){ready=true;break;}}SystemClock.sleep(20);}
            report.put("connection",state(telemetry));if(!ready)throw new IllegalStateException("Production WarningSession did not become ready with legitimate complete coverage");
            Object realSession=field(telemetry,"semantic").get(null),realConnection=method(realSession.getClass(),"connection").invoke(realSession);
            productionConnection=realConnection;
            report.put("actual_graph",new JSONObject().put("telemetry",telemetry.getName()).put("session",realSession.getClass().getName()).put("connection",realConnection.getClass().getName()).put("scheduler",field(telemetry,"scheduler").get(null).getClass().getName()).put("speaker",field(telemetry,"nativeSpeaker").get(null).getClass().getName()).put("provider_uid",field(realConnection.getClass(),"providerUid").getInt(realConnection)));
            if(report.getJSONObject("actual_graph").getInt("provider_uid")==android.os.Process.myUid())throw new IllegalStateException("Provider/receiver UID boundary not exercised");
            report.put("receiver_armed_at_elapsed_ms",SystemClock.elapsedRealtime());Bundle status=new Bundle();status.putString("stage","RECEIVER_ARMED");status.putString("target_package",pkg);sendStatus(0,status);
            long observeAfter=report.getLong("selection_at_elapsed_ms"),until=SystemClock.elapsedRealtime()+Math.max(30000,expectedCount*5000L+20000);Object observedAttempt=null,observedAuthority=null;String eventKey="",terminalStage="";boolean terminal=false,started=false,uiCaptured=false;
            long disconnectedAt=-1;String originalProviderSession=String.valueOf(method(realConnection.getClass(),"providerSession").invoke(realConnection));
            while(SystemClock.elapsedRealtime()<until){
                checkCancellation();Object liveSession=field(telemetry,"semantic").get(null);String liveState=liveSession==null?"off":String.valueOf(method(liveSession.getClass(),"state").invoke(liveSession));
                if(!liveState.equals("ready")){if(disconnectedAt<0)disconnectedAt=SystemClock.elapsedRealtime();if(SystemClock.elapsedRealtime()-disconnectedAt>5000)throw new IllegalStateException("Production source remained disconnected during matrix");}
                else {disconnectedAt=-1;Object currentConnection=method(liveSession.getClass(),"connection").invoke(liveSession);if(expectedCount>1&&currentConnection!=null&&!originalProviderSession.equals(String.valueOf(method(currentConnection.getClass(),"providerSession").invoke(currentConnection))))throw new IllegalStateException("Provider session changed during warm matrix");}
                Object display=field(telemetry,"nativeWarnings").get(null);synchronized(display){Map<?,?> values=(Map<?,?>)field(display.getClass(),"values").get(display);for(Object value:values.values())if(matches(value,type)){eligibleEventKeys.add(eventKey(value));observedAuthority=value;report.put("received_display_event",event(value));}}
                Object scheduler=field(telemetry,"scheduler").get(null),active=scheduler==null?null:field(scheduler.getClass(),"active").get(scheduler);
                if(active!=null){Object pending=field(active.getClass(),"pending").get(active),authority=field(pending.getClass(),"authority").get(pending);
                    if(matches(authority,type)){eligibleEventKeys.add(eventKey(authority));observedAuthority=authority;observedAttempt=active;report.put("received_authority",event(authority));eventKey=String.valueOf(field(pending.getClass(),"key").get(pending));}}
                final JSONObject[] witness={null};onMain(()->{Object speaker=field(actualTelemetry,"nativeSpeaker").get(null),attempt=speaker==null?null:field(speaker.getClass(),"active").get(speaker);if(attempt!=null){Object payload=field(attempt.getClass(),"event").get(attempt),grant=field(attempt.getClass(),"grant").get(attempt);if(matches(payload,type))witness[0]=new JSONObject().put("payload",event(payload)).put("attempt_id",field(grant.getClass(),"attemptId").get(grant)).put("mode",String.valueOf(field(grant.getClass(),"mode").get(grant))).put("submitted",field(attempt.getClass(),"submitted").getBoolean(attempt)).put("started",field(attempt.getClass(),"started").getBoolean(attempt));}});
                if(witness[0]!=null)report.put("actual_speaker_attempt",witness[0]);
                if(observedAuthority!=null&&!uiCaptured){
                    final File destination=new File(folder,"integrated-warning.png");final JSONObject ui=new JSONObject();
                    final String capturedMessage=String.valueOf(field(observedAuthority.getClass(),"message").get(observedAuthority));
                    onMain(()->{Object startup=field(actualTelemetry,"startup").get(null);Activity foreground=startup==null?null:(Activity)method(startup.getClass(),"foregroundActivity").invoke(startup);View originalRoot=actualActivity.getWindow().getDecorView();View view=findCompact(originalRoot);Object speedState=Class.forName("c54",true,getTargetContext().getClassLoader()).getField("a").get(null);Object currentView=method(actualTelemetry,"view").invoke(null),nativeFix=method(actualTelemetry,"lastFix").invoke(null),phoneSpeed=method(actualTelemetry,"phoneSpeedValue").invoke(null);ui.put("legacy_external",field(currentView.getClass(),"external").getBoolean(currentView)).put("legacy_measured_speed_present",field(currentView.getClass(),"currentKmh").get(currentView)!=null).put("native_fix_present",nativeFix!=null).put("native_fresh_measured_speed",method(actualTelemetry,"freshNativeSpeed").invoke(null)).put("phone_speed_present",phoneSpeed!=null).put("native_speed_display_on",method(speedState.getClass(),"getValue").invoke(speedState)).put("show_speed_gate_without_native",method(actualTelemetry,"showSpeed",boolean.class).invoke(null,false)).put("native_warning_text",method(actualTelemetry,"nativeCarWarningText").invoke(null)).put("compact_warning_text",method(actualTelemetry,"compactWarningText").invoke(null));if(view==null&&!report.has("missing_widget_screenshot")){Bitmap image=getUiAutomation().takeScreenshot();if(image!=null){File missing=new File(destination.getParentFile(),"missing-widget.png");try(FileOutputStream stream=new FileOutputStream(missing)){image.compress(Bitmap.CompressFormat.PNG,100,stream);}report.put("missing_widget_screenshot",missing.getAbsolutePath());}}ui.put("original_activity_destroyed",actualActivity.isDestroyed()).put("original_activity_finishing",actualActivity.isFinishing()).put("original_activity_identity",System.identityHashCode(actualActivity)).put("original_root_attached",originalRoot.isAttachedToWindow()).put("original_has_window_focus",actualActivity.hasWindowFocus()).put("original_root_widget_found",view!=null).put("original_root_classes",viewClasses(originalRoot));if(foreground!=null)ui.put("foreground_activity",foreground.getClass().getName()).put("foreground_activity_identity",System.identityHashCode(foreground)).put("foreground_same_as_launched",foreground==actualActivity).put("foreground_root_widget_found",findCompact(foreground.getWindow().getDecorView())!=null).put("foreground_root_classes",viewClasses(foreground.getWindow().getDecorView()));if(view!=null)ui.put("widget_attached",view.isAttachedToWindow()).put("widget_description",String.valueOf(view.getContentDescription()));});
                    if(ui.optBoolean("widget_attached")&&ui.optString("widget_description").contains(capturedMessage.replace('\n',' ').replace('\r',' '))){
                        // Allow actual rendering while the warning is active; a genuine source CLEAR after
                        // terminal must not overwrite this witness with an intentionally empty final widget.
                        SystemClock.sleep(150);
                        onMain(()->{View view=findCompact(actualActivity.getWindow().getDecorView());if(view!=null){int[] pos=new int[2];view.getLocationOnScreen(pos);
                            ui.put("foreground_activity",actualActivity.getClass().getName()).put("activity_has_window_focus",actualActivity.hasWindowFocus()).put("compact_text",method(actualTelemetry,"compactWarningText").invoke(null))
                              .put("widget_attached",view.isAttachedToWindow()).put("widget_shown",view.isShown()).put("widget_description",String.valueOf(view.getContentDescription())).put("widget_x",pos[0]).put("widget_y",pos[1]).put("widget_width",view.getWidth()).put("widget_height",view.getHeight()).put("captured_message",capturedMessage);
                            if(view.isShown()&&String.valueOf(view.getContentDescription()).contains(capturedMessage.replace('\n',' ').replace('\r',' '))){Bitmap image=getUiAutomation().takeScreenshot();if(image!=null)try(FileOutputStream stream=new FileOutputStream(destination)){image.compress(Bitmap.CompressFormat.PNG,100,stream);ui.put("screenshot",destination.getAbsolutePath());}}
                        }});
                    }
                    uiCaptured=ui.has("screenshot");report.put("ui",ui);
                }
                List<?> rows=(List<?>)method(diagnostics,"snapshot").invoke(null);
                for(Object value:rows){Map<?,?> row=(Map<?,?>)value;Object at=row.get("elapsed_ms");if(!(at instanceof Number)||((Number)at).longValue()<observeAfter)continue;
                    String rowKey=String.valueOf(row.get("stage"))+"|"+row.get("provider_session")+"|"+row.get("sequence")+"|"+row.get("attempt_id")+"|"+at;
                    if(!diagnosticArchive.containsKey(rowKey)){if(diagnosticArchive.size()>=expectedCount*32+128)throw new IllegalStateException("Private diagnostic archive bound exceeded");diagnosticArchive.put(rowKey,new HashMap<>(row));}
                    if(!type.equals(row.get("native_type")))continue;String key=String.valueOf(row.get("event_key"));if(key.isEmpty()||key.equals("null")||!eligibleEventKeys.contains(key))continue;
                    if(eventKey.isEmpty())eventKey=key;
                    Set<String> stages=eventStages.get(key);if(stages==null){stages=new HashSet<>();eventStages.put(key,stages);}stages.add(String.valueOf(row.get("stage")));
                }
                started=false;terminal=eventStages.size()==expectedCount;int startedCount=0,terminalCount=0;
                for(Set<String> stages:eventStages.values()){if(stages.contains("SCHEDULER_STARTED")){started=true;startedCount++;}if(stages.contains(expectedTerminal))terminalCount++;else terminal=false;}
                terminalStage=terminal?expectedTerminal:"";
                report.put("observed_event_count",eventStages.size()).put("started_event_count",startedCount).put("terminal_event_count",terminalCount);
                // Silent can finish before the first map/widget frame. Keep observing the
                // original UI within the existing deadline; audio completion is not a draw fence.
                if(terminal&&observedAuthority!=null&&uiCaptured&&field(scheduler.getClass(),"active").get(scheduler)==null)break;
                SystemClock.sleep(10);
            }
            if(uiCaptured){final JSONObject drawn=new JSONObject();onMain(()->{View view=findCompact(actualActivity.getWindow().getDecorView());if(view!=null)drawn.put("shown",view.isShown()).put("alpha",view.getAlpha()).put("draw_time",view.getDrawingTime()).put("description",String.valueOf(view.getContentDescription()));});report.put("post_terminal_ui",drawn);}
            report.put("event_key",eventKey).put("started",started).put("terminal_observed",terminal).put("terminal_stage",terminalStage).put("final_state",state(telemetry)).put("diagnostics",new JSONArray(diagnosticArchive.values()));
            if(observedAuthority==null)throw new IllegalStateException("No matching genuine native authority reached the actual scheduler");
            if(!mode.equals("SILENT")&&report.optInt("started_event_count")!=expectedCount)throw new IllegalStateException("Some actual authorities never reached speaker STARTED");
            if(!terminal)throw new IllegalStateException("No actual terminal outcome");
            if(!terminalStage.equals(expectedTerminal))throw new IllegalStateException("The real outcome did not satisfy the reviewed test choice: "+terminalStage);
            JSONObject ui=report.optJSONObject("ui");String message=ui==null?"":ui.optString("captured_message");
            if(!uiCaptured||ui==null||!ui.optBoolean("widget_attached")||!ui.optBoolean("widget_shown")||!ui.optString("widget_description").contains(message.replace('\n',' ').replace('\r',' ')))throw new IllegalStateException("Actual attached warning UI did not preserve the received text");
            if("true".equals(args.getString("require_no_speed"))&&(ui.optBoolean("legacy_measured_speed_present",true)||ui.optBoolean("native_fresh_measured_speed",true)||ui.optBoolean("phone_speed_present",true)))throw new IllegalStateException("No-speed UI witness requires actual absent legacy and native measured speed");
            if(!report.getJSONObject("final_state").optBoolean("provider_audio_muted"))throw new IllegalStateException("Production startup status did not observe source mute");
            if("true".equals(args.getString("capture_pcm"))){JSONArray signals=pcmReport(folder);report.put("pcm_signals",signals);boolean valid=false;for(int i=0;i<signals.length();i++){JSONObject signal=signals.getJSONObject(i);if(signal.optBoolean("started")&&signal.optBoolean("done")&&!signal.optBoolean("failed")&&!signal.optBoolean("stopped")&&signal.optLong("nonzero_samples")>1000&&signal.optDouble("duration_seconds")>.3&&!signal.optBoolean("truncated"))valid=true;}if(!valid)throw new IllegalStateException("No bounded non-silent tagged TTS PCM signal observed");}
            report.put("status","observed");
        }catch(Throwable error){reportPut(report,"status","blocked");reportPut(report,"exception",android.util.Log.getStackTraceString(error));}
        finally{
            try{if(telemetry!=null&&activity!=null){final Class<?> real=telemetry;final Context context=getTargetContext();onMain(()->method(real,"select",String.class).invoke(null,""));
                long until=SystemClock.elapsedRealtime()+8000;boolean quiet=false;while(SystemClock.elapsedRealtime()<until){final boolean[] idle={false};onMain(()->{Object scheduler=field(real,"scheduler").get(null),speaker=field(real,"nativeSpeaker").get(null);idle[0]=(scheduler==null||field(scheduler.getClass(),"active").get(scheduler)==null&&field(scheduler.getClass(),"grantRequests").getInt(scheduler)==0)&&(speaker==null||field(speaker.getClass(),"active").get(speaker)==null);});boolean pending=productionConnection!=null&&(field(productionConnection.getClass(),"outputOutstanding").getBoolean(productionConnection)||field(productionConnection.getClass(),"grantRequestPending").getBoolean(productionConnection));if(idle[0]&&!pending){quiet=true;break;}SystemClock.sleep(20);}reportPut(report,"cleanup_output_quiescent",quiet);if(!quiet)reportPut(report,"status","blocked");}}
            catch(Throwable failure){reportPut(report,"cleanup_exception",android.util.Log.getStackTraceString(failure));reportPut(report,"status","blocked");}
            try{if(observedEngine!=null&&observedOriginal!=null)onMain(()->observedEngine.setOnUtteranceProgressListener(observedOriginal));reportPut(report,"original_tts_listener_restored",observedEngine==null||observedOriginal!=null);}catch(Throwable failure){reportPut(report,"status","blocked");reportPut(report,"listener_restore_error",android.util.Log.getStackTraceString(failure));}
            try{if(activity!=null){final Activity done=activity;onMain(done::finish);onMain(()->{});}if(prefs!=null&&original!=null){restore(prefs,original);boolean equal=copy(prefs.getAll()).equals(original);reportPut(report,"preferences_restored_exactly",equal);reportPut(report,"preferences_after_sha256",fingerprint(copy(prefs.getAll())));if(!equal)reportPut(report,"status","blocked");}}
            catch(Throwable failure){reportPut(report,"restore_exception",android.util.Log.getStackTraceString(failure));reportPut(report,"status","blocked");}
            if(cancelFile!=null&&cancelFile.exists())reportPut(report,"private_cancel_sentinel_removed",cancelFile.delete());
            reportPut(report,"probe_completed",true);reportPut(report,"scope","Actual Vela Activity/ViewModel/native engine preferences/session/connection/scheduler/speaker/UI; producer must trigger original native callbacks into its real endpoint. No direct speaker/owner construction, packet, grant, source-complete or test-sink override.");
            if(diagnostics!=null)try{report.put("diagnostics_after_cleanup",new JSONArray(diagnosticArchive.values()));}catch(Throwable ignored){}
            try{report.put("expected_event_count",expectedCount).put("expected_terminal",expectedTerminal).put("event_stages",new JSONObject(eventStages));}catch(Exception ignored){}
            if(expectedCount>3&&folder!=null){try{File full=new File(folder,"matrix-result.json");byte[] bytes=report.toString().getBytes("UTF-8");try(FileOutputStream stream=new FileOutputStream(full)){stream.write(bytes);}StringBuilder hash=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))hash.append(String.format(java.util.Locale.ROOT,"%02x",b&255));JSONObject manifest=new JSONObject().put("status",report.optString("status")).put("probe_completed",true).put("process_uid",android.os.Process.myUid()).put("target_uid",getTargetContext().getApplicationInfo().uid).put("target_package",getTargetContext().getPackageName()).put("report_file",full.getAbsolutePath()).put("report_sha256",hash.toString()).put("expected_event_count",expectedCount).put("cleanup_output_quiescent",report.optBoolean("cleanup_output_quiescent")).put("preferences_restored_exactly",report.optBoolean("preferences_restored_exactly"));output.putString("integrated_receiver_result",manifest.toString());}catch(Exception failure){reportPut(report,"status","blocked");output.putString("integrated_receiver_result",report.toString());}}
            else output.putString("integrated_receiver_result",report.toString());finish(report.optString("status").equals("observed")?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
        }
    }
    private static JSONArray viewClasses(View root){JSONArray rows=new JSONArray();java.util.ArrayDeque<View> queue=new java.util.ArrayDeque<>();queue.add(root);while(!queue.isEmpty()&&rows.length()<64){View view=queue.remove();rows.put(view.getClass().getName());if(view instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)view;for(int i=0;i<group.getChildCount();i++)queue.add(group.getChildAt(i));}}return rows;}
    private static View findCompact(View view){if(view.getClass().getName().equals("nl.johninnl.vela.CompactSpeedView"))return view;if(view instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View match=findCompact(group.getChildAt(i));if(match!=null)return match;}}return null;}
    private void installPcmObserver(Class<?> telemetry)throws Exception {
        Object actualGuide=field(telemetry,"voice").get(null);if(actualGuide==null)throw new IllegalStateException("Actual lifecycle guide missing for PCM");observedEngine=(TextToSpeech)field(actualGuide.getClass(),"b").get(actualGuide);if(observedEngine==null)throw new IllegalStateException("Actual selected system engine missing for PCM");
        for(Field f:TextToSpeech.class.getDeclaredFields())if(UtteranceProgressListener.class.isAssignableFrom(f.getType())){f.setAccessible(true);Object value=f.get(observedEngine);if(value!=null){observedOriginal=(UtteranceProgressListener)value;break;}}
        if(observedOriginal==null||!observedOriginal.getClass().getName().equals("vy4"))throw new IllegalStateException("Cannot forward SAME installed original native listener for PCM");
        observedEngine.setOnUtteranceProgressListener(new UtteranceProgressListener(){
            private PcmSignal tagged(String id){if(id==null||!id.startsWith("vela-warning-"))return null;PcmSignal value=pcmSignals.get(id);if(value==null){if(pcmSignals.size()>=8)throw new IllegalStateException("Private PCM utterance bound");try{Object actualSpeaker=field(telemetry,"nativeSpeaker").get(null),attempt=field(actualSpeaker.getClass(),"active").get(actualSpeaker);if(attempt==null||!id.equals("vela-"+field(attempt.getClass(),"id").get(attempt)))return null;Object payload=field(attempt.getClass(),"event").get(attempt);if(!matches(payload,args.getString("expected_native_type")))return null;Object grant=field(attempt.getClass(),"grant").get(attempt);value=new PcmSignal(id);value.warningId=String.valueOf(field(payload.getClass(),"warningId").get(payload));value.providerSession=String.valueOf(field(payload.getClass(),"providerSession").get(payload));value.grantAttempt=String.valueOf(field(grant.getClass(),"attemptId").get(grant));pcmSignals.put(id,value);}catch(Exception error){throw new IllegalStateException("Actual PCM utterance correlation failed",error);}}return value;}
            @Override public void onBeginSynthesis(String id,int rate,int format,int channels){PcmSignal value=tagged(id);if(value!=null)synchronized(value){value.rate=rate;value.format=format;value.channels=channels;}observedOriginal.onBeginSynthesis(id,rate,format,channels);}
            @Override public void onAudioAvailable(String id,byte[] audio){PcmSignal value=tagged(id);if(value!=null&&audio!=null)synchronized(value){value.total+=audio.length;int count=Math.min(audio.length,MAX_PCM-value.data.size());if(count>0)value.data.write(audio,0,count);if(count<audio.length)value.truncated=true;}observedOriginal.onAudioAvailable(id,audio);}
            @Override public void onStart(String id){PcmSignal value=tagged(id);if(value!=null)value.started=true;observedOriginal.onStart(id);}
            @Override public void onDone(String id){PcmSignal value=tagged(id);if(value!=null)value.done=true;observedOriginal.onDone(id);}
            @Override public void onError(String id){PcmSignal value=tagged(id);if(value!=null)value.failed=true;observedOriginal.onError(id);}
            @Override public void onError(String id,int code){PcmSignal value=tagged(id);if(value!=null)value.failed=true;observedOriginal.onError(id,code);}
            @Override public void onStop(String id,boolean interrupted){PcmSignal value=tagged(id);if(value!=null)value.stopped=true;observedOriginal.onStop(id,interrupted);}
        });
    }
    private JSONArray pcmReport(File folder)throws Exception {
        JSONArray out=new JSONArray();for(PcmSignal signal:pcmSignals.values())synchronized(signal){byte[] bytes=signal.data.toByteArray();int width=signal.format==AudioFormat.ENCODING_PCM_16BIT?2:signal.format==AudioFormat.ENCODING_PCM_8BIT?1:signal.format==AudioFormat.ENCODING_PCM_FLOAT?4:0;long samples=0,nonzero=0;double peak=0,squares=0;
            if(width>0)for(int i=0;i+width<=bytes.length;i+=width){double value;if(width==1)value=((bytes[i]&255)-128)/128d;else if(width==2)value=(short)((bytes[i]&255)|(bytes[i+1]<<8))/32768d;else value=Float.intBitsToFloat((bytes[i]&255)|((bytes[i+1]&255)<<8)|((bytes[i+2]&255)<<16)|(bytes[i+3]<<24));if(!Double.isFinite(value))throw new IllegalStateException("Invalid emitted PCM");samples++;if(value!=0)nonzero++;peak=Math.max(peak,Math.abs(value));squares+=value*value;}
            File file=new File(folder,signal.id+".pcm");try(FileOutputStream stream=new FileOutputStream(file)){stream.write(bytes);}StringBuilder hash=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(bytes))hash.append(String.format(java.util.Locale.ROOT,"%02x",b&255));
            out.put(new JSONObject().put("utterance_id",signal.id).put("warning_id",signal.warningId).put("provider_session",signal.providerSession).put("grant_attempt_id",signal.grantAttempt).put("sample_rate",signal.rate).put("audio_format",signal.format).put("channels",signal.channels).put("captured_bytes",bytes.length).put("total_bytes",signal.total).put("truncated",signal.truncated).put("samples",samples).put("nonzero_samples",nonzero).put("peak",peak).put("rms",samples==0?0:Math.sqrt(squares/samples)).put("duration_seconds",signal.rate>0&&signal.channels>0?(double)samples/(signal.rate*signal.channels):0).put("started",signal.started).put("done",signal.done).put("stopped",signal.stopped).put("failed",signal.failed).put("pcm_file",file.getAbsolutePath()).put("pcm_sha256",hash.toString()));
        }return out;
    }
    private static final class PcmSignal{final String id;String warningId,providerSession,grantAttempt;final ByteArrayOutputStream data=new ByteArrayOutputStream();int rate,format,channels;long total;boolean truncated;volatile boolean started,done,stopped,failed;PcmSignal(String id){this.id=id;}}
    private String eventKey(Object event)throws Exception{Class<?> grant=Class.forName("nl.johninnl.navigation.alerts.PlaybackGrant",true,getTargetContext().getClassLoader());return String.valueOf(method(grant,"key",event.getClass()).invoke(null,event));}
    private boolean matches(Object event,String expected)throws Exception{return expected.equals(field(event.getClass(),"nativeType").get(event))&&(!args.containsKey("exclude_warning_id")||!args.getString("exclude_warning_id").equals(field(event.getClass(),"warningId").get(event)))&&(!args.containsKey("expected_native_subtype")||args.getString("expected_native_subtype").equals(field(event.getClass(),"nativeSubtype").get(event)))&&(!args.containsKey("expected_warning_id_prefix")||String.valueOf(field(event.getClass(),"warningId").get(event)).startsWith(args.getString("expected_warning_id_prefix")))&&(!args.containsKey("expected_warning_id")||args.getString("expected_warning_id").equals(field(event.getClass(),"warningId").get(event)));}
    private static JSONObject event(Object event)throws Exception{JSONObject result=new JSONObject();for(String name:new String[]{"providerSession","sequence","warningId","revision","announcementIndex","nativeType","nativeSubtype","category","phase","message","languageTag","messageOrigin","relevance","relationship","priority","observedAt","issuedAt","announceUntil"})result.put(name,String.valueOf(field(event.getClass(),name).get(event)));return result;}
    private static JSONObject state(Class<?> telemetry)throws Exception{JSONObject value=new JSONObject();Object startup=field(telemetry,"startup").get(null),session=field(telemetry,"semantic").get(null),scheduler=field(telemetry,"scheduler").get(null);value.put("startup",startup==null?"":method(startup.getClass(),"state").invoke(startup)).put("provider_audio_muted",startup!=null&&field(startup.getClass(),"providerMuted").getBoolean(startup)).put("session",session==null?"":method(session.getClass(),"state").invoke(session)).put("coverage",session!=null&&Boolean.TRUE.equals(method(session.getClass(),"captureComplete").invoke(session))).put("scheduler",scheduler==null?"":method(scheduler.getClass(),"status").invoke(scheduler));return value;}
    private static Field field(Class<?> type,String name)throws Exception{for(Class<?> current=type;current!=null;current=current.getSuperclass())try{Field f=current.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}throw new NoSuchFieldException(type.getName()+"."+name);}
    private static Method method(Class<?> type,String name,Class<?>...params)throws Exception{for(Class<?> current=type;current!=null;current=current.getSuperclass())try{Method m=current.getDeclaredMethod(name,params);m.setAccessible(true);return m;}catch(NoSuchMethodException absent){}throw new NoSuchMethodException(type.getName()+"."+name);}
    private static Object enumValue(Class<?> type,String name)throws Exception{for(Object value:(Object[])method(type,"values").invoke(null))if(((Enum<?>)value).name().equals(name))return value;throw new IllegalArgumentException(name);}
    private interface Main {void run()throws Exception;}
    private void onMain(Main action)throws Exception{AtomicReference<Throwable> error=new AtomicReference<>();runOnMainSync(()->{try{action.run();}catch(Throwable caught){error.set(caught);}});if(error.get()!=null)throw new Exception("Actual app main operation failed",error.get());}
    private static Map<String,Object> copy(Map<String,?> values){Map<String,Object> result=new HashMap<>();for(Map.Entry<String,?> entry:values.entrySet())result.put(entry.getKey(),entry.getValue() instanceof Set?new HashSet<>((Set<?>)entry.getValue()):entry.getValue());return result;}
    @SuppressWarnings("unchecked") private static void restore(SharedPreferences prefs,Map<String,Object> values){SharedPreferences.Editor edit=prefs.edit().clear();for(Map.Entry<String,Object> entry:values.entrySet()){String key=entry.getKey();Object value=entry.getValue();if(value instanceof String)edit.putString(key,(String)value);else if(value instanceof Integer)edit.putInt(key,(Integer)value);else if(value instanceof Long)edit.putLong(key,(Long)value);else if(value instanceof Float)edit.putFloat(key,(Float)value);else if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else if(value instanceof Set)edit.putStringSet(key,new HashSet<>((Set<String>)value));else throw new IllegalStateException("Unknown preference type");}if(!edit.commit())throw new IllegalStateException("Preference restore did not persist");}
    private static String fingerprint(Map<String,Object> values)throws Exception{TreeMap<String,String> sorted=new TreeMap<>();for(Map.Entry<String,Object> entry:values.entrySet()){Object value=entry.getValue();sorted.put(entry.getKey(),value.getClass().getName()+":"+(value instanceof Set?new java.util.TreeSet<>((Set<?>)value):value));}byte[] hash=MessageDigest.getInstance("SHA-256").digest(new JSONObject(sorted).toString().getBytes("UTF-8"));StringBuilder out=new StringBuilder();for(byte b:hash)out.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return out.toString();}
    private static void reportPut(JSONObject report,String key,Object value){try{report.put(key,value);}catch(Exception ignored){}}
}
