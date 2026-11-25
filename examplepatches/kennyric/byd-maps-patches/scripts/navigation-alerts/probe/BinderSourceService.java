package nl.johninnl.warningprobe;

import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import java.util.Collections;
import nl.johninnl.navigation.alerts.WarningCapabilities;
import nl.johninnl.navigation.alerts.WarningEndpoint;

/** Disposable synthetic source. No application warning or audio engine is involved. */
public final class BinderSourceService extends Service {
    public static final String ALLOWED="nl.johninnl.warningprobe.binder.client";
    private final Handler main=new Handler(Looper.getMainLooper());
    private WarningEndpoint endpoint;
    private boolean scheduled;
    @Override public void onCreate(){
        super.onCreate();char[] digest=new char[64];java.util.Arrays.fill(digest,'a');
        endpoint=new WarningEndpoint(this,uid->{
            String[] packages=getPackageManager().getPackagesForUid(uid);
            if(packages!=null)for(String pkg:packages)if(ALLOWED.equals(pkg))return pkg;
            return null;
        },new WarningCapabilities(new String(digest),Collections.singleton("native_text"),true));
    }
    @Override public IBinder onBind(Intent intent){
        if(!scheduled){scheduled=true;main.postDelayed(()->{
            long now=SystemClock.elapsedRealtime();Bundle event=new Bundle();
            event.putString("operation","ANNOUNCE");event.putString("warning_id","synthetic-binder-test");
            event.putLong("revision",1);event.putLong("announcement_index",1);event.putString("phase","notice");
            event.putString("native_type","SYNTHETIC_TEST");event.putString("category","test_only");event.putInt("priority",1);
            event.putString("message","TEST ONLY: synthetic Binder warning; no audio.");event.putString("language_tag","en");
            event.putString("message_origin","native_text");event.putString("relevance","notice");event.putString("relationship","unknown");
            event.putLong("observed_elapsed_ms",now);event.putLong("state_until_elapsed_ms",now+30000);endpoint.emit(event);
        },2000);}
        return endpoint.binder();
    }
    @Override public void onDestroy(){main.removeCallbacksAndMessages(null);if(endpoint!=null)endpoint.close();super.onDestroy();}
}
