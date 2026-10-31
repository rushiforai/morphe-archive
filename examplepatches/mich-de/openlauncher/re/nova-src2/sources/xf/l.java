package xf;

import android.hardware.display.DisplayManager;
import android.os.Handler;
import wf.v;

/* loaded from: classes3.dex */
public final class l implements k, DisplayManager.DisplayListener {

    /* renamed from: a, reason: collision with root package name */
    public final DisplayManager f95801a;

    /* renamed from: b, reason: collision with root package name */
    public wm.b f95802b;

    public l(DisplayManager displayManager) {
        this.f95801a = displayManager;
    }

    @Override // xf.k
    public final void a() {
        this.f95801a.unregisterDisplayListener(this);
        this.f95802b = null;
    }

    @Override // xf.k
    public final void c(wm.b bVar) {
        this.f95802b = bVar;
        Handler handlerJ = v.j(null);
        DisplayManager displayManager = this.f95801a;
        displayManager.registerDisplayListener(this, handlerJ);
        bVar.b(displayManager.getDisplay(0));
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayAdded(int i5) {
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayChanged(int i5) {
        wm.b bVar = this.f95802b;
        if (bVar == null || i5 != 0) {
            return;
        }
        bVar.b(this.f95801a.getDisplay(0));
    }

    @Override // android.hardware.display.DisplayManager.DisplayListener
    public final void onDisplayRemoved(int i5) {
    }
}
