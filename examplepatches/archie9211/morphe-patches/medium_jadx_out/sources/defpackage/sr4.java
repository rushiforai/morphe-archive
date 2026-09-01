package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sr4 {
    public static final sr4 b = new sr4();
    public static final sr4 c = new sr4();
    public static final sr4 d = new sr4();
    public final o78 a = new o78(new ur4[16]);

    /* JADX WARN: Code restructure failed: missing block: B:69:0x004b, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void a(defpackage.sr4 r12) {
        /*
            r12.getClass()
            sr4 r0 = defpackage.sr4.b
            java.lang.String r1 = "\n    Please check whether the focusRequester is FocusRequester.Cancel or FocusRequester.Default\n    before invoking any functions on the focusRequester.\n"
            if (r12 == r0) goto Lc3
            sr4 r0 = defpackage.sr4.c
            if (r12 == r0) goto Lbf
            o78 r12 = r12.a
            int r0 = r12.c
            if (r0 != 0) goto L1b
            java.lang.String r12 = "FocusRelatedWarning: \n   FocusRequester is not initialized. Here are some possible fixes:\n\n   1. Remember the FocusRequester: val focusRequester = remember { FocusRequester() }\n   2. Did you forget to add a Modifier.focusRequester() ?\n   3. Are you attempting to request focus during composition? Focus requests should be made in\n   response to some event. Eg Modifier.clickable { focusRequester.requestFocus() }\n"
            java.io.PrintStream r0 = java.lang.System.out
            r0.println(r12)
            return
        L1b:
            java.lang.Object[] r12 = r12.a
            r1 = 0
            r2 = r1
        L1f:
            if (r2 >= r0) goto Lbe
            r3 = r12[r2]
            ur4 r3 = (defpackage.ur4) r3
            r4 = r3
            q28 r4 = (defpackage.q28) r4
            q28 r4 = r4.a
            boolean r4 = r4.n
            if (r4 != 0) goto L33
            java.lang.String r4 = "visitChildren called on an unattached node"
            defpackage.b26.b(r4)
        L33:
            o78 r4 = new o78
            r5 = 16
            q28[] r6 = new defpackage.q28[r5]
            r4.<init>(r6)
            q28 r3 = (defpackage.q28) r3
            q28 r3 = r3.a
            q28 r6 = r3.f
            if (r6 != 0) goto L48
            defpackage.flb.X(r4, r3)
            goto L4b
        L48:
            r4.b(r6)
        L4b:
            int r3 = r4.c
            if (r3 == 0) goto Lba
            int r3 = r3 + (-1)
            java.lang.Object r3 = r4.m(r3)
            q28 r3 = (defpackage.q28) r3
            int r6 = r3.d
            r6 = r6 & 1024(0x400, float:1.435E-42)
            if (r6 != 0) goto L61
            defpackage.flb.X(r4, r3)
            goto L4b
        L61:
            if (r3 == 0) goto L4b
            int r6 = r3.c
            r6 = r6 & 1024(0x400, float:1.435E-42)
            if (r6 == 0) goto Lb7
            r6 = 0
            r7 = r6
        L6b:
            if (r3 == 0) goto L4b
            boolean r8 = r3 instanceof defpackage.es4
            if (r8 == 0) goto L7b
            es4 r3 = (defpackage.es4) r3
            r8 = 7
            boolean r3 = r3.P0(r8)
            if (r3 == 0) goto Lb2
            goto Lba
        L7b:
            int r8 = r3.c
            r8 = r8 & 1024(0x400, float:1.435E-42)
            if (r8 == 0) goto Lb2
            boolean r8 = r3 instanceof defpackage.b43
            if (r8 == 0) goto Lb2
            r8 = r3
            b43 r8 = (defpackage.b43) r8
            q28 r8 = r8.p
            r9 = r1
        L8b:
            r10 = 1
            if (r8 == 0) goto Laf
            int r11 = r8.c
            r11 = r11 & 1024(0x400, float:1.435E-42)
            if (r11 == 0) goto Lac
            int r9 = r9 + 1
            if (r9 != r10) goto L9a
            r3 = r8
            goto Lac
        L9a:
            if (r7 != 0) goto La3
            o78 r7 = new o78
            q28[] r10 = new defpackage.q28[r5]
            r7.<init>(r10)
        La3:
            if (r3 == 0) goto La9
            r7.b(r3)
            r3 = r6
        La9:
            r7.b(r8)
        Lac:
            q28 r8 = r8.f
            goto L8b
        Laf:
            if (r9 != r10) goto Lb2
            goto L6b
        Lb2:
            q28 r3 = defpackage.flb.q0(r7)
            goto L6b
        Lb7:
            q28 r3 = r3.f
            goto L61
        Lba:
            int r2 = r2 + 1
            goto L1f
        Lbe:
            return
        Lbf:
            defpackage.ygf.f(r1)
            return
        Lc3:
            defpackage.ygf.f(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sr4.a(sr4):void");
    }
}
