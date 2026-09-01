package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum d63 {
    DEVELOPER(1),
    USER_SIDELOAD(2),
    TEST_DISTRIBUTION(3),
    APP_STORE(4);

    public final int a;

    d63(int i) {
        this.a = i;
    }

    public static d63 determineFrom(String str) {
        return str != null ? APP_STORE : DEVELOPER;
    }

    public int getId() {
        return this.a;
    }

    @Override // java.lang.Enum
    public String toString() {
        return Integer.toString(this.a);
    }
}
