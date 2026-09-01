package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum d7a implements o56 {
    LANGUAGE_VERSION(0),
    COMPILER_VERSION(1),
    API_VERSION(2);

    public final int a;

    d7a(int i) {
        this.a = i;
    }

    public static d7a valueOf(int i) {
        if (i == 0) {
            return LANGUAGE_VERSION;
        }
        if (i == 1) {
            return COMPILER_VERSION;
        }
        if (i != 2) {
            return null;
        }
        return API_VERSION;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
