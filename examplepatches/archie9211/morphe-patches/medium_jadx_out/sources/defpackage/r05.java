package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r05 {
    public static final r05 d = new r05("", "", false);
    public static final r05 e = new r05("\n", "  ", true);
    public final String a;
    public final String b;
    public final boolean c;

    public r05(String str, String str2, boolean z) {
        if (!str.matches("[\r\n]*")) {
            ay0.e("Only combinations of \\n and \\r are allowed in newline.");
            throw null;
        }
        if (!str2.matches("[ \t]*")) {
            ay0.e("Only combinations of spaces and tabs are allowed in indent.");
            throw null;
        }
        this.a = str;
        this.b = str2;
        this.c = z;
    }
}
