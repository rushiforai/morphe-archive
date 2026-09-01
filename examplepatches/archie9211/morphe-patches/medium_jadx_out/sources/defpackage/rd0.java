package defpackage;

import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rd0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ yd0 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rd0(yd0 yd0Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = yd0Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        yd0 yd0Var = this.d;
        switch (i) {
            case 0:
                return new rd0(yd0Var, n92Var, 0);
            case 1:
                return new rd0(yd0Var, n92Var, 1);
            case 2:
                return new rd0(yd0Var, n92Var, 2);
            case 3:
                return new rd0(yd0Var, n92Var, 3);
            case 4:
                return new rd0(yd0Var, n92Var, 4);
            case 5:
                return new rd0(yd0Var, n92Var, 5);
            default:
                return new rd0(yd0Var, n92Var, 6);
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
        return ((rd0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        yd0 yd0Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = yd0Var.r;
                zc0 zc0Var = new zc0(false);
                this.c = 1;
                return r6cVar.a(zc0Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = yd0Var.r;
                zc0 zc0Var2 = new zc0(true);
                this.c = 1;
                return r6cVar2.a(zc0Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = yd0Var.r;
                zc0 zc0Var3 = new zc0(false);
                this.c = 1;
                return r6cVar3.a(zc0Var3, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
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
                r6c r6cVar4 = yd0Var.r;
                zc0 zc0Var4 = new zc0(true);
                this.c = 1;
                return r6cVar4.a(zc0Var4, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
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
                r6c r6cVar5 = yd0Var.r;
                zc0 zc0Var5 = new zc0(true);
                this.c = 1;
                return r6cVar5.a(zc0Var5, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                oo1 oo1Var = yd0Var.g;
                oo1Var.getClass();
                km4.I(wld.a, null, "Clearing remember me token (rid)", new Object[0], "Clearing remember me token (rid)");
                u3 u3Var = oo1Var.a.b;
                ReentrantLock reentrantLock = u3Var.d;
                reentrantLock.lock();
                try {
                    u3Var.b.e(ek6.RID_COOKIE);
                    reentrantLock.unlock();
                    r6c r6cVar6 = yd0Var.r;
                    this.c = 1;
                    return r6cVar6.a(bd0.a, this) == tb2Var6 ? tb2Var6 : c1eVar;
                } catch (Throwable th) {
                    reentrantLock.unlock();
                    throw th;
                }
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
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
                r6c r6cVar7 = yd0Var.r;
                zc0 zc0Var6 = new zc0(true);
                this.c = 1;
                return r6cVar7.a(zc0Var6, this) == tb2Var7 ? tb2Var7 : c1eVar;
        }
    }
}
