package androidx.work.impl.diagnostics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import androidx.work.impl.workers.DiagnosticsWorker;
import o7.r;
import o7.t;
import o7.u;
import p7.s;

/* loaded from: classes2.dex */
public class DiagnosticsReceiver extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public static final String f15346a = r.e("DiagnosticsRcvr");

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        if (intent == null) {
            return;
        }
        r.c().getClass();
        try {
            s.c(context).a((u) new t(DiagnosticsWorker.class).a());
        } catch (IllegalStateException e3) {
            r.c().b(f15346a, "WorkManager is not initialized", e3);
        }
    }
}
