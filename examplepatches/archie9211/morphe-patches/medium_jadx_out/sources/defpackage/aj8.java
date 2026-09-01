package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class aj8 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[NotificationFilterType.values().length];
        try {
            iArr[NotificationFilterType.ALL.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[NotificationFilterType.RESPONSES.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
    }
}
