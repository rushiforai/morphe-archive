package defpackage;

import gen.model.CatalogType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class kg1 {
    public static CatalogType a(int i) {
        switch (i) {
            case 0:
                return CatalogType.CATALOG_TYPE_DEFAULT;
            case 1:
                return CatalogType.CATALOG_TYPE_SERIES;
            case 2:
                return CatalogType.CATALOG_TYPE_TOPIC;
            case 3:
                return CatalogType.CATALOG_TYPE_SEQUENCE;
            case 4:
                return CatalogType.CATALOG_TYPE_HOME_MODULE;
            case 5:
                return CatalogType.CATALOG_TYPE_LIST;
            case 6:
                return CatalogType.CATALOG_TYPE_PREDEFINED_LIST;
            default:
                return null;
        }
    }
}
