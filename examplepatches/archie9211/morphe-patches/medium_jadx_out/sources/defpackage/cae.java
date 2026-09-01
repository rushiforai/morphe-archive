package defpackage;

import com.medium.android.graphql.type.MarkupType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class cae {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[MarkupType.values().length];
        try {
            iArr[MarkupType.STRONG.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[MarkupType.EM.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[MarkupType.A.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
