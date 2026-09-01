package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import com.google.android.gms.internal.gtm.zzff;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n51 extends BroadcastReceiver {
    static Boolean zza;

    public static boolean zzb(Context context) {
        vp7.p(context);
        Boolean bool = zza;
        if (bool != null) {
            return bool.booleanValue();
        }
        boolean zZzi = zzff.zzi(context, "com.google.android.gms.analytics.CampaignTrackingReceiver", true);
        zza = Boolean.valueOf(zZzi);
        return zZzi;
    }
}
