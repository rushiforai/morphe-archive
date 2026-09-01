package defpackage;

import com.medium.android.donkey.launcher.LauncherActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class go6 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ LauncherActivity d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ go6(LauncherActivity launcherActivity, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = launcherActivity;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        LauncherActivity launcherActivity = this.d;
        switch (i) {
            case 0:
                return new go6(launcherActivity, n92Var, 0);
            default:
                return new go6(launcherActivity, n92Var, 1);
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
        return ((go6) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        LauncherActivity launcherActivity = this.d;
        n92 n92Var = null;
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
                int i3 = LauncherActivity.t;
                uua uuaVar = ((to6) launcherActivity.s.getValue()).i;
                ob0 ob0Var = new ob0(3, launcherActivity);
                this.c = 1;
                return uuaVar.a.b(ob0Var, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
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
                vx6 vx6Var = vx6.CREATED;
                go6 go6Var = new go6(launcherActivity, n92Var, 0);
                this.c = 1;
                return gq7.Q(launcherActivity, vx6Var, go6Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
