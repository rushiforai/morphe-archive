package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum iz7 implements m7a {
    UNKNOWN_EVENT(0),
    MESSAGE_DELIVERED(1),
    MESSAGE_OPEN(2);

    public final int a;

    iz7(int i) {
        this.a = i;
    }

    @Override // defpackage.m7a
    public int getNumber() {
        return this.a;
    }
}
