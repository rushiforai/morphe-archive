// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.os.*;
import android.view.View;
import android.widget.TextView;
import android.widget.CompoundButton;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.util.Objects;
import java.util.concurrent.*;
import org.json.JSONObject;

/** An observable read-only page. File/settings reads never run on the main thread. */
final class VehicleDataPage {
    private static final String STALE=VehicleDataText.stale();
    private static final String DISABLED="BYD vehicle data is off.\n\nTurn it on and enable Automatic reader to read from this head unit without a computer.";
    private static final String WAITING="Waiting for fresh vehicle readings. Enable Automatic reader or check local ADB authorization.";
    private static final String LOADING="Loading BYD vehicle data setting…";
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsVehicleCache");t.setDaemon(true);return t;});
    private static final ExecutorService settings=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsVehicleSettings");t.setDaemon(true);return t;});
    static void bindToggle(Activity activity,CompoundButton button){
        VehicleDataStore.Access access=VehicleDataStore.access(activity.getApplicationContext());WeakReference<CompoundButton> target=new WeakReference<>(button);
        button.setEnabled(false);
        button.post(new Runnable(){public void run(){
            CompoundButton current=target.get();if(current==null||!current.isAttachedToWindow())return;
            if(!access.loaded){main.postDelayed(this,100);return;}
            current.setChecked(access.enabled);current.setEnabled(true);
        }});
    }
    static void setEnabled(Activity activity,CompoundButton button,boolean on){
        Context context=activity.getApplicationContext();VehicleDataStore.Access access=VehicleDataStore.access(context);
        long token=VehicleDataStore.requestEnabled(context);button.setEnabled(false);WeakReference<CompoundButton> target=new WeakReference<>(button);
        settings.execute(()->{
            boolean saved;try{saved=VehicleDataStore.finishEnabled(context,on,token);}catch(Exception e){saved=false;}
            boolean ok=saved;
            main.post(()->{
                CompoundButton current=target.get();
                if(current!=null&&current.isAttachedToWindow()&&access.epoch==token){
                    current.setChecked(access.enabled);current.setEnabled(true);
                    if(!ok)Toast.makeText(context,"Could not save BYD vehicle data setting. Try again.",Toast.LENGTH_LONG).show();
                }
            });
        });
    }
    static void bind(Activity activity,TextView view){
        Context context=activity.getApplicationContext();WeakReference<TextView> target=new WeakReference<>(view);
        VehicleDataStore.Access access=VehicleDataStore.access(context);
        long[] paintedDeadline={0},paintedEpoch={access.epoch};String[] paintedSource={null};
        // Handler delays use uptime, whereas freshness includes deep sleep. Recheck before any frame.
        view.getViewTreeObserver().addOnPreDrawListener(()->{
            TextView current=target.get();
            if(current!=null&&(!access.loaded||!access.enabled||paintedEpoch[0]!=access.epoch||paintedSource[0]!=null&&access.sourceKnown&&!Objects.equals(paintedSource[0],access.sourceIdentity)||access.enabled&&(DISABLED.contentEquals(current.getText())||LOADING.contentEquals(current.getText())))){
                paintedDeadline[0]=0;paintedSource[0]=null;paintedEpoch[0]=access.epoch;String message=!access.loaded?LOADING:access.enabled?WAITING:DISABLED;
                if(!message.contentEquals(current.getText())){current.setText(message);return false;}
            }
            if(current!=null&&paintedDeadline[0]>0&&SystemClock.elapsedRealtime()>paintedDeadline[0]){
                paintedDeadline[0]=0;current.setText(STALE);return false;
            }
            return true;
        });
        Runnable update=new Runnable(){long renderGeneration;public void run(){
            TextView text=target.get();if(text==null||!text.isAttachedToWindow())return;
            if(text.getWindowVisibility()!=View.VISIBLE){main.postDelayed(this,1000);return;}
            if(!access.enabled){paintedDeadline[0]=0;paintedEpoch[0]=access.epoch;text.setText(access.loaded?DISABLED:LOADING);main.postDelayed(this,1000);return;}
            long requestedEpoch=access.epoch;
            worker.execute(()->{
                String summary,source;long until;boolean fresh;
                try{JSONObject status=VehicleDataStore.status(context);summary=format(status);fresh=status.optBoolean("fresh",false);until=status.optLong("valid_until_elapsed_ms",0);source=status.optString("source_identity","");}
                catch(Exception e){summary="Vehicle readings unavailable. Check Automatic reader or local ADB authorization.";fresh=false;until=0;source="";}
                String ready=summary,identity=source;long deadline=until;boolean hasReadings=fresh;
                main.post(()->{
                    TextView current=target.get();
                    if(current!=null&&current.isAttachedToWindow()){
                        if(current.getWindowVisibility()!=View.VISIBLE){main.postDelayed(this,1000);return;}
                        if(!access.enabled||requestedEpoch!=access.epoch||hasReadings&&access.sourceKnown&&!Objects.equals(identity,access.sourceIdentity)){
                            paintedDeadline[0]=0;paintedSource[0]=null;paintedEpoch[0]=access.epoch;current.setText(access.enabled?WAITING:DISABLED);main.postDelayed(this,1000);return;
                        }
                        long now=SystemClock.elapsedRealtime(),token=++renderGeneration;
                        boolean expired=hasReadings&&(deadline<=0||now>deadline);
                        paintedDeadline[0]=hasReadings&&!expired?deadline:0;
                        paintedSource[0]=hasReadings&&!expired?identity:null;
                        paintedEpoch[0]=requestedEpoch;
                        current.setText(expired?STALE:ready);
                        if(hasReadings&&!expired)main.postDelayed(()->{
                            TextView visible=target.get();
                            if(token==renderGeneration&&access.enabled&&access.epoch==requestedEpoch&&Objects.equals(identity,access.sourceIdentity)&&visible!=null&&visible.isAttachedToWindow()){
                                paintedDeadline[0]=0;paintedSource[0]=null;visible.setText(STALE);
                            }
                        },Math.max(1,deadline-now+1));
                        // The independent expiry above still runs if this next file/settings read blocks.
                        main.postDelayed(this,1000);
                    }
                });
            });
        }};
        // bind is called while building the page, just before it is attached.
        view.post(update);
    }
    private static String format(JSONObject status){
        if("DISABLED".equals(status.optString("reader_state")))return DISABLED;
        return VehicleDataText.format(status,VehicleReaderSettings.mode())+"\n\n"+VehicleEvBridge.description()+"\n\n"+VehicleAutoReader.description();
    }
}
