package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum ph0 implements b.e5 {
    TIER_UNKNOWN(0),
    TIER_INVALID_DATA_SOURCE(1),
    TIER_EXTREME_LOW(2),
    TIER_VERY_LOW(3),
    TIER_LOW(4),
    TIER_MID(5),
    TIER_MID_PLUS(6),
    TIER_HIGH(7),
    TIER_VERY_HIGH(8),
    TIER_EXTREME_HIGH(9),
    /* JADX INFO: Fake field, exist only in values array */
    TIER_UNPARSABLE(255),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f8281a;

    ph0(int i5) {
        this.f8281a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f8281a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(ph0.class, "<");
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
