package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum pc implements b.e5 {
    FALLBACK_NONE(0),
    FALLBACK_TIMEOUT(1);


    /* renamed from: a, reason: collision with root package name */
    public final int f8159a;

    pc(int i5) {
        this.f8159a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f8159a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(pc.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f8159a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
