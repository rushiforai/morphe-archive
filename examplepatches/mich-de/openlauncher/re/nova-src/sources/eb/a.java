package eb;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52451a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f52452b;

    public /* synthetic */ a(c cVar, int i5) {
        this.f52451a = i5;
        this.f52452b = cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f52451a) {
            case 0:
                this.f52452b.f52465k = null;
                break;
            default:
                this.f52452b.d();
                break;
        }
    }
}
