package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum mm1 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    OS_UNKNOWN(0),
    OS_ANDROID(1),
    /* JADX INFO: Fake field, exist only in values array */
    OS_IOS(2),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f7280a;

    mm1(int i5) {
        this.f7280a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f7280a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(mm1.class, "<");
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
