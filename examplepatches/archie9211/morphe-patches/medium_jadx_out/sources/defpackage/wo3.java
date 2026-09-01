package defpackage;

import com.medium.android.graphql.EditCatalogItemsMutation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class wo3 {
    public static final cp3 a(String str, Object obj) {
        str.getClass();
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            wld.a.e(thB, "Edit catalog items failure. Catalog id: ".concat(str), new Object[0]);
            return new yo3(thB);
        }
        EditCatalogItemsMutation.EditCatalogItems editCatalogItems = (EditCatalogItemsMutation.EditCatalogItems) obj;
        EditCatalogItemsMutation.OnEditCatalogItemsSuccess onEditCatalogItemsSuccess = editCatalogItems.getOnEditCatalogItemsSuccess();
        if (onEditCatalogItemsSuccess != null) {
            return new bp3(onEditCatalogItemsSuccess.getVersion());
        }
        if (editCatalogItems.getOnNotFound() != null) {
            EditCatalogItemsMutation.OnNotFound onNotFound = editCatalogItems.getOnNotFound();
            return new ap3(onNotFound != null ? onNotFound.getMessage() : null);
        }
        if (editCatalogItems.getOnBadRequest() != null) {
            EditCatalogItemsMutation.OnBadRequest onBadRequest = editCatalogItems.getOnBadRequest();
            return new xo3(onBadRequest != null ? onBadRequest.getMessage() : null);
        }
        if (editCatalogItems.getOnForbidden() != null) {
            EditCatalogItemsMutation.OnForbidden onForbidden = editCatalogItems.getOnForbidden();
            return new zo3(onForbidden != null ? onForbidden.getMessage() : null);
        }
        IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Result not handled: " + editCatalogItems);
        wld.a.e(illegalArgumentException, "Edit catalog items failure. Catalog id: ".concat(str), new Object[0]);
        return new yo3(illegalArgumentException);
    }
}
