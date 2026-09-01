package defpackage;

import java.util.Collection;

/* JADX INFO: loaded from: classes5.dex */
public final class o93 implements m45 {
    public final /* synthetic */ int a;
    public final q93 b;

    public /* synthetic */ o93(q93 q93Var, int i) {
        this.a = i;
        this.b = q93Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        q93 q93Var = this.b;
        switch (i) {
            case 0:
                p83 p83Var = p83.m;
                ev7.a.getClass();
                return q93Var.i(p83Var, h06.x, ng8.WHEN_GET_ALL_DESCRIPTORS);
            default:
                sn6 sn6Var = q93Var.g;
                s93 s93Var = q93Var.j;
                sn6Var.getClass();
                s93Var.getClass();
                Collection collectionB = ((z2) s93Var.n()).b();
                collectionB.getClass();
                return collectionB;
        }
    }
}
