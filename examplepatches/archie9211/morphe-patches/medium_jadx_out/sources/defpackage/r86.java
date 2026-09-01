package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r86 extends zm1 implements q86 {
    public Boolean F;
    public Boolean G;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r86(y28 y28Var, r86 r86Var, ly lyVar, boolean z, e41 e41Var, jkc jkcVar) {
        super(y28Var, r86Var, lyVar, z, e41Var, jkcVar);
        if (y28Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (e41Var == null) {
            f0(2);
            throw null;
        }
        if (jkcVar == null) {
            f0(3);
            throw null;
        }
        this.F = null;
        this.G = null;
    }

    public static r86 O0(y28 y28Var, ly lyVar, boolean z, wmb wmbVar) {
        if (y28Var != null) {
            return new r86(y28Var, null, lyVar, z, e41.DECLARATION, wmbVar);
        }
        f0(4);
        throw null;
    }

    @Override // defpackage.zm1, defpackage.u55
    public final /* bridge */ /* synthetic */ u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        return P0(yv2Var, s55Var, e41Var, lyVar, jkcVar);
    }

    @Override // defpackage.u55
    public final void F0(boolean z) {
        this.F = Boolean.valueOf(z);
    }

    @Override // defpackage.u55
    public final void G0(boolean z) {
        this.G = Boolean.valueOf(z);
    }

    @Override // defpackage.zm1
    /* JADX INFO: renamed from: I0 */
    public final /* bridge */ /* synthetic */ zm1 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        return P0(yv2Var, s55Var, e41Var, lyVar, jkcVar);
    }

    public final r86 P0(yv2 yv2Var, s55 s55Var, e41 e41Var, ly lyVar, jkc jkcVar) {
        if (yv2Var == null) {
            f0(7);
            throw null;
        }
        if (e41Var == null) {
            f0(8);
            throw null;
        }
        if (lyVar == null) {
            f0(9);
            throw null;
        }
        if (jkcVar == null) {
            f0(10);
            throw null;
        }
        if (e41Var != e41.DECLARATION && e41Var != e41.SYNTHESIZED) {
            throw new IllegalStateException("Attempt at creating a constructor that is not a declaration: \ncopy from: " + this + "\nnewOwner: " + yv2Var + "\nkind: " + e41Var);
        }
        r86 r86Var = new r86((y28) yv2Var, (r86) s55Var, lyVar, this.E, e41Var, jkcVar);
        Boolean bool = this.F;
        bool.getClass();
        r86Var.F = bool;
        Boolean bool2 = this.G;
        bool2.getClass();
        r86Var.G = bool2;
        return r86Var;
    }

    @Override // defpackage.u55, defpackage.c41
    public final boolean u() {
        return this.G.booleanValue();
    }

    @Override // defpackage.q86
    public final q86 x(mn6 mn6Var, ArrayList arrayList, mn6 mn6Var2, f09 f09Var) {
        r86 r86VarP0 = P0(h(), null, j(), getAnnotations(), d());
        r86VarP0.D0(mn6Var == null ? null : kng.s(r86VarP0, mn6Var, cd7.e), this.k, ey3.a, getTypeParameters(), mq7.y(arrayList, I(), r86VarP0), mn6Var2, o(), getVisibility());
        if (f09Var != null) {
            v93 v93Var = (v93) f09Var.a;
            Object obj = f09Var.b;
            Map linkedHashMap = r86VarP0.D;
            if (linkedHashMap == null) {
                linkedHashMap = new LinkedHashMap();
                r86VarP0.D = linkedHashMap;
            }
            linkedHashMap.put(v93Var, obj);
        }
        return r86VarP0;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 11 || i == 18) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 11 || i == 18) ? 2 : 3];
        switch (i) {
            case 1:
            case 5:
            case 9:
            case 15:
                objArr[0] = "annotations";
                break;
            case 2:
            case 8:
            case 13:
                objArr[0] = "kind";
                break;
            case 3:
            case 6:
            case 10:
                objArr[0] = "source";
                break;
            case 4:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 7:
            case 12:
                objArr[0] = JWcjNoweKCnTr.PgHTho;
                break;
            case 11:
            case 18:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaClassConstructorDescriptor";
                break;
            case 14:
                objArr[0] = "sourceElement";
                break;
            case 16:
                objArr[0] = "enhancedValueParameterTypes";
                break;
            case 17:
                objArr[0] = "enhancedReturnType";
                break;
        }
        if (i == 11) {
            objArr[1] = "createSubstitutedCopy";
        } else if (i != 18) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaClassConstructorDescriptor";
        } else {
            objArr[1] = "enhance";
        }
        switch (i) {
            case 4:
            case 5:
            case 6:
                objArr[2] = "createJavaConstructor";
                break;
            case 7:
            case 8:
            case 9:
            case 10:
                objArr[2] = "createSubstitutedCopy";
                break;
            case 11:
            case 18:
                break;
            case 12:
            case 13:
            case 14:
            case 15:
                objArr[2] = "createDescriptor";
                break;
            case 16:
            case 17:
                objArr[2] = "enhance";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 11 && i != 18) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }
}
