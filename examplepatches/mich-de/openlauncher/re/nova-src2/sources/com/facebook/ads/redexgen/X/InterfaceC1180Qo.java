package com.facebook.ads.redexgen.X;

import android.media.AudioDeviceInfo;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.nio.ByteBuffer;

/* renamed from: com.facebook.ads.redexgen.X.Qo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public interface InterfaceC1180Qo {
    void A5i(VC vc, int i5, int[] iArr) throws C1173Qh;

    void A6Y();

    void A6v();

    void A72();

    long A8G(boolean z11);

    UW A9P();

    boolean AAI(ByteBuffer byteBuffer, long j11, int i5) throws C1174Qi, C1179Qn;

    void AAL();

    boolean AAS();

    boolean AB7();

    void AID();

    void AIF() throws C1179Qn;

    void AKY(VL vl2);

    void AKZ(int i5);

    void AKa(C1015Jq c1015Jq);

    @MetaExoPlayerCustomization
    void AKi(boolean z11);

    void AKn(InterfaceC1176Qk interfaceC1176Qk);

    void AKv(UW uw2);

    void AKy(QD qd2);

    void AL0(AudioDeviceInfo audioDeviceInfo);

    void AL6(boolean z11);

    boolean ALg(VC vc);

    @MetaExoPlayerCustomization
    boolean ALi(int i5, int i11);

    void flush();

    void pause();

    void setVolume(float f11);
}
