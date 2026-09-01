package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f68 extends dn1 {
    public final qn1 g;
    public c28 h;
    public g93 i;
    public wn1 j;
    public ArrayList k;
    public final ArrayList l;
    public final x67 m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f68(gy3 gy3Var, qn1 qn1Var, n98 n98Var, x67 x67Var) {
        super(x67Var, gy3Var, n98Var, jkc.g0);
        if (qn1Var == null) {
            u0(1);
            throw null;
        }
        if (x67Var == null) {
            u0(4);
            throw null;
        }
        this.l = new ArrayList();
        this.m = x67Var;
        this.g = qn1Var;
    }

    public static /* synthetic */ void u0(int i) {
        String str;
        int i2;
        switch (i) {
            case 5:
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
            case 17:
            case 18:
            case 19:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 5:
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
            case 17:
            case 18:
            case 19:
                i2 = 2;
                break;
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "kind";
                break;
            case 2:
                objArr[0] = "name";
                break;
            case 3:
                objArr[0] = "source";
                break;
            case 4:
                objArr[0] = "storageManager";
                break;
            case 5:
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
            case 17:
            case 18:
            case 19:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/MutableClassDescriptor";
                break;
            case 6:
                objArr[0] = "modality";
                break;
            case 9:
                objArr[0] = "visibility";
                break;
            case 12:
                objArr[0] = "supertype";
                break;
            case 14:
                objArr[0] = "typeParameters";
                break;
            case 16:
                objArr[0] = "kotlinTypeRefiner";
                break;
            default:
                objArr[0] = "containingDeclaration";
                break;
        }
        switch (i) {
            case 5:
                objArr[1] = "getAnnotations";
                break;
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/MutableClassDescriptor";
                break;
            case 7:
                objArr[1] = "getModality";
                break;
            case 8:
                objArr[1] = "getKind";
                break;
            case 10:
                objArr[1] = "getVisibility";
                break;
            case 11:
                objArr[1] = "getTypeConstructor";
                break;
            case 13:
                objArr[1] = "getConstructors";
                break;
            case 15:
                objArr[1] = "getDeclaredTypeParameters";
                break;
            case 17:
                objArr[1] = "getUnsubstitutedMemberScope";
                break;
            case 18:
                objArr[1] = "getStaticScope";
                break;
            case 19:
                objArr[1] = "getSealedSubclasses";
                break;
        }
        switch (i) {
            case 5:
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
            case 17:
            case 18:
            case 19:
                break;
            case 6:
                objArr[2] = "setModality";
                break;
            case 9:
                objArr[2] = "setVisibility";
                break;
            case 12:
                objArr[2] = "addSupertype";
                break;
            case 14:
                objArr[2] = "setTypeParameterDescriptors";
                break;
            case 16:
                objArr[2] = "getUnsubstitutedMemberScope";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 5:
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
            case 17:
            case 18:
            case 19:
                throw new IllegalStateException(str2);
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        qn1 qn1Var = this.g;
        if (qn1Var != null) {
            return qn1Var;
        }
        u0(8);
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return false;
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        ArrayList arrayList = this.k;
        if (arrayList != null) {
            return arrayList;
        }
        u0(15);
        throw null;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return cd7.e;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = this.i;
        if (g93Var != null) {
            return g93Var;
        }
        u0(10);
        throw null;
    }

    @Override // defpackage.y28
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.y28
    public final ev7 j0() {
        return dv7.b;
    }

    @Override // defpackage.co1
    public final zvd n() {
        wn1 wn1Var = this.j;
        if (wn1Var != null) {
            return wn1Var;
        }
        u0(11);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        return dv7.b;
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        c28 c28Var = this.h;
        if (c28Var != null) {
            return c28Var;
        }
        u0(7);
        throw null;
    }

    @Override // defpackage.y28
    public final zm1 o0() {
        return null;
    }

    @Override // defpackage.y28
    public final cqe p0() {
        return null;
    }

    @Override // defpackage.y28
    public final boolean q0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean r0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean t0() {
        return false;
    }

    public final String toString() {
        return zv2.w0(this);
    }

    @Override // defpackage.y28
    public final Collection w() {
        Set set = Collections.EMPTY_SET;
        if (set != null) {
            return set;
        }
        u0(13);
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }
}
