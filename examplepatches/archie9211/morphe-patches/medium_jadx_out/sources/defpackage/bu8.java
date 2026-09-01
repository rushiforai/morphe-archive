package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bu8 extends zl4 {
    public static final bu8 d = new bu8(0, 2, 1);

    @Override // defpackage.zl4
    public final void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        int i = ((p46) ym0Var.i(0)).a;
        List list = (List) ym0Var.i(1);
        int size = list.size();
        for (int i2 = 0; i2 < size; i2++) {
            Object obj = list.get(i2);
            int i3 = i + i2;
            x60Var.c(i3, obj);
            x60Var.k(i3, obj);
        }
    }
}
