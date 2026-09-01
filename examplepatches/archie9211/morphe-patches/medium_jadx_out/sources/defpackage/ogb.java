package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ogb {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[ResponsesReference.ResponseViewType.values().length];
        try {
            iArr[ResponsesReference.ResponseViewType.Replies.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ResponsesReference.ResponseViewType.HighlightResponses.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
