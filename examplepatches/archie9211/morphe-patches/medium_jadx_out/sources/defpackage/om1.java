package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class om1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;
    public /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public om1(zk2 zk2Var, boolean z, Set set, UserDismissableFlags userDismissableFlags, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.d = zk2Var;
        this.c = z;
        this.e = set;
        this.f = userDismissableFlags;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                om1 om1Var = new om1(this.c, (ou) obj3, (ou) obj2, n92Var);
                om1Var.d = obj;
                return om1Var;
            case 1:
                return new om1((zk2) this.d, this.c, (Set) obj3, (UserDismissableFlags) obj2, n92Var);
            case 2:
                return new om1(this.c, (ki9) this.d, (l78) obj3, (l78) obj2, n92Var, 2);
            case 3:
                return new om1(this.c, (sr4) this.d, (lr4) obj3, (akc) obj2, n92Var, 3);
            default:
                om1 om1Var2 = new om1((l78) this.d, (l78) obj3, (l78) obj2, n92Var);
                om1Var2.c = ((Boolean) obj).booleanValue();
                return om1Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((om1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((om1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 2:
                ((om1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            case 3:
                ((om1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
            default:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                ((om1) create(bool, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 1;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                ou ouVar = (ou) obj2;
                ou ouVar2 = (ou) obj3;
                sb2 sb2Var = (sb2) this.d;
                br7.v(obj);
                int i3 = 0;
                n92 n92Var = null;
                if (!this.c) {
                    vx0.c0(sb2Var, null, null, new nm1(ouVar, ouVar2, n92Var, i3), 3);
                } else {
                    vx0.c0(sb2Var, null, null, new mm1(ouVar2, n92Var, i3), 3);
                    vx0.c0(sb2Var, null, null, new mm1(ouVar, n92Var, i2), 3);
                }
                break;
            case 1:
                UserDismissableFlags userDismissableFlags = (UserDismissableFlags) obj2;
                br7.v(obj);
                Set set = (Set) obj3;
                ((zk2) this.d).c.Q(this.c ? qo7.w(set, userDismissableFlags.name()) : qo7.s(set, userDismissableFlags.name()));
                break;
            case 2:
                boolean z = this.c;
                l78 l78Var = (l78) obj2;
                ki9 ki9Var = (ki9) this.d;
                br7.v(obj);
                l78 l78Var2 = (l78) obj3;
                int i4 = jj9.b;
                if (((Boolean) l78Var2.getValue()).booleanValue() && !z && ki9Var.a() > 0.0f) {
                    l78Var.setValue(Boolean.TRUE);
                }
                if (z) {
                    l78Var.setValue(Boolean.FALSE);
                }
                if (((Boolean) l78Var.getValue()).booleanValue() && ki9Var.a() > 0.0f) {
                    float f = ki9Var.b;
                    if (f > 0.0f) {
                        ki9Var.a.h(f);
                    }
                }
                if (ki9Var.a() <= 0.0f) {
                    l78Var.setValue(Boolean.FALSE);
                }
                l78Var2.setValue(Boolean.valueOf(z));
                break;
            case 3:
                br7.v(obj);
                if (!this.c) {
                    km4.m((lr4) obj3);
                    akc akcVar = (akc) obj2;
                    if (akcVar != null) {
                        ((n43) akcVar).a();
                    }
                } else {
                    sr4.a((sr4) this.d);
                }
                break;
            default:
                br7.v(obj);
                boolean z2 = this.c;
                l78 l78Var3 = (l78) this.d;
                float f2 = p5d.a;
                if (((Boolean) l78Var3.getValue()).booleanValue() != z2) {
                    x45 x45Var = (x45) ((l78) obj3).getValue();
                    if (x45Var != null) {
                        x45Var.invoke(Boolean.valueOf(z2));
                    }
                    ((l78) obj2).setValue(Boolean.valueOf(!((Boolean) r3.getValue()).booleanValue()));
                }
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public om1(l78 l78Var, l78 l78Var2, l78 l78Var3, n92 n92Var) {
        super(2, n92Var);
        this.b = 4;
        this.d = l78Var;
        this.e = l78Var2;
        this.f = l78Var3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public om1(boolean z, ou ouVar, ou ouVar2, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.c = z;
        this.e = ouVar;
        this.f = ouVar2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ om1(boolean z, Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = z;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
    }
}
