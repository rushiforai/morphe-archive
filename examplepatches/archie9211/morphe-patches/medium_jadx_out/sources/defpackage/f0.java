package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class f0 extends y28 {
    public final n98 a;
    public final u67 b;
    public final u67 c;
    public final u67 d;

    public f0(x67 x67Var, n98 n98Var) {
        int i = 0;
        if (x67Var == null) {
            u0(0);
            throw null;
        }
        int i2 = 1;
        if (n98Var == null) {
            u0(1);
            throw null;
        }
        this.a = n98Var;
        this.b = new u67(x67Var, new e0(this, i));
        this.c = new u67(x67Var, new e0(this, i2));
        this.d = new u67(x67Var, new e0(this, 2));
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.Q(this, obj);
    }

    @Override // defpackage.y28, defpackage.co1
    public final hec T() {
        hec hecVar = (hec) this.b.invoke();
        if (hecVar != null) {
            return hecVar;
        }
        u0(20);
        throw null;
    }

    @Override // defpackage.y28, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final co1 x0() {
        return this;
    }

    @Override // defpackage.y28
    public List a0() {
        List list = Collections.EMPTY_LIST;
        if (list != null) {
            return list;
        }
        u0(6);
        throw null;
    }

    @Override // defpackage.y28
    public final ev7 f0(exd exdVar) {
        f93.h(d93.d(this));
        ev7 ev7VarH0 = h0(exdVar, sn6.a);
        if (ev7VarH0 != null) {
            return ev7VarH0;
        }
        u0(16);
        throw null;
    }

    @Override // defpackage.yv2
    public final n98 getName() {
        n98 n98Var = this.a;
        if (n98Var != null) {
            return n98Var;
        }
        u0(2);
        throw null;
    }

    @Override // defpackage.y28
    public ev7 h0(exd exdVar, sn6 sn6Var) {
        if (!exdVar.e()) {
            return new t0d(n0(sn6Var), new ixd(exdVar));
        }
        ev7 ev7VarN0 = n0(sn6Var);
        if (ev7VarN0 != null) {
            return ev7VarN0;
        }
        u0(12);
        throw null;
    }

    @Override // defpackage.y28
    /* JADX INFO: renamed from: i0 */
    public final y28 x0() {
        return this;
    }

    @Override // defpackage.y28
    public final yq6 k0() {
        yq6 yq6Var = (yq6) this.d.invoke();
        if (yq6Var != null) {
            return yq6Var;
        }
        u0(5);
        throw null;
    }

    @Override // defpackage.y28
    public ev7 l0() {
        ev7 ev7Var = (ev7) this.c.invoke();
        if (ev7Var != null) {
            return ev7Var;
        }
        u0(4);
        throw null;
    }

    @Override // defpackage.y28
    public ev7 m0() {
        f93.h(d93.d(this));
        ev7 ev7VarN0 = n0(sn6.a);
        if (ev7VarN0 != null) {
            return ev7VarN0;
        }
        u0(17);
        throw null;
    }

    @Override // defpackage.s0d
    /* JADX INFO: renamed from: v0, reason: merged with bridge method [inline-methods] */
    public y28 f(ixd ixdVar) {
        if (ixdVar != null) {
            return ixdVar.a.e() ? this : new xw6(this, ixdVar);
        }
        u0(18);
        throw null;
    }

    public static /* synthetic */ void u0(int i) {
        String str = (i == 2 || i == 3 || i == 4 || i == 5 || i == 6 || i == 9 || i == 12 || i == 14 || i == 16 || i == 17 || i == 19 || i == 20) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 2 || i == 3 || i == 4 || i == 5 || i == 6 || i == 9 || i == 12 || i == 14 || i == 16 || i == 17 || i == 19 || i == 20) ? 2 : 3];
        switch (i) {
            case 1:
                objArr[0] = "name";
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            case 17:
            case 19:
            case 20:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractClassDescriptor";
                break;
            case 7:
            case 13:
                objArr[0] = "typeArguments";
                break;
            case 8:
            case 11:
                objArr[0] = "kotlinTypeRefiner";
                break;
            case 10:
            case 15:
                objArr[0] = "typeSubstitution";
                break;
            case 18:
                objArr[0] = "substitutor";
                break;
            default:
                objArr[0] = "storageManager";
                break;
        }
        if (i == 2) {
            objArr[1] = "getName";
        } else if (i == 3) {
            objArr[1] = "getOriginal";
        } else if (i == 4) {
            objArr[1] = nGxjfIr.NDbnQmi;
        } else if (i == 5) {
            objArr[1] = "getThisAsReceiverParameter";
        } else if (i == 6) {
            objArr[1] = "getContextReceivers";
        } else if (i == 9 || i == 12 || i == 14 || i == 16) {
            objArr[1] = "getMemberScope";
        } else if (i == 17) {
            objArr[1] = "getUnsubstitutedMemberScope";
        } else if (i == 19) {
            objArr[1] = "substitute";
        } else if (i != 20) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/AbstractClassDescriptor";
        } else {
            objArr[1] = "getDefaultType";
        }
        switch (i) {
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 9:
            case 12:
            case 14:
            case 16:
            case 17:
            case 19:
            case 20:
                break;
            case 7:
            case 8:
            case 10:
            case 11:
            case 13:
            case 15:
                objArr[2] = "getMemberScope";
                break;
            case 18:
                objArr[2] = "substitute";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 2 && i != 3 && i != 4 && i != 5 && i != 6 && i != 9 && i != 12 && i != 14 && i != 16 && i != 17 && i != 19 && i != 20) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @Override // defpackage.y28, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public final yv2 x0() {
        return this;
    }
}
