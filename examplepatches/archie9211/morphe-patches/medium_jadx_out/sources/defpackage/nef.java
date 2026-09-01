package defpackage;

import com.medium.android.yourfollowingfeed.ui.FollowedType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nef extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ ref f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nef(int i, n92 n92Var, ref refVar) {
        super(3, n92Var);
        this.b = i;
        this.f = refVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ref refVar = this.f;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                nef nefVar = new nef(0, n92Var, refVar);
                nefVar.d = do4Var;
                nefVar.e = obj2;
                return nefVar.invokeSuspend(c1eVar);
            case 1:
                nef nefVar2 = new nef(1, n92Var, refVar);
                nefVar2.d = do4Var;
                nefVar2.e = obj2;
                return nefVar2.invokeSuspend(c1eVar);
            case 2:
                nef nefVar3 = new nef(2, n92Var, refVar);
                nefVar3.d = do4Var;
                nefVar3.e = obj2;
                return nefVar3.invokeSuspend(c1eVar);
            default:
                nef nefVar4 = new nef(3, n92Var, refVar);
                nefVar4.d = do4Var;
                nefVar4.e = obj2;
                return nefVar4.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        to4 to4Var;
        bo4 bo4Var;
        bo4 bo4Var2;
        int i = this.b;
        int i2 = 13;
        c1e c1eVar = c1e.a;
        ref refVar = this.f;
        int i3 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                Object obj2 = this.e;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    d04 d04Var = (d04) obj2;
                    int i5 = 0;
                    n92 n92Var2 = null;
                    if (d04Var == null) {
                        dp5 dp5Var = refVar.j;
                        k13 k13Var = new k13(5, null, refVar);
                        dp5Var.getClass();
                        to4Var = new to4(dp5Var.b.Q(new kg(dp5Var, k13Var, n92Var2, i2)), new cef(i5, n92Var2, refVar), 3);
                    } else if (d04Var instanceof b04) {
                        String str = ((b04) d04Var).a;
                        zv4 zv4Var = refVar.e;
                        def defVar = new def(0, null, refVar, str);
                        zv4Var.getClass();
                        str.getClass();
                        to4Var = new to4(zv4Var.b.Q(new yj2(zv4Var, str, defVar, n92Var2, 1)), new eef(i5, n92Var2, refVar, str), 3);
                    } else if (d04Var instanceof c04) {
                        String str2 = ((c04) d04Var).a;
                        iw4 iw4Var = refVar.i;
                        def defVar2 = new def(1, null, refVar, str2);
                        iw4Var.getClass();
                        str2.getClass();
                        to4Var = new to4(iw4Var.b.Q(new yj2(iw4Var, str2, defVar2, n92Var2, 3)), new eef(i3, n92Var2, refVar, str2), 3);
                    } else {
                        ygf.a();
                    }
                    this.d = null;
                    this.e = null;
                    this.c = 1;
                    return wgf.l(do4Var, to4Var, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 1:
                do4 do4Var2 = this.d;
                Object obj3 = this.e;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
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
                String str3 = (String) obj3;
                bo4 bo4VarB = str3 != null ? ip4.b(refVar.v, new gd1(n92Var, refVar, str3, i2)) : new u50(7, pz8.a);
                this.d = null;
                this.e = null;
                this.c = 1;
                return wgf.l(do4Var2, bo4VarB, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                do4 do4Var3 = this.d;
                Object obj4 = this.e;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    int i8 = bef.b[((FollowedType) obj4).ordinal()];
                    if (i8 == 1) {
                        bo4Var = refVar.A;
                    } else if (i8 == 2) {
                        bo4Var = refVar.B;
                    } else {
                        ygf.a();
                    }
                    this.d = null;
                    this.e = null;
                    this.c = 1;
                    return wgf.l(do4Var3, bo4Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i7 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                do4 do4Var4 = this.d;
                Object obj5 = this.e;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    int i10 = bef.b[((FollowedType) obj5).ordinal()];
                    if (i10 == 1) {
                        bo4Var2 = refVar.y;
                    } else if (i10 == 2) {
                        bo4Var2 = refVar.z;
                    } else {
                        ygf.a();
                    }
                    this.d = null;
                    this.e = null;
                    this.c = 1;
                    return wgf.l(do4Var4, bo4Var2, this) == tb2Var4 ? tb2Var4 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
