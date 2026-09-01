package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class co9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public boolean d;
    public int e;
    public int f;
    public final /* synthetic */ String g;
    public final /* synthetic */ boolean h;
    public final /* synthetic */ String i;
    public que j;
    public final /* synthetic */ que k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ co9(que queVar, String str, boolean z, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.k = queVar;
        this.g = str;
        this.h = z;
        this.i = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        que queVar = this.k;
        switch (i) {
            case 0:
                return new co9((ko9) queVar, this.g, this.h, this.i, n92Var, 0);
            default:
                return new co9((nib) queVar, this.g, this.h, this.i, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((co9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00cd A[PHI: r2 r10 r11
      0x00cd: PHI (r2v23 java.lang.Object) = (r2v21 java.lang.Object), (r2v22 java.lang.Object), (r2v33 java.lang.Object) binds: [B:19:0x0090, B:28:0x00ca, B:12:0x003c] A[DONT_GENERATE, DONT_INLINE]
      0x00cd: PHI (r10v7 tb2) = (r10v4 tb2), (r10v5 tb2), (r10v10 tb2) binds: [B:19:0x0090, B:28:0x00ca, B:12:0x003c] A[DONT_GENERATE, DONT_INLINE]
      0x00cd: PHI (r11v5 nib) = (r11v3 nib), (r11v4 nib), (r11v8 nib) binds: [B:19:0x0090, B:28:0x00ca, B:12:0x003c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0194 A[PHI: r0
      0x0194: PHI (r0v6 java.lang.Object) = (r0v4 java.lang.Object), (r0v5 java.lang.Object), (r0v17 java.lang.Object) binds: [B:53:0x0157, B:62:0x0191, B:46:0x0111] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:72:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:76:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r20) {
        /*
            Method dump skipped, instruction units count: 440
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.co9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
