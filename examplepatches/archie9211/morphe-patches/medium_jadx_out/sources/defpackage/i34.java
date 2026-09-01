package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i34 implements e8a {
    public final /* synthetic */ int a;
    public final v0c b;

    public /* synthetic */ i34(v0c v0cVar, int i) {
        this.a = i;
        this.b = v0cVar;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        v0c v0cVar = this.b;
        switch (i) {
            case 0:
                return new h34((h8a) v0cVar.b);
            case 1:
                xj4 xj4Var = (xj4) v0cVar.b;
                xj4Var.getClass();
                a1c a1cVar = a1c.a;
                return a1c.a(xj4Var);
            default:
                return new b67((Context) v0cVar.b);
        }
    }
}
