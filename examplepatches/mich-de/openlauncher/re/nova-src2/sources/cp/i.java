package cp;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: d, reason: collision with root package name */
    public static final i f47746d = new i(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);

    /* renamed from: a, reason: collision with root package name */
    public final String f47747a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47748b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f47749c;

    static {
        new i("\n", "  ", true);
    }

    public i(String str, String str2, boolean z11) {
        if (!str.matches("[\r\n]*")) {
            throw new IllegalArgumentException("Only combinations of \\n and \\r are allowed in newline.");
        }
        if (!str2.matches("[ \t]*")) {
            throw new IllegalArgumentException("Only combinations of spaces and tabs are allowed in indent.");
        }
        this.f47747a = str;
        this.f47748b = str2;
        this.f47749c = z11;
    }
}
