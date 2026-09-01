package j$.util.stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class i8 extends h5 implements n8 {
    public long b;
    public boolean c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ h8 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i8(h8 h8Var, l5 l5Var, boolean z) {
        super(l5Var);
        this.e = h8Var;
        this.d = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0015  */
    @Override // java.util.function.Consumer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void accept(java.lang.Object r7) {
        /*
            r6 = this;
            boolean r0 = r6.c
            if (r0 != 0) goto L15
            j$.util.stream.h8 r0 = r6.e
            java.util.function.Predicate r0 = r0.m
            boolean r0 = r0.test(r7)
            r1 = r0 ^ 1
            r6.c = r1
            if (r0 != 0) goto L13
            goto L15
        L13:
            r0 = 0
            goto L16
        L15:
            r0 = 1
        L16:
            boolean r1 = r6.d
            if (r1 == 0) goto L23
            if (r0 != 0) goto L23
            long r2 = r6.b
            r4 = 1
            long r2 = r2 + r4
            r6.b = r2
        L23:
            if (r1 != 0) goto L29
            if (r0 == 0) goto L28
            goto L29
        L28:
            return
        L29:
            j$.util.stream.l5 r6 = r6.a
            r6.accept(r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: j$.util.stream.i8.accept(java.lang.Object):void");
    }

    @Override // j$.util.stream.n8
    public final long h() {
        return this.b;
    }
}
