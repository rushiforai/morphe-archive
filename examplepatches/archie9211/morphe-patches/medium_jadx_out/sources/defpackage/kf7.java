package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kf7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sg7 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kf7(sg7 sg7Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sg7Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        sg7 sg7Var = this.d;
        switch (i) {
            case 0:
                return new kf7(sg7Var, n92Var, 0);
            case 1:
                return new kf7(sg7Var, n92Var, 1);
            case 2:
                return new kf7(sg7Var, n92Var, 2);
            case 3:
                return new kf7(sg7Var, n92Var, 3);
            case 4:
                return new kf7(sg7Var, n92Var, 4);
            case 5:
                return new kf7(sg7Var, n92Var, 5);
            case 6:
                return new kf7(sg7Var, n92Var, 6);
            default:
                return new kf7(sg7Var, n92Var, 7);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((kf7) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objY0;
        int i = this.b;
        int i2 = 2;
        int i3 = 3;
        int i4 = 4;
        int i5 = 0;
        sg7 sg7Var = this.d;
        c1e c1eVar = c1e.a;
        char c = 1;
        char c2 = 1;
        char c3 = 1;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                bo4 bo4VarJ = m40.J(new w23(bo.A(((y23) sg7Var.c).o), c == true ? 1 : 0));
                if7 if7Var = new if7(sg7Var, i5);
                this.c = 1;
                return bo4VarJ.b(if7Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                pu7 pu7Var = sg7Var.b;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    hx4 hx4Var = sg7Var.g;
                    this.c = 1;
                    objY0 = hx4Var.Y0(this);
                    if (objY0 != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i7 != 1) {
                    if (i7 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    if (i7 != 3) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    Object obj2 = ((bjb) obj).a;
                    return c1eVar;
                }
                br7.v(obj);
                objY0 = obj;
                rj2 rj2Var = (rj2) objY0;
                if (rj2Var == null) {
                    return c1eVar;
                }
                Long l = rj2Var.r;
                long jLongValue = l != null ? l.longValue() : System.currentTimeMillis();
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(jLongValue);
                calendar.add(6, 4);
                if (!Calendar.getInstance().after(calendar)) {
                    return c1eVar;
                }
                pu7Var.getClass();
                ek6 ek6Var = ek6.HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG;
                if (pu7Var.s(ek6Var) == null) {
                    pu7Var.z(ek6Var, pu7Var.l(ek6.LAST_CONTACTS_SHARED_AT, 0L) != 0);
                }
                if (!pu7Var.j(ek6Var, false)) {
                    xpc xpcVar = sg7Var.x;
                    lf7 lf7Var = new lf7(sg7Var.B);
                    this.c = 2;
                    xpcVar.a(lf7Var, this);
                    if (c1eVar != tb2Var2) {
                        return c1eVar;
                    }
                } else {
                    if (pu7Var.l(ek6.LAST_CONTACTS_SHARED_AT, 0L) <= 0) {
                        return c1eVar;
                    }
                    o2b o2bVar = sg7Var.r;
                    this.c = 3;
                    if (o2bVar.v(this) != tb2Var2) {
                        return c1eVar;
                    }
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    r6c r6cVar = sg7Var.u;
                    this.c = 1;
                    return r6cVar.a(tf7.a, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i8 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    cr0 cr0Var = sg7Var.p;
                    this.c = 1;
                    return ((xx2) cr0Var).i(this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                pu7 pu7Var2 = sg7Var.b;
                pu7Var2.getClass();
                zz zzVar = new zz(new og7(new zz(pu7Var2.J(ek6.ADD_TO_LIST_USES_COUNT, 0), 5), i5), 6);
                if7 if7Var2 = new if7(sg7Var, c2 == true ? 1 : 0);
                this.c = 1;
                return zzVar.b(if7Var2, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                pu7 pu7Var3 = sg7Var.b;
                pu7Var3.getClass();
                zz zzVar2 = new zz(new og7(new zz(pu7Var3.J(ek6.FOLLOW_CLICKS_COUNT, 0), 5), c3 == true ? 1 : 0), 6);
                if7 if7Var3 = new if7(sg7Var, i2);
                this.c = 1;
                return zzVar2.b(if7Var3, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                bo4 bo4VarJ2 = m40.J(new sp4(mya.w(sg7Var.d, null, 7), sg7Var.e.k(UserDismissableFlags.MOBILE_PREMIUM_TIER_EDUCATIONAL_DIALOG), new gd1(sg7Var, null), i5));
                if7 if7Var4 = new if7(sg7Var, i3);
                this.c = 1;
                Object objB = bo4VarJ2.b(new yh(if7Var4, 29), this);
                if (objB != tb2Var7) {
                    objB = c1eVar;
                }
                return objB == tb2Var7 ? tb2Var7 : c1eVar;
            default:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                bo4 bo4VarJ3 = m40.J(new zh(mya.w(sg7Var.d, null, 7), 12));
                if7 if7Var5 = new if7(sg7Var, i4);
                this.c = 1;
                Object objB2 = bo4VarJ3.b(new wv4(if7Var5, 11), this);
                if (objB2 != tb2Var8) {
                    objB2 = c1eVar;
                }
                return objB2 == tb2Var8 ? tb2Var8 : c1eVar;
        }
    }
}
