package a5;

import android.view.WindowInsets;

/* loaded from: classes.dex */
public abstract class g2 {
    public static int a(int i5) {
        int iStatusBars;
        int i11 = 0;
        for (int i12 = 1; i12 <= 256; i12 <<= 1) {
            if ((i5 & i12) != 0) {
                if (i12 == 1) {
                    iStatusBars = WindowInsets.Type.statusBars();
                } else if (i12 == 2) {
                    iStatusBars = WindowInsets.Type.navigationBars();
                } else if (i12 == 4) {
                    iStatusBars = WindowInsets.Type.captionBar();
                } else if (i12 == 8) {
                    iStatusBars = WindowInsets.Type.ime();
                } else if (i12 == 16) {
                    iStatusBars = WindowInsets.Type.systemGestures();
                } else if (i12 == 32) {
                    iStatusBars = WindowInsets.Type.mandatorySystemGestures();
                } else if (i12 == 64) {
                    iStatusBars = WindowInsets.Type.tappableElement();
                } else if (i12 == 128) {
                    iStatusBars = WindowInsets.Type.displayCutout();
                }
                i11 |= iStatusBars;
            }
        }
        return i11;
    }
}
