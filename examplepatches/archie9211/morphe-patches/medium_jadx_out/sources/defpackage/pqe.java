package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum pqe {
    INVARIANT("", true),
    IN_VARIANCE("in", false),
    OUT_VARIANCE("out", true);

    public final String a;
    public final boolean b;

    pqe(String str, boolean z) {
        this.a = str;
        this.b = z;
    }

    public final boolean getAllowsOutPosition() {
        return this.b;
    }

    public final String getLabel() {
        return this.a;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }
}
