package i30;

/* loaded from: classes4.dex */
public final class s implements j30.e {

    /* renamed from: a, reason: collision with root package name */
    public Object f61337a;

    @Override // j30.e
    public void onCancel() {
        synchronized (((u) ((c10.a) this.f61337a).f19149c)) {
            ((u) ((c10.a) this.f61337a).f19149c).notifyAll();
        }
    }
}
