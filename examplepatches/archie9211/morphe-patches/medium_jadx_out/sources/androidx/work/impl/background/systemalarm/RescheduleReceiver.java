package androidx.work.impl.background.systemalarm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.pairip.VMRunner;
import defpackage.d87;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class RescheduleReceiver extends BroadcastReceiver {
    public static final String a = d87.k("RescheduleReceiver");

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("oktgtpbJLkEub67g", new Object[]{this, context, intent});
    }
}
