package androidx.work.impl.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.pairip.VMRunner;
import defpackage.d87;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class ForceStopRunnable$BroadcastReceiver extends BroadcastReceiver {
    public static final String a = d87.k("ForceStopRunnable$Rcvr");

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("GSYdr81Qc7IAeM9e", new Object[]{this, context, intent});
    }
}
