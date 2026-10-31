package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum va1 implements b.e5 {
    UNKNOWN(0),
    OK(1),
    SERVICE_UNAVAILABLE(2),
    FEATURE_NOT_SUPPORTED(3),
    DEVELOPER_ERROR(4),
    PERMISSION_ERROR(5),
    SERVICE_DISCONNECTED(6),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f10656a;

    va1(int i5) {
        this.f10656a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f10656a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(va1.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        if (this != UNRECOGNIZED) {
            sbM.append(" number=");
            sbM.append(getNumber());
        }
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
