package o80;

/* loaded from: classes5.dex */
public final class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79725a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f79726b;

    public /* synthetic */ f(g gVar, int i5) {
        this.f79725a = i5;
        this.f79726b = gVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f79725a) {
            case 0:
                if (!i.f()) {
                    g gVar = this.f79726b;
                    i.d(gVar.f79727a, gVar.f79728b);
                    break;
                }
                break;
            default:
                if (!i.f()) {
                    g gVar2 = this.f79726b;
                    i.d(gVar2.f79727a, gVar2.f79728b);
                    break;
                }
                break;
        }
    }
}
