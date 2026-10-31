package o9;

import android.view.View;

/* loaded from: classes2.dex */
public final class j4 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79923a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f79924b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Runnable f79925c;

    public /* synthetic */ j4(View view, Runnable runnable, int i5) {
        this.f79923a = i5;
        this.f79924b = view;
        this.f79925c = runnable;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f79923a) {
            case 0:
                View view = this.f79924b;
                if (view != null) {
                    view.setVisibility(0);
                }
                Runnable runnable = this.f79925c;
                if (runnable != null) {
                    runnable.run();
                    break;
                }
                break;
            default:
                View view2 = this.f79924b;
                if (view2 != null) {
                    view2.setVisibility(0);
                }
                Runnable runnable2 = this.f79925c;
                if (runnable2 != null) {
                    runnable2.run();
                    break;
                }
                break;
        }
    }
}
