package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class twd extends c3 {
    public final ArrayList l;
    public boolean m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public twd(int i, ly lyVar, yv2 yv2Var, x67 x67Var, n98 n98Var, pqe pqeVar, boolean z) {
        super(i, lyVar, yv2Var, x67Var, n98Var, pqeVar, z);
        if (yv2Var == null) {
            f0(19);
            throw null;
        }
        if (lyVar == null) {
            f0(20);
            throw null;
        }
        if (pqeVar == null) {
            f0(21);
            throw null;
        }
        if (n98Var == null) {
            f0(22);
            throw null;
        }
        if (x67Var == null) {
            f0(25);
            throw null;
        }
        this.l = new ArrayList(1);
        this.m = false;
    }

    public static twd A0(int i, ly lyVar, yv2 yv2Var, x67 x67Var, n98 n98Var, pqe pqeVar, boolean z) {
        if (yv2Var == null) {
            f0(6);
            throw null;
        }
        if (lyVar == null) {
            f0(7);
            throw null;
        }
        if (pqeVar == null) {
            f0(8);
            throw null;
        }
        if (n98Var == null) {
            f0(9);
            throw null;
        }
        if (x67Var != null) {
            return new twd(i, lyVar, yv2Var, x67Var, n98Var, pqeVar, z);
        }
        f0(11);
        throw null;
    }

    public static twd B0(f0 f0Var, pqe pqeVar, n98 n98Var, int i, x67 x67Var) {
        ky kyVar = cd7.e;
        if (pqeVar == null) {
            f0(2);
            throw null;
        }
        if (x67Var == null) {
            f0(4);
            throw null;
        }
        twd twdVarA0 = A0(i, kyVar, f0Var, x67Var, n98Var, pqeVar, false);
        hec hecVarO = f93.e(f0Var).o();
        if (twdVarA0.m) {
            ygf.f("Type parameter descriptor is already initialized: ".concat(twdVarA0.C0()));
            return null;
        }
        if (!kyd.a0(hecVarO)) {
            twdVarA0.l.add(hecVarO);
        }
        if (twdVarA0.m) {
            ygf.f("Type parameter descriptor is already initialized: ".concat(twdVarA0.C0()));
            return null;
        }
        twdVarA0.m = true;
        return twdVarA0;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 5 || i == 28) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 5 || i == 28) ? 2 : 3];
        switch (i) {
            case 1:
            case 7:
            case 13:
            case 20:
                objArr[0] = "annotations";
                break;
            case 2:
            case 8:
            case 14:
            case 21:
                objArr[0] = "variance";
                break;
            case 3:
            case 9:
            case 15:
            case 22:
                objArr[0] = "name";
                break;
            case 4:
            case 11:
            case 18:
            case 25:
                objArr[0] = "storageManager";
                break;
            case 5:
            case 28:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/TypeParameterDescriptorImpl";
                break;
            case 6:
            case 12:
            case 19:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 10:
            case 16:
            case 23:
                objArr[0] = "source";
                break;
            case 17:
                objArr[0] = "supertypeLoopsResolver";
                break;
            case 24:
                objArr[0] = "supertypeLoopsChecker";
                break;
            case 26:
                objArr[0] = "bound";
                break;
            case 27:
                objArr[0] = "type";
                break;
        }
        if (i == 5) {
            objArr[1] = "createWithDefaultBound";
        } else if (i != 28) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/TypeParameterDescriptorImpl";
        } else {
            objArr[1] = "resolveUpperBounds";
        }
        switch (i) {
            case 5:
            case 28:
                break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
                objArr[2] = "createForFurtherModification";
                break;
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 24:
            case 25:
                objArr[2] = "<init>";
                break;
            case 26:
                objArr[2] = "addUpperBound";
                break;
            case 27:
                objArr[2] = "reportSupertypeLoopError";
                break;
            default:
                objArr[2] = "createWithDefaultBound";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 5 && i != 28) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public final String C0() {
        return getName() + " declared in " + d93.g(h());
    }

    @Override // defpackage.c3
    public final List z0() {
        if (!this.m) {
            ygf.f("Type parameter descriptor is not initialized: ".concat(C0()));
            return null;
        }
        ArrayList arrayList = this.l;
        if (arrayList != null) {
            return arrayList;
        }
        f0(28);
        throw null;
    }
}
