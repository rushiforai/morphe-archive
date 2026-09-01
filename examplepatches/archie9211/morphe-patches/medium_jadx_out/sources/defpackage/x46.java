package defpackage;

import java.util.Collection;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x46 implements zvd {
    public final Set a;
    public final w5d b;

    public x46(Set set) {
        uvd.b.getClass();
        uvd uvdVar = uvd.c;
        uvdVar.getClass();
        pwd.Z(l24.a(t14.INTEGER_LITERAL_TYPE_SCOPE, true, "unknown integer literal type"), uvdVar, this, ey3.a, false);
        this.b = new w5d(new qk0(14, this));
        this.a = set;
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return null;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        return (List) this.b.getValue();
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return false;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        throw null;
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return ey3.a;
    }

    public final String toString() {
        return "IntegerLiteralType".concat("[" + bu1.F0(this.a, ",", null, null, h06.c, 30) + ']');
    }
}
