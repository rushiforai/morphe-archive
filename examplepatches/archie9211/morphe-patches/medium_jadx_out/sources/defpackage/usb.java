package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class usb extends p4d implements b55 {
    public long b;
    public int c;
    public /* synthetic */ long d;
    public final /* synthetic */ vsb e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public usb(vsb vsbVar, n92 n92Var) {
        super(2, n92Var);
        this.e = vsbVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        usb usbVar = new usb(this.e, n92Var);
        usbVar.d = ((qre) obj).a;
        return usbVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        long j = ((qre) obj).a;
        usb usbVar = new usb(this.e, (n92) obj2);
        usbVar.d = j;
        return usbVar.invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006e  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            r14 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r14.c
            r2 = 3
            r3 = 2
            r4 = 1
            vsb r5 = r14.e
            if (r1 == 0) goto L2e
            if (r1 == r4) goto L28
            if (r1 == r3) goto L20
            if (r1 != r2) goto L19
            long r0 = r14.b
            long r2 = r14.d
            defpackage.br7.v(r15)
            goto L70
        L19:
            java.lang.String r14 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r14)
            r14 = 0
            return r14
        L20:
            long r3 = r14.b
            long r6 = r14.d
            defpackage.br7.v(r15)
            goto L56
        L28:
            long r6 = r14.d
            defpackage.br7.v(r15)
            goto L40
        L2e:
            defpackage.br7.v(r15)
            long r6 = r14.d
            cd8 r15 = r5.f
            r14.d = r6
            r14.c = r4
            java.lang.Object r15 = r15.b(r6, r14)
            if (r15 != r0) goto L40
            goto L6d
        L40:
            qre r15 = (defpackage.qre) r15
            long r8 = r15.a
            long r8 = defpackage.qre.d(r6, r8)
            r14.d = r6
            r14.b = r8
            r14.c = r3
            java.lang.Object r15 = r5.a(r8, r14)
            if (r15 != r0) goto L55
            goto L6d
        L55:
            r3 = r8
        L56:
            qre r15 = (defpackage.qre) r15
            long r11 = r15.a
            cd8 r8 = r5.f
            long r9 = defpackage.qre.d(r3, r11)
            r14.d = r6
            r14.b = r11
            r14.c = r2
            r13 = r14
            java.lang.Object r15 = r8.a(r9, r11, r13)
            if (r15 != r0) goto L6e
        L6d:
            return r0
        L6e:
            r2 = r6
            r0 = r11
        L70:
            qre r15 = (defpackage.qre) r15
            long r14 = r15.a
            long r14 = defpackage.qre.d(r0, r14)
            long r14 = defpackage.qre.d(r2, r14)
            qre r0 = new qre
            r0.<init>(r14)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.usb.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
