package ql;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: c, reason: collision with root package name */
    public static final b f84110c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f84111d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f84112e;

    /* renamed from: f, reason: collision with root package name */
    public static final b f84113f;

    /* renamed from: g, reason: collision with root package name */
    public static final b f84114g;

    /* renamed from: h, reason: collision with root package name */
    public static final b f84115h;

    /* renamed from: i, reason: collision with root package name */
    public static final b f84116i;

    /* renamed from: j, reason: collision with root package name */
    public static final b f84117j;

    /* renamed from: k, reason: collision with root package name */
    public static final b f84118k;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84119a;

    /* renamed from: b, reason: collision with root package name */
    public final String f84120b;

    static {
        int i5 = 0;
        f84110c = new b("SHA256", i5);
        f84111d = new b("SHA384", i5);
        f84112e = new b("SHA512", i5);
        int i11 = 1;
        f84113f = new b("IEEE_P1363", i11);
        f84114g = new b("DER", i11);
        int i12 = 2;
        f84115h = new b("TINK", i12);
        f84116i = new b("CRUNCHY", i12);
        f84117j = new b("LEGACY", i12);
        f84118k = new b("NO_PREFIX", i12);
    }

    public /* synthetic */ b(String str, int i5) {
        this.f84119a = i5;
        this.f84120b = str;
    }

    public final String toString() {
        switch (this.f84119a) {
        }
        return this.f84120b;
    }
}
