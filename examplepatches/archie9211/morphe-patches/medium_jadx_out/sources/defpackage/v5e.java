package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum v5e {
    FREQUENT(500),
    AVERAGE(2000),
    RARE(5000);

    public final long a;

    v5e(long j) {
        this.a = j;
    }

    public final long getBaseStepMs$dd_sdk_android_core_release() {
        return this.a;
    }
}
