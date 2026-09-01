package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.type.CatalogType;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p47 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ x47 d;
    public final /* synthetic */ CatalogPreviewData e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p47(x47 x47Var, CatalogPreviewData catalogPreviewData, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = x47Var;
        this.e = catalogPreviewData;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        CatalogPreviewData catalogPreviewData = this.e;
        x47 x47Var = this.d;
        switch (i) {
            case 0:
                return new p47(x47Var, catalogPreviewData, n92Var, 0);
            default:
                return new p47(x47Var, catalogPreviewData, n92Var, 1);
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
        return ((p47) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        x47 x47Var = this.d;
        CatalogPreviewData catalogPreviewData = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    gg5 gg5Var = x47Var.g;
                    String id = catalogPreviewData.getId();
                    String version = catalogPreviewData.getCatalogSummaryData().getVersion();
                    CatalogType type = catalogPreviewData.getCatalogSummaryData().getType();
                    List listQ = d46.Q(x47Var.b);
                    this.c = 1;
                    obj = gg5Var.H(id, version, type, listQ, this);
                    if (obj == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                cp3 cp3Var = (cp3) obj;
                if (cp3Var instanceof bp3) {
                    x47Var.f(catalogPreviewData.getId());
                    x47Var.i(catalogPreviewData.getId(), ((bp3) cp3Var).a);
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    gg5 gg5Var2 = x47Var.g;
                    String id2 = catalogPreviewData.getId();
                    String version2 = catalogPreviewData.getCatalogSummaryData().getVersion();
                    CatalogType catalogType = CatalogType.PREDEFINED_LIST;
                    List listQ2 = d46.Q(x47Var.b);
                    this.c = 1;
                    obj = gg5Var2.H(id2, version2, catalogType, listQ2, this);
                    if (obj == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                cp3 cp3Var2 = (cp3) obj;
                if (cp3Var2 instanceof bp3) {
                    x47Var.f(catalogPreviewData.getId());
                    x47Var.j(((bp3) cp3Var2).a);
                }
                break;
        }
        return obj;
    }
}
