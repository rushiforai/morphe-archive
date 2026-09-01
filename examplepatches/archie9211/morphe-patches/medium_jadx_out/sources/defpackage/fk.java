package defpackage;

import com.medium.proto.obv.post.AnchorType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class fk {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[AnchorType.values().length];
        try {
            iArr[AnchorType.LINK.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[AnchorType.AUDIO.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[AnchorType.USER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[com.medium.android.graphql.type.AnchorType.values().length];
        try {
            iArr2[com.medium.android.graphql.type.AnchorType.LINK.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[com.medium.android.graphql.type.AnchorType.AUDIO.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[com.medium.android.graphql.type.AnchorType.USER.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[com.medium.android.graphql.type.AnchorType.UNKNOWN__.ordinal()] = 4;
        } catch (NoSuchFieldError unused7) {
        }
        b = iArr2;
    }
}
