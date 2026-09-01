package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eu6 {
    public final int a;
    public final ArrayList b = new ArrayList();
    public final /* synthetic */ gu6 c;

    public eu6(gu6 gu6Var, int i) {
        this.c = gu6Var;
        this.a = i;
    }

    public final void a(int i) {
        gu6 gu6Var = this.c;
        zf3 zf3Var = gu6Var.c;
        if (zf3Var == null) {
            return;
        }
        this.b.add(new az9(zf3Var, i, gu6Var.b, null));
    }
}
