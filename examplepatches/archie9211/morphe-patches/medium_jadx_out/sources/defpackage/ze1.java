package defpackage;

import android.net.Uri;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.android.graphql.type.PredefinedCatalogType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ze1 {
    public ze1(tz7 tz7Var) {
    }

    public final eg1 a(CatalogSummaryData catalogSummaryData) {
        String username;
        catalogSummaryData.getClass();
        if (catalogSummaryData.getVisibility() == CatalogVisibility.PUBLIC && (username = catalogSummaryData.getCreator().getUsername()) != null && !muc.b0(username)) {
            String id = catalogSummaryData.getId();
            String username2 = catalogSummaryData.getCreator().getUsername();
            if (username2 != null) {
                PredefinedCatalogType predefined = catalogSummaryData.getPredefined();
                i03 i03Var = i03.a;
                id.getClass();
                int i = predefined == null ? -1 : gu7.a[predefined.ordinal()];
                Uri uriBuild = i != -1 ? i != 1 ? null : Uri.parse(i03.b).buildUpon().appendEncodedPath("@".concat(username2)).appendEncodedPath("reading-list").build() : Uri.parse(i03.b).buildUpon().appendEncodedPath("@".concat(username2)).appendEncodedPath("list").appendEncodedPath(id).build();
                if (uriBuild != null) {
                    return new eg1(uriBuild, catalogSummaryData.getId(), ef1.a(catalogSummaryData));
                }
            } else {
                ay0.e("Cannot share a catalog without a creator");
            }
        }
        return null;
    }
}
