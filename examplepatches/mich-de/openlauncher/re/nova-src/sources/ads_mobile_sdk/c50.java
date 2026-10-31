package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum c50 implements b.e5 {
    TYPE_UNKNOWN(0),
    TYPE_CREATIVE(1);


    /* renamed from: a, reason: collision with root package name */
    public final int f1665a;

    c50(int i5) {
        this.f1665a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f1665a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(c50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f1665a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
