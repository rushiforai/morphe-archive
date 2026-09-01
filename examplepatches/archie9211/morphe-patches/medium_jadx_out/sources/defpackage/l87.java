package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum l87 {
    NATIVE_WITH_FALLBACK(true, true, true, false, true, true, true),
    NATIVE_ONLY(true, true, false, false, false, true, true),
    KATANA_ONLY(false, true, false, false, false, false, false),
    WEB_ONLY(false, false, true, false, true, false, false),
    DIALOG_ONLY(false, true, true, false, true, true, true),
    DEVICE_AUTH(false, false, false, true, false, false, false);

    public final boolean a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;

    l87(boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7) {
        this.a = z;
        this.b = z2;
        this.c = z3;
        this.d = z4;
        this.e = z5;
        this.f = z6;
        this.g = z7;
    }

    public final boolean allowsCustomTabAuth() {
        return this.e;
    }

    public final boolean allowsDeviceAuth() {
        return this.d;
    }

    public final boolean allowsFacebookLiteAuth() {
        return this.f;
    }

    public final boolean allowsGetTokenAuth() {
        return this.a;
    }

    public final boolean allowsInstagramAppAuth() {
        return this.g;
    }

    public final boolean allowsKatanaAuth() {
        return this.b;
    }

    public final boolean allowsWebViewAuth() {
        return this.c;
    }
}
