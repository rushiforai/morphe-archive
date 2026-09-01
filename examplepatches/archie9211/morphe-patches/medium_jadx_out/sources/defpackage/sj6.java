package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: loaded from: classes5.dex */
public final class sj6 implements m45 {
    public final /* synthetic */ int a;
    public final vj6 b;

    public /* synthetic */ sj6(vj6 vj6Var, int i) {
        this.a = i;
        this.b = vj6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        vj6 vj6Var = this.b;
        switch (i) {
            case 0:
                return vj6Var.a(vj6Var.a);
            default:
                k1b k1bVar = vj6Var.c;
                Type type = k1bVar != null ? (Type) k1bVar.invoke() : null;
                type.getClass();
                return e0b.c(type);
        }
    }
}
