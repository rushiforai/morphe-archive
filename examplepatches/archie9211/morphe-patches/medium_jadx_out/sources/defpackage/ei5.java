package defpackage;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ei5 extends kb2 implements x33 {
    public final Handler c;
    public final String d;
    public final boolean e;
    public final ei5 f;

    public ei5(Handler handler, String str, boolean z) {
        this.c = handler;
        this.d = str;
        this.e = z;
        this.f = z ? this : new ei5(handler, str, true);
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        if (this.c.post(runnable)) {
            return;
        }
        I0(ib2Var, runnable);
    }

    @Override // defpackage.kb2
    public final boolean G0(ib2 ib2Var) {
        return (this.e && g76.L(Looper.myLooper(), this.c.getLooper())) ? false : true;
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        wgf.f(i);
        return this;
    }

    public final void I0(ib2 ib2Var, Runnable runnable) {
        bo.D(ib2Var, new CancellationException("The task was rejected, the handler underlying the dispatcher '" + this + "' was closed"));
        r13 r13Var = xg3.a;
        vz2.c.E0(ib2Var, runnable);
    }

    @Override // defpackage.x33
    public final yh3 Q(long j, Runnable runnable, ib2 ib2Var) {
        if (j > 4611686018427387903L) {
            j = 4611686018427387903L;
        }
        if (this.c.postDelayed(runnable, j)) {
            return new di5(this, 0, runnable);
        }
        I0(ib2Var, runnable);
        return lh8.a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ei5)) {
            return false;
        }
        ei5 ei5Var = (ei5) obj;
        return ei5Var.c == this.c && ei5Var.e == this.e;
    }

    @Override // defpackage.x33
    public final void g0(long j, x51 x51Var) {
        fi2 fi2Var = new fi2(x51Var, 10, this);
        if (j > 4611686018427387903L) {
            j = 4611686018427387903L;
        }
        if (this.c.postDelayed(fi2Var, j)) {
            x51Var.v(new si3(this, 14, fi2Var));
        } else {
            I0(x51Var.e, fi2Var);
        }
    }

    public final int hashCode() {
        return (this.e ? 1231 : 1237) ^ System.identityHashCode(this.c);
    }

    @Override // defpackage.kb2
    public final String toString() {
        ei5 ei5Var;
        String str;
        r13 r13Var = xg3.a;
        ei5 ei5Var2 = ff7.a;
        if (this == ei5Var2) {
            str = "Dispatchers.Main";
        } else {
            try {
                ei5Var = ei5Var2.f;
            } catch (UnsupportedOperationException unused) {
                ei5Var = null;
            }
            str = this == ei5Var ? "Dispatchers.Main.immediate" : null;
        }
        if (str != null) {
            return str;
        }
        String string = this.d;
        if (string == null) {
            string = this.c.toString();
        }
        return this.e ? km4.y(string, ".immediate") : string;
    }

    public ei5(Handler handler) {
        this(handler, null, false);
    }
}
