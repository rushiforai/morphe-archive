package defpackage;

import android.content.Context;
import android.os.Process;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.regex.Pattern;
import org.chromium.net.impl.ImplVersion;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class oi2 extends d46 {
    public static final int B;
    public String A;
    public final dm2 t;
    public final Context u;
    public final boolean v;
    public String w;
    public final boolean x;
    public final boolean y;
    public final ni2 z;

    static {
        Pattern.compile("^[0-9\\.]*$");
        B = Integer.parseInt("143.0.7445.0".split("\\.")[0]) < 59 ? 3 : 40;
    }

    public oi2(Context context, ti2 ti2Var) {
        new ArrayList();
        new ArrayList();
        long jUptimeMillis = SystemClock.uptimeMillis();
        Context applicationContext = context.getApplicationContext();
        this.u = applicationContext;
        this.t = yi2.K(applicationContext, ti2Var);
        try {
            this.x = true;
            this.y = true;
            ni2 ni2Var = ni2.DISABLED;
            if (ni2Var.a == 1) {
                throw new IllegalArgumentException("Storage path must be set");
            }
            this.z = ni2Var;
            this.v = true;
            k0(jUptimeMillis, true, ti2Var);
        } catch (Throwable th) {
            k0(jUptimeMillis, false, ti2Var);
            throw th;
        }
    }

    @Override // defpackage.d46
    public abstract long L();

    public final void k0(long j, boolean z, ti2 ti2Var) {
        dm2 dm2Var = this.t;
        if (B >= 30) {
            return;
        }
        si2 si2Var = new si2();
        si2Var.e = Boolean.FALSE;
        try {
            si2Var.b = ri2.IMPL;
            si2Var.h = Process.myUid();
            si2Var.g = new xi2(ImplVersion.getCronetVersion());
            si2Var.d = ti2Var;
            si2Var.f = new xi2("143.0.7445.0");
            si2Var.a = L();
            si2Var.e = Boolean.valueOf(z);
        } finally {
            si2Var.c = (int) (SystemClock.uptimeMillis() - j);
            dm2Var.N(si2Var);
        }
    }

    public final qi2 l0() {
        int i;
        int i2;
        int iOrdinal = this.z.ordinal();
        if (iOrdinal != 0) {
            i = 3;
            if (iOrdinal != 1) {
                i2 = 2;
                if (iOrdinal != 2) {
                    if (iOrdinal != 3) {
                        ay0.e("Unknown internal builder cache mode");
                        return null;
                    }
                    i2 = 1;
                }
            }
            return new qi2(this.v, this.x, this.y, i2, this.A, L());
        }
        i = 0;
        i2 = i;
        return new qi2(this.v, this.x, this.y, i2, this.A, L());
    }
}
