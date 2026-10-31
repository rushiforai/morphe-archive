package ads_mobile_sdk;

/* loaded from: classes2.dex */
public enum qh0 implements b.e5 {
    AVAILABLE_MEMORY_TIER_UNKNOWN(0),
    AVAILABLE_MEMORY_TIER_INVALID_DATA_SOURCE(1),
    AVAILABLE_MEMORY_TIER_EXTREME_LOW(2),
    AVAILABLE_MEMORY_TIER_VERY_LOW(3),
    AVAILABLE_MEMORY_TIER_LOW(4),
    AVAILABLE_MEMORY_TIER_MID(5),
    AVAILABLE_MEMORY_TIER_MID_PLUS(6),
    AVAILABLE_MEMORY_TIER_HIGH(7),
    AVAILABLE_MEMORY_TIER_VERY_HIGH(8),
    AVAILABLE_MEMORY_TIER_EXTREME_HIGH(9),
    /* JADX INFO: Fake field, exist only in values array */
    AVAILABLE_MEMORY_TIER_UNPARSABLE(255),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f8667a;

    qh0(int i5) {
        this.f8667a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f8667a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("<");
        sb2.append(qh0.class.getName());
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
