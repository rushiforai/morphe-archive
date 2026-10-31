package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum vs implements b.e5 {
    NONE(0),
    GZIP(1),
    BROTLI(2),
    UNKNOWN(3);


    /* renamed from: a, reason: collision with root package name */
    public final int f10888a;

    vs(int i5) {
        this.f10888a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f10888a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(vs.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f10888a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
