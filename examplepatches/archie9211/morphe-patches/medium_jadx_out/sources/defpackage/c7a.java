package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum c7a implements o56 {
    WARNING(0),
    ERROR(1),
    HIDDEN(2);

    public final int a;

    c7a(int i) {
        this.a = i;
    }

    public static c7a valueOf(int i) {
        if (i == 0) {
            return WARNING;
        }
        if (i == 1) {
            return ERROR;
        }
        if (i != 2) {
            return null;
        }
        return HIDDEN;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
