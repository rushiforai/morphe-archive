package com.bytedance.sdk.openadsdk.core;

import android.graphics.Rect;
import android.view.View;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ifb {
    private static int sya(View view, int i5) {
        if (i5 == 3) {
            return dc.lt(view.getContext().getApplicationContext()) / 2;
        }
        return 20;
    }

    private static boolean ycx(View view, int i5) {
        float fYcx = ycx(view);
        return fYcx > 0.0f && fYcx >= ((float) i5) / 100.0f;
    }

    private static boolean zb(View view) {
        return view != null && view.isShown();
    }

    public static float ycx(View view) {
        if (view != null) {
            try {
                if (view.getVisibility() == 0 && view.getParent() != null) {
                    if (!view.getGlobalVisibleRect(new Rect())) {
                        return -1.0f;
                    }
                    long jHeight = r1.height() * r1.width();
                    long height = view.getHeight() * view.getWidth();
                    if (height <= 0) {
                        return -1.0f;
                    }
                    return jHeight / height;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "bec+nAG1Zc6UU/RViRKrLUk=", "XOs5owqvYMWMT/ZPiRA=", 64);
            }
        }
        return -1.0f;
    }

    private static int zb(View view, int i5) {
        if (i5 == 3) {
            return (int) (dc.dj(view.getContext().getApplicationContext()) * 0.7d);
        }
        return 20;
    }

    private static int zb(View view, int i5, int i11, boolean z11) throws Throwable {
        if (view.getWindowVisibility() != 0) {
            return 4;
        }
        if (!zb(view)) {
            return 1;
        }
        if (ycx(view, i11, z11)) {
            return !ycx(view, i5) ? 3 : 0;
        }
        return 6;
    }

    private static boolean ycx(View view, int i5, boolean z11) {
        return (i5 == 1 && z11) ? view.getWidth() > 0 && view.getHeight() > 0 : view.getWidth() >= zb(view, i5) && view.getHeight() >= sya(view, i5);
    }

    public static boolean ycx(View view, int i5, int i11, boolean z11) {
        if (i11 == 1) {
            while (view != null) {
                try {
                    if (view.getVisibility() != 0) {
                        return false;
                    }
                    if ((view instanceof com.bytedance.sdk.openadsdk.core.jc.thx) || (view instanceof com.bytedance.sdk.openadsdk.core.dj.dj)) {
                        break;
                    }
                    view = (View) view.getParent();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "bec+nAG1Zc6UU/RViRKrLUk=", "Uv0enQyr", 147);
                    return false;
                }
            }
            if (z11) {
                i5 = 0;
            }
        }
        return zb(view, i5, i11, z11) == 0;
    }
}
