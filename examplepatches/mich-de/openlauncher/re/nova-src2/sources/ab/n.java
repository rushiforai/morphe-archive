package ab;

import android.widget.Advanceable;

/* loaded from: classes2.dex */
public final /* synthetic */ class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f737a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ o f738b;

    public /* synthetic */ n(o oVar, int i5) {
        this.f737a = i5;
        this.f738b = oVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f737a) {
            case 0:
                this.f738b.u();
                break;
            default:
                o oVar = this.f738b;
                Advanceable advanceableX = oVar.x();
                if (advanceableX != null) {
                    advanceableX.advance();
                }
                oVar.B();
                break;
        }
    }
}
