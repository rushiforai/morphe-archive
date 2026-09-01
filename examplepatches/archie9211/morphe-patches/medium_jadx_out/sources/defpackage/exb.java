package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class exb extends uib implements b55 {
    public final /* synthetic */ int c = 0;
    public long d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public exb(long j, qya qyaVar, n92 n92Var) {
        super(2, n92Var);
        this.d = j;
        this.g = qyaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                exb exbVar = new exb(this.d, (qya) obj2, n92Var);
                exbVar.f = obj;
                return exbVar;
            default:
                exb exbVar2 = new exb((rb9) obj2, n92Var);
                exbVar2.f = obj;
                return exbVar2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.c;
        c1e c1eVar = c1e.a;
        u4d u4dVar = (u4d) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((exb) create(u4dVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0045  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x004f  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:11:0x0043 -> B:13:0x0047). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) {
        /*
            r9 = this;
            int r0 = r9.c
            java.lang.Object r1 = r9.g
            java.lang.String r2 = "call to 'resume' before 'invoke' with coroutine"
            r3 = 1
            r4 = 0
            switch(r0) {
                case 0: goto L51;
                default: goto Lb;
            }
        Lb:
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r9.e
            if (r5 == 0) goto L21
            if (r5 != r3) goto L1d
            long r1 = r9.d
            java.lang.Object r5 = r9.f
            u4d r5 = (defpackage.u4d) r5
            defpackage.br7.v(r10)
            goto L47
        L1d:
            defpackage.ygf.f(r2)
            goto L50
        L21:
            defpackage.br7.v(r10)
            java.lang.Object r10 = r9.f
            u4d r10 = (defpackage.u4d) r10
            rb9 r1 = (defpackage.rb9) r1
            long r1 = r1.b
            zte r5 = r10.e()
            r5.getClass()
            r5 = 40
            long r5 = r5 + r1
            r1 = r5
            r5 = r10
        L38:
            r9.f = r5
            r9.d = r1
            r9.e = r3
            r10 = 3
            java.lang.Object r10 = defpackage.qfd.b(r5, r4, r9, r10)
            if (r10 != r0) goto L47
            r4 = r0
            goto L50
        L47:
            rb9 r10 = (defpackage.rb9) r10
            long r6 = r10.b
            int r6 = (r6 > r1 ? 1 : (r6 == r1 ? 0 : -1))
            if (r6 < 0) goto L38
            r4 = r10
        L50:
            return r4
        L51:
            qya r1 = (defpackage.qya) r1
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r9.e
            if (r5 == 0) goto L67
            if (r5 != r3) goto L63
            java.lang.Object r9 = r9.f
            u4d r9 = (defpackage.u4d) r9
            defpackage.br7.v(r10)
            goto L86
        L63:
            defpackage.ygf.f(r2)
            goto Lb8
        L67:
            defpackage.br7.v(r10)
            java.lang.Object r10 = r9.f
            u4d r10 = (defpackage.u4d) r10
            long r4 = r9.d
            h9b r2 = new h9b
            r6 = 10
            r2.<init>(r6, r1)
            r9.f = r10
            r9.e = r3
            java.lang.Object r9 = defpackage.yk3.c(r10, r4, r2, r9)
            if (r9 != r0) goto L83
            r4 = r0
            goto Lb8
        L83:
            r8 = r10
            r10 = r9
            r9 = r8
        L86:
            rb9 r10 = (defpackage.rb9) r10
            if (r10 == 0) goto L9e
            long r0 = r1.a
            r2 = 9223372034707292159(0x7fffffff7fffffff, double:NaN)
            long r0 = r0 & r2
            r2 = 9205357640488583168(0x7fc000007fc00000, double:2.247117487993712E307)
            int r10 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r10 == 0) goto L9e
            cj3 r4 = defpackage.cj3.Drag
            goto Lb8
        L9e:
            w4d r9 = r9.e
            lb9 r9 = r9.s
            java.util.List r9 = r9.a
            java.lang.Object r9 = defpackage.bu1.x0(r9)
            rb9 r9 = (defpackage.rb9) r9
            boolean r10 = defpackage.mq7.x(r9)
            if (r10 == 0) goto Lb6
            r9.a()
            cj3 r4 = defpackage.cj3.Up
            goto Lb8
        Lb6:
            cj3 r4 = defpackage.cj3.Cancel
        Lb8:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.exb.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public exb(rb9 rb9Var, n92 n92Var) {
        super(2, n92Var);
        this.g = rb9Var;
    }
}
