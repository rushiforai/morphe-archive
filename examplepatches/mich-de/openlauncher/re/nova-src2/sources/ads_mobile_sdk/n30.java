package ads_mobile_sdk;

/* loaded from: classes2.dex */
public enum n30 implements b.e5 {
    UNSPECIFIED(0),
    TAILORED_WARNING_CT_BASE(1),
    TAILORED_WARNING_CT(2),
    TAILORED_WARNING_CT_ACCOUNT_INFO(3),
    TAILORED_WARNING_SUSPICIOUS_BASE(4),
    TAILORED_WARNING_SUSPICIOUS(5);


    /* renamed from: a, reason: collision with root package name */
    public final int f7419a;

    n30(int i5) {
        this.f7419a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f7419a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "<" + n30.class.getName() + '@' + Integer.toHexString(System.identityHashCode(this)) + " number=" + this.f7419a + " name=" + name() + '>';
    }
}
