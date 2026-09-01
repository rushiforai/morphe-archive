package defpackage;

import com.medium.android.data.settings.NotificationNetwork;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class dqa {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[NotificationNetwork.values().length];
        try {
            iArr[NotificationNetwork.ALL.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[NotificationNetwork.NETWORK.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[NotificationNetwork.OFF.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
    }
}
