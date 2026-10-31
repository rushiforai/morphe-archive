package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum bw0 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_ADMOB(0),
    SCAR_REQUEST_TYPE_UNSPECIFIED(-1),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_INBOUND_MEDIATION(1),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_GBID(2),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_GOLDENEYE(3),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_YAVIN(4),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_UNITY(5),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_PAW(6),
    /* JADX INFO: Fake field, exist only in values array */
    SCAR_REQUEST_TYPE_GUILDER(7),
    SCAR_REQUEST_TYPE_GAM_S2S(8),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f1591a;

    bw0(int i5) {
        this.f1591a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f1591a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(bw0.class, "<");
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
