package defpackage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class bec extends u55 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bec(yv2 yv2Var, bec becVar, ly lyVar, n98 n98Var, e41 e41Var, jkc jkcVar) {
        super(lyVar, e41Var, yv2Var, becVar, n98Var, jkcVar);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (n98Var == null) {
            f0(2);
            throw null;
        }
        if (e41Var == null) {
            f0(3);
            throw null;
        }
        if (jkcVar != null) {
        } else {
            f0(4);
            throw null;
        }
    }

    public static bec I0(yv2 yv2Var, n98 n98Var, e41 e41Var, jkc jkcVar) {
        ky kyVar = cd7.e;
        if (n98Var == null) {
            f0(7);
            throw null;
        }
        if (e41Var == null) {
            f0(8);
            throw null;
        }
        if (jkcVar != null) {
            return new bec(yv2Var, null, kyVar, n98Var, e41Var, jkcVar);
        }
        f0(9);
        throw null;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 13 || i == 18 || i == 23 || i == 24 || i == 29 || i == 30) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 13 || i == 18 || i == 23 || i == 24 || i == 29 || i == 30) ? 2 : 3];
        switch (i) {
            case 1:
            case 6:
            case 27:
                objArr[0] = "annotations";
                break;
            case 2:
            case 7:
                objArr[0] = "name";
                break;
            case 3:
            case 8:
            case 26:
                objArr[0] = "kind";
                break;
            case 4:
            case 9:
            case 28:
                objArr[0] = "source";
                break;
            case 5:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 10:
            case 15:
            case 20:
                objArr[0] = "typeParameters";
                break;
            case 11:
            case 16:
            case 21:
                objArr[0] = "unsubstitutedValueParameters";
                break;
            case 12:
            case 17:
            case 22:
                objArr[0] = "visibility";
                break;
            case 13:
            case 18:
            case 23:
            case 24:
            case 29:
            case 30:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/SimpleFunctionDescriptorImpl";
                break;
            case 14:
            case 19:
                objArr[0] = "contextReceiverParameters";
                break;
            case 25:
                objArr[0] = "newOwner";
                break;
        }
        if (i == 13 || i == 18 || i == 23) {
            objArr[1] = "initialize";
        } else if (i == 24) {
            objArr[1] = "getOriginal";
        } else if (i == 29) {
            objArr[1] = "copy";
        } else if (i != 30) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/SimpleFunctionDescriptorImpl";
        } else {
            objArr[1] = "newCopyBuilder";
        }
        switch (i) {
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                objArr[2] = "create";
                break;
            case 10:
            case 11:
            case 12:
            case 14:
            case 15:
            case 16:
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
                objArr[2] = "initialize";
                break;
            case 13:
            case 18:
            case 23:
            case 24:
            case 29:
            case 30:
                break;
            case 25:
            case 26:
            case 27:
            case 28:
                objArr[2] = "createSubstitutedCopy";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 13 && i != 18 && i != 23 && i != 24 && i != 29 && i != 30) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.u55
    public u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        if (yv2Var == null) {
            f0(25);
            throw null;
        }
        if (e41Var == null) {
            f0(26);
            throw null;
        }
        if (lyVar == null) {
            f0(27);
            throw null;
        }
        bec becVar = (bec) s55Var;
        if (n98Var == null) {
            n98Var = getName();
        }
        return new bec(yv2Var, becVar, lyVar, n98Var, e41Var, jkcVar);
    }

    @Override // defpackage.bw2
    /* JADX INFO: renamed from: J0, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final bec x0() {
        bec becVar = (bec) super.x0();
        if (becVar != null) {
            return becVar;
        }
        f0(24);
        throw null;
    }

    @Override // defpackage.u55
    /* JADX INFO: renamed from: K0, reason: merged with bridge method [inline-methods] */
    public final bec D0(yq6 yq6Var, yq6 yq6Var2, List list, List list2, List list3, mn6 mn6Var, c28 c28Var, g93 g93Var) {
        if (list == null) {
            f0(14);
            throw null;
        }
        if (list2 == null) {
            f0(15);
            throw null;
        }
        if (list3 == null) {
            f0(16);
            throw null;
        }
        if (g93Var != null) {
            return L0(yq6Var, yq6Var2, list, list2, list3, mn6Var, c28Var, g93Var, null);
        }
        f0(17);
        throw null;
    }

    public bec L0(yq6 yq6Var, yq6 yq6Var2, List list, List list2, List list3, mn6 mn6Var, c28 c28Var, g93 g93Var, Map map) {
        if (list == null) {
            f0(19);
            throw null;
        }
        if (list2 == null) {
            f0(20);
            throw null;
        }
        if (list3 == null) {
            f0(21);
            throw null;
        }
        if (g93Var == null) {
            f0(22);
            throw null;
        }
        super.D0(yq6Var, yq6Var2, list, list2, list3, mn6Var, c28Var, g93Var);
        if (map != null && !map.isEmpty()) {
            this.D = new LinkedHashMap(map);
        }
        return this;
    }

    @Override // defpackage.u55, defpackage.s55
    public r55 d0() {
        return E0(ixd.b);
    }
}
