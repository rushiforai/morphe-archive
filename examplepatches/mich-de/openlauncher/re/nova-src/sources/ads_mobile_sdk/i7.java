package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum i7 implements b.e5 {
    UNKNOWN_HOST_TYPE(0),
    GMA(1),
    YOUTUBE(2),
    GPAY(3),
    IMA(4),
    PAL(5),
    MAPS(6),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f4655a;

    i7(int i5) {
        this.f4655a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f4655a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(i7.class, "<");
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
