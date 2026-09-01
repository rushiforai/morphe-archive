package defpackage;

import com.medium.android.graphql.FullPostQuery;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dp8 extends qb8 {
    public final /* synthetic */ ep8 y;

    public dp8(ep8 ep8Var) {
        this.y = ep8Var;
    }

    @Override // defpackage.qb8
    public final String D() {
        return "INSERT OR REPLACE INTO `offline_post` (`id`,`latest_published_version`,`content`) VALUES (?,?,?)";
    }

    @Override // defpackage.qb8
    public final void z(gnb gnbVar, Object obj) {
        bp8 bp8Var = (bp8) obj;
        gnbVar.getClass();
        bp8Var.getClass();
        gnbVar.M(1, bp8Var.a);
        gnbVar.M(2, bp8Var.b);
        alb albVar = (alb) this.y.c.getValue();
        FullPostQuery.Data data = bp8Var.c;
        albVar.getClass();
        gnbVar.M(3, ((jb6) albVar.c.getValue()).d(data));
    }
}
