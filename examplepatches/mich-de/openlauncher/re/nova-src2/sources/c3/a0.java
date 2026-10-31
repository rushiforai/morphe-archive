package c3;

import android.view.MotionEvent;
import androidx.compose.ui.platform.AndroidComposeView;

/* loaded from: classes.dex */
public final class a0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AndroidComposeView f19205a;

    public a0(AndroidComposeView androidComposeView) {
        this.f19205a = androidComposeView;
    }

    @Override // java.lang.Runnable
    public final void run() {
        AndroidComposeView androidComposeView = this.f19205a;
        androidComposeView.removeCallbacks(this);
        MotionEvent motionEvent = androidComposeView.previousMotionEvent;
        if (motionEvent != null) {
            boolean z11 = motionEvent.getToolType(0) == 3;
            int actionMasked = motionEvent.getActionMasked();
            if (z11) {
                if (actionMasked == 10 || actionMasked == 1) {
                    return;
                }
            } else if (actionMasked == 1) {
                return;
            }
            int i5 = 7;
            if (actionMasked != 7 && actionMasked != 9) {
                i5 = 2;
            }
            AndroidComposeView androidComposeView2 = this.f19205a;
            androidComposeView2.sendSimulatedEvent(motionEvent, i5, androidComposeView2.relayoutTime, false);
        }
    }
}
