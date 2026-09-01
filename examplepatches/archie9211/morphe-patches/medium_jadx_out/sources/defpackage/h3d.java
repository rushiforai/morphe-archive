package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.donkey.susi.SusiActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h3d extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ SusiActivity d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h3d(SusiActivity susiActivity, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = susiActivity;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        SusiActivity susiActivity = this.d;
        switch (i) {
            case 0:
                return new h3d(susiActivity, n92Var, 0);
            default:
                return new h3d(susiActivity, n92Var, 1);
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
        return ((h3d) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        SusiActivity susiActivity = this.d;
        String str = pUlNWdybf.ycLOAMkzNPNPU;
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
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                int i3 = SusiActivity.v;
                bo4 bo4Var = ((a4d) susiActivity.u.getValue()).b;
                a7c a7cVar = new a7c(5, susiActivity);
                this.c = 1;
                return bo4Var.b(a7cVar, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                vx6 vx6Var = vx6.STARTED;
                h3d h3dVar = new h3d(susiActivity, n92Var, 0);
                this.c = 1;
                return gq7.Q(susiActivity, vx6Var, h3dVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
