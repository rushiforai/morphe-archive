package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.os.Bundle;
import com.facebook.ads.internal.api.AudienceNetworkExportedActivityApi;
import java.util.Arrays;
import java.util.UUID;

/* renamed from: com.facebook.ads.redexgen.X.n9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2217n9 implements AudienceNetworkExportedActivityApi {
    public static byte[] A01;
    public static String[] A02 = {"lqcZKkXS6TgOyt76sZ5yjVO68Nd1QdQN", "bQWyI3suGbnh3U5StjCALiPIzXDV3Wa6", "hqk98641WxUvYLytASVEQqAqBzewRvKz", "WJUhx8cI8X6XmYecnMlLMKWkuLUkkXH9", "MP1e4gCZR", "1EPuqCSCyQ9J2YoomIIpPWX0Nb9xTOcz", "0suERcaSwAa0E2CxcbYZCTLc9cS16", "2TigNonfP4HCMPOeSAXXuXDynNOGBzuQ"};
    public final Activity A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 97);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {126, 121, 99, 104, 101, 97, 104, 118, 103, 103, 104, 120, 101, 126, 114, 121, 99, 118, 99, 126, 120, 121, 104, 124, 114, 110, 61, 58, 60, 49, 47, 42, 49, 39, 42, 49, 37, 43, 55};
        if (A02[2].charAt(23) != 'q') {
            throw new RuntimeException();
        }
        A02[2] = "wLiEtUSufX2SvKxRiuuw2ghqe6rTYyXA";
        A01 = bArr;
    }

    static {
        A01();
    }

    public C2217n9(Activity activity) {
        this.A00 = activity;
    }

    private void A02(int i5) {
        this.A00.setResult(i5);
        this.A00.finish();
    }

    private boolean A03(C2216n8 c2216n8) {
        String callingPackage = this.A00.getCallingPackage();
        if (callingPackage != null) {
            String callingPackage2 = c2216n8.A04;
            if (callingPackage.equals(callingPackage2)) {
                return true;
            }
        }
        A02(12);
        if (c2216n8.A00 instanceof C1024Jz) {
            ((C1024Jz) c2216n8.A00).A0F().A0F().AJ8();
        }
        if (c2216n8.A00 instanceof C1021Jw) {
            ((C1021Jw) c2216n8.A00).A0H().A0F().AJ8();
            return false;
        }
        return false;
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkExportedActivityApi
    public final void onCreate(Bundle bundle) {
        C0958Hi c0958HiA05 = C2013jn.A05(this.A00, UUID.randomUUID().toString());
        if (this.A00.isTaskRoot()) {
            c0958HiA05.A0F().AJ0();
            A02(10);
            return;
        }
        String adId = this.A00.getIntent().getStringExtra(A00(26, 13, 15));
        if (adId == null) {
            c0958HiA05.A0F().AJ4();
            A02(11);
            return;
        }
        C2216n8 c2216n8A04 = C0949Gz.A00().A04(adId);
        InterfaceC1790g7 interfaceC1790g7 = c2216n8A04 != null ? c2216n8A04.A00 : null;
        if (A02[6].length() == 29) {
            A02[6] = "3hvfYctBGPg0BeMvR8jiqRXkEjCpv";
            if (c2216n8A04 != null && (interfaceC1790g7 instanceof C1021Jw)) {
                if (!A03(c2216n8A04)) {
                    return;
                }
                C1021Jw c1021Jw = (C1021Jw) interfaceC1790g7;
                c1021Jw.A0G().A01().A0J(this.A00);
                c1021Jw.A0M(this.A00.getIntent().getIntExtra(A00(0, 26, 86), -1), 0L);
            } else {
                if (c2216n8A04 != null) {
                    boolean z11 = interfaceC1790g7 instanceof C1024Jz;
                    if (A02[1].charAt(21) == 'i') {
                        A02[2] = "XUW1n7Q8abvbP2RLETYRfIyqCZkI4d7q";
                        if (z11) {
                            if (!A03(c2216n8A04)) {
                                return;
                            }
                            C1024Jz c1024Jz = (C1024Jz) interfaceC1790g7;
                            c1024Jz.A0E().A05().A0J(this.A00);
                            c1024Jz.A0J();
                        }
                    }
                }
                c0958HiA05.A0F().AJW();
                A02(13);
                return;
            }
            this.A00.setResult(-1);
            this.A00.finish();
            return;
        }
        throw new RuntimeException();
    }
}
