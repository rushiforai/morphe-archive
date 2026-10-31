package ads_mobile_sdk;

/* loaded from: classes2.dex */
public enum rh0 implements b.e5 {
    PROCESSOR_TIER_UNKNOWN(0),
    PROCESSOR_TIER_INVALID_DATA_SOURCE(1),
    PROCESSOR_TIER_EXTREME_LOW(2),
    PROCESSOR_TIER_LOW(3),
    PROCESSOR_TIER_MID(4),
    PROCESSOR_TIER_MID_PLUS(5),
    PROCESSOR_TIER_HIGH(6),
    PROCESSOR_TIER_EXTREME_HIGH(7),
    /* JADX INFO: Fake field, exist only in values array */
    PROCESSOR_TIER_UNPARSABLE(255),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f9190a;

    rh0(int i5) {
        this.f9190a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f9190a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("<");
        sb2.append(rh0.class.getName());
        sb2.append('@');
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        if (this != UNRECOGNIZED) {
            sb2.append(" number=");
            sb2.append(getNumber());
        }
        sb2.append(" name=");
        sb2.append(name());
        sb2.append('>');
        return sb2.toString();
    }
}
