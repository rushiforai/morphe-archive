package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum uv0 implements b.e5 {
    /* JADX INFO: Fake field, exist only in values array */
    NOT_CACHEABLE(0),
    EXPIRED(1),
    CACHED(2),
    UPDATING(3),
    STALE(4),
    UNRECOGNIZED(-1);


    /* renamed from: a, reason: collision with root package name */
    public final int f10498a;

    uv0(int i5) {
        this.f10498a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        if (this != UNRECOGNIZED) {
            return this.f10498a;
        }
        byte[] bArr = rb1.f9048a;
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(uv0.class, "<");
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
