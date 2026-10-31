/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
/** Shared entry points for automatic renewal and optional interactive verification. */
final class ServiceConnection {
    private ServiceConnection(){}
    static boolean expired(String jwt){return TokenExpiry.expired(jwt,System.currentTimeMillis()/1000);}
    static void ensure(Activity activity){SourceVerification.ensure(activity);}
    static void renew(Context context){Activity activity=activity(context);if(activity!=null)ensure(activity);}
    static void show(Context context){Activity activity=activity(context);if(activity!=null)SourceVerification.show(activity);}
    static void cancel(){SourceVerification.cancel();}
    private static Activity activity(Context context){
        for(int depth=0;context!=null&&depth<16;depth++){
            if(context instanceof Activity activity)return activity;
            if(!(context instanceof ContextWrapper wrapper))break;
            Context base=wrapper.getBaseContext();if(base==context)break;context=base;
        }
        return null;
    }
}
