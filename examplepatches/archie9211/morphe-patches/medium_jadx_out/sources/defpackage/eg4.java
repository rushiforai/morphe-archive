package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum eg4 {
    SCALAR(false),
    VECTOR(true),
    PACKED_VECTOR(true),
    MAP(false);

    public final boolean a;

    eg4(boolean z) {
        this.a = z;
    }

    public boolean isList() {
        return this.a;
    }
}
