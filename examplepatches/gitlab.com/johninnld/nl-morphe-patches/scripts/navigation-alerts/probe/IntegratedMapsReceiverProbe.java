package nl.johninnl.warningprobe.integration;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
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

/** Observe only the real Maps receiver graph. No event, grant, source flag or speaker is constructed. */
public final class IntegratedMapsReceiverProbe extends Instrumentation {
    private Bundle args;
    private IntegratedMapsPcmObserver pcm;
    private File cancelFile;
    private boolean controllerCancelled;
    private void checkCancellation(){if(cancelFile!=null&&cancelFile.exists()){controllerCancelled=true;throw new IllegalStateException("CONTROLLER_CANCELLED: source validation failed; partial evidence retained");}}
    @Override public void onCreate(Bundle args){super.onCreate(args);this.args=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        JSONObject report=new JSONObject();Bundle output=new Bundle();Activity activity=null;SharedPreferences prefs=null;Map<String,Object> original=null;
        Class<?> telemetry=null,diagnostics=null;File folder=null;Object productionConnection=null;
        try{
            if("true".equals(args.getString("observe_pcm")))pcm=new IntegratedMapsPcmObserver();
            if(!"true".equals(args.getString("reviewed_synthetic_choices")))throw new IllegalArgumentException("Explicit reviewed_synthetic_choices=true is required");
            String mode=args.getString("mode","");if(!mode.equals("VOICE")&&!mode.equals("TONE")&&!mode.equals("SILENT"))throw new IllegalArgumentException("Explicit VOICE/TONE/SILENT mode is required");
            String type=args.getString("expected_native_type","");if(type.isEmpty())throw new IllegalArgumentException("Expected native type required");
            Context context=getTargetContext();String pkg=context.getPackageName();if(!pkg.equals("com.google.android.apps.maps")&&!pkg.equals("org.ungoogled.android.apps.maps"))throw new IllegalArgumentException("Unexpected target");
            ClassLoader loader=context.getClassLoader();telemetry=Class.forName("org.ungoogled.ui.ExternalTelemetry",true,loader);diagnostics=Class.forName("nl.johninnl.navigation.alerts.WarningDiagnostics",true,loader);
            Class<?> shapes=Class.forName("org.ungoogled.ui.Shapes",true,loader);String file=(String)field(shapes,"PREFS").get(null);prefs=context.getSharedPreferences(file,Context.MODE_PRIVATE);original=copy(prefs.getAll());
            report.put("preferences_before_sha256",fingerprint(original)).put("process_uid",android.os.Process.myUid()).put("target_uid",context.getApplicationInfo().uid).put("target_package",pkg);
            report.put("choices",new JSONObject().put("provider","nl.flitsmeister").put("mode",mode).put("categories","ALL").put("reviewed",true).put("widget",true));
            folder=new File(context.getExternalFilesDir(null),"native-warning-integrated");if(!folder.exists()&&!folder.mkdirs())throw new IllegalStateException("Output folder");
            String cancelToken=args.getString("cancel_token","");if(!cancelToken.isEmpty()){if(!cancelToken.matches("[a-f0-9]{32}"))throw new IllegalArgumentException("Invalid private cancellation token");cancelFile=new File(folder,"cancel-"+cancelToken+".request");}
            Intent launch=context.getPackageManager().getLaunchIntentForPackage(pkg);if(launch==null)throw new IllegalStateException("No genuine launcher Activity");launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity=startActivitySync(launch);final Activity actualActivity=activity;final Class<?> actualTelemetry=telemetry;
            long initUntil=SystemClock.elapsedRealtime()+10000;
            while(SystemClock.elapsedRealtime()<initUntil&&field(telemetry,"scheduler").get(null)==null){checkCancellation();SystemClock.sleep(20);}
            if(field(telemetry,"scheduler").get(null)==null)throw new IllegalStateException("Genuine Activity lifecycle did not initialize the receiver graph");
            onMain(()->{
                Object choices=field(actualTelemetry,"warningPreferences").get(null);Class<?> modes=Class.forName("nl.johninnl.navigation.alerts.WarningAudioOwner$Mode",true,loader);
                method(choices.getClass(),"mode",modes).invoke(choices,enumValue(modes,mode));method(choices.getClass(),"categories",int.class).invoke(choices,127);method(choices.getClass(),"confirm").invoke(choices);
                method(actualTelemetry,"setWidget",Context.class,boolean.class).invoke(null,actualActivity,true);
                method(actualTelemetry,"select",Context.class,String.class).invoke(null,actualActivity,"nl.flitsmeister");
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
            if(args.containsKey("matrix_count")){observeMatrix(actualTelemetry,diagnostics,folder,report,mode,type);}
            else {
            long observeAfter=report.getLong("selection_at_elapsed_ms"),until=SystemClock.elapsedRealtime()+30000;Object observedAttempt=null,observedAuthority=null;String eventKey="",terminalStage="";boolean terminal=false,started=false,uiCaptured=false;
            while(SystemClock.elapsedRealtime()<until){
                checkCancellation();
                Object display=field(telemetry,"nativeWarnings").get(null);synchronized(display){Map<?,?> values=(Map<?,?>)field(display.getClass(),"values").get(display);for(Object value:values.values())if(matches(value,type)){observedAuthority=value;report.put("received_display_event",event(value));}}
                Object scheduler=field(telemetry,"scheduler").get(null),active=scheduler==null?null:field(scheduler.getClass(),"active").get(scheduler);
                if(active!=null){Object pending=field(active.getClass(),"pending").get(active),authority=field(pending.getClass(),"authority").get(pending);
                    if(matches(authority,type)){observedAuthority=authority;observedAttempt=active;report.put("received_authority",event(authority));eventKey=String.valueOf(field(pending.getClass(),"key").get(pending));}}
                final JSONObject[] witness={null};onMain(()->{Object speaker=field(actualTelemetry,"nativeSpeaker").get(null);if(pcm!=null&&speaker!=null)pcm.install(speaker);Object attempt=speaker==null?null:field(speaker.getClass(),"active").get(speaker);if(attempt!=null){Object payload=field(attempt.getClass(),"payload").get(attempt),grant=field(attempt.getClass(),"grant").get(attempt);if(matches(payload,type))witness[0]=new JSONObject().put("payload",event(payload)).put("utterance_id",field(attempt.getClass(),"id").get(attempt)).put("attempt_id",field(grant.getClass(),"attemptId").get(grant)).put("mode",String.valueOf(field(grant.getClass(),"mode").get(grant))).put("submitted",field(attempt.getClass(),"submitted").getBoolean(attempt)).put("started",field(attempt.getClass(),"started").getBoolean(attempt));}});
                if(witness[0]!=null)report.put("actual_speaker_attempt",witness[0]);
                if(observedAuthority!=null&&!uiCaptured){final File destination=new File(folder,"integrated-warning.png");final JSONObject ui=new JSONObject();onMain(()->{
                    Object weak=field(actualTelemetry,"foreground").get(null);Activity shown=weak instanceof WeakReference?(Activity)((WeakReference<?>)weak).get():null;Object widget=field(actualTelemetry,"widget").get(null);
                    ui.put("foreground_activity",shown==null?"":shown.getClass().getName()).put("compact_text",method(actualTelemetry,"compactWarning").invoke(null));
                    if(widget instanceof View){View view=(View)widget;int[] pos=new int[2];view.getLocationOnScreen(pos);ui.put("widget_attached",view.isAttachedToWindow()).put("widget_description",String.valueOf(view.getContentDescription())).put("widget_x",pos[0]).put("widget_y",pos[1]).put("widget_width",view.getWidth()).put("widget_height",view.getHeight());}
                    Bitmap image=getUiAutomation().takeScreenshot();if(image!=null){try(FileOutputStream stream=new FileOutputStream(destination)){image.compress(Bitmap.CompressFormat.PNG,100,stream);}ui.put("screenshot",destination.getAbsolutePath());}
                });report.put("ui",ui);uiCaptured=true;}
                List<?> rows=(List<?>)method(diagnostics,"snapshot").invoke(null);
                for(Object value:rows){Map<?,?> row=(Map<?,?>)value;Object at=row.get("elapsed_ms");if(!(at instanceof Number)||((Number)at).longValue()<observeAfter)continue;
                    if(eventKey.isEmpty()&&type.equals(row.get("native_type")))eventKey=String.valueOf(row.get("event_key"));
                    if(!eventKey.isEmpty()&&eventKey.equals(row.get("event_key"))){String stage=String.valueOf(row.get("stage"));if(stage.equals("SCHEDULER_STARTED"))started=true;if(stage.equals("SCHEDULER_COMPLETED")||stage.equals("SCHEDULER_USER_MUTED")||stage.equals("SCHEDULER_USER_FILTERED")||stage.equals("SCHEDULER_EXPIRED")||stage.equals("SCHEDULER_REJECTED")||stage.equals("SCHEDULER_FAILED")){terminal=true;terminalStage=stage;}}
                }
                if(terminal&&observedAuthority!=null&&field(scheduler.getClass(),"active").get(scheduler)==null)break;
                SystemClock.sleep(10);
            }
            // Observe a real draw in the attached Activity before capturing the actual window.
            if(observedAuthority!=null){final java.util.concurrent.CountDownLatch drawn=new java.util.concurrent.CountDownLatch(1);final View[] actualWidget={null};final android.view.ViewTreeObserver.OnDrawListener listener=drawn::countDown;
                onMain(()->{Object value=field(actualTelemetry,"widget").get(null);if(value instanceof View){actualWidget[0]=(View)value;actualWidget[0].getViewTreeObserver().addOnDrawListener(listener);actualWidget[0].invalidate();}});
                boolean realDraw=drawn.await(3,java.util.concurrent.TimeUnit.SECONDS);onMain(()->{if(actualWidget[0]!=null&&actualWidget[0].getViewTreeObserver().isAlive())actualWidget[0].getViewTreeObserver().removeOnDrawListener(listener);});
                report.put("attached_widget_draw_observed",realDraw);if(!realDraw)throw new IllegalStateException("No actual attached warning draw was observed");SystemClock.sleep(250);
                Bitmap image=getUiAutomation().takeScreenshot();if(image==null)throw new IllegalStateException("Actual window screenshot unavailable");File rendered=new File(folder,"integrated-warning-after-draw.png");try(FileOutputStream stream=new FileOutputStream(rendered)){image.compress(Bitmap.CompressFormat.PNG,100,stream);}report.put("actual_window_after_draw_png",rendered.getAbsolutePath());
            }
            report.put("event_key",eventKey).put("started",started).put("terminal_observed",terminal).put("terminal_stage",terminalStage).put("final_state",state(telemetry)).put("diagnostics",new JSONArray((List<?>)method(diagnostics,"snapshot").invoke(null)));
            if(observedAuthority==null)throw new IllegalStateException("No matching genuine native authority reached the actual scheduler");
            if(!started&&!mode.equals("SILENT"))throw new IllegalStateException("Actual scheduler never observed speaker STARTED");
            if(!terminal)throw new IllegalStateException("No actual terminal outcome");
            if(!terminalStage.equals(mode.equals("SILENT")?"SCHEDULER_USER_MUTED":"SCHEDULER_COMPLETED"))throw new IllegalStateException("The real outcome did not satisfy the reviewed test choice: "+terminalStage);
            JSONObject ui=report.optJSONObject("ui");String message=String.valueOf(field(observedAuthority.getClass(),"message").get(observedAuthority));
            if(ui==null||!ui.optBoolean("widget_attached")||!ui.optString("widget_description").contains(message.replace('\n',' ').replace('\r',' ')))throw new IllegalStateException("Actual attached warning UI did not preserve the received text");
            if(!report.getJSONObject("final_state").optBoolean("provider_audio_muted"))throw new IllegalStateException("Production startup status did not observe source mute");
            report.put("status","observed");
            }
        }catch(Throwable error){reportPut(report,"status","blocked");reportPut(report,"exception",android.util.Log.getStackTraceString(error));if(controllerCancelled){reportPut(report,"controller_cancelled",true);reportPut(report,"partial",true);}}
        finally{
            try{if(telemetry!=null&&activity!=null){final Class<?> real=telemetry;final Context context=getTargetContext();onMain(()->method(real,"select",Context.class,String.class).invoke(null,context,""));
                long until=SystemClock.elapsedRealtime()+8000;boolean quiet=false;while(SystemClock.elapsedRealtime()<until){final boolean[] idle={false};onMain(()->{Object scheduler=field(real,"scheduler").get(null),speaker=field(real,"nativeSpeaker").get(null);idle[0]=(scheduler==null||field(scheduler.getClass(),"active").get(scheduler)==null&&field(scheduler.getClass(),"grantRequests").getInt(scheduler)==0)&&(speaker==null||field(speaker.getClass(),"active").get(speaker)==null);});boolean pending=productionConnection!=null&&(field(productionConnection.getClass(),"outputOutstanding").getBoolean(productionConnection)||field(productionConnection.getClass(),"grantRequestPending").getBoolean(productionConnection));if(idle[0]&&!pending){quiet=true;break;}SystemClock.sleep(20);}reportPut(report,"cleanup_output_quiescent",quiet);if(!quiet)reportPut(report,"status","blocked");}}
            catch(Throwable failure){reportPut(report,"cleanup_exception",android.util.Log.getStackTraceString(failure));reportPut(report,"status","blocked");}
            if(pcm!=null)try{onMain(()->pcm.restore());report.put("private_pcm_observer",pcm.report(folder));}catch(Throwable failure){reportPut(report,"pcm_observer_error",android.util.Log.getStackTraceString(failure));reportPut(report,"status","blocked");}
            try{if(activity!=null){final Activity done=activity;onMain(done::finish);onMain(()->{});}if(prefs!=null&&original!=null){restore(prefs,original);boolean equal=copy(prefs.getAll()).equals(original);reportPut(report,"preferences_restored_exactly",equal);reportPut(report,"preferences_after_sha256",fingerprint(copy(prefs.getAll())));if(!equal)reportPut(report,"status","blocked");}}
            catch(Throwable failure){reportPut(report,"restore_exception",android.util.Log.getStackTraceString(failure));reportPut(report,"status","blocked");}
            if(cancelFile!=null&&cancelFile.exists())reportPut(report,"private_cancel_sentinel_removed",cancelFile.delete());
            reportPut(report,"probe_completed",true);reportPut(report,"scope","Actual Maps Activity/preferences/session/connection/scheduler/speaker/UI; producer must trigger original native callbacks into its real endpoint. No packet, grant, source-complete or test-sink override.");
            if(diagnostics!=null)try{report.put("diagnostics_after_cleanup",new JSONArray((List<?>)method(diagnostics,"snapshot").invoke(null)));}catch(Throwable ignored){}
            if(args.containsKey("matrix_count")&&folder!=null)try{File file=new File(folder,"matrix-result.json");byte[] bytes=report.toString().getBytes("UTF-8");try(FileOutputStream stream=new FileOutputStream(file)){stream.write(bytes);}output.putString("integrated_receiver_manifest",new JSONObject().put("file",file.getAbsolutePath()).put("sha256",hex(MessageDigest.getInstance("SHA-256").digest(bytes))).put("status",report.optString("status")).put("probe_completed",true).toString());}catch(Throwable error){output.putString("integrated_receiver_error",android.util.Log.getStackTraceString(error));}
            else output.putString("integrated_receiver_result",report.toString());finish(report.optString("status").equals("observed")?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
        }
    }
    /** Keep the real connection and Activity alive; privately drain the bounded production ring. */
    private void observeMatrix(Class<?> telemetry,Class<?> diagnostics,File folder,JSONObject report,String mode,String type)throws Exception{
        int count=Integer.parseInt(args.getString("matrix_count")),per=args.getString("matrix_pattern","single").equals("repeat")?2:1;if(count<1||count>100)throw new IllegalArgumentException("Matrix model count");
        int expected=count*per;String prefix=args.getString("matrix_warning_base","");if(prefix.isEmpty())throw new IllegalArgumentException("Matrix warning base");
        java.util.LinkedHashMap<String,Map<String,Object>> archive=new java.util.LinkedHashMap<>();java.util.IdentityHashMap<Map<String,Object>,Boolean> seenRows=new java.util.IdentityHashMap<>();java.util.LinkedHashMap<String,Object> authorities=new java.util.LinkedHashMap<>();java.util.Map<String,String> terminal=new java.util.HashMap<>();java.util.Map<String,Integer> startedCounts=new java.util.HashMap<>();java.util.Set<String> started=new java.util.HashSet<>(),succeeded=new java.util.HashSet<>();java.util.Map<String,JSONObject> speakerAttempts=new java.util.LinkedHashMap<>();
        long deadline=SystemClock.elapsedRealtime()+Long.parseLong(args.getString("matrix_timeout_seconds","900"))*1000L;String providerSession=null;boolean screenshot=false;int lastProgress=-1;
        Class<?> eventType=Class.forName("nl.johninnl.navigation.alerts.WarningEvent",false,getTargetContext().getClassLoader()),grantType=Class.forName("nl.johninnl.navigation.alerts.PlaybackGrant",false,getTargetContext().getClassLoader());Method key=method(grantType,"key",eventType);
        try{while(SystemClock.elapsedRealtime()<deadline){
            checkCancellation();
            Object display=field(telemetry,"nativeWarnings").get(null);synchronized(display){for(Object value:((Map<?,?>)field(display.getClass(),"values").get(display)).values())if(matrixMatches(value,prefix,count,type)){String identity=(String)key.invoke(null,value);if(!authorities.containsKey(identity)||"ANNOUNCE".equals(String.valueOf(field(value.getClass(),"operation").get(value))))authorities.put(identity,value);}}
            final Object[] actual={null};onMain(()->{Object scheduler=field(telemetry,"scheduler").get(null),active=field(scheduler.getClass(),"active").get(scheduler);if(active!=null){Object pending=field(active.getClass(),"pending").get(active);actual[0]=field(pending.getClass(),"authority").get(pending);}Object speaker=field(telemetry,"nativeSpeaker").get(null);if(pcm!=null)pcm.install(speaker);Object spoken=field(speaker.getClass(),"active").get(speaker);if(spoken!=null){Object payload=field(spoken.getClass(),"payload").get(spoken);if(matrixMatches(payload,prefix,count,type)){Object grant=field(spoken.getClass(),"grant").get(spoken);String id=String.valueOf(field(spoken.getClass(),"id").get(spoken));speakerAttempts.put(id,new JSONObject().put("utterance_id",id).put("attempt_id",field(grant.getClass(),"attemptId").get(grant)).put("event_key",key.invoke(null,payload)).put("payload",event(payload)));}}});
            if(actual[0]!=null&&matrixMatches(actual[0],prefix,count,type))authorities.put((String)key.invoke(null,actual[0]),actual[0]);
            for(Object value:(List<?>)method(diagnostics,"snapshot").invoke(null)){
                @SuppressWarnings("unchecked") Map<String,Object> row=(Map<String,Object>)value;
                // snapshot() retains each immutable record object. Dedup snapshots by identity,
                // preserving even two distinct callbacks with identical millisecond/scalar fields.
                if(seenRows.put(row,Boolean.TRUE)==null)archive.put(String.valueOf(archive.size()),new java.util.LinkedHashMap<>(row));
            }
            if(archive.size()>20000)throw new IllegalStateException("Private diagnostic archive bound");
            startedCounts.clear();
            for(Map<String,Object> row:archive.values()){
                String identity=String.valueOf(row.get("event_key"));if(!authorities.containsKey(identity))continue;
                String session=String.valueOf(row.get("provider_session"));if(providerSession==null)providerSession=session;else if(!providerSession.equals(session))throw new IllegalStateException("Matrix source session changed");
                String stage=String.valueOf(row.get("stage"));if(stage.equals("SCHEDULER_STARTED")){started.add(identity);startedCounts.put(identity,startedCounts.getOrDefault(identity,0)+1);}
                if(stage.startsWith("SCHEDULER_")&&java.util.Arrays.asList("COMPLETED","INTERRUPTED","CANCELLED","EXPIRED","FAILED","REJECTED","USER_MUTED","USER_FILTERED","NOT_STARTED","UNCERTAIN").contains(stage.substring(10)))terminal.put(identity,stage);
                boolean clear=args.getString("matrix_pattern","single").equals("clear");if(started.contains(identity)&&(clear?stage.equals("SCHEDULER_INTERRUPTED")||stage.equals("SCHEDULER_CANCELLED"):stage.equals("SCHEDULER_COMPLETED")))succeeded.add(identity);
            }
            if(lastProgress!=terminal.size()+succeeded.size()){lastProgress=terminal.size()+succeeded.size();report.put("diagnostics_all_including_warmup",new JSONArray(archive.values())).put("matrix_observed_so_far",authorities.size()).put("matrix_completed_so_far",succeeded.size());Bundle progress=new Bundle();progress.putString("stage","MATRIX_PROGRESS");progress.putInt("completed",succeeded.size());progress.putInt("expected",expected);sendStatus(0,progress);}
            if(!screenshot&&!started.isEmpty()){
                SystemClock.sleep(250);Bitmap image=getUiAutomation().takeScreenshot();if(image!=null){File png=new File(folder,"matrix-actual-window.png");try(FileOutputStream stream=new FileOutputStream(png)){image.compress(Bitmap.CompressFormat.PNG,100,stream);}report.put("matrix_actual_window",png.getAbsolutePath());screenshot=true;}
            }
            if(succeeded.size()>=expected){
                final boolean[] idle={false};onMain(()->{Object scheduler=field(telemetry,"scheduler").get(null);idle[0]=field(scheduler.getClass(),"active").get(scheduler)==null&&field(scheduler.getClass(),"grantRequests").getInt(scheduler)==0;});if(idle[0])break;
            }
            SystemClock.sleep(20);
        }
        }finally{
        JSONArray events=new JSONArray();for(Map.Entry<String,Object> entry:authorities.entrySet())events.put(new JSONObject().put("event_key",entry.getKey()).put("event",event(entry.getValue())).put("started",started.contains(entry.getKey())).put("started_count",startedCounts.getOrDefault(entry.getKey(),0)).put("terminal",terminal.get(entry.getKey())));
        JSONArray measured=new JSONArray();for(Map<String,Object> row:archive.values())if(authorities.containsKey(String.valueOf(row.get("event_key"))))measured.put(new JSONObject(row));
        report.put("matrix_expected_authorities",expected).put("matrix_measured_authorities",authorities.size()).put("matrix_terminal_authorities",terminal.size()).put("matrix_succeeded_authorities",succeeded.size()).put("matrix_provider_session",providerSession).put("matrix_events",events).put("matrix_speaker_attempts",new JSONArray(speakerAttempts.values())).put("diagnostics",measured).put("diagnostics_all_including_warmup",new JSONArray(archive.values())).put("measured_event_keys",new JSONArray(authorities.keySet())).put("diagnostic_archive_private",true).put("production_ring_unchanged",true).put("final_state",state(telemetry));
        }
        if(authorities.size()!=expected||succeeded.size()!=expected||started.size()!=expected)throw new IllegalStateException("Incomplete real warm matrix; no missing sample is excluded");
        for(String identity:authorities.keySet())if(startedCounts.getOrDefault(identity,0)!=1)throw new IllegalStateException("Duplicate actual STARTED under one ANNOUNCE authority; all callbacks retained");report.put("status","observed");
    }
    private boolean matrixMatches(Object event,String prefix,int count,String type)throws Exception{
        if(!type.equals(field(event.getClass(),"nativeType").get(event)))return false;String id=String.valueOf(field(event.getClass(),"warningId").get(event));
        if(count==1)return id.equals(prefix);if(!id.matches(java.util.regex.Pattern.quote(prefix)+"-\\d{3}"))return false;int index=Integer.parseInt(id.substring(id.length()-3));return index>=1&&index<=count;
    }
    private static String hex(byte[] data){StringBuilder value=new StringBuilder();for(byte b:data)value.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return value.toString();}
    private boolean matches(Object event,String expected)throws Exception{return expected.equals(field(event.getClass(),"nativeType").get(event))&&(!args.containsKey("expected_native_subtype")||args.getString("expected_native_subtype").equals(field(event.getClass(),"nativeSubtype").get(event)))&&(!args.containsKey("expected_warning_id")||args.getString("expected_warning_id").equals(field(event.getClass(),"warningId").get(event)));}
    private static JSONObject event(Object event)throws Exception{JSONObject result=new JSONObject();for(String name:new String[]{"providerSession","sequence","warningId","revision","announcementIndex","nativeType","nativeSubtype","category","phase","message","languageTag","messageOrigin","relevance","relationship","priority","observedAt","issuedAt","announceUntil"})result.put(name,String.valueOf(field(event.getClass(),name).get(event)));return result;}
    private static JSONObject state(Class<?> telemetry)throws Exception{JSONObject value=new JSONObject();Object startup=field(telemetry,"startup").get(null),session=field(telemetry,"semantic").get(null),scheduler=field(telemetry,"scheduler").get(null);value.put("startup",startup==null?"":method(startup.getClass(),"state").invoke(startup)).put("provider_audio_muted",startup!=null&&field(startup.getClass(),"providerMuted").getBoolean(startup)).put("session",session==null?"":method(session.getClass(),"state").invoke(session)).put("coverage",session!=null&&Boolean.TRUE.equals(method(session.getClass(),"captureComplete").invoke(session))).put("scheduler",scheduler==null?"":method(scheduler.getClass(),"status").invoke(scheduler));
        Object speaker=field(telemetry,"nativeSpeaker").get(null);if(speaker!=null){Object guide=field(speaker.getClass(),"guidance").get(speaker);value.put("speaker_initialized",field(speaker.getClass(),"initialized").getBoolean(speaker)).put("speaker_prepared_language",field(speaker.getClass(),"preparedLanguage").get(speaker)).put("speaker_tts_created",field(speaker.getClass(),"tts").get(speaker)!=null).put("guidance_ready",method(guide.getClass(),"isReady").invoke(guide)).put("guidance_bound",field(guide.getClass(),"bound").getBoolean(guide)).put("guidance_fault",field(guide.getClass(),"fault").getBoolean(guide));}
        if(scheduler!=null)value.put("scheduler_prepared_language",field(scheduler.getClass(),"preparedLanguage").get(scheduler)).put("scheduler_prepared_mode",String.valueOf(field(scheduler.getClass(),"preparedMode").get(scheduler)));return value;}
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
