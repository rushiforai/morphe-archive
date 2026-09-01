package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m69 implements p3b {
    public final Set a;
    public final o78 b = new o78(new t65[16]);

    public m69(Set set) {
        this.a = set;
    }

    @Override // defpackage.p3b
    public final void d() {
        o78 o78Var = this.b;
        Object[] objArr = o78Var.a;
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            p3b p3bVar = ((t65) objArr[i2]).a;
            this.a.remove(p3bVar);
            p3bVar.d();
        }
    }

    @Override // defpackage.p3b
    public final void b() {
    }

    @Override // defpackage.p3b
    public final void c() {
    }
}
