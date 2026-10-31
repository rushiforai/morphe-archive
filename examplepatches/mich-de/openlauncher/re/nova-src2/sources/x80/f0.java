package x80;

/* loaded from: classes.dex */
public enum f0 {
    HTTP_1_0("http/1.0"),
    HTTP_1_1("http/1.1"),
    SPDY_3("spdy/3.1"),
    HTTP_2("h2"),
    H2_PRIOR_KNOWLEDGE("h2_prior_knowledge"),
    QUIC("quic");


    /* renamed from: a, reason: collision with root package name */
    public final String f95490a;

    f0(String str) {
        this.f95490a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f95490a;
    }
}
