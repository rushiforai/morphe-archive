package k40;

import com.vungle.ads.internal.presenter.r;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71098a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f71099b;

    public /* synthetic */ a(r rVar, int i5) {
        this.f71098a = i5;
        this.f71099b = rVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f71098a) {
            case 0:
                r.c(this.f71099b);
                break;
            case 1:
                r.e(this.f71099b);
                break;
            default:
                r.d(this.f71099b);
                break;
        }
    }
}
