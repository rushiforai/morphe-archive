package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ch9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ PostFragment d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ch9(PostFragment postFragment, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = postFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        PostFragment postFragment = this.d;
        switch (i) {
            case 0:
                return new ch9(postFragment, n92Var, 0);
            case 1:
                return new ch9(postFragment, n92Var, 1);
            case 2:
                return new ch9(postFragment, n92Var, 2);
            case 3:
                return new ch9(postFragment, n92Var, 3);
            case 4:
                return new ch9(postFragment, n92Var, 4);
            case 5:
                return new ch9(postFragment, n92Var, 5);
            case 6:
                return new ch9(postFragment, n92Var, 6);
            default:
                return new ch9(postFragment, n92Var, 7);
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
        return ((ch9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 0;
        int i3 = 2;
        c1e c1eVar = c1e.a;
        PostFragment postFragment = this.d;
        int i4 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                zz zzVar = postFragment.k1().Y0;
                bh9 bh9Var = new bh9(postFragment, i2);
                this.c = 1;
                return zzVar.b(bh9Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
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
                vx6 vx6Var = vx6.STARTED;
                ch9 ch9Var = new ch9(postFragment, n92Var, i2);
                this.c = 1;
                return gq7.Q(postFragment, vx6Var, ch9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    wua wuaVar = postFragment.k1().M0;
                    ob0 ob0Var = new ob0(7, postFragment);
                    this.c = 1;
                    if (wuaVar.a.b(ob0Var, this) == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i7 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                vx6 vx6Var2 = vx6.STARTED;
                ch9 ch9Var2 = new ch9(postFragment, n92Var, i3);
                this.c = 1;
                return gq7.Q(postFragment, vx6Var2, ch9Var2, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 != 0) {
                    if (i9 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                zz zzVar2 = postFragment.k1().W0;
                bh9 bh9Var2 = new bh9(postFragment, i4);
                this.c = 1;
                return zzVar2.b(bh9Var2, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
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
                vx6 vx6Var3 = vx6.STARTED;
                ch9 ch9Var3 = new ch9(postFragment, n92Var, 4);
                this.c = 1;
                return gq7.Q(postFragment, vx6Var3, ch9Var3, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
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
                zz zzVar3 = postFragment.k1().X0;
                bh9 bh9Var3 = new bh9(postFragment, i3);
                this.c = 1;
                return zzVar3.b(bh9Var3, this) == tb2Var7 ? tb2Var7 : c1eVar;
            default:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
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
                vx6 vx6Var4 = vx6.STARTED;
                ch9 ch9Var4 = new ch9(postFragment, n92Var, 6);
                this.c = 1;
                return gq7.Q(postFragment, vx6Var4, ch9Var4, this) == tb2Var8 ? tb2Var8 : c1eVar;
        }
    }
}
