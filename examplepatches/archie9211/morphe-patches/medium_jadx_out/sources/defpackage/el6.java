package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class el6 {
    public final String a;
    public final Map b;

    public el6(String str, Map map) {
        str.getClass();
        this.a = str;
        this.b = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof el6)) {
            return false;
        }
        el6 el6Var = (el6) obj;
        return g76.L(this.a, el6Var.a) && this.b.equals(el6Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x000a A[PHI: r2
      0x000a: PHI (r2v8 java.lang.Iterable) = (r2v0 java.lang.Iterable), (r2v0 java.lang.Iterable), (r2v6 java.lang.Iterable) binds: [B:3:0x0008, B:6:0x0018, B:10:0x0027] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() throws java.io.IOException {
        /*
            r10 = this;
            java.util.Map r0 = r10.b
            int r1 = r0.size()
            ey3 r2 = defpackage.ey3.a
            if (r1 != 0) goto Lc
        La:
            r4 = r2
            goto L6f
        Lc:
            java.util.Set r1 = r0.entrySet()
            java.util.Iterator r1 = r1.iterator()
            boolean r3 = r1.hasNext()
            if (r3 != 0) goto L1b
            goto La
        L1b:
            java.lang.Object r2 = r1.next()
            java.util.Map$Entry r2 = (java.util.Map.Entry) r2
            boolean r3 = r1.hasNext()
            if (r3 != 0) goto L39
            f09 r0 = new f09
            java.lang.Object r1 = r2.getKey()
            java.lang.Object r2 = r2.getValue()
            r0.<init>(r1, r2)
            java.util.List r2 = defpackage.d46.Q(r0)
            goto La
        L39:
            java.util.ArrayList r3 = new java.util.ArrayList
            int r0 = r0.size()
            r3.<init>(r0)
            f09 r0 = new f09
            java.lang.Object r4 = r2.getKey()
            java.lang.Object r2 = r2.getValue()
            r0.<init>(r4, r2)
            r3.add(r0)
        L52:
            java.lang.Object r0 = r1.next()
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0
            f09 r2 = new f09
            java.lang.Object r4 = r0.getKey()
            java.lang.Object r0 = r0.getValue()
            r2.<init>(r4, r0)
            r3.add(r2)
            boolean r0 = r1.hasNext()
            if (r0 != 0) goto L52
            r4 = r3
        L6f:
            h06 r8 = defpackage.h06.k
            r9 = 31
            r5 = 0
            r6 = 0
            r7 = 0
            java.lang.String r0 = defpackage.bu1.F0(r4, r5, r6, r7, r8, r9)
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            java.lang.String r2 = "@"
            r1.<init>(r2)
            java.lang.String r10 = r10.a
            r1.append(r10)
            r10 = 40
            r1.append(r10)
            r1.append(r0)
            r10 = 41
            r1.append(r10)
            java.lang.String r10 = r1.toString()
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.el6.toString():java.lang.String");
    }
}
