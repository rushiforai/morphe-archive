package defpackage;

import java.io.IOException;

/* JADX INFO: loaded from: classes.dex */
public final class s2 implements x45, j41 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ s2(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x0301  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x02b8  */
    @Override // defpackage.x45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r12) {
        /*
            Method dump skipped, instruction units count: 838
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s2.invoke(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.j41
    public void o(cva cvaVar, adb adbVar) {
        ((x51) this.c).resumeWith(adbVar);
    }

    @Override // defpackage.j41
    public void w(cva cvaVar, IOException iOException) {
        if (cvaVar.q) {
            return;
        }
        ((x51) this.c).resumeWith(new ajb(iOException));
    }
}
