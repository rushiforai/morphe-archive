package xm;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final int f96124a;

    /* renamed from: b, reason: collision with root package name */
    public final e f96125b;

    /* renamed from: c, reason: collision with root package name */
    public final String f96126c;

    public h(int i5, e eVar, String str) {
        this.f96124a = i5;
        this.f96125b = eVar;
        this.f96126c = str;
    }

    public static h a(e eVar) {
        return new h(1, eVar, null);
    }

    public static h b(String str, e eVar) {
        return new h(0, eVar, str);
    }

    public static h c() {
        return new h(2, null, null);
    }

    public final e d() {
        return this.f96125b;
    }

    public final String e() {
        return this.f96126c;
    }

    public final int f() {
        return this.f96124a;
    }
}
