package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.navigation.EditPostReference;
import com.medium.android.explore.ui.ExploreFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class i64 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l64 b;
    public final /* synthetic */ x64 c;

    public /* synthetic */ i64(l64 l64Var, x64 x64Var, int i) {
        this.a = i;
        this.b = l64Var;
        this.c = x64Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x64 x64Var = this.c;
        l64 l64Var = this.b;
        switch (i) {
            case 0:
                SourceParameter sourceParameterA = x64Var.a();
                sourceParameterA.getClass();
                ExploreFragment exploreFragment = l64Var.b.a;
                b09.K(exploreFragment.Z(), exploreFragment.S(), EditPostReference.NewPost.INSTANCE, gp7.u(sourceParameterA));
                break;
            default:
                SourceParameter sourceParameterA2 = x64Var.a();
                sourceParameterA2.getClass();
                ExploreFragment exploreFragment2 = l64Var.b.a;
                ((p13) exploreFragment2.Z()).F(exploreFragment2.S(), gp7.u(sourceParameterA2), false);
                break;
        }
        return c1eVar;
    }
}
