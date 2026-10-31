package com.facebook.ads.redexgen.X;

import android.hardware.display.DisplayManager;

/* renamed from: com.facebook.ads.redexgen.X.Xu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1358Xu implements DisplayManager.DisplayListener {
    public final DisplayManager A00;
    public final /* synthetic */ C1359Xw A01;

    public C1358Xu(C1359Xw c1359Xw, DisplayManager displayManager) {
        this.A01 = c1359Xw;
        this.A00 = displayManager;
    }

    public final void A00() {
        this.A00.registerDisplayListener(this, null);
    }

    public final void A01() {
        this.A00.unregisterDisplayListener(this);
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayAdded(int i5) {
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayChanged(int i5) {
        if (i5 != 0) {
            return;
        }
        this.A01.A03();
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayRemoved(int i5) {
    }
}
