package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.explore.ui.vAWg.OphtYB;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yq6 extends zv2 implements r39 {
    public final /* synthetic */ int d = 0;
    public final yv2 e;
    public final iwa f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yq6(yv2 yv2Var, b2 b2Var, ly lyVar, n98 n98Var) {
        super(lyVar, n98Var);
        if (yv2Var == null) {
            f0(3);
            throw null;
        }
        if (lyVar == null) {
            f0(5);
            throw null;
        }
        if (n98Var == null) {
            f0(6);
            throw null;
        }
        this.e = yv2Var;
        this.f = b2Var;
    }

    public static /* synthetic */ void x0(int i) {
        String str;
        int i2;
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                str = "@NotNull method %s.%s must not return null";
                break;
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                i2 = 2;
                break;
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 2:
                objArr[0] = "name";
                break;
            case 3:
                objArr[0] = "substitutor";
                break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractReceiverParameterDescriptor";
                break;
            default:
                objArr[0] = "annotations";
                break;
        }
        switch (i) {
            case 4:
                objArr[1] = "getContextReceiverParameters";
                break;
            case 5:
                objArr[1] = "getTypeParameters";
                break;
            case 6:
                objArr[1] = "getType";
                break;
            case 7:
                objArr[1] = "getValueParameters";
                break;
            case 8:
                objArr[1] = "getOverriddenDescriptors";
                break;
            case 9:
                objArr[1] = "getVisibility";
                break;
            case 10:
                objArr[1] = "getOriginal";
                break;
            case 11:
                objArr[1] = "getSource";
                break;
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractReceiverParameterDescriptor";
                break;
        }
        switch (i) {
            case 3:
                objArr[2] = "substitute";
                break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                throw new IllegalStateException(str2);
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.r(this, obj);
    }

    @Override // defpackage.c41
    public final List I() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        x0(7);
        throw null;
    }

    @Override // defpackage.c41
    public final yq6 M() {
        return null;
    }

    @Override // defpackage.c41
    public final yq6 P() {
        return null;
    }

    @Override // defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final c41 x0() {
        return this;
    }

    @Override // defpackage.aw2
    public final jkc d() {
        return jkc.g0;
    }

    @Override // defpackage.c41
    public final mn6 getReturnType() {
        return getType();
    }

    @Override // defpackage.b2, defpackage.iwa
    public final mn6 getType() {
        mn6 type = y0().getType();
        if (type != null) {
            return type;
        }
        x0(6);
        throw null;
    }

    @Override // defpackage.c41
    public final List getTypeParameters() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        x0(5);
        throw null;
    }

    @Override // defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = h93.f;
        if (g93Var != null) {
            return g93Var;
        }
        x0(9);
        throw null;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        int i = this.d;
        yv2 yv2Var = this.e;
        switch (i) {
            case 0:
                return (y28) yv2Var;
            default:
                if (yv2Var != null) {
                    return yv2Var;
                }
                f0(8);
                throw null;
        }
    }

    @Override // defpackage.c41
    public final Collection i() {
        Set set = Collections.EMPTY_SET;
        if (set != null) {
            return set;
        }
        x0(8);
        throw null;
    }

    @Override // defpackage.zv2, defpackage.b2
    public String toString() {
        switch (this.d) {
            case 0:
                return "class " + ((y28) this.e).getName() + "::this";
            default:
                return super.toString();
        }
    }

    @Override // defpackage.c41
    public final boolean u() {
        return false;
    }

    public final iwa y0() {
        int i = this.d;
        iwa iwaVar = this.f;
        switch (i) {
            case 0:
                return (bz5) iwaVar;
            default:
                b2 b2Var = (b2) iwaVar;
                if (b2Var != null) {
                    return b2Var;
                }
                f0(7);
                throw null;
        }
    }

    @Override // defpackage.s0d
    /* JADX INFO: renamed from: z0, reason: merged with bridge method [inline-methods] */
    public final yq6 f(ixd ixdVar) {
        if (ixdVar == null) {
            x0(3);
            throw null;
        }
        if (!ixdVar.a.e()) {
            mn6 mn6VarH = h() instanceof y28 ? ixdVar.h(getType(), pqe.OUT_VARIANCE) : ixdVar.h(getType(), pqe.INVARIANT);
            if (mn6VarH == null) {
                return null;
            }
            if (mn6VarH != getType()) {
                return new yq6(h(), new trd(mn6VarH), getAnnotations());
            }
        }
        return this;
    }

    public static /* synthetic */ void f0(int i) {
        String str = (i == 7 || i == 8) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 7 || i == 8) ? 2 : 3];
        switch (i) {
            case 1:
            case 4:
                objArr[0] = "value";
                break;
            case 2:
            case 5:
                objArr[0] = "annotations";
                break;
            case 3:
            default:
                objArr[0] = "containingDeclaration";
                break;
            case 6:
                objArr[0] = "name";
                break;
            case 7:
            case 8:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/ReceiverParameterDescriptorImpl";
                break;
            case 9:
                objArr[0] = "newOwner";
                break;
            case 10:
                objArr[0] = "outType";
                break;
        }
        if (i == 7) {
            objArr[1] = "getValue";
        } else if (i != 8) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/ReceiverParameterDescriptorImpl";
        } else {
            objArr[1] = Plbho.qfhbyJzbSPbR;
        }
        switch (i) {
            case 7:
            case 8:
                break;
            case 9:
                objArr[2] = OphtYB.XDizQYVJ;
                break;
            case 10:
                objArr[2] = "setOutType";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 7 && i != 8) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        return this;
    }

    public yq6(y28 y28Var) {
        super(cd7.e, olc.d);
        this.e = y28Var;
        this.f = new bz5(y28Var);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public yq6(yv2 yv2Var, b2 b2Var, ly lyVar) {
        this(yv2Var, b2Var, lyVar, olc.d);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar != null) {
        } else {
            f0(2);
            throw null;
        }
    }
}
