package tb0;

import ib0.e;
import ib0.h;

/* loaded from: classes5.dex */
public final class c extends h {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f88951e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final e f88952f;

    public c(h hVar) {
        super(hVar, true);
        this.f88952f = new b(hVar);
    }

    @Override // ib0.e
    public final void c(Object obj) {
        switch (this.f88951e) {
            case 0:
                ((b) this.f88952f).c(obj);
                break;
            default:
                ((h) this.f88952f).c(obj);
                break;
        }
    }

    @Override // ib0.e
    public final void onCompleted() {
        switch (this.f88951e) {
            case 0:
                ((b) this.f88952f).onCompleted();
                break;
            default:
                ((h) this.f88952f).onCompleted();
                break;
        }
    }

    @Override // ib0.e
    public final void onError(Throwable th2) {
        switch (this.f88951e) {
            case 0:
                ((b) this.f88952f).onError(th2);
                break;
            default:
                ((h) this.f88952f).onError(th2);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(h hVar, h hVar2) {
        super(hVar, true);
        this.f88952f = hVar2;
    }
}
