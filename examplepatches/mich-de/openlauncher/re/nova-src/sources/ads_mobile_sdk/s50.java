package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum s50 implements b.e5 {
    SAFE_OR_OTHER(0),
    MALWARE(1),
    PHISHING(2),
    UNWANTED(3),
    BILLING(4);


    /* renamed from: a, reason: collision with root package name */
    public final int f9420a;

    s50(int i5) {
        this.f9420a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f9420a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(s50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f9420a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
