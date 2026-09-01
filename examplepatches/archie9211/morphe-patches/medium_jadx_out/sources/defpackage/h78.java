package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h78 extends uib implements b55 {
    public u75 c;
    public i78 d;
    public long[] e;
    public int f;
    public int g;
    public int h;
    public int i;
    public long j;
    public int k;
    public /* synthetic */ Object l;
    public final /* synthetic */ i78 m;
    public final /* synthetic */ u75 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h78(i78 i78Var, u75 u75Var, n92 n92Var) {
        super(2, n92Var);
        this.m = i78Var;
        this.n = u75Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        h78 h78Var = new h78(this.m, this.n, n92Var);
        h78Var.l = obj;
        return h78Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((h78) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00a3  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0050 -> B:23:0x00a1). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:13:0x0052 -> B:14:0x0065). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x006e -> B:20:0x0096). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0093 -> B:20:0x0096). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r22) {
        /*
            r21 = this;
            r0 = r21
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.k
            r4 = 8
            r5 = 1
            if (r2 == 0) goto L2d
            if (r2 != r5) goto L26
            int r2 = r0.i
            int r6 = r0.h
            long r7 = r0.j
            int r9 = r0.g
            int r10 = r0.f
            long[] r11 = r0.e
            i78 r12 = r0.d
            u75 r13 = r0.c
            java.lang.Object r14 = r0.l
            nzb r14 = (defpackage.nzb) r14
            defpackage.br7.v(r22)
            goto L96
        L26:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L2d:
            defpackage.br7.v(r22)
            java.lang.Object r2 = r0.l
            nzb r2 = (defpackage.nzb) r2
            i78 r6 = r0.m
            g78 r7 = r6.b
            long[] r7 = r7.a
            int r8 = r7.length
            int r8 = r8 + (-2)
            if (r8 < 0) goto La6
            u75 r9 = r0.n
            r10 = 0
        L42:
            r11 = r7[r10]
            long r13 = ~r11
            r15 = 7
            long r13 = r13 << r15
            long r13 = r13 & r11
            r15 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r13 = r13 & r15
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 == 0) goto La1
            int r13 = r10 - r8
            int r13 = ~r13
            int r13 = r13 >>> 31
            int r13 = 8 - r13
            r14 = r2
            r2 = 0
            r19 = r11
            r12 = r6
            r11 = r7
            r6 = r13
            r13 = r9
            r9 = r10
            r10 = r8
            r7 = r19
        L65:
            if (r2 >= r6) goto L99
            r15 = 255(0xff, double:1.26E-321)
            long r15 = r15 & r7
            r17 = 128(0x80, double:6.3E-322)
            int r15 = (r15 > r17 ? 1 : (r15 == r17 ? 0 : -1))
            if (r15 >= 0) goto L96
            int r15 = r9 << 3
            int r15 = r15 + r2
            r13.b = r15
            g78 r3 = r12.b
            java.lang.Object[] r3 = r3.b
            r3 = r3[r15]
            r0.l = r14
            r0.c = r13
            r0.d = r12
            r0.e = r11
            r0.f = r10
            r0.g = r9
            r0.j = r7
            r0.h = r6
            r0.i = r2
            r0.k = r5
            tb2 r3 = r14.b(r0, r3)
            if (r3 != r1) goto L96
            return r1
        L96:
            long r7 = r7 >> r4
            int r2 = r2 + r5
            goto L65
        L99:
            if (r6 != r4) goto La6
            r8 = r10
            r7 = r11
            r6 = r12
            r2 = r14
            r10 = r9
            r9 = r13
        La1:
            if (r10 == r8) goto La6
            int r10 = r10 + 1
            goto L42
        La6:
            c1e r0 = defpackage.c1e.a
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h78.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
