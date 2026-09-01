package defpackage;

import android.app.PendingIntent;
import com.medium.stats.ui.pub.PubStatsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e9a implements qqc {
    public final /* synthetic */ my6 a;
    public final /* synthetic */ w9a b;

    public e9a(my6 my6Var, w9a w9aVar) {
        this.a = my6Var;
        this.b = w9aVar;
    }

    @Override // defpackage.qqc
    public final void a(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        str.getClass();
        String strU = gp7.u(sourceParameter);
        w9a w9aVar = this.b;
        w9aVar.g.a(str, w9aVar.c, strU, w9aVar.j);
        PubStatsFragment pubStatsFragment = (PubStatsFragment) this.a.a;
        ((p13) pubStatsFragment.Z()).r(pubStatsFragment.S(), str, gp7.u(sourceParameter));
    }

    @Override // defpackage.qqc
    public final void b(String str, SourceParameter sourceParameter) {
        str.getClass();
        PubStatsFragment pubStatsFragment = (PubStatsFragment) this.a.a;
        ((p13) pubStatsFragment.Z()).Q(pubStatsFragment.S(), str, gp7.u(sourceParameter));
    }

    public final void c() {
        w9a w9aVar = this.b;
        vx0.c0(f76.F(w9aVar), null, null, new r9a(w9aVar, null, 0), 3);
    }
}
