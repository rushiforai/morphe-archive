package ads_mobile_sdk;

/* loaded from: classes.dex */
public enum v50 implements b.e5 {
    REQUEST_DESTINATION_UNSPECIFIED(0),
    EMPTY(1),
    AUDIO(2),
    AUDIO_WORKLET(3),
    DOCUMENT(4),
    EMBED(5),
    FONT(6),
    FRAME(7),
    IFRAME(8),
    IMAGE(9),
    MANIFEST(10),
    OBJECT(11),
    PAINT_WORKLET(12),
    REPORT(13),
    SCRIPT(14),
    SERVICE_WORKER(15),
    SHARED_WORKER(16),
    STYLE(17),
    TRACK(18),
    VIDEO(19),
    WEB_BUNDLE(20),
    WORKER(21),
    XSLT(22),
    FENCED_FRAME(23),
    WEB_IDENTITY(24),
    DICTIONARY(25),
    SPECULATION_RULES(26),
    JSON(27),
    SHARED_STORAGE_WORKLET(28);


    /* renamed from: a, reason: collision with root package name */
    public final int f10599a;

    v50(int i5) {
        this.f10599a = i5;
    }

    @Override // b.e5
    public final int getNumber() {
        return this.f10599a;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sbM = a80.m.m(v50.class, "<");
        sbM.append(Integer.toHexString(System.identityHashCode(this)));
        sbM.append(" number=");
        sbM.append(this.f10599a);
        sbM.append(" name=");
        sbM.append(name());
        sbM.append('>');
        return sbM.toString();
    }
}
