package defpackage;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b3 extends z2 {
    public final uob c;
    public final /* synthetic */ c3 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b3(c3 c3Var, x67 x67Var) {
        super(x67Var);
        uob uobVar = uob.h;
        if (x67Var == null) {
            l(0);
            throw null;
        }
        this.d = c3Var;
        this.c = uobVar;
    }

    public static /* synthetic */ void l(int i) {
        String str = (i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 8) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 1 || i == 2 || i == 3 || i == 4 || i == 5 || i == 8) ? 2 : 3];
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 8:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractTypeParameterDescriptor$TypeParameterTypeConstructor";
                break;
            case 6:
                objArr[0] = "type";
                break;
            case 7:
                objArr[0] = "supertypes";
                break;
            case 9:
                objArr[0] = "classifier";
                break;
            default:
                objArr[0] = "storageManager";
                break;
        }
        if (i == 1) {
            objArr[1] = "computeSupertypes";
        } else if (i == 2) {
            objArr[1] = "getParameters";
        } else if (i == 3) {
            objArr[1] = "getDeclarationDescriptor";
        } else if (i == 4) {
            objArr[1] = "getBuiltIns";
        } else if (i == 5) {
            objArr[1] = "getSupertypeLoopChecker";
        } else if (i != 8) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractTypeParameterDescriptor$TypeParameterTypeConstructor";
        } else {
            objArr[1] = "processSupertypesWithoutCycles";
        }
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 8:
                break;
            case 6:
                objArr[2] = "reportSupertypeLoopError";
                break;
            case 7:
                objArr[2] = "processSupertypesWithoutCycles";
                break;
            case 9:
                objArr[2] = "isSameClassifier";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 1 && i != 2 && i != 3 && i != 4 && i != 5 && i != 8) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return this.d;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return true;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        vm6 vm6VarE = f93.e(this.d);
        if (vm6VarE != null) {
            return vm6VarE;
        }
        l(4);
        throw null;
    }

    @Override // defpackage.z2
    public final Collection f() {
        List listZ0 = this.d.z0();
        if (listZ0 != null) {
            return listZ0;
        }
        l(1);
        throw null;
    }

    @Override // defpackage.z2
    public final mn6 g() {
        return l24.c(k24.CYCLIC_UPPER_BOUNDS, new String[0]);
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        l(2);
        throw null;
    }

    @Override // defpackage.z2
    public final uob h() {
        uob uobVar = this.c;
        if (uobVar != null) {
            return uobVar;
        }
        l(5);
        throw null;
    }

    @Override // defpackage.z2
    public final boolean j(co1 co1Var) {
        if (!(co1Var instanceof swd)) {
            return false;
        }
        return h1c.e.P0(this.d, (swd) co1Var, true, a0.r);
    }

    @Override // defpackage.z2
    public final List k(List list) {
        List listY0 = this.d.y0(list);
        if (listY0 != null) {
            return listY0;
        }
        l(8);
        throw null;
    }

    public final String toString() {
        return this.d.getName().a;
    }
}
