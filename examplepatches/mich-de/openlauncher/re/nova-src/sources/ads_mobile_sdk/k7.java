package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum k7 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    UNSPECIFIED(0),
    ADSHIELD(15),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f5534a;

    k7(int i5) {
        this.f5534a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f5534a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(k7.class, "<");
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
