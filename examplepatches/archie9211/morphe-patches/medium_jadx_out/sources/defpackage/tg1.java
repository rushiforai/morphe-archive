package defpackage;

import com.medium.android.core.models.CatalogName;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.CatalogSummaryData;
import com.medium.android.graphql.fragment.ImageMetadataData;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.CatalogVisibility;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tg1 {
    public final ze1 a;
    public final qi1 b;

    public tg1(ze1 ze1Var, qi1 qi1Var) {
        qi1Var.getClass();
        this.a = ze1Var;
        this.b = qi1Var;
    }

    public final rg1 a(String str, CatalogPreviewData catalogPreviewData) {
        Boolean boolValueOf;
        CatalogPreviewData.OnPost onPost;
        CatalogPreviewData.PreviewImage previewImage;
        ImageMetadataData imageMetadataData;
        catalogPreviewData.getClass();
        boolean zIsUser = catalogPreviewData.getCatalogSummaryData().getCreator().getViewerEdge().isUser();
        List<CatalogPreviewData.Item> items = catalogPreviewData.getItemsConnection().getItems();
        ArrayList arrayList = new ArrayList();
        Iterator<T> it2 = items.iterator();
        while (true) {
            boolValueOf = null;
            sw5VarM = null;
            sw5VarM = null;
            sw5VarM = null;
            sw5 sw5VarM = null;
            if (!it2.hasNext()) {
                break;
            }
            CatalogPreviewData.Entity entity = ((CatalogPreviewData.Item) it2.next()).getEntity();
            if (entity != null && (onPost = entity.getOnPost()) != null && (previewImage = onPost.getPreviewImage()) != null && (imageMetadataData = previewImage.getImageMetadataData()) != null) {
                sw5VarM = pxf.M(imageMetadataData);
            }
            if (sw5VarM != null) {
                arrayList.add(sw5VarM);
            }
        }
        az5 az5VarF0 = bo.f0(bu1.g1(arrayList, 3));
        qi1 qi1Var = this.b;
        zz zzVarG = !zIsUser ? qi1Var.G(catalogPreviewData.getId()) : null;
        zz zzVar = new zz(qi1Var.H(catalogPreviewData.getId()), 2);
        eg1 eg1VarA = this.a.a(catalogPreviewData.getCatalogSummaryData());
        String id = catalogPreviewData.getId();
        String name = catalogPreviewData.getCatalogSummaryData().getCreator().getName();
        String imageId = catalogPreviewData.getCatalogSummaryData().getCreator().getImageId();
        String str2 = imageId != null ? imageId : null;
        CatalogSummaryData.Verifications verifications = catalogPreviewData.getCatalogSummaryData().getCreator().getVerifications();
        boolean zIsBookAuthor = verifications != null ? verifications.isBookAuthor() : false;
        CatalogType type = catalogPreviewData.getCatalogSummaryData().getType();
        CatalogName catalogNameA = ef1.a(catalogPreviewData.getCatalogSummaryData());
        int postItemsCount = catalogPreviewData.getCatalogSummaryData().getPostItemsCount();
        CatalogVisibility visibility = catalogPreviewData.getCatalogSummaryData().getVisibility();
        if (zIsUser) {
            boolValueOf = Boolean.valueOf(catalogPreviewData.getCatalogSummaryData().getVisibility() == CatalogVisibility.PUBLIC);
        }
        boolean z = true;
        boolean z2 = !zIsUser;
        if (!zIsUser || catalogPreviewData.getCatalogSummaryData().getPredefined() != null) {
            z = false;
        }
        return new rg1(id, name, str2, zIsBookAuthor, type, catalogNameA, postItemsCount, visibility, az5VarF0, zzVarG, zIsUser, zzVar, new qg1(zIsUser, boolValueOf, z2, z, eg1VarA), str);
    }
}
