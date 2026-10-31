package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum dt implements b.e5 {
    BLOB_STATE_AVAILABLE(1),
    BLOB_STATE_INACTIVE(2),
    BLOB_STATE_ACTIVE(3),
    BLOB_STATE_FAILED(4);


    /* renamed from: a, reason: collision with root package name */
    public final int f2615a;

    dt(int i5) {
        this.f2615a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f2615a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(dt.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f2615a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
