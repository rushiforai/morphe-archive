package defpackage;

import android.graphics.Canvas;
import android.graphics.Picture;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dp6 extends Picture {
    public final of5 a;

    public dp6(of5 of5Var) {
        this.a = of5Var;
    }

    @Override // android.graphics.Picture
    public final Canvas beginRecording(int i, int i2) {
        return new Canvas();
    }

    @Override // android.graphics.Picture
    public final void draw(Canvas canvas) {
        Canvas canvas2 = qm.a;
        pm pmVar = new pm();
        pmVar.a = canvas;
        this.a.c(pmVar, null);
    }

    @Override // android.graphics.Picture
    public final int getHeight() {
        return (int) (this.a.u & 4294967295L);
    }

    @Override // android.graphics.Picture
    public final int getWidth() {
        return (int) (this.a.u >> 32);
    }

    @Override // android.graphics.Picture
    public final boolean requiresHardwareAcceleration() {
        return true;
    }

    @Override // android.graphics.Picture
    public final void endRecording() {
    }
}
