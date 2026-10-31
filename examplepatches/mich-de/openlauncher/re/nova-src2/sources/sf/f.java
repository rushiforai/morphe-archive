package sf;

/* loaded from: classes3.dex */
public final class f implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final int f87395a;

    /* renamed from: b, reason: collision with root package name */
    public final b f87396b;

    public f(int i5, b bVar) {
        this.f87395a = i5;
        this.f87396b = bVar;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return Integer.compare(this.f87395a, ((f) obj).f87395a);
    }
}
