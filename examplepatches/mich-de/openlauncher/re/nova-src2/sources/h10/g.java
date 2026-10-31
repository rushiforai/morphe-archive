package h10;

import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: classes4.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58879a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f58880b;

    public /* synthetic */ g(View view, int i5) {
        this.f58879a = i5;
        this.f58880b = view;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f58879a) {
            case 0:
                View view = this.f58880b;
                Drawable background = view.getBackground();
                if (background != null) {
                    background.setHotspot(view.getWidth() / 2.0f, view.getHeight() / 2.0f);
                }
                view.setPressed(true);
                view.setPressed(false);
                view.postDelayed(new g(view, 1), 300L);
                break;
            default:
                View view2 = this.f58880b;
                Drawable background2 = view2.getBackground();
                if (background2 != null) {
                    background2.setHotspot(view2.getWidth() / 2.0f, view2.getHeight() / 2.0f);
                }
                view2.setPressed(true);
                view2.setPressed(false);
                break;
        }
    }
}
