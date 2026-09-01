package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class j96 extends r4a implements q86 {
    public final boolean B;
    public final f09 C;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j96(yv2 yv2Var, ly lyVar, c28 c28Var, g93 g93Var, boolean z, n98 n98Var, jkc jkcVar, q4a q4aVar, e41 e41Var, boolean z2, f09 f09Var) {
        super(yv2Var, q4aVar, lyVar, c28Var, g93Var, z, n98Var, e41Var, jkcVar, false, false, false, false, false);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
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
        if (n98Var == null) {
            f0(4);
            throw null;
        }
        if (jkcVar == null) {
            f0(5);
            throw null;
        }
        if (e41Var == null) {
            f0(6);
            throw null;
        }
        this.B = z2;
        this.C = f09Var;
    }

    public static j96 G0(yv2 yv2Var, as6 as6Var, c28 c28Var, g93 g93Var, boolean z, n98 n98Var, wmb wmbVar, boolean z2) {
        if (yv2Var == null) {
            f0(7);
            throw null;
        }
        if (c28Var == null) {
            f0(9);
            throw null;
        }
        if (n98Var != null) {
            return new j96(yv2Var, as6Var, c28Var, g93Var, z, n98Var, wmbVar, null, e41.DECLARATION, z2, null);
        }
        f0(11);
        throw null;
    }

    @Override // defpackage.r4a
    public final r4a A0(yv2 yv2Var, c28 c28Var, g93 g93Var, q4a q4aVar, e41 e41Var, n98 n98Var) {
        if (yv2Var == null) {
            f0(13);
            throw null;
        }
        if (c28Var == null) {
            f0(14);
            throw null;
        }
        if (g93Var == null) {
            f0(15);
            throw null;
        }
        if (e41Var == null) {
            f0(16);
            throw null;
        }
        if (n98Var == null) {
            f0(17);
            throw null;
        }
        return new j96(yv2Var, getAnnotations(), c28Var, g93Var, this.g, n98Var, jkc.g0, q4aVar, e41Var, this.B, this.C);
    }

    @Override // defpackage.r4a
    public final void E0(mn6 mn6Var) {
    }

    @Override // defpackage.r4a, defpackage.c41
    public final Object m(v93 v93Var) {
        f09 f09Var = this.C;
        if (f09Var == null || !((v93) f09Var.a).equals(v93Var)) {
            return null;
        }
        return f09Var.b;
    }

    @Override // defpackage.r4a, defpackage.nqe
    public final boolean p() {
        mn6 type = getType();
        if (!this.B) {
            return false;
        }
        type.getClass();
        if (((!vm6.F(type) && !v2e.a(type)) || nxd.e(type)) && !vm6.G(type)) {
            return false;
        }
        ny nyVar = iwd.a;
        y05 y05Var = de6.p;
        y05Var.getClass();
        return !k40.i0(type, y05Var) || vm6.G(type);
    }

    @Override // defpackage.oqe, defpackage.c41
    public final boolean u() {
        return false;
    }

    @Override // defpackage.q86
    public final q86 x(mn6 mn6Var, ArrayList arrayList, mn6 mn6Var2, f09 f09Var) {
        mn6 mn6Var3;
        s4a s4aVar;
        x4a x4aVar;
        q4a q4aVarX0 = x0() == this ? null : x0();
        j96 j96Var = new j96(h(), getAnnotations(), o(), getVisibility(), this.g, getName(), d(), q4aVarX0, j(), this.B, f09Var);
        s4a s4aVar2 = this.x;
        if (s4aVar2 != null) {
            s4a s4aVar3 = new s4a(j96Var, s4aVar2.getAnnotations(), s4aVar2.o(), s4aVar2.getVisibility(), s4aVar2.f, s4aVar2.g, s4aVar2.j, j(), q4aVarX0 == null ? null : q4aVarX0.b(), s4aVar2.d());
            s4aVar3.m = s4aVar2.m;
            mn6Var3 = mn6Var2;
            s4aVar3.n = mn6Var3;
            s4aVar = s4aVar3;
        } else {
            mn6Var3 = mn6Var2;
            s4aVar = null;
        }
        x4a x4aVar2 = this.y;
        if (x4aVar2 != null) {
            x4aVar = new x4a(j96Var, x4aVar2.getAnnotations(), x4aVar2.o(), x4aVar2.getVisibility(), x4aVar2.f, x4aVar2.g, x4aVar2.j, j(), q4aVarX0 == null ? null : q4aVarX0.c(), x4aVar2.d());
            x4aVar.m = x4aVar.m;
            lqe lqeVar = (lqe) x4aVar2.I().get(0);
            if (lqeVar == null) {
                x4a.f0(6);
                throw null;
            }
            x4aVar.n = lqeVar;
        } else {
            x4aVar = null;
        }
        j96Var.C0(s4aVar, x4aVar, this.z, this.A);
        m45 m45Var = this.i;
        if (m45Var != null) {
            j96Var.D0(this.h, m45Var);
        }
        j96Var.Z(i());
        j96Var.F0(mn6Var3, getTypeParameters(), this.u, mn6Var != null ? kng.s(this, mn6Var, cd7.e) : null, ey3.a);
        return j96Var;
    }

    public static /* synthetic */ void f0(int i) {
        String str = i != 21 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
        Object[] objArr = new Object[i != 21 ? 3 : 2];
        switch (i) {
            case 1:
            case 8:
                objArr[0] = "annotations";
                break;
            case 2:
            case 9:
                objArr[0] = peNPu.nxTSrMuIdptp;
                break;
            case 3:
            case 10:
                objArr[0] = "visibility";
                break;
            case 4:
            case 11:
                objArr[0] = "name";
                break;
            case 5:
            case 12:
            case 18:
                objArr[0] = "source";
                break;
            case 6:
            case 16:
                objArr[0] = "kind";
                break;
            case 7:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 13:
                objArr[0] = "newOwner";
                break;
            case 14:
                objArr[0] = "newModality";
                break;
            case 15:
                objArr[0] = "newVisibility";
                break;
            case 17:
                objArr[0] = "newName";
                break;
            case 19:
                objArr[0] = "enhancedValueParameterTypes";
                break;
            case 20:
                objArr[0] = "enhancedReturnType";
                break;
            case 21:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaPropertyDescriptor";
                break;
            case 22:
                objArr[0] = "inType";
                break;
        }
        if (i != 21) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaPropertyDescriptor";
        } else {
            objArr[1] = "enhance";
        }
        switch (i) {
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
                objArr[2] = "create";
                break;
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
                objArr[2] = "createSubstitutedCopy";
                break;
            case 19:
            case 20:
                objArr[2] = "enhance";
                break;
            case 21:
                break;
            case 22:
                objArr[2] = "setInType";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i == 21) {
            throw new IllegalStateException(str2);
        }
    }
}
