package e7;

/* loaded from: classes.dex */
public final class g extends RuntimeException {

    /* renamed from: a, reason: collision with root package name */
    public final int f52222a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f52223b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(int i5, Throwable th2) {
        super(th2);
        fq.c.o(i5, "callbackName");
        this.f52222a = i5;
        this.f52223b = th2;
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return this.f52223b;
    }
}
