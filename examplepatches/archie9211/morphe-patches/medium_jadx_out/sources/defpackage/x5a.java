package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum x5a implements o56 {
    TRUE(0),
    FALSE(1),
    NULL(2);

    public final int a;

    x5a(int i) {
        this.a = i;
    }

    public static x5a valueOf(int i) {
        if (i == 0) {
            return TRUE;
        }
        if (i == 1) {
            return FALSE;
        }
        if (i != 2) {
            return null;
        }
        return NULL;
    }

    @Override // defpackage.o56
    public final int getNumber() {
        return this.a;
    }
}
