package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class n13 implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Runnable f7397a;

    /* renamed from: b, reason: collision with root package name */
    public final long f7398b;

    public n13(Runnable runnable, long j11) {
        this.f7397a = runnable;
        this.f7398b = j11;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Long.compare(this.f7398b, ((n13) obj).f7398b);
    }
}
