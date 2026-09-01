package defpackage;

import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jnc extends jb6 {
    public final x38 a;
    public final jb6 b;
    public final jb6 c;
    public final jb6 d;
    public final jb6 e;
    public final jb6 f;

    public jnc(x38 x38Var) {
        this.a = x38Var;
        Set set = yoe.a;
        this.b = x38Var.a(List.class, set, null);
        this.c = x38Var.a(Map.class, set, null);
        this.d = x38Var.a(String.class, set, null);
        this.e = x38Var.a(Double.class, set, null);
        this.f = x38Var.a(Boolean.class, set, null);
    }

    @Override // defpackage.jb6
    public final Object a(hd6 hd6Var) {
        switch (inc.a[hd6Var.I().ordinal()]) {
            case 1:
                return this.b.a(hd6Var);
            case 2:
                return this.c.a(hd6Var);
            case 3:
                return this.d.a(hd6Var);
            case 4:
                return this.e.a(hd6Var);
            case 5:
                return this.f.a(hd6Var);
            case 6:
                hd6Var.a0();
                return null;
            default:
                StringBuilder sb = new StringBuilder("Expected a value but was ");
                sb.append(hd6Var.I());
                String strD = hd6Var.D();
                sb.append(" at path ");
                sb.append(strD);
                throw new IllegalStateException(sb.toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0017 A[PHI: r1
      0x0017: PHI (r1v4 java.lang.Class<?>) = (r1v1 java.lang.Class<?>), (r1v2 java.lang.Class<?>) binds: [B:7:0x0015, B:10:0x001f] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.jb6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.zd6 r4, java.lang.Object r5) {
        /*
            r3 = this;
            java.lang.Class r0 = r5.getClass()
            java.lang.Class<java.lang.Object> r1 = java.lang.Object.class
            if (r0 != r1) goto Lf
            r4.m()
            r4.p()
            return
        Lf:
            java.lang.Class<java.util.Map> r1 = java.util.Map.class
            boolean r2 = r1.isAssignableFrom(r0)
            if (r2 == 0) goto L19
        L17:
            r0 = r1
            goto L22
        L19:
            java.lang.Class<java.util.Collection> r1 = java.util.Collection.class
            boolean r2 = r1.isAssignableFrom(r0)
            if (r2 == 0) goto L22
            goto L17
        L22:
            java.util.Set r1 = defpackage.yoe.a
            r2 = 0
            x38 r3 = r3.a
            jb6 r3 = r3.a(r0, r1, r2)
            r3.e(r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jnc.e(zd6, java.lang.Object):void");
    }

    public final String toString() {
        return "JsonAdapter(Object)";
    }
}
