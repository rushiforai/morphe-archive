package defpackage;

import android.os.Build;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class x7f {
    public boolean a;
    public UUID b;
    public c8f c;
    public final Set d;

    public x7f(Class cls) {
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        this.b = uuidRandomUUID;
        String string = this.b.toString();
        string.getClass();
        this.c = new c8f(string, (j7f) null, cls.getName(), (String) null, (dt2) null, (dt2) null, 0L, 0L, 0L, (e72) null, 0, (tm0) null, 0L, 0L, 0L, 0L, false, (lw8) null, 0, 0L, 0, 0, (String) null, (Boolean) null, 33554426);
        String[] strArr = {cls.getName()};
        LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(1));
        k80.L0(strArr, linkedHashSet);
        this.d = linkedHashSet;
    }

    public final y7f a() {
        y7f y7fVarB = b();
        e72 e72Var = this.c.j;
        boolean z = (Build.VERSION.SDK_INT >= 24 && e72Var.b()) || e72Var.e || e72Var.c || e72Var.d;
        c8f c8fVar = this.c;
        if (c8fVar.q) {
            if (z) {
                ay0.e("Expedited jobs only support network and storage constraints");
                return null;
            }
            if (c8fVar.g > 0) {
                ay0.e("Expedited jobs cannot be delayed");
                return null;
            }
        }
        String str = c8fVar.x;
        if (str == null) {
            List listP0 = muc.p0(c8fVar.c, new String[]{"."}, 0, 6);
            String strX0 = listP0.size() == 1 ? (String) listP0.get(0) : (String) bu1.H0(listP0);
            if (strX0.length() > 127) {
                strX0 = muc.x0(127, strX0);
            }
            c8fVar.x = strX0;
        } else if (str.length() > 127) {
            this.c.x = muc.x0(127, str);
        }
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        this.b = uuidRandomUUID;
        String string = uuidRandomUUID.toString();
        string.getClass();
        c8f c8fVar2 = this.c;
        this.c = new c8f(string, c8fVar2.b, c8fVar2.c, c8fVar2.d, new dt2(c8fVar2.e), new dt2(c8fVar2.f), c8fVar2.g, c8fVar2.h, c8fVar2.i, new e72(c8fVar2.j), c8fVar2.k, c8fVar2.l, c8fVar2.m, c8fVar2.n, c8fVar2.o, c8fVar2.p, c8fVar2.q, c8fVar2.r, c8fVar2.s, c8fVar2.u, c8fVar2.v, c8fVar2.w, c8fVar2.x, c8fVar2.y, 524288);
        return y7fVarB;
    }

    public abstract y7f b();

    public abstract x7f c();

    public final x7f d(tm0 tm0Var, TimeUnit timeUnit) {
        tm0Var.getClass();
        timeUnit.getClass();
        this.a = true;
        c8f c8fVar = this.c;
        c8fVar.l = tm0Var;
        long millis = timeUnit.toMillis(1L);
        String str = c8f.z;
        if (millis > 18000000) {
            d87.h().l(str, "Backoff delay duration exceeds maximum value");
        }
        if (millis < 10000) {
            d87.h().l(str, "Backoff delay duration less than minimum value");
        }
        c8fVar.m = iq7.w(millis, 10000L, 18000000L);
        return c();
    }

    public final x7f e(long j, TimeUnit timeUnit) {
        timeUnit.getClass();
        this.c.g = timeUnit.toMillis(j);
        if (Long.MAX_VALUE - System.currentTimeMillis() > this.c.g) {
            return c();
        }
        ay0.e("The given initial delay is too large and will cause an overflow!");
        return null;
    }
}
