package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ou2 {
    public final v5e a;
    public final int b;
    public final long c;
    public final long d;
    public final long e;

    public ou2(v5e v5eVar, int i) {
        v5eVar.getClass();
        this.a = v5eVar;
        this.b = i;
        this.c = v5eVar.getBaseStepMs$dd_sdk_android_core_release();
        this.d = v5eVar.getBaseStepMs$dd_sdk_android_core_release() * 10;
        this.e = v5eVar.getBaseStepMs$dd_sdk_android_core_release() * 5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ou2)) {
            return false;
        }
        ou2 ou2Var = (ou2) obj;
        return this.a == ou2Var.a && this.b == ou2Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        return "DataUploadConfiguration(frequency=" + this.a + ", maxBatchesPerUploadJob=" + this.b + ")";
    }
}
