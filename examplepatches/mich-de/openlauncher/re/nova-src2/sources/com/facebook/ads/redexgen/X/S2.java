package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.concurrent.Executor;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class S2 implements U5 {
    public static byte[] A02;
    public static String[] A03 = {"PCd1LxC6t30GpXH0OnNcOCzBlSs3YkOd", "JenL0PYWNuefWgZmV2GA7aACOdgI2Vnf", "d6L", "eZPPieVk0Gawul7INPkiVTbCdvgybwzo", "2JIvAFfeaD7d1N4DwBV3Z9KmlsGoa2Oj", "rHg7RGGSdAXayBl6BAeJx7WFaLrssGRm", "M5xIghZn1BfuZZJ6Q2WhjAhkVLa7oYCj", "jPGoko8HOnA9C4rqg"};
    public static final SparseArray<Constructor<? extends U3>> A04;
    public final C1086Mm A00;
    public final Executor A01;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 28);
            if (A03[2].length() == 6) {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[4] = "1E0FELRzrptf02JVKK16aXpQbPua6GtD";
            strArr[0] = "hpXG0m4EtljMlwA92d1785fVa1erya8x";
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static Constructor<? extends U3> A03(Class<?> cls) {
        try {
            return cls.asSubclass(U3.class).getConstructor(C1273Ug.class, C1086Mm.class, Executor.class);
        } catch (NoSuchMethodException e3) {
            throw new IllegalStateException(A02(0, 30, 28), e3);
        }
    }

    public static void A04() {
        A02 = new byte[]{68, 111, 119, 110, 108, 111, 97, 100, 101, 114, 32, 99, 111, 110, 115, 116, 114, 117, 99, 116, 111, 114, 32, 109, 105, 115, 115, 105, 110, 103, 24, 63, 55, 50, 59, 58, 126, 42, 49, 126, 55, 48, 45, 42, 63, 48, 42, 55, 63, 42, 59, 126, 58, 49, 41, 48, 50, 49, 63, 58, 59, 44, 126, 56, 49, 44, 126, 61, 49, 48, 42, 59, 48, 42, 126, 42, 39, 46, 59, 126, 27, 57, 50, 35, 58, 51, 118, 59, 63, 37, 37, 63, 56, 49, 118, 48, 57, 36, 118, 53, 57, 56, 34, 51, 56, 34, 118, 34, 47, 38, 51, 118, 89, 98, AbstractJsonLexerKt.TC_INVALID, 121, 124, 124, 99, 126, 120, 105, 104, 44, 120, 117, 124, 105, 54, 44, 75, 71, 69, 6, 78, 73, 75, 77, 74, 71, 71, 67, 6, 73, 76, 91, 6, 73, 70, 76, 90, 71, 65, 76, 80, 6, 69, 77, 76, 65, 73, 27, 6, 77, 80, 71, 88, 68, 73, 81, 77, 90, 6, 91, 71, 93, 90, 75, 77, 6, 76, 73, 91, 64, 6, 71, 78, 78, 68, 65, 70, 77, 6, 108, 73, 91, 64, 108, 71, 95, 70, 68, 71, 73, 76, 77, 90, 101, 105, 107, 40, 96, 103, 101, 99, 100, 105, 105, 109, 40, 103, 98, 117, 40, 103, 104, 98, 116, 105, 111, 98, 126, 40, 107, 99, 98, 111, 103, 53, 40, 99, 126, 105, 118, 106, 103, AbstractJsonLexerKt.TC_INVALID, 99, 116, 40, 117, 105, 115, 116, 101, 99, 40, 110, 106, 117, 40, 105, 96, 96, 106, 111, 104, 99, 40, 78, 106, 117, 66, 105, 113, 104, 106, 105, 103, 98, 99, 116, 59, 55, 53, 118, 62, 57, 59, 61, 58, 55, 55, 51, 118, 57, 60, 43, 118, 57, 54, 60, 42, 55, 49, 60, 32, 118, 53, 61, 60, 49, 57, 107, 118, 61, 32, 55, 40, 52, 57, 33, 61, 42, 118, 43, 55, 45, 42, 59, 61, 118, 43, 53, 55, 55, 44, 48, 43, 44, 42, 61, 57, 53, 49, 54, 63, 118, 55, 62, 62, 52, 49, 54, 61, 118, 11, 43, 28, 55, 47, 54, 52, 55, 57, 60, 61, 42};
    }

    static {
        A04();
        A04 = A00();
    }

    public S2(C1086Mm c1086Mm, Executor executor) {
        this.A00 = (C1086Mm) AbstractC1062Ln.A01(c1086Mm);
        this.A01 = (Executor) AbstractC1062Ln.A01(executor);
    }

    public static SparseArray<Constructor<? extends U3>> A00() {
        SparseArray<Constructor<? extends U3>> sparseArray = new SparseArray<>();
        try {
            sparseArray.put(0, A03(Class.forName(A02(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 77, 52))));
        } catch (ClassNotFoundException unused) {
        }
        try {
            sparseArray.put(2, A03(Class.forName(A02(Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 75, 26))));
        } catch (ClassNotFoundException unused2) {
        }
        try {
            sparseArray.put(1, A03(Class.forName(A02(282, 86, 68))));
        } catch (ClassNotFoundException unused3) {
        }
        return sparseArray;
    }

    private U3 A01(DownloadRequest downloadRequest, int i5) {
        Constructor<? extends U3> constructor = A04.get(i5);
        if (constructor != null) {
            try {
                return constructor.newInstance(new C1034Kj().A00(downloadRequest.A00).A04(downloadRequest.A04).A02(downloadRequest.A01).A05(), this.A00, this.A01);
            } catch (Exception e3) {
                throw new IllegalStateException(A02(30, 50, 66) + i5, e3);
            }
        }
        throw new IllegalStateException(A02(80, 32, 74) + i5);
    }

    @Override // com.facebook.ads.redexgen.X.U5
    public final U3 A5v(DownloadRequest downloadRequest) {
        int iA0B = N1.A0B(downloadRequest.A00, downloadRequest.A03);
        switch (iA0B) {
            case 0:
            case 1:
            case 2:
                U3 u3A01 = A01(downloadRequest, iA0B);
                if (A03[2].length() == 6) {
                    throw new RuntimeException();
                }
                String[] strArr = A03;
                strArr[3] = "1knMGtHzX0r2tLwixYeQbvVCfya3f4OS";
                strArr[1] = "7Mz3frZ99cxdPwbi1oAajaMCphCMZYjN";
                return u3A01;
            case 3:
            default:
                throw new IllegalArgumentException(A02(112, 18, 16) + iA0B);
            case 4:
                return new C1215Rx(new C1034Kj().A00(downloadRequest.A00).A02(downloadRequest.A01).A05(), this.A00, this.A01);
        }
    }
}
