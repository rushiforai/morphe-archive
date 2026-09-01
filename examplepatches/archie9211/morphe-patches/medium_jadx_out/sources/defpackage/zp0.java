package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum zp0 {
    LOW(1),
    MEDIUM(20),
    HIGH(100);

    public final int a;

    zp0(int i) {
        this.a = i;
    }

    public final int getMaxBatchesPerUploadJob() {
        return this.a;
    }
}
