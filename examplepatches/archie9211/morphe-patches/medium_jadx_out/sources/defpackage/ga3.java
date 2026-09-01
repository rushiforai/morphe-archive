package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ga3 extends bec implements k93 {
    public final a6a E;
    public final p98 F;
    public final wjc G;
    public final kse H;
    public final u93 I;

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.getPhiList()" because "resultVar" is null
        	at jadx.core.dex.visitors.InitCodeVariables.collectConnectedVars(InitCodeVariables.java:119)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:82)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:48)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    public ga3(defpackage.yv2 r8, defpackage.bec r9, defpackage.ly r10, defpackage.n98 r11, defpackage.e41 r12, defpackage.a6a r13, defpackage.p98 r14, defpackage.wjc r15, defpackage.kse r16, defpackage.u93 r17, defpackage.jkc r18) {
        /*
            r7 = this;
            r8.getClass()
            r10.getClass()
            r12.getClass()
            r14.getClass()
            r16.getClass()
            if (r18 != 0) goto L1b
            tz7 r0 = defpackage.jkc.g0
            r6 = r0
            r1 = r8
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            r0 = r7
            goto L23
        L1b:
            r6 = r18
            r0 = r7
            r1 = r8
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
        L23:
            r0.<init>(r1, r2, r3, r4, r5, r6)
            r7.E = r13
            r7.F = r14
            r7.G = r15
            r1 = r16
            r7.H = r1
            r1 = r17
            r7.I = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ga3.<init>(yv2, bec, ly, n98, e41, a6a, p98, wjc, kse, u93, jkc):void");
    }

    @Override // defpackage.bec, defpackage.u55
    public final u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        n98 n98Var2;
        yv2Var.getClass();
        e41Var.getClass();
        lyVar.getClass();
        bec becVar = (bec) s55Var;
        if (n98Var == null) {
            n98 name = getName();
            name.getClass();
            n98Var2 = name;
        } else {
            n98Var2 = n98Var;
        }
        ga3 ga3Var = new ga3(yv2Var, becVar, lyVar, n98Var2, e41Var, this.E, this.F, this.G, this.H, this.I, jkcVar);
        ga3Var.w = this.w;
        return ga3Var;
    }

    @Override // defpackage.x93
    public final wjc D() {
        return this.G;
    }

    @Override // defpackage.x93
    public final p98 J() {
        return this.F;
    }

    @Override // defpackage.x93
    public final u93 K() {
        return this.I;
    }

    @Override // defpackage.x93
    public final q1 s() {
        return this.E;
    }
}
