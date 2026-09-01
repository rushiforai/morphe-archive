package defpackage;

import java.util.Collection;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b93 extends er7 {
    public final /* synthetic */ q14 d;
    public final /* synthetic */ LinkedHashSet e;
    public final /* synthetic */ boolean f;

    public b93(q14 q14Var, LinkedHashSet linkedHashSet, boolean z) {
        this.d = q14Var;
        this.e = linkedHashSet;
        this.f = z;
    }

    public static /* synthetic */ void P(int i) {
        Object[] objArr = new Object[3];
        if (i == 1) {
            objArr[0] = "fromSuper";
        } else if (i == 2) {
            objArr[0] = "fromCurrent";
        } else if (i == 3) {
            objArr[0] = "member";
        } else if (i != 4) {
            objArr[0] = "fakeOverride";
        } else {
            objArr[0] = "overridden";
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/components/DescriptorResolverUtils$1";
        if (i == 1 || i == 2) {
            objArr[2] = "conflict";
        } else if (i == 3 || i == 4) {
            objArr[2] = "setOverriddenDescriptors";
        } else {
            objArr[2] = "addFakeOverride";
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    @Override // defpackage.er7
    public final void G(f41 f41Var, Collection collection) {
        if (f41Var == null) {
            P(3);
            throw null;
        }
        if (!this.f || f41Var.j() == e41.FAKE_OVERRIDE) {
            f41Var.Z(collection);
        }
    }

    @Override // defpackage.er7
    public final void u(f41 f41Var) {
        if (f41Var == null) {
            P(0);
            throw null;
        }
        cx8.r(f41Var, new z(14, this));
        this.e.add(f41Var);
    }

    @Override // defpackage.er7
    public final void v(f41 f41Var, f41 f41Var2) {
    }
}
