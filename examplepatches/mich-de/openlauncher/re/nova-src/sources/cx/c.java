package cx;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48408a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f48409b;

    public /* synthetic */ c(d dVar, int i5) {
        this.f48408a = i5;
        this.f48409b = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f48408a) {
            case 0:
                this.f48409b.f48411b.d();
                break;
            default:
                this.f48409b.f48411b.h();
                break;
        }
    }
}
