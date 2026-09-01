package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bw8 implements h8a {
    public static final lg8 c = new lg8(4);
    public static final hz1 d = new hz1(6);
    public m33 a;
    public volatile h8a b;

    public bw8(lg8 lg8Var, h8a h8aVar) {
        this.a = lg8Var;
        this.b = h8aVar;
    }

    public final void a(m33 m33Var) {
        h8a h8aVar;
        h8a h8aVar2;
        h8a h8aVar3 = this.b;
        hz1 hz1Var = d;
        if (h8aVar3 != hz1Var) {
            m33Var.e(h8aVar3);
            return;
        }
        synchronized (this) {
            h8aVar = this.b;
            if (h8aVar != hz1Var) {
                h8aVar2 = h8aVar;
            } else {
                this.a = new lt(this.a, 12, m33Var);
                h8aVar2 = null;
            }
        }
        if (h8aVar2 != null) {
            m33Var.e(h8aVar);
        }
    }

    @Override // defpackage.h8a
    public final Object get() {
        return this.b.get();
    }
}
