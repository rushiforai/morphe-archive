package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.home.ui.home.HomeFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nq5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rq5 b;
    public final /* synthetic */ vq5 c;

    public /* synthetic */ nq5(rq5 rq5Var, vq5 vq5Var, int i) {
        this.a = i;
        this.b = rq5Var;
        this.c = vq5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        vq5 vq5Var = this.c;
        rq5 rq5Var = this.b;
        switch (i) {
            case 0:
                SourceParameter sourceParameter = vq5Var.f;
                rq5Var.getClass();
                sourceParameter.getClass();
                HomeFragment homeFragment = ((dq5) rq5Var.b).a;
                b09.N(homeFragment.Z(), homeFragment.S(), gp7.u(sourceParameter));
                break;
            default:
                SourceParameter sourceParameter2 = vq5Var.f;
                rq5Var.getClass();
                sourceParameter2.getClass();
                HomeFragment homeFragment2 = ((dq5) rq5Var.b).a;
                b09.K(homeFragment2.Z(), homeFragment2.S(), EditPostReference.NewPost.INSTANCE, gp7.u(sourceParameter2));
                break;
        }
        return c1eVar;
    }
}
