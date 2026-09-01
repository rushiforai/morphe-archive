package defpackage;

import java.io.EOFException;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o05 extends sbb {
    public static final fn7 d;
    public final List b;
    public final List c;

    static {
        x2b x2bVar = fn7.d;
        d = en7.x("application/x-www-form-urlencoded");
    }

    public o05(ArrayList arrayList, ArrayList arrayList2) {
        this.b = ggf.j(arrayList);
        this.c = ggf.j(arrayList2);
    }

    @Override // defpackage.sbb
    public final long a() {
        return e(null, true);
    }

    @Override // defpackage.sbb
    public final fn7 b() {
        return d;
    }

    @Override // defpackage.sbb
    public final void d(xz0 xz0Var) throws EOFException {
        e(xz0Var, false);
    }

    public final long e(xz0 xz0Var, boolean z) throws EOFException {
        kz0 kz0VarA;
        if (z) {
            kz0VarA = new kz0();
        } else {
            xz0Var.getClass();
            kz0VarA = xz0Var.a();
        }
        List list = this.b;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                kz0VarA.K0(38);
            }
            kz0VarA.R0((String) list.get(i));
            kz0VarA.K0(61);
            kz0VarA.R0((String) this.c.get(i));
        }
        if (!z) {
            return 0L;
        }
        long j = kz0VarA.b;
        kz0VarA.B();
        return j;
    }
}
