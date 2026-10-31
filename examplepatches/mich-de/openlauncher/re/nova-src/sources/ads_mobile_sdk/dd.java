package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum dd implements b.e5 {
    NETWORK_INTERFACE_UNSPECIFIED(0),
    NETWORK_INTERFACE_NOT_SET(1),
    NETWORK_INTERFACE_ERROR(2),
    NETWORK_INTERFACE_WIFI(3),
    NETWORK_INTERFACE_CELLULAR(4),
    NETWORK_INTERFACE_ETHERNET(5),
    NETWORK_INTERFACE_LOOPBACK(6),
    NETWORK_INTERFACE_OTHER(7),
    NETWORK_INTERFACE_NO_CONNECTION(8);


    /* renamed from: a, reason: collision with root package name */
    public final int f2450a;

    dd(int i5) {
        this.f2450a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f2450a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(dd.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f2450a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
