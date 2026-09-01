package j$.util.concurrent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g extends l {
    public final l[] e;

    public g(l[] lVarArr) {
        super(-1, null, null);
        this.e = lVarArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x001f, code lost:
    
        return r2;
     */
    @Override // j$.util.concurrent.l
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final j$.util.concurrent.l a(int r3, java.lang.Object r4) {
        /*
            r2 = this;
            j$.util.concurrent.l[] r2 = r2.e
        L2:
            int r0 = r2.length
            if (r0 == 0) goto L34
            int r0 = r0 + (-1)
            r0 = r0 & r3
            j$.util.concurrent.l r2 = j$.util.concurrent.ConcurrentHashMap.k(r2, r0)
            if (r2 != 0) goto Lf
            goto L34
        Lf:
            int r0 = r2.a
            if (r0 != r3) goto L20
            java.lang.Object r1 = r2.b
            if (r1 == r4) goto L1f
            if (r1 == 0) goto L20
            boolean r1 = r4.equals(r1)
            if (r1 == 0) goto L20
        L1f:
            return r2
        L20:
            if (r0 >= 0) goto L30
            boolean r0 = r2 instanceof j$.util.concurrent.g
            if (r0 == 0) goto L2b
            j$.util.concurrent.g r2 = (j$.util.concurrent.g) r2
            j$.util.concurrent.l[] r2 = r2.e
            goto L2
        L2b:
            j$.util.concurrent.l r2 = r2.a(r3, r4)
            return r2
        L30:
            j$.util.concurrent.l r2 = r2.d
            if (r2 != 0) goto Lf
        L34:
            r2 = 0
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.concurrent.g.a(int, java.lang.Object):j$.util.concurrent.l");
    }
}
