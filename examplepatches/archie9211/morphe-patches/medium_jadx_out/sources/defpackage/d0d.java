package defpackage;

import com.medium.android.core.membership.UpsellReferrer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class d0d {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[UpsellReferrer.values().length];
        try {
            iArr[UpsellReferrer.POST.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        a = iArr;
    }
}
