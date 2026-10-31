package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Ke, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1029Ke {
    public float A00;
    public float A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public int A0C;
    public int A0D;
    public int A0E;
    public int A0F;
    public int A0G;
    public int A0H;
    public int A0I;
    public int A0J;
    public long A0K;
    public ColorInfo A0L;
    public DrmInitData A0M;
    public Metadata A0N;
    public Object A0O;
    public String A0P;
    public String A0Q;
    public String A0R;
    public String A0S;
    public String A0T;
    public String A0U;
    public List<byte[]> A0V;
    public byte[] A0W;

    public C1029Ke() {
        this.A03 = -1;
        this.A0B = -1;
        this.A09 = -1;
        this.A0K = Long.MAX_VALUE;
        this.A0J = -1;
        this.A08 = -1;
        this.A00 = -1.0f;
        this.A01 = 1.0f;
        this.A0G = -1;
        this.A04 = -1;
        this.A0E = -1;
        this.A0A = -1;
        this.A02 = -1;
        this.A0H = -1;
        this.A0I = -1;
        this.A05 = 0;
    }

    public C1029Ke(VC vc) {
        this.A0R = vc.A0T;
        this.A0S = vc.A0U;
        this.A0T = vc.A0V;
        this.A0F = vc.A0H;
        this.A0C = vc.A0E;
        this.A03 = vc.A04;
        this.A0B = vc.A0D;
        this.A0P = vc.A0R;
        this.A0N = vc.A0P;
        this.A0Q = vc.A0S;
        this.A0U = vc.A0W;
        this.A09 = vc.A0B;
        this.A0V = vc.A0X;
        this.A0M = vc.A0O;
        this.A0K = vc.A0M;
        this.A0J = vc.A0L;
        this.A08 = vc.A0A;
        this.A00 = vc.A01;
        this.A0D = vc.A0F;
        this.A01 = vc.A02;
        this.A0W = vc.A0Y;
        this.A0G = vc.A0I;
        this.A0L = vc.A0N;
        this.A04 = vc.A06;
        this.A0E = vc.A0G;
        this.A0A = vc.A0C;
        this.A06 = vc.A08;
        this.A07 = vc.A09;
        this.A02 = vc.A03;
        this.A0H = vc.A0J;
        this.A0I = vc.A0K;
        this.A05 = vc.A07;
        this.A0O = vc.A0Q;
    }

    public final C1029Ke A0X(float f11) {
        this.A00 = f11;
        return this;
    }

    public final C1029Ke A0Y(float f11) {
        this.A01 = f11;
        return this;
    }

    public final C1029Ke A0Z(int i5) {
        this.A02 = i5;
        return this;
    }

    public final C1029Ke A0a(int i5) {
        this.A03 = i5;
        return this;
    }

    public final C1029Ke A0b(int i5) {
        this.A04 = i5;
        return this;
    }

    public final C1029Ke A0c(int i5) {
        this.A05 = i5;
        return this;
    }

    public final C1029Ke A0d(int i5) {
        this.A06 = i5;
        return this;
    }

    public final C1029Ke A0e(int i5) {
        this.A07 = i5;
        return this;
    }

    public final C1029Ke A0f(int i5) {
        this.A08 = i5;
        return this;
    }

    public final C1029Ke A0g(int i5) {
        this.A0R = Integer.toString(i5);
        return this;
    }

    public final C1029Ke A0h(int i5) {
        this.A09 = i5;
        return this;
    }

    public final C1029Ke A0i(int i5) {
        this.A0A = i5;
        return this;
    }

    public final C1029Ke A0j(int i5) {
        this.A0B = i5;
        return this;
    }

    public final C1029Ke A0k(int i5) {
        this.A0C = i5;
        return this;
    }

    public final C1029Ke A0l(int i5) {
        this.A0D = i5;
        return this;
    }

    public final C1029Ke A0m(int i5) {
        this.A0E = i5;
        return this;
    }

    public final C1029Ke A0n(int i5) {
        this.A0F = i5;
        return this;
    }

    public final C1029Ke A0o(int i5) {
        this.A0G = i5;
        return this;
    }

    public final C1029Ke A0p(int i5) {
        this.A0H = i5;
        return this;
    }

    public final C1029Ke A0q(int i5) {
        this.A0I = i5;
        return this;
    }

    public final C1029Ke A0r(int i5) {
        this.A0J = i5;
        return this;
    }

    public final C1029Ke A0s(long j11) {
        this.A0K = j11;
        return this;
    }

    public final C1029Ke A0t(ColorInfo colorInfo) {
        this.A0L = colorInfo;
        return this;
    }

    @MetaExoPlayerCustomization
    public final C1029Ke A0u(DrmInitData drmInitData) {
        this.A0M = drmInitData;
        if (drmInitData != null && this.A05 == 0) {
            A0c(2);
        }
        return this;
    }

    public final C1029Ke A0v(Metadata metadata) {
        this.A0N = metadata;
        return this;
    }

    public final C1029Ke A0w(String str) {
        this.A0P = str;
        return this;
    }

    public final C1029Ke A0x(String str) {
        this.A0Q = str;
        return this;
    }

    public final C1029Ke A0y(String str) {
        this.A0R = str;
        return this;
    }

    public final C1029Ke A0z(String str) {
        this.A0S = str;
        return this;
    }

    public final C1029Ke A10(String str) {
        this.A0T = str;
        return this;
    }

    public final C1029Ke A11(String str) {
        this.A0U = str;
        return this;
    }

    public final C1029Ke A12(List<byte[]> initializationData) {
        this.A0V = initializationData;
        return this;
    }

    public final C1029Ke A13(byte[] bArr) {
        this.A0W = bArr;
        return this;
    }

    public final VC A14() {
        return new VC(this);
    }
}
