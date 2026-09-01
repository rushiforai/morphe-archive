package defpackage;

import com.medium.android.graphql.type.CatalogItemType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class t37 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[CatalogItemType.values().length];
        try {
            iArr[CatalogItemType.POST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        a = iArr;
    }
}
