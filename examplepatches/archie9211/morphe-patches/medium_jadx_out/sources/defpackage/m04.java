package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m04 extends dn1 {
    public final wn1 g;
    public final l04 h;
    public final fi8 i;
    public final ly j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m04(x67 x67Var, y28 y28Var, hec hecVar, n98 n98Var, fi8 fi8Var, ly lyVar, jkc jkcVar) {
        super(x67Var, y28Var, n98Var, jkcVar);
        if (x67Var == null) {
            u0(6);
            throw null;
        }
        if (y28Var == null) {
            u0(7);
            throw null;
        }
        if (hecVar == null) {
            u0(8);
            throw null;
        }
        if (fi8Var == null) {
            u0(10);
            throw null;
        }
        this.j = lyVar;
        this.g = new wn1(this, Collections.EMPTY_LIST, Collections.singleton(hecVar), x67Var);
        this.h = new l04(this, x67Var);
        this.i = fi8Var;
    }

    public static /* synthetic */ void u0(int i) {
        String str;
        int i2;
        switch (i) {
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                str = "@NotNull method %s.%s must not return null";
                break;
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                i2 = 2;
                break;
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "enumClass";
                break;
            case 2:
            case 9:
                objArr[0] = "name";
                break;
            case 3:
            case 10:
                objArr[0] = "enumMemberNames";
                break;
            case 4:
            case 11:
                objArr[0] = "annotations";
                break;
            case 5:
            case 12:
                objArr[0] = "source";
                break;
            case 6:
            default:
                objArr[0] = "storageManager";
                break;
            case 7:
                objArr[0] = "containingClass";
                break;
            case 8:
                objArr[0] = "supertype";
                break;
            case 13:
                objArr[0] = "kotlinTypeRefiner";
                break;
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/EnumEntrySyntheticClassDescriptor";
                break;
        }
        switch (i) {
            case 14:
                objArr[1] = "getUnsubstitutedMemberScope";
                break;
            case 15:
                objArr[1] = "getStaticScope";
                break;
            case 16:
                objArr[1] = "getConstructors";
                break;
            case 17:
                objArr[1] = "getTypeConstructor";
                break;
            case 18:
                objArr[1] = "getKind";
                break;
            case 19:
                objArr[1] = "getModality";
                break;
            case 20:
                objArr[1] = "getVisibility";
                break;
            case 21:
                objArr[1] = "getAnnotations";
                break;
            case 22:
                objArr[1] = "getDeclaredTypeParameters";
                break;
            case 23:
                objArr[1] = "getSealedSubclasses";
                break;
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/EnumEntrySyntheticClassDescriptor";
                break;
        }
        switch (i) {
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
                objArr[2] = "<init>";
                break;
            case 13:
                objArr[2] = "getUnsubstitutedMemberScope";
                break;
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                break;
            default:
                objArr[2] = "create";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
                throw new IllegalStateException(str2);
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    public static m04 w0(x67 x67Var, y28 y28Var, n98 n98Var, u67 u67Var, ly lyVar, jkc jkcVar) {
        if (x67Var == null) {
            u0(0);
            throw null;
        }
        if (y28Var == null) {
            u0(1);
            throw null;
        }
        if (u67Var != null) {
            return new m04(x67Var, y28Var, y28Var.T(), n98Var, u67Var, lyVar, jkcVar);
        }
        u0(3);
        throw null;
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        qn1 qn1Var = qn1.ENUM_ENTRY;
        if (qn1Var != null) {
            return qn1Var;
        }
        u0(18);
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
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        u0(22);
        throw null;
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        ly lyVar = this.j;
        if (lyVar != null) {
            return lyVar;
        }
        u0(21);
        throw null;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = h93.e;
        if (g93Var != null) {
            return g93Var;
        }
        u0(20);
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
        wn1 wn1Var = this.g;
        if (wn1Var != null) {
            return wn1Var;
        }
        u0(17);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        l04 l04Var = this.h;
        if (l04Var != null) {
            return l04Var;
        }
        u0(14);
        throw null;
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        c28 c28Var = c28.FINAL;
        if (c28Var != null) {
            return c28Var;
        }
        u0(19);
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
        return "enum entry " + getName();
    }

    @Override // defpackage.y28
    public final Collection w() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        u0(16);
        throw null;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }
}
