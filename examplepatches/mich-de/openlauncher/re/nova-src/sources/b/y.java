package b;

import ads_mobile_sdk.c72;
import android.hardware.display.DisplayManager;

/* loaded from: classes2.dex */
public final class y implements DisplayManager.DisplayListener {
    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayAdded(int i5) {
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayChanged(int i5) {
        c72.f1706a.submit(new l(0));
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayRemoved(int i5) {
    }
}
