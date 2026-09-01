package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum aq0 {
    SMALL(3000),
    MEDIUM(10000),
    LARGE(35000);

    public final long a;

    aq0(long j) {
        this.a = j;
    }

    public final long getWindowDurationMs$dd_sdk_android_core_release() {
        return this.a;
    }
}
