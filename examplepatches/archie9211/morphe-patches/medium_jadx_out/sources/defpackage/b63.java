package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b63 implements Iterator, th6 {
    public int a = -1;
    public int b;
    public int c;
    public n46 d;
    public int e;
    public final /* synthetic */ c63 f;

    public b63(c63 c63Var) {
        this.f = c63Var;
        int iV = iq7.v(0, 0, c63Var.a.length());
        this.b = iV;
        this.c = iV;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001c  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            r8 = this;
            c63 r0 = r8.f
            java.lang.CharSequence r1 = r0.a
            int r2 = r8.c
            r3 = 0
            if (r2 >= 0) goto Lf
            r8.a = r3
            r0 = 0
            r8.d = r0
            return
        Lf:
            int r4 = r0.b
            r5 = -1
            r6 = 1
            if (r4 <= 0) goto L1c
            int r7 = r8.e
            int r7 = r7 + r6
            r8.e = r7
            if (r7 >= r4) goto L22
        L1c:
            int r4 = r1.length()
            if (r2 <= r4) goto L36
        L22:
            n46 r0 = new n46
            int r2 = r8.b
            r1.getClass()
            int r1 = r1.length()
            int r1 = r1 - r6
            r0.<init>(r2, r1, r6)
            r8.d = r0
            r8.c = r5
            goto L7b
        L36:
            b55 r0 = r0.c
            int r2 = r8.c
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)
            java.lang.Object r0 = r0.invoke(r1, r2)
            f09 r0 = (defpackage.f09) r0
            if (r0 != 0) goto L5a
            n46 r0 = new n46
            int r2 = r8.b
            r1.getClass()
            int r1 = r1.length()
            int r1 = r1 - r6
            r0.<init>(r2, r1, r6)
            r8.d = r0
            r8.c = r5
            goto L7b
        L5a:
            java.lang.Object r1 = r0.a
            java.lang.Number r1 = (java.lang.Number) r1
            int r1 = r1.intValue()
            java.lang.Object r0 = r0.b
            java.lang.Number r0 = (java.lang.Number) r0
            int r0 = r0.intValue()
            int r2 = r8.b
            n46 r2 = defpackage.iq7.W(r2, r1)
            r8.d = r2
            int r1 = r1 + r0
            r8.b = r1
            if (r0 != 0) goto L78
            r3 = r6
        L78:
            int r1 = r1 + r3
            r8.c = r1
        L7b:
            r8.a = r6
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b63.a():void");
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        if (this.a == -1) {
            a();
        }
        return this.a == 1;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.a == -1) {
            a();
        }
        if (this.a == 0) {
            ywb.n();
            return null;
        }
        n46 n46Var = this.d;
        n46Var.getClass();
        this.d = null;
        this.a = -1;
        return n46Var;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
