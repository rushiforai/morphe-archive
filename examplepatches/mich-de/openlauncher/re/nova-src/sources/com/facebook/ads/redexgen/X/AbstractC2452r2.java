package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.widget.LinearLayout;

/* renamed from: com.facebook.ads.redexgen.X.r2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2452r2 extends LinearLayout {
    public static int A00 = (int) (AbstractC2385px.A02 * 56.0f);
    public static int A01 = (int) (AbstractC2385px.A02 * 56.0f);

    public abstract void A09();

    public abstract void A0A();

    public abstract void A0B();

    public abstract void A0C(float f11, int i5);

    public abstract void A0D(C1744fN c1744fN, boolean z11);

    public abstract boolean A0E();

    public abstract int getToolbarActionMode();

    public abstract int getToolbarHeight();

    public abstract InterfaceC2451r1 getToolbarListener();

    public abstract void setAdReportingVisible(boolean z11);

    public abstract void setCTAClickListener(View.OnClickListener onClickListener);

    public abstract void setCTAClickListener(ViewOnClickListenerC0884El viewOnClickListenerC0884El);

    public abstract void setFullscreen(boolean z11);

    public abstract void setPageDetails(C1756fZ c1756fZ, String str, int i5, C1765fi c1765fi);

    public abstract void setPageDetailsVisible(boolean z11);

    public abstract void setProgress(float f11);

    public abstract void setProgressClickListener(View.OnClickListener onClickListener);

    public abstract void setProgressImage(EnumC2437qn enumC2437qn);

    public abstract void setProgressImmediate(float f11);

    public abstract void setProgressSpinnerInvisible(boolean z11);

    public abstract void setToolbarActionMessage(String str);

    public abstract void setToolbarActionMode(int i5);

    public abstract void setToolbarListener(InterfaceC2451r1 interfaceC2451r1);

    public AbstractC2452r2(Context context) {
        super(context);
    }

    public void A08() {
    }

    public Rect getRequestedMargins() {
        return null;
    }

    public void setSkipIconSuppressed(boolean z11) {
    }
}
