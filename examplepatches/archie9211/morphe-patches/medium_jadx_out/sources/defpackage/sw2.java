package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.hardware.display.DisplayManager;
import android.view.Display;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sw2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Context b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sw2(Context context, int i) {
        super(0);
        this.a = i;
        this.b = context;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Context context = this.b;
        switch (i) {
            case 0:
                try {
                    return Boolean.valueOf(((ActivityManager) context.getSystemService(ActivityManager.class)).isLowRamDevice());
                } catch (Exception unused) {
                    return null;
                }
            case 1:
                Object systemService = context.getSystemService("display");
                DisplayManager displayManager = systemService instanceof DisplayManager ? (DisplayManager) systemService : null;
                if (displayManager == null) {
                    return null;
                }
                Display[] displays = displayManager.getDisplays();
                displays.getClass();
                int i2 = 0;
                for (Display display : displays) {
                    if (!k80.S0(new Integer[]{1, 0}).contains(Integer.valueOf(display.getState()))) {
                        i2++;
                    }
                }
                return Integer.valueOf(i2);
            default:
                try {
                    ActivityManager activityManager = (ActivityManager) context.getSystemService(ActivityManager.class);
                    ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                    activityManager.getMemoryInfo(memoryInfo);
                    return Integer.valueOf((int) (memoryInfo.totalMem / 1048576));
                } catch (Exception unused2) {
                    return null;
                }
        }
    }
}
