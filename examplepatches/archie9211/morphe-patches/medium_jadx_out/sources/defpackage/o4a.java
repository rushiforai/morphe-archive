package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class o4a extends bw2 implements s55 {
    public boolean f;
    public final boolean g;
    public final c28 h;
    public final q4a i;
    public final boolean j;
    public final e41 k;
    public g93 l;
    public s55 m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o4a(c28 c28Var, g93 g93Var, q4a q4aVar, ly lyVar, n98 n98Var, boolean z, boolean z2, boolean z3, e41 e41Var, jkc jkcVar) {
        super(q4aVar.h(), lyVar, n98Var, jkcVar);
        if (c28Var == null) {
            f0(0);
            throw null;
        }
        if (g93Var == null) {
            f0(1);
            throw null;
        }
        if (lyVar == null) {
            f0(3);
            throw null;
        }
        if (jkcVar == null) {
            f0(5);
            throw null;
        }
        this.m = null;
        this.h = c28Var;
        this.l = g93Var;
        this.i = q4aVar;
        this.f = z;
        this.g = z2;
        this.j = z3;
        this.k = e41Var;
    }

    @Override // defpackage.f41
    public final f41 A(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) {
        throw new UnsupportedOperationException("Accessors must be copied by the corresponding property");
    }

    @Override // defpackage.s55
    public final boolean C() {
        return false;
    }

    @Override // defpackage.s55
    public final s55 L() {
        return this.m;
    }

    @Override // defpackage.c41
    public final yq6 M() {
        return this.i.M();
    }

    @Override // defpackage.c41
    public final yq6 P() {
        return this.i.P();
    }

    @Override // defpackage.c41
    public final List U() {
        List listU = this.i.U();
        if (listU != null) {
            return listU;
        }
        f0(14);
        throw null;
    }

    @Override // defpackage.s55
    public final boolean Y() {
        return false;
    }

    @Override // defpackage.f41
    public final void Z(Collection collection) {
        if (collection != null) {
            return;
        }
        f0(16);
        throw null;
    }

    @Override // defpackage.s55
    public final boolean c0() {
        return false;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.s55, defpackage.s0d
    public final s55 f(ixd ixdVar) {
        if (ixdVar != null) {
            return this;
        }
        f0(7);
        throw null;
    }

    @Override // defpackage.c41
    public final List getTypeParameters() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        f0(9);
        throw null;
    }

    @Override // defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = this.l;
        if (g93Var != null) {
            return g93Var;
        }
        f0(11);
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean isExternal() {
        return this.g;
    }

    @Override // defpackage.s55
    public final boolean isInfix() {
        return false;
    }

    @Override // defpackage.s55
    public final boolean isInline() {
        return this.j;
    }

    @Override // defpackage.s55
    public final boolean isOperator() {
        return false;
    }

    @Override // defpackage.s55
    public final boolean isSuspend() {
        return false;
    }

    @Override // defpackage.f41
    public final e41 j() {
        e41 e41Var = this.k;
        if (e41Var != null) {
            return e41Var;
        }
        f0(6);
        throw null;
    }

    @Override // defpackage.c41
    public final Object m(v93 v93Var) {
        return null;
    }

    @Override // defpackage.tu7
    public final c28 o() {
        c28 c28Var = this.h;
        if (c28Var != null) {
            return c28Var;
        }
        f0(10);
        throw null;
    }

    @Override // defpackage.c41
    public final boolean u() {
        return false;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }

    public final ArrayList y0(boolean z) {
        ArrayList arrayList = new ArrayList(0);
        for (q4a q4aVar : this.i.i()) {
            c41 c41VarB = z ? q4aVar.b() : q4aVar.c();
            if (c41VarB != null) {
                arrayList.add(c41VarB);
            }
        }
        return arrayList;
    }

    public static /* synthetic */ void f0(int i) {
        String str;
        int i2;
        switch (i) {
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 7:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                i2 = 2;
                break;
            case 7:
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "visibility";
                break;
            case 2:
                objArr[0] = peNPu.hmhN;
                break;
            case 3:
                objArr[0] = "annotations";
                break;
            case 4:
                objArr[0] = "name";
                break;
            case 5:
                objArr[0] = "source";
                break;
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyAccessorDescriptorImpl";
                break;
            case 7:
                objArr[0] = "substitutor";
                break;
            case 16:
                objArr[0] = "overriddenDescriptors";
                break;
            default:
                objArr[0] = "modality";
                break;
        }
        switch (i) {
            case 6:
                objArr[1] = "getKind";
                break;
            case 7:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/PropertyAccessorDescriptorImpl";
                break;
            case 8:
                objArr[1] = "substitute";
                break;
            case 9:
                objArr[1] = "getTypeParameters";
                break;
            case 10:
                objArr[1] = "getModality";
                break;
            case 11:
                objArr[1] = "getVisibility";
                break;
            case 12:
                objArr[1] = "getCorrespondingVariable";
                break;
            case 13:
                objArr[1] = "getCorrespondingProperty";
                break;
            case 14:
                objArr[1] = "getContextReceiverParameters";
                break;
            case 15:
                objArr[1] = "getOverriddenDescriptors";
                break;
        }
        switch (i) {
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                break;
            case 7:
                objArr[2] = "substitute";
                break;
            case 16:
                objArr[2] = "setOverriddenDescriptors";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 6:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                throw new IllegalStateException(str2);
            case 7:
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    @Override // defpackage.s0d
    public final /* bridge */ /* synthetic */ aw2 f(ixd ixdVar) {
        f(ixdVar);
        return this;
    }
}
