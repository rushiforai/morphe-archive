package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;
import java.util.Arrays;
import org.json.JSONException;

/* loaded from: assets/audience_network/classes.dex */
public class GJ implements InterfaceC1527bq {
    public static byte[] A03;
    public static String[] A04 = {"Uw4OqKfxrSl3mEv", "VqN2b3nioUrp4JO4Jinaxa7heHGcMfmj", "RKN56TZmz8G8vSZ7D7kYOpuBRs6noRkR", "lFzX", "v1ebTUXYyOhZWRRzR1yx5a2LWyaadprb", "q7AVSoVdO1Y", "l0BlUcehLgrbJ08aN7EZVrGsyfO9Oj5h", "UBwSl28KkUZ2ITe"};
    public final /* synthetic */ long A00;
    public final /* synthetic */ C2285oH A01;
    public final /* synthetic */ C2288oK A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{99, 99, 99, 54, 104, 49, 50, 103, 20, 65, 23, 65, 31, 31, 17, 70, 1, 24, 4, 5, 14, 51, 40, 46, 59, 63, 34, 36, 37, 113, 107, 108, 90, 77, 73, 90, 77, 31, 90, 77, 77, 80, 77, 31, 80, 92, 92, 74, 77, 77, 90, 91, 75, 125, 106, 110, 125, 106, 56, 106, 125, 104, 116, 113, 125, 124, 56, 107, 109, 123, 123, 125, 107, 107, 126, 109, 116, 116, 97, 75, 74, 103, 75, 73, 84, 72, 65, 80, 65, 95, 94, 117, 66, 66, 95, 66};
    }

    static {
        A01();
    }

    public GJ(C2288oK c2288oK, C2285oH c2285oH, long j11) {
        this.A02 = c2288oK;
        this.A01 = c2285oH;
        this.A00 = j11;
    }

    private final void A02(C1476b1 c1476b1) {
        AbstractC2284oG.A06(this.A01);
        try {
            InterfaceC1533bw response = c1476b1.A00();
            if (response != null) {
                String strA7d = response.A7d();
                C2291oN serverResponse = this.A02.A06.A07(this.A02.A05, strA7d, this.A00);
                if (serverResponse.A01() == EnumC2290oM.A04) {
                    GF gf2 = (GF) serverResponse;
                    String strA04 = gf2.A04();
                    AdErrorType adErrorTypeAdErrorTypeFromCode = AdErrorType.adErrorTypeFromCode(gf2.A03(), AdErrorType.ERROR_MESSAGE);
                    if (strA04 != null) {
                        strA7d = strA04;
                    }
                    this.A02.A05.A0F().A3t(C2416qS.A01(this.A02.A01), adErrorTypeAdErrorTypeFromCode.getErrorCode(), strA7d, adErrorTypeAdErrorTypeFromCode.isPublicError());
                    this.A02.A0E(C2262nt.A01(adErrorTypeAdErrorTypeFromCode, strA7d));
                    return;
                }
            }
            AdErrorType adErrorType = AdErrorType.NETWORK_ERROR;
            String errorMessage = c1476b1.getMessage();
            this.A02.A05.A0F().A3t(C2416qS.A01(this.A02.A01), adErrorType.getErrorCode(), errorMessage, adErrorType.isPublicError());
            this.A02.A0E(C2262nt.A01(adErrorType, errorMessage));
        } catch (JSONException e3) {
            AdErrorType adErrorType2 = AdErrorType.NETWORK_ERROR;
            String errorMessage2 = c1476b1.getMessage();
            this.A02.A05.A0F().A3t(C2416qS.A01(this.A02.A01), adErrorType2.getErrorCode(), A00(16, 15, 65) + e3.getMessage(), adErrorType2.isPublicError());
            this.A02.A0E(C2262nt.A01(adErrorType2, errorMessage2));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AES(InterfaceC1533bw interfaceC1533bw) throws JSONException {
        AbstractC2273o5.A05(A00(79, 10, 46), A00(52, 27, 18), A00(8, 8, 45));
        this.A02.A05.A0F().A5A();
        if (interfaceC1533bw != null) {
            String strA7d = interfaceC1533bw.A7d();
            if (C2203mv.A00(this.A02.A05) > 0) {
                C0958Hi c0958Hi = this.A02.A05;
                String[] strArr = A04;
                String str = strArr[0];
                String response = strArr[7];
                if (str.length() != response.length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[2] = "tgxx0UuGIft9UA3MnRMnFLQfhWdW0vbW";
                strArr2[4] = "0P0cGKPCvj1NlSOKLSh97X6dm38hZHc8";
                C2328oz.A00(c0958Hi).A0C(strA7d);
            }
            AbstractC2284oG.A06(this.A01);
            this.A02.A0O(strA7d, this.A00, this.A01);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AEs(Exception exc) {
        AbstractC2273o5.A05(A00(89, 7, 58), A00(31, 21, 53), A00(0, 8, 90));
        this.A02.A05.A0F().A5A();
        if (C1476b1.class.equals(exc.getClass())) {
            A02((C1476b1) exc);
            return;
        }
        AdErrorType adErrorType = AdErrorType.NETWORK_ERROR;
        String errorMessage = exc.getMessage();
        this.A02.A05.A0F().A3t(C2416qS.A01(this.A02.A01), adErrorType.getErrorCode(), errorMessage, adErrorType.isPublicError());
        this.A02.A0E(C2262nt.A01(adErrorType, errorMessage));
    }
}
