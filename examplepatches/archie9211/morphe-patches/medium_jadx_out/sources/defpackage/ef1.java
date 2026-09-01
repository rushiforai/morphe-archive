package defpackage;

import com.medium.android.core.models.CatalogName;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.type.PredefinedCatalogType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ef1 {
    public static final CatalogName a(CatalogSummaryData catalogSummaryData) {
        catalogSummaryData.getClass();
        PredefinedCatalogType predefined = catalogSummaryData.getPredefined();
        return (predefined == null ? -1 : cf1.a[predefined.ordinal()]) == 1 ? CatalogName.ReadingList.INSTANCE : new CatalogName.Name(catalogSummaryData.getName());
    }
}
