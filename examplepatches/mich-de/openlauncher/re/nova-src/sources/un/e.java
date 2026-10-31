package un;

/* loaded from: classes3.dex */
public enum e {
    DEFINED_BY_JAVASCRIPT("definedByJavaScript"),
    HTML_DISPLAY("htmlDisplay"),
    /* JADX INFO: Fake field, exist only in values array */
    NATIVE_DISPLAY("nativeDisplay"),
    VIDEO("video"),
    /* JADX INFO: Fake field, exist only in values array */
    AUDIO("audio");


    /* renamed from: a, reason: collision with root package name */
    public final String f91379a;

    e(String str) {
        this.f91379a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f91379a;
    }
}
