package defpackage;

import com.medium.android.graphql.type.AppConfigSupportStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class j60 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[AppConfigSupportStatus.values().length];
        try {
            iArr[AppConfigSupportStatus.DEPRECATED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[AppConfigSupportStatus.DROPPED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[AppConfigSupportStatus.INVALID_VERSION.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[AppConfigSupportStatus.SUPPORTED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[AppConfigSupportStatus.UNKNOWN__.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        a = iArr;
    }
}
