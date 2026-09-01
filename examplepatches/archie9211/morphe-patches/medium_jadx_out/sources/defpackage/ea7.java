package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum ea7 {
    FACEBOOK("facebook"),
    INSTAGRAM("instagram");

    public static final da7 Companion = new da7();
    public final String a;

    ea7(String str) {
        this.a = str;
    }

    public static final ea7 fromString(String str) {
        Companion.getClass();
        for (ea7 ea7Var : values()) {
            if (g76.L(ea7Var.toString(), str)) {
                return ea7Var;
            }
        }
        return FACEBOOK;
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.a;
    }
}
