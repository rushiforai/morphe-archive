package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum k6a implements o56 {
    CLASS(0),
    PACKAGE(1),
    LOCAL(2);

    public final int a;

    k6a(int i) {
        this.a = i;
    }

    public static k6a valueOf(int i) {
        if (i == 0) {
            return CLASS;
        }
        if (i == 1) {
            return PACKAGE;
        }
        if (i != 2) {
            return null;
        }
        return LOCAL;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
