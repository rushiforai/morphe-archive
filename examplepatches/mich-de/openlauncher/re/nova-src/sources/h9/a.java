package h9;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59542a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.amplitude.android.sessionreplay.a f59543b;

    public /* synthetic */ a(com.amplitude.android.sessionreplay.a aVar, int i5) {
        this.f59542a = i5;
        this.f59543b = aVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f59542a) {
            case 0:
                com.amplitude.android.sessionreplay.a.d(this.f59543b);
                break;
            case 1:
                com.amplitude.android.sessionreplay.a.e(this.f59543b);
                break;
            default:
                com.amplitude.android.sessionreplay.a.c(this.f59543b);
                break;
        }
    }
}
