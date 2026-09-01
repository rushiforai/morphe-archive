package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum pxd {
    IN("in"),
    OUT("out"),
    INV("");

    public final String a;

    pxd(String str) {
        this.a = str;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }
}
