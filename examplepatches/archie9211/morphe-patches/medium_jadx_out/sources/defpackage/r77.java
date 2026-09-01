package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum r77 {
    MOBILE("mobile"),
    DESKTOP("desktop"),
    TABLET("tablet"),
    TV("tv"),
    GAMING_CONSOLE("gaming_console"),
    BOT("bot"),
    OTHER("other");

    public static final q77 Companion = new q77();
    public final String a;

    r77(String str) {
        this.a = str;
    }

    public static final r77 fromJson(String str) {
        Companion.getClass();
        str.getClass();
        for (r77 r77Var : values()) {
            if (g76.L(r77Var.a, str)) {
                return r77Var;
            }
        }
        ywb.h("Array contains no element matching the predicate.");
        return null;
    }

    public final dc6 toJson() {
        return new zc6(this.a);
    }
}
