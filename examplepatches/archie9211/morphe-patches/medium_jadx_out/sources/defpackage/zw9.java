package defpackage;

import com.medium.android.graphql.type.PostVisibilityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class zw9 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PostVisibilityType.values().length];
        try {
            iArr[PostVisibilityType.UNLISTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PostVisibilityType.LOCKED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PostVisibilityType.PUBLIC.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
