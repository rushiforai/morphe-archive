package xm;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f96143a;

    public k(l lVar) {
        this.f96143a = lVar;
    }

    public final void a() {
        l lVar = this.f96143a;
        synchronized (lVar) {
            lVar.f96149d = true;
        }
        this.f96143a.g();
    }
}
