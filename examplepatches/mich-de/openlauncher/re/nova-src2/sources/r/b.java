package r;

import androidx.appcompat.widget.ActionBarOverlayLayout;

/* loaded from: classes2.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84669a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ActionBarOverlayLayout f84670b;

    public /* synthetic */ b(ActionBarOverlayLayout actionBarOverlayLayout, int i5) {
        this.f84669a = i5;
        this.f84670b = actionBarOverlayLayout;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f84669a) {
            case 0:
                ActionBarOverlayLayout actionBarOverlayLayout = this.f84670b;
                actionBarOverlayLayout.h();
                actionBarOverlayLayout.f13737v = actionBarOverlayLayout.f13721d.animate().translationY(0.0f).setListener(actionBarOverlayLayout.f13738w);
                break;
            default:
                ActionBarOverlayLayout actionBarOverlayLayout2 = this.f84670b;
                actionBarOverlayLayout2.h();
                actionBarOverlayLayout2.f13737v = actionBarOverlayLayout2.f13721d.animate().translationY(-actionBarOverlayLayout2.f13721d.getHeight()).setListener(actionBarOverlayLayout2.f13738w);
                break;
        }
    }
}
