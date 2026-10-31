package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum ft implements b.e5 {
    BLOB_TYPE_UNKNOWN(0),
    BLOB_TYPE_DEFAULT(1),
    BLOB_TYPE_JAR(2),
    BLOB_TYPE_WEB_SUGGEST(3),
    BLOB_TYPE_BRAIN_SUGGEST(4);


    /* renamed from: a, reason: collision with root package name */
    public final int f3498a;

    ft(int i5) {
        this.f3498a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f3498a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(ft.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f3498a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
