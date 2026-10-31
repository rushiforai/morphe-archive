package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.NativeAd;
import com.facebook.ads.NativeAdBase;
import java.util.Arrays;
import java.util.List;
import javax.annotation.Nullable;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class I5 implements InterfaceC1785g2 {
    public static byte[] A04;

    @Nullable
    public NativeAd.NativeOptions A00;
    public C2030k4 A01;
    public C0958Hi A02;
    public final NativeAdBase.MediaCacheFlag A03;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A04 = new byte[]{59, 52, 33, 60, 35, 48, 100, AbstractJsonLexerKt.TC_INVALID, 122, AbstractJsonLexerKt.TC_INVALID, 126, 102, AbstractJsonLexerKt.TC_INVALID};
    }

    public I5(@Nullable C2030k4 c2030k4, C0958Hi c0958Hi, NativeAdBase.MediaCacheFlag mediaCacheFlag, NativeAd.NativeOptions nativeOptions) {
        this.A00 = nativeOptions;
        this.A01 = c2030k4;
        this.A02 = c0958Hi;
        this.A03 = mediaCacheFlag;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1785g2
    public final void AEr(C2262nt c2262nt) {
        AbstractC2310oh.A00(new I8(this, c2262nt));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1785g2
    public final void AG2(List<C1056Lh> list) {
        C2086kz manager = new C2086kz(this.A02);
        String firstRequestId = A03(6, 7, 70);
        for (C1056Lh c1056Lh : list) {
            if (A03(6, 7, 70).equals(firstRequestId)) {
                firstRequestId = c1056Lh.A0G();
            }
            if (this.A03.equals(NativeAdBase.MediaCacheFlag.ALL)) {
                if (c1056Lh.A0E().A0I() != null) {
                    manager.A0c(new C2084kx(c1056Lh.A0E().A0I().getUrl(), c1056Lh.A0E().A0I().getHeight(), c1056Lh.A0E().A0I().getWidth(), c1056Lh.A0G(), A03(0, 6, 2)));
                }
                if (c1056Lh.A0E().A0H() != null) {
                    manager.A0c(new C2084kx(c1056Lh.A0E().A0H().getUrl(), c1056Lh.A0E().A0H().getHeight(), c1056Lh.A0E().A0H().getWidth(), c1056Lh.A0G(), A03(0, 6, 2)));
                }
                if (!TextUtils.isEmpty(c1056Lh.A0E().A0e())) {
                    manager.A0b(new C2082kv(c1056Lh.A0E().A0e(), c1056Lh.A0G(), A03(0, 6, 2), c1056Lh.A0E().A0D()));
                }
            }
        }
        manager.A0X(new I6(this, list), new C2079ks(firstRequestId, A03(0, 6, 2)));
    }
}
