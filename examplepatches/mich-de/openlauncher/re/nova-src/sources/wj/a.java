package wj;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94397a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f94398b;

    public /* synthetic */ a(c cVar, int i5) {
        this.f94397a = i5;
        this.f94398b = cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f94397a) {
            case 0:
                c cVar = this.f94398b;
                if (cVar.f94405d > 0) {
                    SystemClock.uptimeMillis();
                }
                cVar.setVisibility(0);
                break;
            default:
                c.a(this.f94398b);
                break;
        }
    }
}
