package nl.johninnl.warningprobe.recovery;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/** Source-owned recovery UI only, with no grant/player, event injection or receiver construction. */
public final class ParkedRecoveryProbe extends Instrumentation {
    private Bundle args;
    @Override public void onCreate(Bundle arguments){super.onCreate(arguments);args=arguments==null?new Bundle():arguments;start();}
    @Override public void onStart(){
        JSONObject report=new JSONObject();Bundle output=new Bundle();Activity shown=null;
        try{
            if(!"true".equals(args.getString("reviewed_parked_empty_state")))throw new IllegalArgumentException("Explicit reviewed_parked_empty_state=true is required");
            Context target=getTargetContext();if(!target.getPackageName().equals("nl.flitsmeister"))throw new IllegalArgumentException("Unexpected target");
            report.put("target_package",target.getPackageName()).put("target_uid",target.getApplicationInfo().uid).put("process_uid",android.os.Process.myUid());
            Class<?> nativeWarnings=Class.forName("nl.johninnl.flitsmeister.NativeWarnings",true,target.getClassLoader());
            Object endpoint=nativeWarnings.getMethod("init",Context.class).invoke(null,target);
            report.put("before",emptyState(endpoint)); // Refuse to reset any pre-existing ownership/uncertainty.
            String activityName="nl.johninnl.flitsmeister.WarningRecoveryActivity";
            Intent launch=new Intent().setClassName(target.getPackageName(),activityName).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ActivityInfo info=target.getPackageManager().getActivityInfo(launch.getComponent(),0);
            if(info.exported)throw new IllegalStateException("Recovery Activity must remain private");
            shown=startActivitySync(launch);final Activity activity=shown;
            report.put("activity",activity.getClass().getName()).put("exported",info.exported).put("language",activity.getResources().getConfiguration().getLocales().get(0).getLanguage());
            runOnMainSync(()->{
                ArrayList<CheckBox> boxes=new ArrayList<>();ArrayList<Button> buttons=new ArrayList<>();collect(activity.getWindow().getDecorView(),boxes,buttons);
                if(boxes.size()!=2||buttons.size()!=1)throw new IllegalStateException("Expected the actual two-confirmation recovery screen");
                Button reset=buttons.get(0);if(reset.isEnabled())throw new IllegalStateException("Reset initially enabled");
                boxes.get(0).setChecked(true);if(reset.isEnabled())throw new IllegalStateException("Parked alone enabled reset");
                boxes.get(0).setChecked(false);boxes.get(1).setChecked(true);if(reset.isEnabled())throw new IllegalStateException("Stopped alone enabled reset");
                boxes.get(0).setChecked(true);if(!reset.isEnabled())throw new IllegalStateException("Both confirmations did not enable reset");
            });
            waitForIdleSync();SystemClock.sleep(150);
            File destination=new File(target.getExternalFilesDir(null),"native-warning-recovery.png");
            Bitmap image=getUiAutomation().takeScreenshot();if(image==null)throw new IllegalStateException("No actual-window screenshot");
            try(FileOutputStream stream=new FileOutputStream(destination)){image.compress(Bitmap.CompressFormat.PNG,100,stream);}finally{image.recycle();}
            report.put("screenshot",destination.getAbsolutePath()).put("both_confirmations_required",true);
            runOnMainSync(()->{
                ArrayList<CheckBox> boxes=new ArrayList<>();ArrayList<Button> buttons=new ArrayList<>();collect(activity.getWindow().getDecorView(),boxes,buttons);
                if(!buttons.get(0).performClick())throw new IllegalStateException("Reset button did not handle the real click");
            });
            long until=SystemClock.elapsedRealtime()+5000;while(!activity.isFinishing()&&SystemClock.elapsedRealtime()<until)SystemClock.sleep(20);
            if(!activity.isFinishing())throw new IllegalStateException("Successful source-owned reset did not finish its Activity");
            report.put("after",emptyState(endpoint)).put("activity_finished_after_success",true).put("status","observed");
        }catch(Throwable error){try{report.put("status","blocked").put("exception",android.util.Log.getStackTraceString(error));}catch(Exception ignored){}}
        finally{
            if(shown!=null&&!shown.isFinishing()){final Activity unfinished=shown;runOnMainSync(unfinished::finish);}
            try{report.put("scope","Actual private source recovery screen, two required confirmations and source-actor reset in verified initially unowned/no-pending state. No unknown output cleared, no playback attempted. Live-owner refusal and recovery of genuinely uncertain output remain separate.");}catch(Exception ignored){}
            output.putString("parked_recovery_result",report.toString());finish(report.optString("status").equals("observed")?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
        }
    }
    private JSONObject emptyState(Object endpoint)throws Exception{
        ExecutorService actor=(ExecutorService)field(endpoint.getClass(),"actor").get(endpoint);
        return actor.submit(()->{
            Object audio=field(endpoint.getClass(),"audio").get(endpoint);if(audio==null)throw new IllegalStateException("No actual source audio owner");
            Object snapshot=audio.getClass().getMethod("snapshot",long.class).invoke(audio,SystemClock.elapsedRealtime());
            String code=String.valueOf(field(snapshot.getClass(),"code").get(snapshot));
            if(!code.equals("UNOWNED")||field(snapshot.getClass(),"owner").get(snapshot)!=null||field(snapshot.getClass(),"pending").get(snapshot)!=null)throw new IllegalStateException("Refusing reset of pre-existing source ownership: "+code);
            return new JSONObject().put("code",code).put("owner_present",false).put("pending_present",false);
        }).get(3,TimeUnit.SECONDS);
    }
    private static Field field(Class<?> owner,String name)throws Exception{Field value=owner.getDeclaredField(name);value.setAccessible(true);return value;}
    private static void collect(View root,ArrayList<CheckBox> boxes,ArrayList<Button> buttons){
        if(root instanceof CheckBox)boxes.add((CheckBox)root);else if(root instanceof Button)buttons.add((Button)root);
        if(root instanceof ViewGroup){ViewGroup group=(ViewGroup)root;for(int i=0;i<group.getChildCount();i++)collect(group.getChildAt(i),boxes,buttons);}
    }
}
