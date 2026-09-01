package defpackage;

import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nr9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nr9(int i, n92 n92Var, sw9 sw9Var) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        sw9 sw9Var = this.d;
        switch (i) {
            case 0:
                return new nr9(0, n92Var, sw9Var);
            case 1:
                return new nr9(1, n92Var, sw9Var);
            case 2:
                return new nr9(2, n92Var, sw9Var);
            case 3:
                return new nr9(3, n92Var, sw9Var);
            case 4:
                return new nr9(4, n92Var, sw9Var);
            case 5:
                return new nr9(5, n92Var, sw9Var);
            case 6:
                return new nr9(6, n92Var, sw9Var);
            case 7:
                return new nr9(7, n92Var, sw9Var);
            case 8:
                return new nr9(8, n92Var, sw9Var);
            case 9:
                return new nr9(9, n92Var, sw9Var);
            case 10:
                return new nr9(10, n92Var, sw9Var);
            default:
                return new nr9(11, n92Var, sw9Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((nr9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        sw9 sw9Var = this.d;
        Object obj2 = c1e.a;
        int i2 = 1;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    zg7 zg7Var = sw9Var.n0;
                    String serverId = nl4.ENABLE_POST_PAGE_COMPOSE.getServerId();
                    this.c = 1;
                    return zg7Var.p0(serverId, this) == tb2Var ? tb2Var : obj2;
                }
                if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj3 = ((bjb) obj).a;
                return obj2;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (sw9Var.u.a() != null) {
                    return obj2;
                }
                pz2 pz2Var = sw9Var.j0;
                String str = sw9Var.d;
                String str2 = sw9Var.F0;
                String str3 = sw9Var.D0;
                this.c = 1;
                return km4.K(pz2Var, str, str2, str3, null, this, 8) == tb2Var2 ? tb2Var2 : obj2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    og3 og3Var = sw9Var.Y;
                    UserDismissableFlags userDismissableFlags = UserDismissableFlags.POST_PAGE_REPOST_TOOLTIP;
                    this.c = 1;
                    return og3Var.c(userDismissableFlags, this) == tb2Var3 ? tb2Var3 : obj2;
                }
                if (i5 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj4 = ((bjb) obj).a;
                return obj2;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    r6c r6cVar = sw9Var.B0;
                    this.c = 1;
                    return r6cVar.a(ur9.a, this) == tb2Var4 ? tb2Var4 : obj2;
                }
                if (i6 == 1) {
                    br7.v(obj);
                    return obj2;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 4:
                xpc xpcVar = sw9Var.z0;
                Object obj5 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (!(xpcVar.getValue() instanceof or9)) {
                    return obj2;
                }
                this.c = 1;
                xpcVar.a(null, this);
                return obj2 == obj5 ? obj5 : obj2;
            case 5:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    r6c r6cVar2 = sw9Var.x0;
                    mt9 mt9Var = new mt9(sw9Var.F0);
                    this.c = 1;
                    if (r6cVar2.a(mt9Var, this) != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i8 != 1) {
                    if (i8 != 2) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    Object obj6 = ((bjb) obj).a;
                    return obj2;
                }
                br7.v(obj);
                og3 og3Var2 = sw9Var.Y;
                UserDismissableFlags userDismissableFlags2 = UserDismissableFlags.POST_PAGE_FIRST_REPOST_TOAST;
                this.c = 2;
                if (og3Var2.c(userDismissableFlags2, this) != tb2Var5) {
                    return obj2;
                }
                return tb2Var5;
            case 6:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    og3 og3Var3 = sw9Var.Y;
                    UserDismissableFlags userDismissableFlags3 = UserDismissableFlags.POST_PAGE_FIRST_REPOST_TOAST;
                    this.c = 1;
                    return og3Var3.c(userDismissableFlags3, this) == tb2Var6 ? tb2Var6 : obj2;
                }
                if (i9 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj7 = ((bjb) obj).a;
                return obj2;
            case 7:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = sw9Var.x0;
                eu9 eu9Var = new eu9(R.string.post_page_cannot_repost_own_story_snackbar, bhc.Long);
                this.c = 1;
                return r6cVar3.a(eu9Var, this) == tb2Var7 ? tb2Var7 : obj2;
            case 8:
                xpc xpcVar2 = sw9Var.z0;
                Object obj8 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                if (i11 != 0) {
                    if (i11 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (!(xpcVar2.getValue() instanceof pr9)) {
                    return obj2;
                }
                this.c = 1;
                xpcVar2.a(null, this);
                return obj2 == obj8 ? obj8 : obj2;
            case 9:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 != 0) {
                    if (i12 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar4 = sw9Var.x0;
                eu9 eu9Var2 = new eu9(R.string.post_page_repost_disabled_by_writer_snackbar, bhc.Long);
                this.c = 1;
                return r6cVar4.a(eu9Var2, this) == tb2Var8 ? tb2Var8 : obj2;
            case 10:
                xpc xpcVar3 = sw9Var.z0;
                Object obj9 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (!(xpcVar3.getValue() instanceof qr9)) {
                    return obj2;
                }
                this.c = 1;
                xpcVar3.a(null, this);
                return obj2 == obj9 ? obj9 : obj2;
            default:
                Object obj10 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                if (i14 != 0) {
                    if (i14 == 1) {
                        br7.v(obj);
                        return obj2;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                nec necVar = sw9Var.M;
                String id = sw9Var.b.getId();
                necVar.getClass();
                id.getClass();
                r6c r6cVar5 = ((gn9) necVar.b).d;
                uu9 uu9Var = new uu9(sw9Var, i2);
                this.c = 1;
                Object objM = r6c.m(r6cVar5, new gi1(uu9Var, id, 1), this);
                if (objM != tb2.COROUTINE_SUSPENDED) {
                    objM = obj2;
                }
                return objM == obj10 ? obj10 : obj2;
        }
    }
}
