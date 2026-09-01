package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class j93 implements ly {
    public static final /* synthetic */ fj6[] b = {n1b.a.g(new u4a(j93.class, "annotations", "getAnnotations()Ljava/util/List;", 0))};
    public final u67 a;

    public j93(x67 x67Var, m45 m45Var) {
        x67Var.getClass();
        this.a = new u67(x67Var, m45Var);
    }

    @Override // defpackage.ly
    public final /* bridge */ boolean g(y05 y05Var) {
        return rv8.D(this, y05Var);
    }

    @Override // defpackage.ly
    public final /* bridge */ yx i(y05 y05Var) {
        return rv8.z(this, y05Var);
    }

    @Override // defpackage.ly
    public boolean isEmpty() {
        b[0].getClass();
        return ((List) this.a.invoke()).isEmpty();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        b[0].getClass();
        return ((List) this.a.invoke()).iterator();
    }
}
