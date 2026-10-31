package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

/* renamed from: com.facebook.ads.redexgen.X.qO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnSystemUiVisibilityChangeListenerC2412qO implements View.OnSystemUiVisibilityChangeListener {
    public int A00;
    public Window A01;
    public final View A03;
    public EnumC2411qN A02 = EnumC2411qN.A03;
    public final Runnable A04 = new G4(this);

    public ViewOnSystemUiVisibilityChangeListenerC2412qO(View view) {
        this.A03 = view;
        this.A03.setOnSystemUiVisibilityChangeListener(this);
    }

    private void A00(int i5, boolean z11) {
        if (this.A01 == null) {
            return;
        }
        WindowManager.LayoutParams attributes = this.A01.getAttributes();
        if (z11) {
            attributes.flags |= i5;
        } else {
            attributes.flags &= ~i5;
        }
        this.A01.setAttributes(attributes);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02(boolean z11) {
        if (EnumC2411qN.A03.equals(this.A02)) {
            return;
        }
        int i5 = 3840;
        if (!z11) {
            i5 = 3840 | 7;
        }
        Handler handler = this.A03.getHandler();
        if (handler != null && z11) {
            handler.removeCallbacks(this.A04);
            handler.postDelayed(this.A04, 2000L);
        }
        this.A03.setSystemUiVisibility(i5);
    }

    public final void A03() {
        this.A01 = null;
    }

    public final void A04(Window window) {
        this.A01 = window;
    }

    public final void A05(EnumC2411qN enumC2411qN) {
        this.A02 = enumC2411qN;
        switch (this.A02.ordinal()) {
            case 1:
                A00(67108864, true);
                A00(134217728, true);
                A02(false);
                break;
            default:
                A00(67108864, false);
                A00(134217728, false);
                this.A03.setSystemUiVisibility(0);
                break;
        }
    }

    @Override // android.view.View.OnSystemUiVisibilityChangeListener
    public final void onSystemUiVisibilityChange(int i5) {
        int diff = this.A00 ^ i5;
        this.A00 = i5;
        if ((diff & 2) != 0) {
            int diff2 = i5 & 2;
            if (diff2 == 0) {
                A02(true);
            }
        }
    }
}
