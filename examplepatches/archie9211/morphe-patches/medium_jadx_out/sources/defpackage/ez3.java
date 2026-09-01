package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ez3 implements yx {
    public static final ez3 a = new ez3();

    @Override // defpackage.yx
    public final jkc d() {
        throw new IllegalStateException("No methods should be called on this descriptor. Only its presence matters");
    }

    @Override // defpackage.yx
    public final y05 e() {
        y28 y28VarD = f93.d(this);
        if (y28VarD != null) {
            if (l24.f(y28VarD)) {
                y28VarD = null;
            }
            if (y28VarD != null) {
                return f93.c(y28VarD);
            }
        }
        return null;
    }

    @Override // defpackage.yx
    public final Map f() {
        throw new IllegalStateException("No methods should be called on this descriptor. Only its presence matters");
    }

    @Override // defpackage.yx
    public final mn6 getType() {
        throw new IllegalStateException("No methods should be called on this descriptor. Only its presence matters");
    }

    public final String toString() {
        return "[EnhancedType]";
    }
}
