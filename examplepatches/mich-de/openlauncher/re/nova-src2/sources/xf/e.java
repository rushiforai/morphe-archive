package xf;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.view.Display;

/* loaded from: classes3.dex */
public abstract class e {
    public static boolean a(Context context) {
        DisplayManager displayManager = (DisplayManager) context.getSystemService("display");
        Display display = displayManager != null ? displayManager.getDisplay(0) : null;
        if (display != null && display.isHdr()) {
            for (int i5 : display.getHdrCapabilities().getSupportedHdrTypes()) {
                if (i5 == 1) {
                    return true;
                }
            }
        }
        return false;
    }
}
