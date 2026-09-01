package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f42 implements b42 {
    public final lc9 a;
    public final lc9 b;
    public final tz7 c;
    public final ThreadLocal d;
    public volatile boolean e;
    public final long f;

    public f42(final s26 s26Var, final String str, int i) {
        str.getClass();
        final int i2 = 0;
        this.c = new tz7(14, false);
        this.d = new ThreadLocal();
        int i3 = in3.d;
        this.f = hlg.T(30, mn3.SECONDS);
        if (i <= 0) {
            ay0.e("Maximum number of readers must be greater than 0");
            throw null;
        }
        this.a = new lc9(i, new m45() { // from class: c42
            @Override // defpackage.m45
            public final Object invoke() {
                int i4 = i2;
                String str2 = str;
                s26 s26Var2 = s26Var;
                switch (i4) {
                    case 0:
                        anb anbVarD = s26Var2.D(str2);
                        qk7.q(anbVarD, "PRAGMA query_only = 1");
                        return anbVarD;
                    default:
                        return s26Var2.D(str2);
                }
            }
        });
        final int i4 = 1;
        this.b = new lc9(1, new m45() { // from class: c42
            @Override // defpackage.m45
            public final Object invoke() {
                int i42 = i4;
                String str2 = str;
                s26 s26Var2 = s26Var;
                switch (i42) {
                    case 0:
                        anb anbVarD = s26Var2.D(str2);
                        qk7.q(anbVarD, "PRAGMA query_only = 1");
                        return anbVarD;
                    default:
                        return s26Var2.D(str2);
                }
            }
        });
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0145 A[Catch: all -> 0x019d, TRY_LEAVE, TryCatch #3 {all -> 0x019d, blocks: (B:64:0x011e, B:69:0x013a, B:71:0x0145, B:86:0x01a1, B:87:0x01a8), top: B:113:0x011e }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x017d  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01a1 A[Catch: all -> 0x019d, TRY_ENTER, TryCatch #3 {all -> 0x019d, blocks: (B:64:0x011e, B:69:0x013a, B:71:0x0145, B:86:0x01a1, B:87:0x01a8), top: B:113:0x011e }] */
    @Override // defpackage.b42
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object G(boolean r18, defpackage.b55 r19, defpackage.p92 r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 482
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f42.G(boolean, b55, p92):java.lang.Object");
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        if (this.e) {
            return;
        }
        this.e = true;
        this.a.c();
        this.b.c();
    }

    public f42(s26 s26Var) {
        this.c = new tz7(14, false);
        this.d = new ThreadLocal();
        int i = in3.d;
        this.f = hlg.T(30, mn3.SECONDS);
        lc9 lc9Var = new lc9(1, new l8(24, s26Var));
        this.a = lc9Var;
        this.b = lc9Var;
    }
}
