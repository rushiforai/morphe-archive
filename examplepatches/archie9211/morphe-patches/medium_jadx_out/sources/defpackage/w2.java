package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w2 implements zvd {
    public final /* synthetic */ ha3 a;

    public w2(ha3 ha3Var) {
        this.a = ha3Var;
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return this.a;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        Collection collectionB = this.a.A0().j0().b();
        collectionB.getClass();
        return collectionB;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return true;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        return f93.e(this.a);
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        List list = this.a.q;
        if (list != null) {
            return list;
        }
        g76.g0("typeConstructorParameters");
        throw null;
    }

    public final String toString() {
        return "[typealias " + this.a.getName().b() + ']';
    }
}
