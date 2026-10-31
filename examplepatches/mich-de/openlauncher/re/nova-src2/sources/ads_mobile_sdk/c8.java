package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum c8 implements b.e5 {
    ADSHIELD_VERSION_UNSPECIFIED(0),
    ADSHIELD_VERSION_1(1),
    ADSHIELD_VERSION_2(2),
    ADSHIELD_VERSION_3(3),
    ADSHIELD_VERSION_3_STATIC_PROGRAM(4);


    /* renamed from: a, reason: collision with root package name */
    public final int f1718a;

    c8(int i5) {
        this.f1718a = i5;
    }

    public static c8 a(int i5) {
        if (i5 == 0) {
            return ADSHIELD_VERSION_UNSPECIFIED;
        }
        if (i5 == 1) {
            return ADSHIELD_VERSION_1;
        }
        if (i5 == 2) {
            return ADSHIELD_VERSION_2;
        }
        if (i5 == 3) {
            return ADSHIELD_VERSION_3;
        }
        if (i5 != 4) {
            return null;
        }
        return ADSHIELD_VERSION_3_STATIC_PROGRAM;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f1718a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(c8.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f1718a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
