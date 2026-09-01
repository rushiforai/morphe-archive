package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum kz7 implements m7a {
    UNKNOWN_OS(0),
    ANDROID(1),
    IOS(2),
    WEB(3);

    public final int a;

    kz7(int i) {
        this.a = i;
    }

    @Override // defpackage.m7a
    public int getNumber() {
        return this.a;
    }
}
