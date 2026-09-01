package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class do8 extends qb8 {
    public final /* synthetic */ eo8 y;

    public do8(eo8 eo8Var) {
        this.y = eo8Var;
    }

    @Override // defpackage.qb8
    public final String D() {
        return "INSERT OR REPLACE INTO `offline_catalog` (`id`,`is_reading_list`,`version`,`post_ids`,`preview`,`detail`,`items`) VALUES (?,?,?,?,?,?,?)";
    }

    @Override // defpackage.qb8
    public final void z(gnb gnbVar, Object obj) {
        zn8 zn8Var = (zn8) obj;
        gnbVar.getClass();
        zn8Var.getClass();
        gnbVar.M(1, zn8Var.a);
        gnbVar.c(2, zn8Var.b ? 1L : 0L);
        gnbVar.M(3, zn8Var.c);
        eo8 eo8Var = this.y;
        alb albVarA = eo8Var.a();
        List list = zn8Var.d;
        albVarA.getClass();
        gnbVar.M(4, ((jb6) albVarA.b.getValue()).d(list));
        alb albVarA2 = eo8Var.a();
        CatalogPreviewData catalogPreviewData = zn8Var.e;
        albVarA2.getClass();
        gnbVar.M(5, ((jb6) albVarA2.d.getValue()).d(catalogPreviewData));
        alb albVarA3 = eo8Var.a();
        CatalogDetailData catalogDetailData = zn8Var.f;
        albVarA3.getClass();
        catalogDetailData.getClass();
        gnbVar.M(6, ((jb6) albVarA3.e.getValue()).d(catalogDetailData));
        alb albVarA4 = eo8Var.a();
        List list2 = zn8Var.g;
        albVarA4.getClass();
        list2.getClass();
        gnbVar.M(7, ((jb6) albVarA4.f.getValue()).d(list2));
    }
}
