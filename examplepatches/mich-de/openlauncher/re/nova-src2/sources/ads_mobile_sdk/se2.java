package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum se2 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    MISS_REASON_UNKNOWN(0),
    MISS_REASON_EMPTY(1),
    MISS_REASON_EXPIRED(2),
    MISS_REASON_CORRUPTED(3),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f9552a;

    se2(int i5) {
        this.f9552a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f9552a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(se2.class, "<");
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
