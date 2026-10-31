package m7;

/* loaded from: classes2.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final String f76029a;

    /* renamed from: b, reason: collision with root package name */
    public final String f76030b;

    /* renamed from: c, reason: collision with root package name */
    public final je.f f76031c;

    public n(String str, String str2, je.f fVar) {
        if (str2.isEmpty() || str2.charAt(0) != '/') {
            throw new IllegalArgumentException("Path should start with a slash '/'.");
        }
        if (!str2.endsWith("/")) {
            throw new IllegalArgumentException("Path should end with a slash '/'");
        }
        this.f76029a = str;
        this.f76030b = str2;
        this.f76031c = fVar;
    }
}
