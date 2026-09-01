package defpackage;

import com.medium.android.graphql.type.PredefinedCatalogType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class cf1 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PredefinedCatalogType.values().length];
        try {
            iArr[PredefinedCatalogType.READING_LIST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        a = iArr;
    }
}
