package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ao8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ eo8 b;

    public /* synthetic */ ao8(eo8 eo8Var, int i) {
        this.a = i;
        this.b = eo8Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        gnb gnbVarB0;
        int i = this.a;
        eo8 eo8Var = this.b;
        switch (i) {
            case 0:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("SELECT preview FROM offline_catalog WHERE is_reading_list = 1");
                try {
                    CatalogPreviewData catalogPreviewData = null;
                    if (gnbVarB0.w0()) {
                        String strD0 = gnbVarB0.isNull(0) ? null : gnbVarB0.d0(0);
                        if (strD0 != null) {
                            alb albVarA = eo8Var.a();
                            albVarA.getClass();
                            catalogPreviewData = (CatalogPreviewData) ((jb6) albVarA.d.getValue()).b(strD0);
                            break;
                        }
                    }
                    return catalogPreviewData;
                } finally {
                    gnbVarB0.close();
                }
            default:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0("SELECT * FROM offline_catalog");
                try {
                    int iY = il7.y(gnbVarB0, "id");
                    int iY2 = il7.y(gnbVarB0, "is_reading_list");
                    int iY3 = il7.y(gnbVarB0, "version");
                    int iY4 = il7.y(gnbVarB0, "post_ids");
                    int iY5 = il7.y(gnbVarB0, "preview");
                    int iY6 = il7.y(gnbVarB0, "detail");
                    int iY7 = il7.y(gnbVarB0, "items");
                    ArrayList arrayList = new ArrayList();
                    while (gnbVarB0.w0()) {
                        String strD02 = gnbVarB0.d0(iY);
                        boolean z = ((int) gnbVarB0.getLong(iY2)) != 0;
                        String strD03 = gnbVarB0.d0(iY3);
                        String strD04 = gnbVarB0.d0(iY4);
                        alb albVarA2 = eo8Var.a();
                        albVarA2.getClass();
                        strD04.getClass();
                        List list = (List) ((jb6) albVarA2.b.getValue()).b(strD04);
                        if (list == null) {
                            list = ey3.a;
                        }
                        List list2 = list;
                        String strD05 = gnbVarB0.d0(iY5);
                        alb albVarA3 = eo8Var.a();
                        albVarA3.getClass();
                        strD05.getClass();
                        CatalogPreviewData catalogPreviewData2 = (CatalogPreviewData) ((jb6) albVarA3.d.getValue()).b(strD05);
                        if (catalogPreviewData2 == null) {
                            throw new IllegalStateException("Expected NON-NULL 'com.medium.android.graphql.fragment.CatalogPreviewData', but it was NULL.");
                        }
                        String strD06 = gnbVarB0.d0(iY6);
                        alb albVarA4 = eo8Var.a();
                        albVarA4.getClass();
                        strD06.getClass();
                        CatalogDetailData catalogDetailData = (CatalogDetailData) ((jb6) albVarA4.e.getValue()).b(strD06);
                        if (catalogDetailData == null) {
                            throw new IllegalStateException("Expected NON-NULL 'com.medium.android.graphql.fragment.CatalogDetailData', but it was NULL.");
                        }
                        String strD07 = gnbVarB0.d0(iY7);
                        alb albVarA5 = eo8Var.a();
                        albVarA5.getClass();
                        strD07.getClass();
                        List list3 = (List) ((jb6) albVarA5.f.getValue()).b(strD07);
                        if (list3 == null) {
                            throw new IllegalStateException("Expected NON-NULL 'kotlin.collections.List<com.medium.android.graphql.fragment.CatalogItemData>', but it was NULL.");
                        }
                        arrayList.add(new zn8(strD02, z, strD03, list2, catalogPreviewData2, catalogDetailData, list3));
                    }
                    return arrayList;
                } finally {
                }
        }
    }
}
