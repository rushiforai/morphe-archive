package com.bytedance.sdk.openadsdk.ry;

import android.content.Context;
import android.media.AudioManager;
import com.bytedance.sdk.openadsdk.utils.DeviceUtils;

/* loaded from: classes2.dex */
public class jc {
    private final AudioManager ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f26991zb = -1;
    private boolean sya = false;

    public jc(Context context) {
        this.ycx = (AudioManager) context.getApplicationContext().getSystemService("audio");
    }

    public int ycx() {
        return this.f26991zb;
    }

    public void ycx(boolean z11) {
        ycx(z11, false);
    }

    public void ycx(boolean z11, boolean z12) {
        if (this.ycx == null) {
            return;
        }
        int i5 = 0;
        if (z11) {
            int iUl = DeviceUtils.ul();
            if (iUl != 0) {
                this.f26991zb = iUl;
            } else if (!z12) {
                return;
            }
            ycx(3, 0, 0);
            this.sya = true;
            return;
        }
        int iJw = this.f26991zb;
        if (iJw == 0) {
            iJw = DeviceUtils.jw() / 15;
        } else {
            if (iJw == -1) {
                if (!z12) {
                    return;
                } else {
                    iJw = DeviceUtils.jw() / 15;
                }
            }
            this.f26991zb = -1;
            ycx(3, iJw, i5);
            this.sya = true;
        }
        i5 = 1;
        this.f26991zb = -1;
        ycx(3, iJw, i5);
        this.sya = true;
    }

    private void ycx(int i5, int i11, int i12) {
        try {
            this.ycx.setStreamVolume(i5, i11, i12);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4YCrCFI+iibBq4=", "beEhgA65Ss+BRNBYoxOzLUn4KIc=", "SOs5pheubMaNfNhRmRyl", 88);
        }
    }
}
