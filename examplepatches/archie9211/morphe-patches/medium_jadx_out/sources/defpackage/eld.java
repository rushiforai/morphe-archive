package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class eld extends BroadcastReceiver {
    public final l01 a;
    public final AtomicBoolean b;

    public eld() {
        l01.a.getClass();
        this.a = k01.b;
        this.b = new AtomicBoolean(false);
    }

    public final Intent b(Context context, IntentFilter intentFilter) {
        context.getClass();
        j01 j01Var = (j01) this.a;
        Intent intentRegisterReceiver = (j01Var.f || j01Var.c) ? context.registerReceiver(this, intentFilter, 4) : context.registerReceiver(this, intentFilter);
        this.b.set(true);
        return intentRegisterReceiver;
    }
}
