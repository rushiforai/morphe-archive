package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s4a extends o4a {
    public mn6 n;
    public final s4a o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s4a(q4a q4aVar, ly lyVar, c28 c28Var, g93 g93Var, boolean z, boolean z2, boolean z3, e41 e41Var, s4a s4aVar, jkc jkcVar) {
        super(c28Var, g93Var, q4aVar, lyVar, n98.g("<get-" + q4aVar.getName() + ">"), z, z2, z3, e41Var, jkcVar);
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (c28Var == null) {
            f0(2);
            throw null;
        }
        if (g93Var == null) {
            f0(3);
            throw null;
        }
        if (e41Var == null) {
            f0(4);
            throw null;
        }
        if (jkcVar == null) {
            f0(5);
            throw null;
        }
        this.o = s4aVar != null ? s4aVar : this;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 6 || i == 7 || i == 8) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 6 || i == 7 || i == 8) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "annotations";
                break;
            case 2:
                objArr[0] = "modality";
                break;
            case 3:
                objArr[0] = "visibility";
                break;
            case 4:
                objArr[0] = "kind";
                break;
            case 5:
                objArr[0] = "source";
                break;
            case 6:
            case 7:
            case 8:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyGetterDescriptorImpl";
                break;
            default:
                objArr[0] = "correspondingProperty";
                break;
        }
        if (i == 6) {
            objArr[1] = "getOverriddenDescriptors";
        } else if (i == 7) {
            objArr[1] = "getValueParameters";
        } else if (i != 8) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyGetterDescriptorImpl";
        } else {
            objArr[1] = "getOriginal";
        }
        if (i != 6 && i != 7 && i != 8) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 6 && i != 7 && i != 8) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public final void A0(mn6 mn6Var) {
        if (mn6Var == null) {
            mn6Var = this.i.getType();
        }
        this.n = mn6Var;
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.i(this, obj);
    }

    @Override // defpackage.c41
    public final List I() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        f0(7);
        throw null;
    }

    @Override // defpackage.c41
    public final mn6 getReturnType() {
        return this.n;
    }

    @Override // defpackage.f41, defpackage.c41
    public final Collection i() {
        return y0(true);
    }

    @Override // defpackage.bw2
    /* JADX INFO: renamed from: z0, reason: merged with bridge method [inline-methods] */
    public final s4a x0() {
        s4a s4aVar = this.o;
        if (s4aVar != null) {
            return s4aVar;
        }
        f0(8);
        throw null;
    }
}
