package defpackage;

import com.medium.android.donkey.main.MainActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class af7 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ MainActivity d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ af7(MainActivity mainActivity, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mainActivity;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        MainActivity mainActivity = this.d;
        switch (i) {
            case 0:
                return new af7(mainActivity, n92Var, 0);
            case 1:
                return new af7(mainActivity, n92Var, 1);
            case 2:
                return new af7(mainActivity, n92Var, 2);
            case 3:
                return new af7(mainActivity, n92Var, 3);
            case 4:
                return new af7(mainActivity, n92Var, 4);
            default:
                return new af7(mainActivity, n92Var, 5);
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
        return ((af7) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        int i2 = 0;
        c1e c1eVar = c1e.a;
        MainActivity mainActivity = this.d;
        int i3 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
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
                int i5 = MainActivity.H;
                wua wuaVar = mainActivity.v().D;
                ze7 ze7Var = new ze7(mainActivity, i2);
                this.c = 1;
                return wuaVar.a.b(ze7Var, this) == tb2Var ? tb2Var : c1eVar;
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
                af7 af7Var = new af7(mainActivity, n92Var, i2);
                this.c = 1;
                return gq7.Q(mainActivity, vx6Var, af7Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
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
                int i8 = MainActivity.H;
                xwc xwcVar = mainActivity.v().w;
                ob0 ob0Var = new ob0(6, mainActivity);
                this.c = 1;
                return xwcVar.b(ob0Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
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
                vx6 vx6Var2 = vx6.STARTED;
                af7 af7Var2 = new af7(mainActivity, n92Var, 2);
                this.c = 1;
                return gq7.Q(mainActivity, vx6Var2, af7Var2, this) == tb2Var4 ? tb2Var4 : c1eVar;
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
                int i11 = MainActivity.H;
                w62 w62Var = mainActivity.v().L;
                ze7 ze7Var2 = new ze7(mainActivity, i3);
                this.c = 1;
                return w62Var.b(ze7Var2, this) == tb2Var5 ? tb2Var5 : c1eVar;
            default:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
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
                vx6 vx6Var3 = vx6.STARTED;
                af7 af7Var3 = new af7(mainActivity, n92Var, 4);
                this.c = 1;
                return gq7.Q(mainActivity, vx6Var3, af7Var3, this) == tb2Var6 ? tb2Var6 : c1eVar;
        }
    }
}
