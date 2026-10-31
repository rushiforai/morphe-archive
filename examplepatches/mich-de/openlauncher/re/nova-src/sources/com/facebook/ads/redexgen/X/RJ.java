package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class RJ implements InterfaceC1018Jt {
    public final int A00;
    public final int A01;
    public final int A02;
    public final int[] A03;
    public static String[] A04 = {"hGryzRRtnWWmlLI7xcYJx37xIrBucBeY", "no5wTIJGKzUywc2piihl3rAURL0pBOvb", "PVp2", "9qCi", b.f42142b, b.f42142b, "pZX1blWMjT5YBrawJvNIbAhoZ2EHHpZj", "vkgfNScxByl4gT2oBBi0wVUCY7ZCQpzR"};
    public static final String A06 = N1.A0h(0);
    public static final String A07 = N1.A0h(1);
    public static final String A08 = N1.A0h(2);
    public static final InterfaceC1017Js<RJ> A05 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.RK
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return RJ.A00(bundle);
        }
    };

    public RJ(int i5, int[] iArr, int i11) {
        this.A00 = i5;
        this.A03 = Arrays.copyOf(iArr, iArr.length);
        this.A01 = iArr.length;
        this.A02 = i11;
        Arrays.sort(this.A03);
    }

    public static /* synthetic */ RJ A00(Bundle bundle) {
        int i5 = bundle.getInt(A06, -1);
        int[] tracks = bundle.getIntArray(A07);
        int trackType = bundle.getInt(A08, -1);
        AbstractC1062Ln.A07(i5 >= 0 && trackType >= 0);
        AbstractC1062Ln.A01(tracks);
        return new RJ(i5, tracks, trackType);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null) {
            Class<?> cls = getClass();
            String[] strArr = A04;
            if (strArr[4].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            A04[6] = "4p3ewgf2ZVaidpf0iQU4M8hHbY2z6Qyg";
            if (cls == obj.getClass()) {
                RJ rj2 = (RJ) obj;
                if (this.A00 == rj2.A00 && Arrays.equals(this.A03, rj2.A03) && this.A02 == rj2.A02) {
                    return true;
                }
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = ((this.A00 * 31) + Arrays.hashCode(this.A03)) * 31;
        int hash = this.A02;
        return iHashCode + hash;
    }
}
