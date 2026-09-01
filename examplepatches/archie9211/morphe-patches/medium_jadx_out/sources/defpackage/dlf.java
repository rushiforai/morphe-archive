package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.zzcy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dlf extends BroadcastReceiver {
    public boolean a;
    public final boolean b;
    public final /* synthetic */ tlf c;

    public dlf(tlf tlfVar, boolean z) {
        this.c = tlfVar;
        this.b = z;
    }

    public final synchronized void a(Context context, IntentFilter intentFilter) {
        try {
            if (this.a) {
                return;
            }
            if (Build.VERSION.SDK_INT >= 33) {
                context.registerReceiver(this, intentFilter, true != this.b ? 4 : 2);
            } else {
                context.registerReceiver(this, intentFilter);
            }
            this.a = true;
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void b(Context context, IntentFilter intentFilter) {
        dlf dlfVar;
        try {
            try {
                if (this.a) {
                    return;
                }
                if (Build.VERSION.SDK_INT >= 33) {
                    dlfVar = this;
                    context.registerReceiver(dlfVar, intentFilter, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST", null, true != this.b ? 4 : 2);
                } else {
                    dlfVar = this;
                    context.registerReceiver(dlfVar, intentFilter, "com.google.android.finsky.permission.PLAY_BILLING_LIBRARY_BROADCAST", null);
                }
                dlfVar.a = true;
                return;
            } catch (Throwable th) {
                th = th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        throw th;
    }

    public final synchronized void c(Context context) {
        if (!this.a) {
            rxf.i("BillingBroadcastManager", "Receiver is not registered.");
        } else {
            context.unregisterReceiver(this);
            this.a = false;
        }
    }

    public final void d(Bundle bundle, BillingResult billingResult, int i, lbg lbgVar, long j, boolean z) {
        try {
            byte[] byteArray = bundle.getByteArray("FAILURE_LOGGING_PAYLOAD");
            d0g d0gVar = this.c.e;
            if (byteArray != null) {
                ((zjf) d0gVar).q(uag.u(bundle.getByteArray("FAILURE_LOGGING_PAYLOAD")), j, z);
            } else {
                ((zjf) d0gVar).q(zzcy.zzb(cbg.BILLING_RESULT_RECEIVED_FROM_PHONESKY, i, billingResult, null, lbgVar), j, z);
            }
        } catch (Throwable unused) {
            rxf.i("BillingBroadcastManager", "Failed parsing Api failure.");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x026a  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0276  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0042  */
    @Override // android.content.BroadcastReceiver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onReceive(android.content.Context r17, android.content.Intent r18) {
        /*
            Method dump skipped, instruction units count: 641
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dlf.onReceive(android.content.Context, android.content.Intent):void");
    }
}
