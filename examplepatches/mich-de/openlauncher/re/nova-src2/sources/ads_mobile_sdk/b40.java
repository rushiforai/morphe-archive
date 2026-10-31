package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum b40 implements b.e5 {
    ACTION_UNSPECIFIED(0),
    PROCEED(1),
    DISCARD(2),
    KEEP(3),
    CLOSE(4),
    CANCEL(5),
    DISMISS(6),
    BACK(7),
    OPEN_SUBPAGE(8),
    PROCEED_DEEP_SCAN(9),
    OPEN_LEARN_MORE_LINK(10);


    /* renamed from: a, reason: collision with root package name */
    public final int f1260a;

    b40(int i5) {
        this.f1260a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f1260a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(b40.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f1260a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
