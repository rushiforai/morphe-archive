package defpackage;

import com.medium.android.yourlibrary.YourLibraryTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class xef {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[YourLibraryTab.values().length];
        try {
            iArr[YourLibraryTab.YOUR_LISTS.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[YourLibraryTab.SAVED_LISTS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[YourLibraryTab.DIGEST.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[YourLibraryTab.HIGHLIGHTS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[YourLibraryTab.READING_HISTORY.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[YourLibraryTab.RESPONSES.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
    }
}
