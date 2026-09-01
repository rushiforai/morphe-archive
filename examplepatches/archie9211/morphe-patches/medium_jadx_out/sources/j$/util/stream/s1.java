package j$.util.stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public enum s1 {
    ANY(true, true),
    ALL(false, false),
    NONE(true, false);

    public final boolean a;
    public final boolean b;

    s1(boolean z, boolean z2) {
        this.a = z;
        this.b = z2;
    }
}
