package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum h50 implements b.e5 {
    AD_RESOURCE_UNKNOWN(0),
    AD_RESOURCE_CREATIVE(1),
    AD_RESOURCE_POST_CLICK(2),
    AD_RESOURCE_AUTO_CLICK_DESTINATION(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f4218a;

    h50(int i5) {
        this.f4218a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f4218a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(h50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f4218a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
