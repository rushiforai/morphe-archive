package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum a60 implements b.e5 {
    UNKNOWN(0),
    PHISHING_INTERSTITIAL(1),
    CLIENT_SIDE_PHISHING_INTERSTITIAL(2),
    MALWARE_INTERSTITIAL(3),
    UWS_INTERSTITIAL(4),
    BILLING_INTERSTITIAL(5),
    BINARY_MALWARE_DOWNLOAD_WARNING(6);


    /* renamed from: a, reason: collision with root package name */
    public final int f861a;

    a60(int i5) {
        this.f861a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f861a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(a60.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f861a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
