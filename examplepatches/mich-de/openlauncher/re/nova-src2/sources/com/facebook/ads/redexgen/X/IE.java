package com.facebook.ads.redexgen.X;

import com.facebook.ads.MediaViewListener;

/* loaded from: assets/audience_network/classes.dex */
public class IE implements InterfaceC2474rO {
    public final /* synthetic */ MediaViewListener A00;
    public final /* synthetic */ IC A01;

    public IE(IC ic2, MediaViewListener mediaViewListener) {
        this.A01 = ic2;
        this.A00 = mediaViewListener;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AER() {
        this.A00.onComplete(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AEp() {
        this.A00.onEnterFullscreen(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AEv() {
        this.A00.onExitFullscreen(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AF4() {
        this.A00.onFullscreenBackground(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AF6() {
        this.A00.onFullscreenForeground(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AGH() {
        this.A00.onPlay(this.A01.A07);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void AHo() {
        this.A00.onVolumeChange(this.A01.A07, this.A01.A09.getVolume());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2474rO
    public final void onPause() {
        this.A00.onPause(this.A01.A07);
    }
}
