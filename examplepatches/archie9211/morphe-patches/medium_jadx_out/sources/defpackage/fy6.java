package defpackage;

import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fy6 implements f03, vbb {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ fy6(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.vbb
    public Object a(jva jvaVar) throws Throwable {
        Object objT = bgf.t((wx6) this.b, jvaVar);
        return objT == tb2.COROUTINE_SUSPENDED ? objT : c1e.a;
    }

    @Override // defpackage.vbb
    public void c() {
        ((wx6) this.b).b(this);
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
        switch (this.a) {
            case 0:
                break;
            default:
                ((va6) this.c).m(null);
                break;
        }
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
        switch (this.a) {
            case 0:
                gy6 gy6Var = (gy6) this.b;
                if (gy6Var.h) {
                    gy6Var.h = false;
                    gy6Var.i.b((RecyclerView) this.c);
                }
                break;
        }
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
        int i = this.a;
    }

    @Override // defpackage.vbb
    public void start() {
        ((wx6) this.b).a(this);
    }

    @Override // defpackage.vbb
    public void b() {
    }

    private final void d(iy6 iy6Var) {
    }

    private final void e(iy6 iy6Var) {
    }

    private final void g(iy6 iy6Var) {
    }

    private final void h(iy6 iy6Var) {
    }

    private final void i(iy6 iy6Var) {
    }

    private final void j(iy6 iy6Var) {
    }

    private final void k(iy6 iy6Var) {
    }

    private final void l(iy6 iy6Var) {
    }

    private final void m(iy6 iy6Var) {
    }

    private final void n(iy6 iy6Var) {
    }
}
