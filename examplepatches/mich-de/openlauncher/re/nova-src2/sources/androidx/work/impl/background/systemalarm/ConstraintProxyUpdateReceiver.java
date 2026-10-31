package androidx.work.impl.background.systemalarm;

import ab.y;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import o7.r;
import p7.s;

/* loaded from: classes2.dex */
public class ConstraintProxyUpdateReceiver extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f15336a = 0;

    static {
        r.e("ConstrntProxyUpdtRecvr");
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if ("androidx.work.impl.background.systemalarm.UpdateProxies".equals(intent != null ? intent.getAction() : null)) {
            s.c(context).f82375d.a(new y(20, intent, context, goAsync(), false));
        } else {
            r.c().getClass();
        }
    }
}
