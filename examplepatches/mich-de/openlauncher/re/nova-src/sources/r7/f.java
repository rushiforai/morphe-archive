package r7;

/* loaded from: classes2.dex */
public final /* synthetic */ class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85575a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f85576b;

    public /* synthetic */ f(g gVar, int i5) {
        this.f85575a = i5;
        this.f85576b = gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f85575a) {
            case 0:
                g.b(this.f85576b);
                break;
            default:
                g.c(this.f85576b);
                break;
        }
    }
}
