package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum ut implements b.e5 {
    DOWNLOADABLE(0),
    DOWNLOADED(1);


    /* renamed from: a, reason: collision with root package name */
    public final int f10476a;

    ut(int i5) {
        this.f10476a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f10476a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(ut.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f10476a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
