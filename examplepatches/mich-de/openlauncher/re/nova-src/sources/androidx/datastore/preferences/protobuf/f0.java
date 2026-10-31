package androidx.datastore.preferences.protobuf;

/* loaded from: classes2.dex */
public final class f0 implements e0 {
    public final void a(long j11, Object obj) {
        b bVar = (b) ((a0) n1.f14365c.h(j11, obj));
        if (bVar.f14277a) {
            bVar.f14277a = false;
        }
    }

    public final void b(long j11, Object obj, Object obj2) {
        m1 m1Var = n1.f14365c;
        a0 a0VarG = (a0) m1Var.h(j11, obj);
        a0 a0Var = (a0) m1Var.h(j11, obj2);
        int size = a0VarG.size();
        int size2 = a0Var.size();
        if (size > 0 && size2 > 0) {
            if (!((b) a0VarG).f14277a) {
                a0VarG = ((x0) a0VarG).g(size2 + size);
            }
            a0VarG.addAll(a0Var);
        }
        if (size > 0) {
            a0Var = a0VarG;
        }
        n1.o(j11, obj, a0Var);
    }

    public final a0 c(long j11, Object obj) {
        a0 a0Var = (a0) n1.f14365c.h(j11, obj);
        if (((b) a0Var).f14277a) {
            return a0Var;
        }
        int size = a0Var.size();
        x0 x0VarG = ((x0) a0Var).g(size == 0 ? 10 : size * 2);
        n1.o(j11, obj, x0VarG);
        return x0VarG;
    }
}
