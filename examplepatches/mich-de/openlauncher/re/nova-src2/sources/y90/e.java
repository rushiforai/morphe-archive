package y90;

import ba0.x;

/* loaded from: classes5.dex */
public final class e extends da0.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97025a;

    /* renamed from: b, reason: collision with root package name */
    public final ba0.a f97026b;

    public e(int i5) {
        this.f97025a = i5;
        switch (i5) {
            case 1:
                this.f97026b = new x();
                break;
            default:
                this.f97026b = new ba0.j(1);
                break;
        }
    }

    private final void i(CharSequence charSequence) {
    }

    @Override // da0.a
    public void a(CharSequence charSequence) {
        int i5 = this.f97025a;
    }

    @Override // da0.a
    public boolean b(ba0.a aVar) {
        switch (this.f97025a) {
            case 0:
                return true;
            default:
                return super.b(aVar);
        }
    }

    @Override // da0.a
    public final ba0.a e() {
        switch (this.f97025a) {
            case 0:
                return (ba0.j) this.f97026b;
            default:
                return (x) this.f97026b;
        }
    }

    @Override // da0.a
    public boolean f() {
        switch (this.f97025a) {
            case 0:
                return true;
            default:
                return super.f();
        }
    }

    @Override // da0.a
    public final cf.c h(g gVar) {
        switch (this.f97025a) {
            case 0:
                return cf.c.a(gVar.f97032b);
            default:
                return null;
        }
    }
}
