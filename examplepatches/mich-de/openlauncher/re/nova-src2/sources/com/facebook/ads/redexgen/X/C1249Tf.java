package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.facebook.ads.androidx.media3.common.text.Cue;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Tf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1249Tf implements InterfaceC1018Jt {
    public final long A00;

    @MetaExoPlayerCustomization
    public final List<C1251Th> A01;
    public static final C1249Tf A03 = new C1249Tf(XR.A01(), 0);
    public static final String A04 = N1.A0h(0);
    public static final String A05 = N1.A0h(1);
    public static final InterfaceC1017Js<C1249Tf> A02 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Tg
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1249Tf.A00(bundle);
        }
    };

    @MetaExoPlayerCustomization
    public C1249Tf(List<C1251Th> list, long j11) {
        this.A01 = XR.A03((C1251Th[]) list.toArray(new C1251Th[0]));
        this.A00 = j11;
    }

    public static final C1249Tf A00(Bundle bundle) {
        List listA01;
        List<Cue> cues = bundle.getParcelableArrayList(A04);
        if (cues == null) {
            listA01 = XR.A01();
        } else {
            listA01 = C1068Lt.A01(C1251Th.A0I, cues);
        }
        return new C1249Tf(listA01, bundle.getLong(A05));
    }
}
