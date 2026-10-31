package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum n50 implements b.e5 {
    SAFE_BROWSING_URL_API_TYPE_UNSPECIFIED(0),
    PVER3_NATIVE(1),
    PVER4_NATIVE(2),
    ANDROID_SAFETYNET(3),
    FLYWHEEL(4),
    REAL_TIME(5),
    PVER5_NATIVE_REAL_TIME(6),
    ANDROID_SAFEBROWSING_REAL_TIME(7),
    ANDROID_SAFEBROWSING(8),
    CLIENT_SIDE_DETECTION(9),
    GLIC(10),
    PVER5_NATIVE_LOCAL_BLOCKLIST(11);


    /* renamed from: a, reason: collision with root package name */
    public final int f7446a;

    n50(int i5) {
        this.f7446a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f7446a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(n50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f7446a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
