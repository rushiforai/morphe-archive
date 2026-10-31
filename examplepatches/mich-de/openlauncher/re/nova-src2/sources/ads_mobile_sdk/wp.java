package ads_mobile_sdk;

/* loaded from: classes2.dex */
public enum wp implements b.e5 {
    UNKNOWN(0),
    COLLECTED_BIDDING_SIGNAL(1);


    /* renamed from: a, reason: collision with root package name */
    public final int f11357a;

    wp(int i5) {
        this.f11357a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f11357a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "<" + wp.class.getName() + '@' + Integer.toHexString(System.identityHashCode(this)) + " number=" + this.f11357a + " name=" + name() + '>';
    }
}
