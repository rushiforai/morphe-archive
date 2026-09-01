package defpackage;

import com.medium.android.graphql.type.DigestSectionType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class pd3 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[DigestSectionType.values().length];
        try {
            iArr[DigestSectionType.TOP_POSTS.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[DigestSectionType.FROM_YOUR_FOLLOWING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
