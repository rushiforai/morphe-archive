package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum jz7 implements m7a {
    UNKNOWN(0),
    DATA_MESSAGE(1),
    TOPIC(2),
    DISPLAY_NOTIFICATION(3);

    public final int a;

    jz7(int i) {
        this.a = i;
    }

    @Override // defpackage.m7a
    public int getNumber() {
        return this.a;
    }
}
