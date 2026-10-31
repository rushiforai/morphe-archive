package d4;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public Object f48966a;

    /* renamed from: b, reason: collision with root package name */
    public k f48967b;

    /* renamed from: c, reason: collision with root package name */
    public l f48968c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f48969d;

    public final void a(Object obj) {
        this.f48969d = true;
        k kVar = this.f48967b;
        if (kVar == null || !kVar.f48972b.m(obj)) {
            return;
        }
        this.f48966a = null;
        this.f48967b = null;
        this.f48968c = null;
    }

    public final void b(Throwable th2) {
        this.f48969d = true;
        k kVar = this.f48967b;
        if (kVar == null || !kVar.f48972b.n(th2)) {
            return;
        }
        this.f48966a = null;
        this.f48967b = null;
        this.f48968c = null;
    }

    public final void finalize() {
        l lVar;
        k kVar = this.f48967b;
        if (kVar != null) {
            j jVar = kVar.f48972b;
            if (!jVar.isDone()) {
                jVar.n(new cl.e("The completer object was garbage collected - this future would otherwise never complete. The tag was: " + this.f48966a, 4));
            }
        }
        if (this.f48969d || (lVar = this.f48968c) == null) {
            return;
        }
        lVar.m(null);
    }
}
