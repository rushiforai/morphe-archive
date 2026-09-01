package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i5f implements h5f {
    public final String b;
    public final m26 c;
    public final m26 d;

    public i5f(String str) {
        this.b = str;
        this.c = new m26(str);
        this.d = new m26(str.concat(" maximum"));
    }

    public final String toString() {
        return this.b;
    }
}
