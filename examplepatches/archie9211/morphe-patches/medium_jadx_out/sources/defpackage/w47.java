package defpackage;

import com.medium.android.core.models.CatalogName;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.type.CatalogVisibility;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w47 extends p4d implements f55 {
    public /* synthetic */ CatalogPreviewData b;
    public /* synthetic */ List c;
    public /* synthetic */ List d;
    public /* synthetic */ boolean e;
    public /* synthetic */ boolean f;
    public final /* synthetic */ x47 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w47(x47 x47Var, n92 n92Var) {
        super(6, n92Var);
        this.g = x47Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        CatalogPreviewData catalogPreviewData = this.b;
        List<CatalogPreviewData> list = this.c;
        List list2 = this.d;
        boolean z = this.e;
        boolean z2 = this.f;
        br7.v(obj);
        if (catalogPreviewData == null || list == null) {
            return i47.a;
        }
        x47 x47Var = this.g;
        x47Var.p = catalogPreviewData;
        x47Var.r = list;
        ArrayList arrayList = new ArrayList();
        arrayList.add(new a47(catalogPreviewData.getId(), CatalogName.ReadingList.INSTANCE, list2 != null && list2.contains(catalogPreviewData.getId()), catalogPreviewData.getCatalogSummaryData().getVisibility() == CatalogVisibility.PUBLIC));
        for (CatalogPreviewData catalogPreviewData2 : list) {
            arrayList.add(new a47(catalogPreviewData2.getId(), new CatalogName.Name(catalogPreviewData2.getCatalogSummaryData().getName()), list2 != null && list2.contains(catalogPreviewData2.getId()), catalogPreviewData2.getCatalogSummaryData().getVisibility() == CatalogVisibility.PUBLIC));
        }
        if (z) {
            arrayList.add(b47.a);
        }
        return new h47(arrayList, z2);
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        boolean zBooleanValue = ((Boolean) obj4).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj5).booleanValue();
        w47 w47Var = new w47(this.g, (n92) obj6);
        w47Var.b = (CatalogPreviewData) obj;
        w47Var.c = (List) obj2;
        w47Var.d = (List) obj3;
        w47Var.e = zBooleanValue;
        w47Var.f = zBooleanValue2;
        return w47Var.invokeSuspend(c1e.a);
    }
}
