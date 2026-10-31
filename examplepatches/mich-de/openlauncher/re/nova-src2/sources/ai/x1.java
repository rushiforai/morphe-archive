package ai;

/* loaded from: classes3.dex */
public enum x1 {
    UNINITIALIZED("uninitialized"),
    POLICY("eu_consent_policy"),
    DENIED("denied"),
    GRANTED("granted");


    /* renamed from: a, reason: collision with root package name */
    public final String f13467a;

    x1(String str) {
        this.f13467a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f13467a;
    }
}
