package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g96 extends bec implements q86 {
    public static final v93 G = new v93();
    public static final v93 H = new v93();
    public f96 E;
    public final boolean F;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g96(yv2 yv2Var, bec becVar, ly lyVar, n98 n98Var, e41 e41Var, jkc jkcVar, boolean z) {
        super(yv2Var, becVar, lyVar, n98Var, e41Var, jkcVar);
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
        this.E = null;
        this.F = z;
    }

    public static g96 M0(yv2 yv2Var, as6 as6Var, n98 n98Var, wmb wmbVar, boolean z) {
        if (yv2Var == null) {
            f0(5);
            throw null;
        }
        if (n98Var != null) {
            return new g96(yv2Var, null, as6Var, n98Var, e41.DECLARATION, wmbVar, z);
        }
        f0(7);
        throw null;
    }

    @Override // defpackage.bec, defpackage.u55
    public final u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        if (yv2Var == null) {
            f0(14);
            throw null;
        }
        if (e41Var == null) {
            f0(15);
            throw null;
        }
        if (lyVar == null) {
            f0(16);
            throw null;
        }
        bec becVar = (bec) s55Var;
        if (n98Var == null) {
            n98Var = getName();
        }
        g96 g96Var = new g96(yv2Var, becVar, lyVar, n98Var, e41Var, jkcVar, this.F);
        f96 f96Var = this.E;
        g96Var.E = f96.get(f96Var.isStable, f96Var.isSynthesized);
        return g96Var;
    }

    @Override // defpackage.bec
    public final bec L0(yq6 yq6Var, yq6 yq6Var2, List list, List list2, List list3, mn6 mn6Var, c28 c28Var, g93 g93Var, Map map) {
        bl1 bl1Var;
        if (list == null) {
            f0(9);
            throw null;
        }
        if (list2 == null) {
            f0(10);
            throw null;
        }
        if (list3 == null) {
            f0(11);
            throw null;
        }
        if (g93Var == null) {
            f0(12);
            throw null;
        }
        super.L0(yq6Var, yq6Var2, list, list2, list3, mn6Var, c28Var, g93Var, map);
        for (el1 el1Var : sv8.a) {
            x2b x2bVar = el1Var.b;
            n98 n98Var = el1Var.a;
            if (n98Var == null || g76.L(getName(), n98Var)) {
                if (x2bVar != null) {
                    String strB = getName().b();
                    strB.getClass();
                    if (!x2bVar.c(strB)) {
                        continue;
                    }
                }
                Collection collection = el1Var.c;
                if (collection == null || collection.contains(getName())) {
                    zk1[] zk1VarArr = el1Var.e;
                    int length = zk1VarArr.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            bl1Var = ((String) el1Var.d.invoke(this)) != null ? new bl1(false) : bl1.c;
                        } else {
                            if (zk1VarArr[i].b(this) != null) {
                                bl1Var = new bl1(false);
                                break;
                            }
                            i++;
                        }
                    }
                    this.n = bl1Var.a;
                    return this;
                }
            }
        }
        bl1Var = bl1.b;
        this.n = bl1Var.a;
        return this;
    }

    @Override // defpackage.u55, defpackage.c41
    public final boolean u() {
        return this.E.isSynthesized;
    }

    @Override // defpackage.q86
    public final q86 x(mn6 mn6Var, ArrayList arrayList, mn6 mn6Var2, f09 f09Var) {
        ArrayList arrayListY = mq7.y(arrayList, I(), this);
        yq6 yq6VarS = mn6Var == null ? null : kng.s(this, mn6Var, cd7.e);
        t55 t55VarE0 = E0(ixd.b);
        t55VarE0.g = arrayListY;
        t55VarE0.k = mn6Var2;
        t55VarE0.i = yq6VarS;
        t55VarE0.p = true;
        t55VarE0.o = true;
        g96 g96Var = (g96) t55VarE0.x.B0(t55VarE0);
        if (f09Var != null) {
            v93 v93Var = (v93) f09Var.a;
            Object obj = f09Var.b;
            Map linkedHashMap = g96Var.D;
            if (linkedHashMap == null) {
                linkedHashMap = new LinkedHashMap();
                g96Var.D = linkedHashMap;
            }
            linkedHashMap.put(v93Var, obj);
        }
        if (g96Var != null) {
            return g96Var;
        }
        f0(21);
        throw null;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 13 || i == 18 || i == 21) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 13 || i == 18 || i == 21) ? 2 : 3];
        switch (i) {
            case 1:
            case 6:
            case 16:
                objArr[0] = "annotations";
                break;
            case 2:
            case 7:
                objArr[0] = "name";
                break;
            case 3:
            case 15:
                objArr[0] = "kind";
                break;
            case 4:
            case 8:
            case 17:
                objArr[0] = "source";
                break;
            case 5:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 9:
                objArr[0] = "contextReceiverParameters";
                break;
            case 10:
                objArr[0] = "typeParameters";
                break;
            case 11:
                objArr[0] = peNPu.BmORezqZ;
                break;
            case 12:
                objArr[0] = "visibility";
                break;
            case 13:
            case 18:
            case 21:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaMethodDescriptor";
                break;
            case 14:
                objArr[0] = "newOwner";
                break;
            case 19:
                objArr[0] = "enhancedValueParameterTypes";
                break;
            case 20:
                objArr[0] = "enhancedReturnType";
                break;
        }
        if (i == 13) {
            objArr[1] = "initialize";
        } else if (i == 18) {
            objArr[1] = "createSubstitutedCopy";
        } else if (i != 21) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaMethodDescriptor";
        } else {
            objArr[1] = "enhance";
        }
        switch (i) {
            case 5:
            case 6:
            case 7:
            case 8:
                objArr[2] = "createJavaMethod";
                break;
            case 9:
            case 10:
            case 11:
            case 12:
                objArr[2] = "initialize";
                break;
            case 13:
            case 18:
            case 21:
                break;
            case 14:
            case 15:
            case 16:
            case 17:
                objArr[2] = "createSubstitutedCopy";
                break;
            case 19:
            case 20:
                objArr[2] = "enhance";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 13 && i != 18 && i != 21) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }
}
