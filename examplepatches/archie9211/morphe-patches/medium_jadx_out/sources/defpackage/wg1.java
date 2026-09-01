package defpackage;

import com.medium.android.graphql.UserCatalogsQuery;
import com.medium.android.graphql.fragment.CatalogPagingResultData;
import com.medium.android.graphql.type.CatalogPagingCursorInput;
import com.medium.android.graphql.type.CatalogPagingOptionsInput;
import com.medium.android.graphql.type.CatalogVisibility;
import com.medium.proto.event.ListPrivacyLevel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wg1 {
    public static final ListPrivacyLevel a(CatalogVisibility catalogVisibility) {
        catalogVisibility.getClass();
        return vg1.a[catalogVisibility.ordinal()] == 1 ? ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC : ListPrivacyLevel.LIST_PRIVACY_LEVEL_PRIVATE;
    }

    public static CatalogPagingOptionsInput b(UserCatalogsQuery.CatalogsConnection catalogsConnection) {
        String id;
        CatalogPagingResultData.NextPageCursor nextPageCursor = catalogsConnection.getPaging().getCatalogPagingResultData().getNextPageCursor();
        if (nextPageCursor == null || (id = nextPageCursor.getId()) == null) {
            return null;
        }
        return new CatalogPagingOptionsInput(new yv8(new CatalogPagingCursorInput(id)), 15);
    }
}
