package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ln7 implements x31 {
    public final /* synthetic */ int a;
    public final Type b;
    public final y92 c;

    public /* synthetic */ ln7(Type type, y92 y92Var, int i) {
        this.a = i;
        this.b = type;
        this.c = y92Var;
    }

    @Override // defpackage.x31
    public final Type s() {
        int i = this.a;
        return this.b;
    }

    @Override // defpackage.x31
    public final Object u(sp8 sp8Var) {
        int i = this.a;
        y92 y92Var = this.c;
        switch (i) {
            case 0:
                return new kn7(sp8Var, y92Var, 0);
            default:
                return new kn7(sp8Var, y92Var, 1);
        }
    }
}
