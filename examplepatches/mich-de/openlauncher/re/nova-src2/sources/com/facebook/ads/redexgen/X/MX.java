package com.facebook.ads.redexgen.X;

import android.media.MediaFormat;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public abstract class MX {
    public static byte[] A00;
    public static String[] A01 = {"7", "i65AyHoXhr03CZTkwFIsJPOqjFKh7SdZ", "gAbJvAXG7VAvpxzxcYKdDebdKuiKWAVi", "iTegN4CLcHpcAElPiGNAFOSrQgadfB", "gojcFh5YQgZVdw3RfQsPk76OA0q5Wgol", "5975FOL9BJuGMsJl92VFO3rFk8IB4T1W", "B01kqTAHFG", "d3UmOFRYw"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[7].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[5] = "gX60bN5F4sCW8TusqdUF4ztUEmSZSFK6";
            strArr2[2] = "vmo615Sie4vfxGGKNuV6tWqzBviQlWUT";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 47);
            i13++;
        }
    }

    public static void A01() {
        A00 = new byte[]{70, 74, 73, 74, 87, 8, 87, 68, 75, 66, 64, 102, 106, 105, 106, 119, 40, 118, 113, 100, 107, 97, 100, 119, 97, 78, 66, 65, 66, 95, 0, 89, 95, 76, 67, 94, 75, 72, 95, 49, 33, 54, AbstractJsonLexerKt.TC_INVALID, 126, 114, 100, 59, 101, 98, 119, 98, AbstractJsonLexerKt.TC_INVALID, 117, 59, AbstractJsonLexerKt.TC_INVALID, 120, 112, 121};
    }

    static {
        A01();
    }

    public static void A02(MediaFormat mediaFormat, ColorInfo colorInfo) {
        if (colorInfo != null) {
            String strA00 = A00(25, 14, 2);
            int i5 = colorInfo.A03;
            String[] strArr = A01;
            if (strArr[7].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            A01[1] = "xeL0lPESkp4f5J5FbIAShl1PzrWbveLZ";
            A04(mediaFormat, strA00, i5);
            A04(mediaFormat, A00(11, 14, 42), colorInfo.A02);
            A04(mediaFormat, A00(0, 11, 10), colorInfo.A01);
            A05(mediaFormat, A00(43, 15, 57), colorInfo.A04);
        }
    }

    public static void A03(MediaFormat mediaFormat, String str, float f11) {
        if (f11 != -1.0f) {
            mediaFormat.setFloat(str, f11);
        }
    }

    public static void A04(MediaFormat mediaFormat, String str, int i5) {
        if (i5 != -1) {
            mediaFormat.setInteger(str, i5);
        }
    }

    public static void A05(MediaFormat mediaFormat, String str, byte[] bArr) {
        if (bArr != null) {
            mediaFormat.setByteBuffer(str, ByteBuffer.wrap(bArr));
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A06(MediaFormat mediaFormat, List<byte[]> list) {
        for (int i5 = 0; i5 < i; i5++) {
            mediaFormat.setByteBuffer(A00(39, 4, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE) + i5, ByteBuffer.wrap(list.get(i5)));
        }
    }
}
