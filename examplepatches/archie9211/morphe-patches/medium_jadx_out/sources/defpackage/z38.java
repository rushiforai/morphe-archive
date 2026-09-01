package defpackage;

import com.squareup.moshi.JsonDataException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z38 implements y92 {
    public static final h21 b;
    public final jb6 a;

    static {
        h21 h21Var = h21.d;
        b = dq1.n("EFBBBF");
    }

    public z38(jb6 jb6Var) {
        this.a = jb6Var;
    }

    @Override // defpackage.y92
    public final Object v(Object obj) {
        fdb fdbVar = (fdb) obj;
        zz0 zz0VarV0 = fdbVar.v0();
        try {
            if (zz0VarV0.C(0L, b)) {
                zz0VarV0.skip(r1.a.length);
            }
            sd6 sd6Var = new sd6(zz0VarV0);
            Object objA = this.a.a(sd6Var);
            if (sd6Var.I() != dd6.END_DOCUMENT) {
                throw new JsonDataException("JSON document was not fully consumed.");
            }
            fdbVar.close();
            return objA;
        } catch (Throwable th) {
            fdbVar.close();
            throw th;
        }
    }
}
