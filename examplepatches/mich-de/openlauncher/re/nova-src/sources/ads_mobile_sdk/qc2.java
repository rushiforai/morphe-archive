package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum qc2 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    CLEAR_REASON_UNKNOWN(0),
    CLEAR_REASON_CONSENT_DENIED(1),
    CLEAR_REASON_CONSENT_ALLOWLIST_CHANGED(2),
    CLEAR_REASON_CONSENT_HASH_CHANGED(3),
    CLEAR_REASON_PACKAGE_NAME_CHANGE(4),
    CLEAR_REASON_VERSION_CODE_CHANGE(5),
    CLEAR_REASON_DEVICE_MODEL_CHANGE(6),
    CLEAR_REASON_API_VERSION_CHANGE(7),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f8588a;

    qc2(int i5) {
        this.f8588a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f8588a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(qc2.class, "<");
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
