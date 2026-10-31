package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Timeline;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public class RT implements WY {
    public final float A00;
    public final float A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final long A07;
    public final InterfaceC1069Lu A08;

    @MetaExoPlayerCustomization
    public final InterfaceC1333Ws A09;
    public final int A0A;

    public RT() {
        this(10000, 25000, 25000, 0.75f);
    }

    public RT(int i5, int i11, int i12, float f11) {
        this(null, -1, i5, i11, i12, 1279, 719, f11, 0.75f, 2000L, InterfaceC1069Lu.A00);
    }

    public RT(InterfaceC1333Ws interfaceC1333Ws) {
        this(interfaceC1333Ws, -1, 10000, 25000, 25000, 1279, 719, 0.75f, 0.75f, 2000L, InterfaceC1069Lu.A00);
    }

    public RT(@MetaExoPlayerCustomization("No longer set through factory") InterfaceC1333Ws interfaceC1333Ws, @MetaExoPlayerCustomization("Non standard variable; used in oculus") int i5, @MetaExoPlayerCustomization("Removed from upstream") int i11, int i12, int i13, int i14, int i15, float f11, float f12, long j11, InterfaceC1069Lu interfaceC1069Lu) {
        this.A09 = interfaceC1333Ws;
        this.A0A = i5;
        this.A05 = i11;
        this.A02 = i12;
        this.A06 = i13;
        this.A04 = i14;
        this.A03 = i15;
        this.A00 = f11;
        this.A01 = f12;
        this.A07 = j11;
        this.A08 = interfaceC1069Lu;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection$AdaptationCheckpoint> */
    private final C4B A00(U8 u82, int[] iArr, int i5, InterfaceC1333Ws interfaceC1333Ws, AbstractC07549l<WG> abstractC07549l) {
        return new C4B(u82, iArr, i5, interfaceC1333Ws, this.A0A, this.A05, this.A02, this.A06, this.A04, this.A03, this.A00, this.A01, this.A07, abstractC07549l, this.A08);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.exoplayer.trackselection.AdaptiveTrackSelection$AdaptationCheckpoint>> */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.facebook.ads.redexgen.X.WY
    public final RA[] A6A(WX[] wxArr, InterfaceC1333Ws interfaceC1333Ws, C1202Rk c1202Rk, Timeline timeline) {
        RA raA00;
        AbstractC07549l abstractC07549lA00 = C4B.A00(wxArr);
        RA[] raArr = new RA[wxArr.length];
        for (int i5 = 0; i5 < wxArr.length; i5++) {
            WX wx2 = wxArr[i5];
            if (wx2 != null && wx2.A02.length != 0) {
                if (wx2.A02.length == 1) {
                    raA00 = new C4A(wx2.A01, wx2.A02[0], wx2.A00);
                } else {
                    raA00 = A00(wx2.A01, wx2.A02, wx2.A00, interfaceC1333Ws, (AbstractC07549l) abstractC07549lA00.get(i5));
                }
                raArr[i5] = raA00;
            }
        }
        return raArr;
    }
}
