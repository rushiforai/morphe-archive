package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import com.pairip.VMRunner;
import java.util.Set;
import java.util.concurrent.ThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dz0 extends eld implements u6d {
    public static final Set f = k80.S0(new s6d[]{s6d.CHARGING, s6d.FULL});
    public static final Set g = k80.S0(new Integer[]{1, 4, 2});
    public final f66 c;
    public final ThreadPoolExecutor d;
    public volatile t6d e;

    public dz0(f66 f66Var, ThreadPoolExecutor threadPoolExecutor) {
        f66Var.getClass();
        this.c = f66Var;
        this.d = threadPoolExecutor;
        this.e = new t6d();
    }

    @Override // defpackage.u6d
    public final void a(Context context) {
        if (this.b.compareAndSet(true, false)) {
            context.unregisterReceiver(this);
        }
    }

    @Override // defpackage.u6d
    public final t6d c() {
        return this.e;
    }

    public final void d(Intent intent) {
        boolean z = true;
        int intExtra = intent.getIntExtra("status", 1);
        int intExtra2 = intent.getIntExtra("level", -1);
        int intExtra3 = intent.getIntExtra("scale", 100);
        int intExtra4 = intent.getIntExtra("plugged", -1);
        s6d.Companion.getClass();
        s6d s6dVar = intExtra != 2 ? intExtra != 3 ? intExtra != 4 ? intExtra != 5 ? s6d.UNKNOWN : s6d.FULL : s6d.NOT_CHARGING : s6d.DISCHARGING : s6d.CHARGING;
        boolean booleanExtra = intent.getBooleanExtra("present", true);
        int iW0 = nk7.w0((intExtra2 * 100.0f) / intExtra3);
        if (!g.contains(Integer.valueOf(intExtra4)) && booleanExtra) {
            z = false;
        }
        this.e = t6d.a(this.e, f.contains(s6dVar), iW0, false, z, 4);
    }

    public final void e(Context context, Intent intent) {
        String action;
        int i = 1;
        if (intent != null) {
            try {
                action = intent.getAction();
            } catch (RuntimeException e) {
                f49.L(this.c, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), co.r, e, 48);
                return;
            }
        } else {
            action = null;
        }
        if (g76.L(action, "android.intent.action.BATTERY_CHANGED")) {
            d(intent);
        } else {
            if (!g76.L(action, "android.os.action.POWER_SAVE_MODE_CHANGED")) {
                f49.L(this.c, d66.DEBUG, d46.R(e66.MAINTAINER, e66.TELEMETRY), new hm0(action, i), null, 56);
                return;
            }
            Object systemService = context.getSystemService("power");
            PowerManager powerManager = systemService instanceof PowerManager ? (PowerManager) systemService : null;
            this.e = t6d.a(this.e, false, 0, powerManager != null ? powerManager.isPowerSaveMode() : false, false, 11);
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        VMRunner.invoke("HFKINa9PcsR5FSG6", new Object[]{this, context, intent});
    }
}
