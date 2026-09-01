package defpackage;

import com.medium.android.domain.post.models.AnchorType;
import com.medium.android.domain.post.models.MarkupType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class teb {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[AnchorType.values().length];
        try {
            iArr[AnchorType.LINK.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[AnchorType.USER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[MarkupType.values().length];
        try {
            iArr2[MarkupType.STRONG.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[MarkupType.EM.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[MarkupType.A.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        b = iArr2;
    }
}
