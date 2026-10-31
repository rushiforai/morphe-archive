package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum pc2 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    FILL_DISABLED_REASON_UNKNOWN(0),
    FILL_DISABLED_REASON_NO_CAPACITY(1),
    FILL_DISABLED_REASON_CONSENT_NOT_ALLOWED(2),
    FILL_DISABLED_REASON_WEB_PROPERTY_DISABLED(3),
    FILL_DISABLED_REASON_CELLULAR_NETWORK(4),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f8166a;

    pc2(int i5) {
        this.f8166a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f8166a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(pc2.class, "<");
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
