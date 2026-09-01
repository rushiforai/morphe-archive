package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dy4 implements x45 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ dy4(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    private final Object a(Object obj) {
        zf3 zf3Var = (zf3) this.c;
        Object obj2 = zf3Var.d;
        x51 x51Var = (x51) this.b;
        synchronized (obj2) {
            ((ArrayList) zf3Var.b).remove(x51Var);
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:122:0x03d0  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x02cc  */
    @Override // defpackage.x45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 1594
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dy4.invoke(java.lang.Object):java.lang.Object");
    }
}
