package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lud extends jud {
    public final /* synthetic */ int a;
    public final ch5 b;
    public final jud c;
    public final Type d;

    public /* synthetic */ lud(ch5 ch5Var, jud judVar, Type type, int i) {
        this.a = i;
        this.b = ch5Var;
        this.c = judVar;
        this.d = type;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) {
        int i = this.a;
        jud judVar = this.c;
        switch (i) {
        }
        return judVar.b(gd6Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0040  */
    @Override // defpackage.jud
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.yd6 r4, java.lang.Object r5) {
        /*
            r3 = this;
            int r0 = r3.a
            ch5 r1 = r3.b
            java.lang.reflect.Type r2 = r3.d
            jud r3 = r3.c
            switch(r0) {
                case 0: goto L45;
                default: goto Lb;
            }
        Lb:
            if (r5 == 0) goto L1a
            boolean r0 = r2 instanceof java.lang.Class
            if (r0 != 0) goto L15
            boolean r0 = r2 instanceof java.lang.reflect.TypeVariable
            if (r0 == 0) goto L1a
        L15:
            java.lang.Class r0 = r5.getClass()
            goto L1b
        L1a:
            r0 = r2
        L1b:
            if (r0 == r2) goto L41
            kxd r0 = defpackage.kxd.b(r0)
            jud r0 = r1.d(r0)
            boolean r1 = r0 instanceof defpackage.c2b
            if (r1 != 0) goto L2a
            goto L40
        L2a:
            r1 = r3
        L2b:
            boolean r2 = r1 instanceof defpackage.c0c
            if (r2 == 0) goto L3b
            r2 = r1
            c0c r2 = (defpackage.c0c) r2
            jud r2 = r2.d()
            if (r2 != r1) goto L39
            goto L3b
        L39:
            r1 = r2
            goto L2b
        L3b:
            boolean r1 = r1 instanceof defpackage.c2b
            if (r1 != 0) goto L40
            goto L41
        L40:
            r3 = r0
        L41:
            r3.c(r4, r5)
            return
        L45:
            if (r5 == 0) goto L58
            java.lang.Class<java.lang.Object> r0 = java.lang.Object.class
            if (r2 == r0) goto L53
            boolean r0 = r2 instanceof java.lang.reflect.TypeVariable
            if (r0 != 0) goto L53
            boolean r0 = r2 instanceof java.lang.Class
            if (r0 == 0) goto L58
        L53:
            java.lang.Class r0 = r5.getClass()
            goto L59
        L58:
            r0 = r2
        L59:
            if (r0 == r2) goto L6e
            kxd r0 = defpackage.kxd.b(r0)
            jud r0 = r1.d(r0)
            boolean r1 = r0 instanceof defpackage.c2b
            if (r1 != 0) goto L68
            goto L6d
        L68:
            boolean r1 = r3 instanceof defpackage.c2b
            if (r1 != 0) goto L6d
            goto L6e
        L6d:
            r3 = r0
        L6e:
            r3.c(r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lud.c(yd6, java.lang.Object):void");
    }
}
