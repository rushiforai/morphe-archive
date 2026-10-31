package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public class T6 extends NQ {
    public static byte[] A02;
    public final int A00;
    public final NX A01;

    static {
        A06();
    }

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A02 = new byte[]{-69, -60, -67, -71, -54, -52, -67, -48, -52, -122, -126, -58, -57, -52, 120, -56, -67, -54, -59, -63, -52, -52, -67, -68, -122, -126};
    }

    public T6(NX nx2, int i5, int i11) {
        super(A03(i5, i11));
        this.A01 = nx2;
        this.A00 = i11;
    }

    public T6(IOException iOException, NX nx2, int i5, int i11) {
        super(iOException, A03(i5, i11));
        this.A01 = nx2;
        this.A00 = i11;
    }

    public T6(String str, NX nx2, int i5, int i11) {
        super(str, A03(i5, i11));
        this.A01 = nx2;
        this.A00 = i11;
    }

    public T6(String str, IOException iOException, NX nx2, int i5, int i11) {
        super(str, iOException, A03(i5, i11));
        this.A01 = nx2;
        this.A00 = i11;
    }

    public static int A03(int i5, int i11) {
        if (i5 == 2000 && i11 == 1) {
            return 2001;
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0039  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static T6 A04(final IOException iOException, final NX nx2, int i5) {
        int errorCode;
        String message = iOException.getMessage();
        if (iOException instanceof SocketTimeoutException) {
            errorCode = 2002;
        } else if (iOException instanceof InterruptedIOException) {
            errorCode = 1004;
        } else if (message != null) {
            String strA01 = XC.A01(message);
            String message2 = A05(0, 26, 14);
            if (strA01.matches(message2)) {
                errorCode = 2007;
            } else {
                errorCode = 2001;
            }
        }
        if (errorCode == 2007) {
            return new T6(iOException, nx2) { // from class: com.facebook.ads.redexgen.X.9F
                public static byte[] A00 = null;
                public static final long serialVersionUID = 1;

                static {
                    A01();
                }

                public static String A00(int i11, int i12, int i13) {
                    byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i11, i11 + i12);
                    for (int i14 = 0; i14 < bArrCopyOfRange.length; i14++) {
                        bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] ^ i13) ^ 41);
                    }
                    return new String(bArrCopyOfRange);
                }

                public static void A01() {
                    A00 = new byte[]{28, 51, 58, 62, 45, 43, 58, 39, 43, AbstractJsonLexerKt.TC_INVALID, 23, 11, 11, 15, AbstractJsonLexerKt.TC_INVALID, 43, 45, 62, 57, 57, 54, 60, AbstractJsonLexerKt.TC_INVALID, 49, 48, 43, AbstractJsonLexerKt.TC_INVALID, 47, 58, 45, 50, 54, 43, 43, 58, 59, 113, AbstractJsonLexerKt.TC_INVALID, 12, 58, 58, AbstractJsonLexerKt.TC_INVALID, 55, 43, 43, 47, 44, 101, 112, 112, 59, 58, 41, 58, 51, 48, 47, 58, 45, 113, 62, 49, 59, 45, 48, 54, 59, 113, 60, 48, 50, 112, 56, 42, 54, 59, 58, 112, 43, 48, 47, 54, 60, 44, 112, 50, 58, 59, 54, 62, 112, 54, 44, 44, 42, 58, 44, 112, 60, 51, 58, 62, 45, 43, 58, 39, 43, 114, 49, 48, 43, 114, 47, 58, 45, 50, 54, 43, 43, 58, 59};
                }

                {
                    String strA00 = A00(0, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                }
            };
        }
        return new T6(iOException, nx2, errorCode, i5);
    }
}
