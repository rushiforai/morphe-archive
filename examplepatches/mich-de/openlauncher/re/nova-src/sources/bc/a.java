package bc;

import android.graphics.Rect;
import android.telephony.ims.ImsManager;
import android.view.WindowInsets;
import android.view.WindowMetrics;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class a {
    public static /* bridge */ /* synthetic */ ImsManager h(Object obj) {
        return (ImsManager) obj;
    }

    public static /* synthetic */ WindowMetrics j(Rect rect, WindowInsets windowInsets) {
        return new WindowMetrics(rect, windowInsets);
    }

    public static /* bridge */ /* synthetic */ Class m() {
        return ImsManager.class;
    }

    public static /* synthetic */ void p() {
    }
}
