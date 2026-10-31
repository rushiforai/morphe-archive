package kb0;

import android.os.Handler;
import android.os.Looper;
import ib0.g;
import pb0.i;
import rb0.e;

/* loaded from: classes5.dex */
public final class d extends vh.a {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f71322f = 0;

    /* renamed from: g, reason: collision with root package name */
    public final Object f71323g;

    public d(Looper looper) {
        this.f71323g = new Handler(looper);
    }

    @Override // vh.a
    public final g q() {
        switch (this.f71322f) {
            case 0:
                return new b((Handler) this.f71323g);
            default:
                return new i((e) this.f71323g);
        }
    }

    public d(e eVar) {
        this.f71323g = eVar;
    }
}
