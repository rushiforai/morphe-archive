package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import com.medium.android.graphql.type.CatalogType;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q47 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ x47 c;
    public final /* synthetic */ CatalogPreviewData d;
    public final /* synthetic */ EntityCatalogsConnectionData.CatalogsContainingThi e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q47(x47 x47Var, CatalogPreviewData catalogPreviewData, EntityCatalogsConnectionData.CatalogsContainingThi catalogsContainingThi, n92 n92Var) {
        super(2, n92Var);
        this.c = x47Var;
        this.d = catalogPreviewData;
        this.e = catalogsContainingThi;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new q47(this.c, this.d, this.e, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((q47) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        x47 x47Var = this.c;
        CatalogPreviewData catalogPreviewData = this.d;
        if (i == 0) {
            br7.v(obj);
            n53 n53Var = x47Var.h;
            String id = catalogPreviewData.getId();
            String version = catalogPreviewData.getCatalogSummaryData().getVersion();
            CatalogType type = catalogPreviewData.getCatalogSummaryData().getType();
            ud1 ud1Var = x47Var.b;
            List<String> catalogItemIds = this.e.getCatalogItemIds();
            this.b = 1;
            obj = n53Var.a(id, version, type, ud1Var, catalogItemIds, this);
            if (obj == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        cp3 cp3Var = (cp3) obj;
        if (cp3Var instanceof bp3) {
            x47Var.g(catalogPreviewData.getId());
            x47Var.i(catalogPreviewData.getId(), ((bp3) cp3Var).a);
        }
        return obj;
    }
}
