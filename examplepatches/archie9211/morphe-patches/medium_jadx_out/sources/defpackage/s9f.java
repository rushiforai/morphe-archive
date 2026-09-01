package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s9f extends r9f {
    public final String i;
    public final Iterator j;
    public int k;
    public final /* synthetic */ t9f l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s9f(t9f t9fVar, y9f y9fVar, String str) {
        super(t9fVar);
        this.l = t9fVar;
        this.k = 0;
        if (y9fVar.j().c(Integer.MIN_VALUE)) {
            t9fVar.b = y9fVar.a;
        }
        this.i = a(y9fVar, str, 1);
        this.j = y9fVar.p();
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x005e  */
    @Override // defpackage.r9f, java.util.Iterator
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean hasNext() {
        /*
            r8 = this;
            q9f r0 = r8.g
            r1 = 1
            if (r0 == 0) goto L6
            return r1
        L6:
            java.util.Iterator r0 = r8.j
            boolean r2 = r0.hasNext()
            if (r2 == 0) goto L68
            java.lang.Object r0 = r0.next()
            y9f r0 = (defpackage.y9f) r0
            int r2 = r8.k
            int r2 = r2 + r1
            r8.k = r2
            t4a r2 = r0.j()
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            boolean r2 = r2.c(r3)
            r4 = 0
            t9f r5 = r8.l
            if (r2 == 0) goto L2d
            java.lang.String r2 = r0.a
            r5.b = r2
            goto L3a
        L2d:
            y9f r2 = r0.c
            if (r2 == 0) goto L3a
            java.lang.String r2 = r8.i
            int r6 = r8.k
            java.lang.String r2 = r8.a(r0, r2, r6)
            goto L3b
        L3a:
            r2 = r4
        L3b:
            td r6 = r5.a
            r7 = 512(0x200, float:7.17E-43)
            boolean r6 = r6.c(r7)
            if (r6 == 0) goto L51
            boolean r6 = r0.n()
            if (r6 != 0) goto L4c
            goto L51
        L4c:
            boolean r8 = r8.hasNext()
            return r8
        L51:
            java.lang.String r5 = r5.b
            t4a r6 = r0.j()
            boolean r3 = r6.c(r3)
            if (r3 == 0) goto L5e
            goto L60
        L5e:
            java.lang.String r4 = r0.b
        L60:
            q9f r3 = new q9f
            r3.<init>(r0, r5, r2, r4)
            r8.g = r3
            return r1
        L68:
            r8 = 0
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s9f.hasNext():boolean");
    }
}
