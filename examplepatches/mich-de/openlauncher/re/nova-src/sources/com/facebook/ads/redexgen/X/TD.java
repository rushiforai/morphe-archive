package com.facebook.ads.redexgen.X;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Base64;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Deprecated
/* loaded from: assets/audience_network/classes.dex */
public final class TD implements NN {
    public final Context A00;
    public final NN A01;
    public final InterfaceC1108Ni A02;

    public TD(Context context, InterfaceC1108Ni interfaceC1108Ni, NN nn2) {
        this.A00 = context.getApplicationContext();
        this.A02 = interfaceC1108Ni;
        this.A01 = nn2;
    }

    public TD(Context context, String str, InterfaceC1108Ni interfaceC1108Ni) {
        this(context, interfaceC1108Ni, new C9H().A01(str));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r1v0, types: [com.facebook.ads.redexgen.X.9I] */
    @Override // com.facebook.ads.redexgen.X.NN
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final C9I A5r() {
        final Context context = this.A00;
        final TE teA5r = this.A01.A5r();
        ?? r12 = new TE(context, teA5r) { // from class: com.facebook.ads.redexgen.X.9I
            public static byte[] A0B;
            public static String[] A0C = {"C7DElpO6NNsoAmWreX5VcfHc", "utxULvuUsrxySbN58bWERtIE", "GH", "1gC3bgtSsH3xWcpvek4Gy76najfn5m5C", "feLBh6ukBh9hJyef6KhqZWpWiwqAVmzW", "oWuhO3", "UdjzSOgc8AXsSDGjyMK94ihP6", "R68E1oVy27eUcAlinqsbQfq"};
            public TE A00;
            public TE A01;
            public TE A02;
            public TE A03;
            public TE A04;
            public TE A05;
            public TE A06;

            @MetaExoPlayerCustomization
            public TE A07;
            public final TE A08;

            @MetaExoPlayerCustomization
            public final Context A09;

            @MetaExoPlayerCustomization
            public final List<InterfaceC1108Ni> A0A = new ArrayList();

            public static String A07(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 7);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A08() {
                A0B = new byte[]{67, 13, 2, 8, 30, 3, 5, 8, 51, 13, 31, 31, 9, 24, 67, 25, 44, 44, 61, 53, 40, 44, 49, 54, 63, 120, 44, 55, 120, 40, 52, 57, 33, 120, 10, 12, 21, 8, 120, 43, 44, 42, 61, 57, 53, 120, 47, 49, 44, 48, 55, 45, 44, 120, 60, 61, 40, 61, 54, 60, 49, 54, 63, 120, 55, 54, 120, 44, 48, 61, 120, 10, 12, 21, 8, 120, 61, 32, 44, 61, 54, 43, 49, 55, 54, 119, 86, 85, 82, 70, 95, 71, 119, 82, 71, 82, 96, 92, 70, 65, 80, 86, 106, 93, 93, 64, 93, 15, 70, 65, 92, 91, 78, 65, 91, 70, 78, 91, 70, 65, 72, 15, 125, 123, 98, AbstractJsonLexerKt.TC_INVALID, 15, 74, 87, 91, 74, 65, 92, 70, 64, 65, 3, 12, 6, 16, 13, 11, 6, 76, 16, 7, 17, 13, 23, 16, 1, 7, 5, 23, 23, 1, 16, 78, 66, 64, 3, 75, 76, 78, 72, 79, 66, 66, 70, 3, 76, 73, 94, 3, 74, 66, 66, 74, 65, 72, 3, 76, 67, 73, 95, 66, 68, 73, 3, 72, 85, 66, 93, 65, 76, 84, 72, 95, 31, 3, 72, 85, 89, 3, 95, 89, 64, 93, 3, AbstractJsonLexerKt.TC_INVALID, 89, 64, 93, 105, 76, 89, 76, 126, 66, 88, 95, 78, 72, 58, 54, 55, 45, 60, 55, 45, 71, 66, 87, 66, 41, 58, 44, 41, 62, 40, 52, 46, 41, 56, 62, 125, 123, 98, AbstractJsonLexerKt.TC_INVALID, 126, 111, 123};
            }

            static {
                A08();
            }

            {
                this.A09 = context.getApplicationContext();
                this.A08 = (TE) AbstractC1062Ln.A01(teA5r);
            }

            private TE A00() {
                if (this.A00 == null) {
                    this.A00 = new C9J(this.A09) { // from class: com.facebook.ads.redexgen.X.4O
                        public static byte[] A05;
                        public static String[] A06 = {"MNCe724XVXYIorkFgz7o2RNgKHKWGOUE", "KoqBVr7Jv5wqKKaI5uNyKCjPF5fTSx04", "39znLvM47tXzTjX8uj1zEjh82EgWoj93", "zIfWJ4lI", "bvd6kHZFx5xTKisP5GA6TgtoV1qWEFVT", "BQ8YEZ315WOoQrB3BHr0", "HIyAg6cci8PPHE72WVhQr", "JYF7Q5XuQ6oJay6rRtXA617Q4Mg5SZ7P"};
                        public long A00;
                        public Uri A01;
                        public InputStream A02;
                        public boolean A03;
                        public final AssetManager A04;

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 32);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A05 = new byte[]{-76, 119, -87, -74, -84, -70, -73, -79, -84, -89, -87, -69, -69, -83, -68, 119};
                        }

                        /* JADX WARN: Failed to parse debug info
                        java.lang.ArrayIndexOutOfBoundsException
                         */
                        @Override // com.facebook.ads.redexgen.X.TE
                        public final long AHv(NX nx2) throws TP {
                            try {
                                this.A01 = nx2.A06;
                                String strSubstring = (String) AbstractC1062Ln.A01(this.A01.getPath());
                                if (strSubstring.startsWith(A00(1, 15, 40))) {
                                    strSubstring = strSubstring.substring(15);
                                } else if (strSubstring.startsWith(A00(0, 1, 101))) {
                                    strSubstring = strSubstring.substring(1);
                                }
                                A0G(nx2);
                                this.A02 = this.A04.open(strSubstring, 1);
                                if (this.A02.skip(nx2.A04) < nx2.A04) {
                                    throw new TP(null, 2008);
                                }
                                long j11 = nx2.A03;
                                if (A06[7].charAt(8) != 'Q') {
                                    throw new RuntimeException();
                                }
                                A06[5] = "NGb6erXLGjUofl5sDSaG";
                                if (j11 != -1) {
                                    this.A00 = nx2.A03;
                                } else {
                                    this.A00 = this.A02.available();
                                    if (this.A00 == 2147483647L) {
                                        this.A00 = -1L;
                                    }
                                }
                                this.A03 = true;
                                A0H(nx2);
                                if (A06[6].length() != 21) {
                                    return this.A00;
                                }
                                A06[1] = "3uLbmiFpLLZjkxa8H8HufVIKKBfusAWo";
                                return this.A00;
                            } catch (TP e3) {
                                throw e3;
                            } catch (IOException e11) {
                                throw new TP(e11, e11 instanceof FileNotFoundException ? 2005 : 2000);
                            }
                        }

                        static {
                            A01();
                        }

                        {
                            super(false);
                            this.A04 = context.getAssets();
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final Uri AA2() {
                            return this.A01;
                        }

                        /* JADX WARN: Removed duplicated region for block: B:22:0x0059  */
                        @Override // com.facebook.ads.redexgen.X.TE
                        /*
                            Code decompiled incorrectly, please refer to instructions dump.
                        */
                        public final void close() throws TP {
                            this.A01 = null;
                            try {
                                try {
                                    if (this.A02 != null) {
                                        this.A02.close();
                                    }
                                    this.A02 = null;
                                    boolean z11 = this.A03;
                                    if (A06[7].charAt(8) != 'Q') {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr = A06;
                                    strArr[2] = "RQ2aPYV0XzSKqKGG6lN3Ew4WQR0Wbc5Z";
                                    strArr[4] = "Gl41HGAVYLDZhSdMvoA5zDBgLuWWd6ac";
                                    if (z11) {
                                        this.A03 = false;
                                        A0E();
                                    }
                                } catch (IOException e3) {
                                    throw new TP(e3, 2000);
                                }
                            } catch (Throwable th2) {
                                if (A06[1].charAt(26) != 'f') {
                                    this.A02 = null;
                                    if (this.A03) {
                                        this.A03 = false;
                                        A0E();
                                    }
                                } else {
                                    A06[5] = "DCEAnyVwlIo6CEW5mvnm";
                                    this.A02 = null;
                                    if (this.A03) {
                                    }
                                }
                                throw th2;
                            }
                        }

                        /* JADX WARN: Code restructure failed: missing block: B:22:0x0069, code lost:
                        
                            if (r4 == (-1)) goto L23;
                         */
                        @Override // com.facebook.ads.redexgen.X.KR
                        /*
                            Code decompiled incorrectly, please refer to instructions dump.
                        */
                        public final int read(byte[] bArr, int i5, int i11) throws IOException {
                            if (i11 == 0) {
                                if (A06[5].length() != 20) {
                                    throw new RuntimeException();
                                }
                                String[] strArr = A06;
                                strArr[0] = "HuYs2F2Qnwr41DG6lO3uJ3keMcWeGYbQ";
                                strArr[3] = "KFeaSlCR";
                                return 0;
                            }
                            if (this.A00 == 0) {
                                return -1;
                            }
                            try {
                                if (this.A00 != -1) {
                                    i11 = (int) Math.min(this.A00, i11);
                                }
                                int i12 = ((InputStream) N1.A0f(this.A02)).read(bArr, i5, i11);
                                String[] strArr2 = A06;
                                String str = strArr2[2];
                                String str2 = strArr2[4];
                                int iCharAt = str.charAt(27);
                                int bytesToRead = str2.charAt(27);
                                if (iCharAt != bytesToRead) {
                                    if (i12 == -1) {
                                        return -1;
                                    }
                                    if (this.A00 != -1) {
                                        this.A00 -= i12;
                                    }
                                    A0F(i12);
                                    return i12;
                                }
                                A06[7] = "YynOmLqIQFTKCOIEuI7TEv5epLeyqL2k";
                            } catch (IOException e3) {
                                throw new TP(e3, 2000);
                            }
                        }
                    };
                    A09(this.A00);
                }
                return this.A00;
            }

            private TE A01() {
                if (this.A01 == null) {
                    this.A01 = new C9J(this.A09) { // from class: com.facebook.ads.redexgen.X.4N
                        public static byte[] A06;
                        public static String[] A07 = {"bowdcjQmccgBFbzkOf4gio", "r9jJZmLRaZFVSu1jX3zsztxBNqXGVRCZ", "BGTPkCzcQBDC0dkQPeF0eVtQZJXhz", "VSz6WkkSf7ZEBwYwp4fp1mWK88LTxoGk", "P6usDYEanJfSH1EVqh03t70nwE31pGuI", "BoGfU", "tnhIi", "ULEqDxKlhERdhYsCJ0YzlA0S5jPe3tiU"};
                        public long A00;
                        public AssetFileDescriptor A01;
                        public Uri A02;
                        public FileInputStream A03;
                        public boolean A04;
                        public final ContentResolver A05;

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 61);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A06 = new byte[]{110, 107, 110, 112, 92, 70, 95, 87, 19, 93, 92, 71, 19, 92, 67, 86, 93, 19, 85, 90, 95, 86, 19, 87, 86, 64, 80, 65, 90, 67, 71, 92, 65, 19, 85, 92, 65, 9, 19, 116, 123, 113, 103, 122, 124, 113, 59, 101, 103, 122, 99, 124, 113, 112, 103, 59, 112, 109, 97, 103, 116, 59, 84, 86, 86, 80, 69, 65, 74, 90, 71, 92, 82, 92, 91, 84, 89, 74, 88, 80, 81, 92, 84, 74, 83, 90, 71, 88, 84, 65, 33, 45, 44, 54, 39, 44, 54, 115};
                        }

                        /* JADX WARN: Failed to parse debug info
                        java.lang.ArrayIndexOutOfBoundsException: Index 23 out of bounds for length 15
                        	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.restartVar(DebugInfoParser.java:193)
                        	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:141)
                        	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
                        	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
                        	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
                         */
                        @Override // com.facebook.ads.redexgen.X.TE
                        public final long AHv(NX nx2) throws IOException {
                            AssetFileDescriptor assetFileDescriptorOpenAssetFileDescriptor;
                            long jMin;
                            try {
                                try {
                                    Uri uri = nx2.A06;
                                    this.A02 = uri;
                                    A0G(nx2);
                                    if (A00(90, 7, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE).equals(nx2.A06.getScheme())) {
                                        Bundle bundle = new Bundle();
                                        bundle.putBoolean(A00(39, 51, 40), true);
                                        assetFileDescriptorOpenAssetFileDescriptor = this.A05.openTypedAssetFileDescriptor(uri, A00(0, 3, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), bundle);
                                    } else {
                                        assetFileDescriptorOpenAssetFileDescriptor = this.A05.openAssetFileDescriptor(uri, A00(97, 1, 60));
                                    }
                                    this.A01 = assetFileDescriptorOpenAssetFileDescriptor;
                                    if (assetFileDescriptorOpenAssetFileDescriptor == null) {
                                        try {
                                            throw new TF(new IOException(A00(3, 36, 14) + uri), 2000);
                                        } catch (IOException e3) {
                                            e = e3;
                                            throw new TF(e, e instanceof FileNotFoundException ? 2005 : 2000);
                                        }
                                    }
                                    long length = assetFileDescriptorOpenAssetFileDescriptor.getLength();
                                    FileInputStream fileInputStream = new FileInputStream(assetFileDescriptorOpenAssetFileDescriptor.getFileDescriptor());
                                    this.A03 = fileInputStream;
                                    if (length != -1 && nx2.A04 > length) {
                                        throw new TF(null, 2008);
                                    }
                                    long startOffset = assetFileDescriptorOpenAssetFileDescriptor.getStartOffset();
                                    long jSkip = fileInputStream.skip(nx2.A04 + startOffset) - startOffset;
                                    if (jSkip != nx2.A04) {
                                        throw new TF(null, 2008);
                                    }
                                    if (length == -1) {
                                        FileChannel channel = fileInputStream.getChannel();
                                        long size = channel.size();
                                        if (size == 0) {
                                            this.A00 = -1L;
                                        } else {
                                            this.A00 = size - channel.position();
                                            if (this.A00 < 0) {
                                                throw new TF(null, 2008);
                                            }
                                        }
                                    } else {
                                        this.A00 = length - jSkip;
                                        if (this.A00 < 0) {
                                            throw new TF(null, 2008);
                                        }
                                    }
                                    if (nx2.A03 != -1) {
                                        if (this.A00 == -1) {
                                            jMin = nx2.A03;
                                        } else {
                                            long j11 = this.A00;
                                            long j12 = nx2.A03;
                                            String[] strArr = A07;
                                            if (strArr[7].charAt(4) != strArr[4].charAt(4)) {
                                                String[] strArr2 = A07;
                                                strArr2[0] = "LcBqqL7TbXRUKyH6CBeTvb";
                                                strArr2[2] = "4TGmk9eA76kXOGZ4H9zjlm0C8Vrbm";
                                                jMin = Math.min(j11, j12);
                                            } else {
                                                String[] strArr3 = A07;
                                                strArr3[7] = "cYtBDfAgMwyvftDeAVPseWrsig9rwS74";
                                                strArr3[4] = "Ori0DUAINXD6zku1nkUVeZV8bHBYitYP";
                                                jMin = Math.min(j11, j12);
                                            }
                                        }
                                        this.A00 = jMin;
                                    }
                                    this.A04 = true;
                                    A0H(nx2);
                                    long j13 = nx2.A03;
                                    String[] strArr4 = A07;
                                    if (strArr4[3].charAt(1) == strArr4[1].charAt(1)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr5 = A07;
                                    strArr5[0] = "JgLqlhwF3yN75iqLJZABgy";
                                    strArr5[2] = "iQNQKxIhkHIRP8VKTPKBXdDVcf3xk";
                                    return j13 != -1 ? nx2.A03 : this.A00;
                                } catch (TF e11) {
                                    throw e11;
                                }
                            } catch (IOException e12) {
                                e = e12;
                            }
                        }

                        static {
                            A01();
                        }

                        {
                            super(false);
                            this.A05 = context.getContentResolver();
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final Uri AA2() {
                            return this.A02;
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final void close() throws TF {
                            this.A02 = null;
                            try {
                                try {
                                    if (this.A03 != null) {
                                        this.A03.close();
                                    }
                                    this.A03 = null;
                                    try {
                                        try {
                                            if (this.A01 != null) {
                                                this.A01.close();
                                            }
                                        } catch (IOException e3) {
                                            throw new TF(e3, 2000);
                                        }
                                    } finally {
                                        this.A01 = null;
                                        if (this.A04) {
                                            this.A04 = false;
                                            A0E();
                                        }
                                    }
                                } catch (IOException e11) {
                                    throw new TF(e11, 2000);
                                }
                            } catch (Throwable th2) {
                                this.A03 = null;
                                try {
                                    try {
                                        if (this.A01 != null) {
                                            this.A01.close();
                                        }
                                        this.A01 = null;
                                        if (this.A04) {
                                            this.A04 = false;
                                            A0E();
                                        }
                                        throw th2;
                                    } catch (IOException e12) {
                                        throw new TF(e12, 2000);
                                    }
                                } catch (Throwable th3) {
                                    String[] strArr = A07;
                                    if (strArr[7].charAt(4) != strArr[4].charAt(4)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A07;
                                    strArr2[0] = "qMMLrLuMLkmGyBEBYphxX3";
                                    strArr2[2] = "k8PToccynt0739Zxp37f8GTnFGSjf";
                                    this.A01 = null;
                                    if (this.A04) {
                                        this.A04 = false;
                                        A0E();
                                    }
                                    throw th3;
                                }
                            }
                        }

                        @Override // com.facebook.ads.redexgen.X.KR
                        public final int read(byte[] bArr, int i5, int i11) throws IOException {
                            if (i11 == 0) {
                                return 0;
                            }
                            if (this.A00 == 0) {
                                return -1;
                            }
                            try {
                                if (this.A00 != -1) {
                                    i11 = (int) Math.min(this.A00, i11);
                                }
                                int i12 = ((FileInputStream) N1.A0f(this.A03)).read(bArr, i5, i11);
                                if (i12 == -1) {
                                    return -1;
                                }
                                if (this.A00 != -1) {
                                    this.A00 -= i12;
                                }
                                A0F(i12);
                                return i12;
                            } catch (IOException e3) {
                                throw new TF(e3, 2000);
                            }
                        }
                    };
                    A09(this.A01);
                }
                return this.A01;
            }

            private TE A02() {
                if (this.A02 == null) {
                    this.A02 = new C9J() { // from class: com.facebook.ads.redexgen.X.4M
                        public static byte[] A04;
                        public static String[] A05 = {"BQHtwcCLeeRVBd", "Lc9loNnCO4alo9FI50GCGwDfdK8w3UU6", "Sv6ngZFOBWfOQU8ebNiquQnyGNKos5r", "I7Hii1liDkijw0PBC7ibWmM", "FmtKngjUkYFlQXeXhW5W8dDSyESAYkys", "4", "d0pik2i20nQSmuN2sSQUBKayMAsjM6v", "fFWnuRdYuuszvLk6h8AhLBeRBdctGHjD"};
                        public int A00;
                        public int A01;
                        public NX A02;
                        public byte[] A03;

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 83);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A04 = new byte[]{-65, -31, 8, 7, 25, 11, -36, -38, 4, 49, 49, 46, 49, -33, 54, 39, 40, 43, 36, -33, 47, 32, 49, 50, 40, 45, 38, -33, 1, 32, 50, 36, -11, -13, -33, 36, 45, 34, 46, 35, 36, 35, -33, 50, 51, 49, 40, 45, 38, -7, -33, -44, -19, -28, -9, -17, -28, -30, -13, -28, -29, -97, -44, -47, -56, -97, -27, -18, -15, -20, -32, -13, -71, -97, 8, 33, 38, 40, 35, 35, 34, 37, 39, 24, 23, -45, 38, 22, 27, 24, 32, 24, -19, -45, -4, -7, 12, -7};
                        }

                        static {
                            A01();
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final Uri AA2() {
                            if (this.A02 == null) {
                                return null;
                            }
                            NX nx2 = this.A02;
                            if (A05[7].charAt(17) == 'N') {
                                throw new RuntimeException();
                            }
                            String[] strArr = A05;
                            strArr[2] = "hJcenO465dZZkNArn5bHVKyGY0WTaxW";
                            strArr[6] = "LVT73VK6WdcQVpPVmkt27t8F2Z7XIwO";
                            return nx2.A06;
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final long AHv(NX nx2) throws IOException {
                            A0G(nx2);
                            this.A02 = nx2;
                            Uri uri = nx2.A06;
                            String scheme = uri.getScheme();
                            AbstractC1062Ln.A09(A00(94, 4, 69).equals(scheme), A00(74, 20, 96) + scheme);
                            String[] uriParts = N1.A1O(uri.getSchemeSpecificPart(), A00(0, 1, 64));
                            if (uriParts.length == 2) {
                                String str = uriParts[1];
                                String dataString = uriParts[0];
                                if (dataString.contains(A00(1, 7, 83))) {
                                    try {
                                        this.A03 = Base64.decode(str, 0);
                                    } catch (IllegalArgumentException e3) {
                                        throw L9.A02(A00(8, 43, 108) + str, e3);
                                    }
                                } else {
                                    this.A03 = N1.A1G(URLDecoder.decode(str, XA.A01.name()));
                                }
                                if (nx2.A04 <= this.A03.length) {
                                    this.A01 = (int) nx2.A04;
                                    this.A00 = this.A03.length - this.A01;
                                    if (nx2.A03 != -1) {
                                        this.A00 = (int) Math.min(this.A00, nx2.A03);
                                    }
                                    A0H(nx2);
                                    if (nx2.A03 != -1) {
                                        return nx2.A03;
                                    }
                                    int i5 = this.A00;
                                    if (A05[5].length() == 31) {
                                        throw new RuntimeException();
                                    }
                                    String[] uriParts2 = A05;
                                    uriParts2[1] = "86jhUIAHnYQlsXvk3EiClY9l9h7Uaoq8";
                                    uriParts2[4] = "TKuub57AxrglW5rrcu2d5fJIFZ5Gh9Kw";
                                    return i5;
                                }
                                this.A03 = null;
                                throw new NQ(2008);
                            }
                            throw L9.A02(A00(51, 23, 44) + uri, null);
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final void close() {
                            if (this.A03 != null) {
                                this.A03 = null;
                                if (A05[5].length() == 31) {
                                    throw new RuntimeException();
                                }
                                String[] strArr = A05;
                                strArr[2] = "3XBU26XwaCKC02YSKhUmIl9UtWHPirj";
                                strArr[6] = "hDxDV8K3FDbLTF4fYtKKQCpp3hi7oXw";
                                A0E();
                            }
                            this.A02 = null;
                            if (A05[3].length() == 9) {
                                throw new RuntimeException();
                            }
                            String[] strArr2 = A05;
                            strArr2[2] = "eSOB9m8mFypWeq5nKDrSkAbj2mlVPN2";
                            strArr2[6] = "gL3vpNNuLDSggEd0nYEJjHTxA4n6887";
                        }

                        @Override // com.facebook.ads.redexgen.X.KR
                        public final int read(byte[] bArr, int i5, int i11) {
                            if (i11 == 0) {
                                return 0;
                            }
                            if (this.A00 == 0) {
                                return -1;
                            }
                            int iMin = Math.min(i11, this.A00);
                            System.arraycopy(N1.A0f(this.A03), this.A01, bArr, i5, iMin);
                            int i12 = this.A01 + iMin;
                            if (A05[5].length() == 31) {
                                throw new RuntimeException();
                            }
                            String[] strArr = A05;
                            strArr[2] = "nT19EfdmkwiryaBp6SneoA1CnVSvuwY";
                            strArr[6] = "KXEqjMpTAxAt95MsjfnOtQNTuXghxu5";
                            this.A01 = i12;
                            this.A00 -= iMin;
                            A0F(iMin);
                            return iMin;
                        }
                    };
                    A09(this.A02);
                }
                return this.A02;
            }

            private TE A03() {
                if (this.A03 == null) {
                    this.A03 = new C4K();
                    A09(this.A03);
                }
                return this.A03;
            }

            private TE A04() {
                if (this.A04 == null) {
                    this.A04 = new C9J(this.A09) { // from class: com.facebook.ads.redexgen.X.4J
                        public static byte[] A07;
                        public static String[] A08 = {"IbVbF5JWi", "e9nb57raekVa", "T8AZMWLEGeKtRm9GnDMvywiXhVD12kTh", "JOUHcuU3CHZG", "LQ5sosQG1uSve7qblcQToCm0XxaBxHma", "mh25", "x9K7bxImLfRCHr", "VpNhG2Rjt"};
                        public long A00;
                        public AssetFileDescriptor A01;
                        public Uri A02;
                        public InputStream A03;
                        public boolean A04;
                        public final Resources A05;
                        public final String A06;

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 38);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A07 = new byte[]{-67, 96, 119, -96, -106, 82, -95, -104, 82, -91, -90, -92, -105, -109, -97, 82, -92, -105, -109, -107, -102, -105, -106, 82, -102, -109, -88, -101, -96, -103, 82, -96, -95, -90, 82, -92, -105, -109, -106, 82, -91, -89, -104, -104, -101, -107, -101, -105, -96, -90, 82, -106, -109, -90, -109, 96, -80, -61, -47, -51, -45, -48, -63, -61, 126, -57, -62, -61, -52, -46, -57, -60, -57, -61, -48, 126, -53, -45, -47, -46, 126, -64, -61, 126, -65, -52, 126, -57, -52, -46, -61, -59, -61, -48, -116, -117, -98, -84, -88, -82, -85, -100, -98, 89, -94, -84, 89, -100, -88, -90, -87, -85, -98, -84, -84, -98, -99, 115, 89, -125, -106, -92, -96, -90, -93, -108, -106, 81, -97, -96, -91, 81, -105, -96, -90, -97, -107, 95, -75, -78, -87, -128, -51, -43, -45, -44, -128, -59, -55, -44, -56, -59, -46, -128, -43, -45, -59, -128, -45, -61, -56, -59, -51, -59, -128, -46, -63, -41, -46, -59, -45, -49, -43, -46, -61, -59, -128, -49, -46, -128, -63, -50, -60, -46, -49, -55, -60, -114, -46, -59, -45, -49, -43, -46, -61, -59, -67, -59, -116, -92, -79, -89, -75, -78, -84, -89, 113, -75, -88, -74, -78, -72, -75, -90, -88, -20, -37, -15, -62, -79, -57, -62, -75, -61, -65, -59, -62, -77, -75};
                        }

                        /* JADX WARN: Failed to parse debug info
                        java.lang.ArrayIndexOutOfBoundsException
                         */
                        /* JADX WARN: Removed duplicated region for block: B:102:0x0056 A[EXC_TOP_SPLITTER, SYNTHETIC] */
                        @Override // com.facebook.ads.redexgen.X.TE
                        /*
                            Code decompiled incorrectly, please refer to instructions dump.
                        */
                        public final long AHv(NX nx2) throws NQ, Resources.NotFoundException, NumberFormatException {
                            int identifier;
                            long jSkip;
                            C4J c4j;
                            Uri uri = nx2.A06;
                            this.A02 = uri;
                            if (!TextUtils.equals(A00(Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 11, 42), uri.getScheme())) {
                                String scheme = uri.getScheme();
                                String strA00 = A00(199, 16, 29);
                                if (TextUtils.equals(strA00, scheme) && uri.getPathSegments().size() == 1 && ((String) AbstractC1062Ln.A01(uri.getLastPathSegment())).matches(A00(196, 3, 59))) {
                                    try {
                                        identifier = Integer.parseInt((String) AbstractC1062Ln.A01(uri.getLastPathSegment()));
                                    } catch (NumberFormatException unused) {
                                        throw new T4(A00(56, 39, 56), null, 1004);
                                    }
                                } else {
                                    if (!TextUtils.equals(strA00, uri.getScheme())) {
                                        throw new T4(A00(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 58, 58), null, 1004);
                                    }
                                    String strSubstring = (String) AbstractC1062Ln.A01(uri.getPath());
                                    if (A08[5].length() != 15) {
                                        A08[6] = "dwQCPGDMwEnPPPl3vUFZ";
                                        if (strSubstring.startsWith(A00(0, 1, 104))) {
                                            strSubstring = strSubstring.substring(1);
                                        }
                                        String host = uri.getHost();
                                        identifier = this.A05.getIdentifier((TextUtils.isEmpty(host) ? A00(0, 0, 36) : host + A00(1, 1, 0)) + strSubstring, A00(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 3, 84), this.A06);
                                        if (identifier == 0) {
                                            throw new T4(A00(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 19, 11), null, 2005);
                                        }
                                    }
                                }
                                A0G(nx2);
                                try {
                                    AssetFileDescriptor assetFileDescriptorOpenRawResourceFd = this.A05.openRawResourceFd(identifier);
                                    this.A01 = assetFileDescriptorOpenRawResourceFd;
                                    if (assetFileDescriptorOpenRawResourceFd == null) {
                                        throw new T4(A00(95, 24, 19) + uri, null, 2000);
                                    }
                                    long length = assetFileDescriptorOpenRawResourceFd.getLength();
                                    FileInputStream fileInputStream = new FileInputStream(assetFileDescriptorOpenRawResourceFd.getFileDescriptor());
                                    this.A03 = fileInputStream;
                                    if (length != -1) {
                                        try {
                                            if (nx2.A04 > length) {
                                                throw new T4(null, null, 2008);
                                            }
                                        } catch (T4 e3) {
                                            throw e3;
                                        } catch (IOException e11) {
                                            e = e11;
                                            throw new T4(null, e, 2000);
                                        }
                                    }
                                    try {
                                        long startOffset = assetFileDescriptorOpenRawResourceFd.getStartOffset();
                                        jSkip = fileInputStream.skip(nx2.A04 + startOffset) - startOffset;
                                        try {
                                        } catch (T4 e12) {
                                            throw e12;
                                        } catch (IOException e13) {
                                            e = e13;
                                        }
                                    } catch (T4 e14) {
                                        throw e14;
                                    } catch (IOException e15) {
                                        e = e15;
                                    }
                                    try {
                                        if (jSkip != nx2.A04) {
                                            throw new T4(null, null, 2008);
                                        }
                                        if (length == -1) {
                                            FileChannel channel = fileInputStream.getChannel();
                                            if (channel.size() == 0) {
                                                c4j = this;
                                                c4j.A00 = -1L;
                                            } else {
                                                c4j = this;
                                                c4j.A00 = channel.size() - channel.position();
                                                if (c4j.A00 < 0) {
                                                    throw new T4(null, null, 2008);
                                                }
                                            }
                                        } else {
                                            c4j = this;
                                            c4j.A00 = length - jSkip;
                                            if (c4j.A00 < 0) {
                                                throw new NQ(2008);
                                            }
                                        }
                                        if (nx2.A03 != -1) {
                                            c4j.A00 = c4j.A00 == -1 ? nx2.A03 : Math.min(c4j.A00, nx2.A03);
                                        }
                                        c4j.A04 = true;
                                        A0H(nx2);
                                        long j11 = nx2.A03;
                                        if (A08[4].length() != 13) {
                                            A08[2] = "LhoEJlWFvHKtz9DNjh2WivGdFPEPIGq3";
                                            return j11 != -1 ? nx2.A03 : c4j.A00;
                                        }
                                    } catch (T4 e16) {
                                        throw e16;
                                    } catch (IOException e17) {
                                        e = e17;
                                        throw new T4(null, e, 2000);
                                    }
                                } catch (Resources.NotFoundException e18) {
                                    throw new T4(null, e18, 2005);
                                }
                            }
                            throw new RuntimeException();
                        }

                        static {
                            A01();
                        }

                        {
                            super(false);
                            this.A05 = context.getResources();
                            this.A06 = context.getPackageName();
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final Uri AA2() {
                            return this.A02;
                        }

                        @Override // com.facebook.ads.redexgen.X.TE
                        public final void close() throws IOException {
                            this.A02 = null;
                            try {
                                try {
                                    if (this.A03 != null) {
                                        this.A03.close();
                                    }
                                    this.A03 = null;
                                    try {
                                        try {
                                            if (this.A01 != null) {
                                                this.A01.close();
                                            }
                                        } catch (IOException e3) {
                                            throw new T4(null, e3, 2000);
                                        }
                                    } finally {
                                        this.A01 = null;
                                        if (this.A04) {
                                            this.A04 = false;
                                            A0E();
                                        }
                                    }
                                } catch (IOException e11) {
                                    throw new T4(null, e11, 2000);
                                }
                            } catch (Throwable th2) {
                                this.A03 = null;
                                try {
                                    try {
                                        if (this.A01 != null) {
                                            this.A01.close();
                                        }
                                        this.A01 = null;
                                        if (this.A04) {
                                            this.A04 = false;
                                            A0E();
                                        }
                                        throw th2;
                                    } catch (IOException e12) {
                                        throw new T4(null, e12, 2000);
                                    }
                                } catch (Throwable e13) {
                                    this.A01 = null;
                                    if (this.A04) {
                                        this.A04 = false;
                                        String[] strArr = A08;
                                        if (strArr[0].length() != strArr[7].length()) {
                                            throw new RuntimeException();
                                        }
                                        A08[5] = "m1s9kylqWyKF";
                                        A0E();
                                    }
                                    throw e13;
                                }
                            }
                        }

                        @Override // com.facebook.ads.redexgen.X.KR
                        public final int read(byte[] bArr, int i5, int i11) throws IOException {
                            if (i11 == 0) {
                                return 0;
                            }
                            if (this.A00 == 0) {
                                return -1;
                            }
                            try {
                                if (this.A00 != -1) {
                                    i11 = (int) Math.min(this.A00, i11);
                                }
                                int i12 = ((InputStream) N1.A0f(this.A03)).read(bArr, i5, i11);
                                if (i12 == -1) {
                                    if (this.A00 == -1) {
                                        return -1;
                                    }
                                    throw new T4(A00(2, 54, 12), new EOFException(), 2000);
                                }
                                if (this.A00 != -1) {
                                    this.A00 -= i12;
                                }
                                A0F(i12);
                                return i12;
                            } catch (IOException e3) {
                                throw new T4(null, e3, 2000);
                            }
                        }
                    };
                    A09(this.A04);
                }
                return this.A04;
            }

            private TE A05() throws Exception {
                if (this.A05 == null) {
                    try {
                        this.A05 = (TE) Class.forName(A07(157, 66, 42)).getConstructor(new Class[0]).newInstance(new Object[0]);
                        A09(this.A05);
                    } catch (ClassNotFoundException unused) {
                        MV.A07(A07(85, 17, 52), A07(15, 70, 95));
                    } catch (Exception e3) {
                        throw new RuntimeException(A07(102, 34, 40), e3);
                    }
                    if (this.A05 == null) {
                        this.A05 = this.A08;
                    }
                }
                TE te2 = this.A05;
                if (A0C[5].length() != 6) {
                    throw new RuntimeException();
                }
                A0C[3] = "O2PCZ67RFUoAeaayXg7oBI7fNvGALE0b";
                return te2;
            }

            private TE A06() {
                if (this.A06 == null) {
                    this.A06 = new C4I();
                    A09(this.A06);
                }
                return this.A06;
            }

            /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            private void A09(TE te2) {
                for (int i5 = 0; i5 < i; i5++) {
                    te2.A4T(this.A0A.get(i5));
                }
            }

            private void A0A(TE te2, InterfaceC1108Ni interfaceC1108Ni) {
                if (te2 != null) {
                    te2.A4T(interfaceC1108Ni);
                }
            }

            @Override // com.facebook.ads.redexgen.X.TE
            public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
                AbstractC1062Ln.A01(interfaceC1108Ni);
                this.A08.A4T(interfaceC1108Ni);
                this.A0A.add(interfaceC1108Ni);
                A0A(this.A03, interfaceC1108Ni);
                A0A(this.A00, interfaceC1108Ni);
                A0A(this.A01, interfaceC1108Ni);
                A0A(this.A05, interfaceC1108Ni);
                A0A(this.A06, interfaceC1108Ni);
                A0A(this.A02, interfaceC1108Ni);
                A0A(this.A04, interfaceC1108Ni);
            }

            @Override // com.facebook.ads.redexgen.X.TE
            public final Map<String, List<String>> A9W() {
                return this.A07 == null ? Collections.emptyMap() : this.A07.A9W();
            }

            @Override // com.facebook.ads.redexgen.X.TE
            public final Uri AA2() {
                if (this.A07 == null) {
                    return null;
                }
                return this.A07.AA2();
            }

            /* JADX WARN: Removed duplicated region for block: B:14:0x003a  */
            /* JADX WARN: Removed duplicated region for block: B:40:0x0105  */
            @Override // com.facebook.ads.redexgen.X.TE
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final long AHv(NX nx2) throws IOException {
                AbstractC1062Ln.A08(this.A07 == null);
                String scheme = nx2.A06.getScheme();
                if (N1.A1A(nx2.A06)) {
                    String path = nx2.A06.getPath();
                    if (path != null) {
                        String scheme2 = A07(0, 15, 107);
                        if (path.startsWith(scheme2)) {
                            this.A07 = A00();
                        } else {
                            TE teA03 = A03();
                            String uriPath = A0C[4];
                            if (uriPath.charAt(12) == 'b') {
                                throw new RuntimeException();
                            }
                            String[] strArr = A0C;
                            strArr[0] = "otnWYl13HUOQLt7bSrhkAVrc";
                            strArr[1] = "xWfSLVE718mAasLO3I3AjPIs";
                            this.A07 = teA03;
                        }
                    }
                } else {
                    String scheme3 = A07(152, 5, 99);
                    if (scheme3.equals(scheme)) {
                        this.A07 = A00();
                    } else {
                        String scheme4 = A07(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 7, 94);
                        if (scheme4.equals(scheme)) {
                            this.A07 = A01();
                        } else {
                            String scheme5 = A07(245, 4, 8);
                            if (scheme5.equals(scheme)) {
                                this.A07 = A05();
                            } else {
                                String scheme6 = A07(249, 3, 12);
                                if (scheme6.equals(scheme)) {
                                    TE teA06 = A06();
                                    String scheme7 = A0C[5];
                                    if (scheme7.length() != 6) {
                                        throw new RuntimeException();
                                    }
                                    A0C[6] = "DFyk3wP3M4Io6PrDIp9QpmsbD";
                                    this.A07 = teA06;
                                } else {
                                    String scheme8 = A07(230, 4, 36);
                                    if (scheme8.equals(scheme)) {
                                        this.A07 = A02();
                                    } else {
                                        String scheme9 = A07(234, 11, 92);
                                        if (!scheme9.equals(scheme)) {
                                            String scheme10 = A07(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 16, 101);
                                            if (scheme10.equals(scheme)) {
                                                this.A07 = A04();
                                            } else {
                                                TE te2 = this.A08;
                                                String[] strArr2 = A0C;
                                                String uriPath2 = strArr2[0];
                                                String scheme11 = strArr2[1];
                                                if (uriPath2.length() != scheme11.length()) {
                                                    A0C[5] = "zFUlNW";
                                                    this.A07 = te2;
                                                } else {
                                                    A0C[4] = "4B5nLzgVQjmjHPClZgF09TYaq2uT9Ypp";
                                                    this.A07 = te2;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return this.A07.AHv(nx2);
            }

            @Override // com.facebook.ads.redexgen.X.TE
            public final void close() throws IOException {
                if (this.A07 != null) {
                    try {
                        this.A07.close();
                    } finally {
                        this.A07 = null;
                    }
                }
            }

            @Override // com.facebook.ads.redexgen.X.KR
            public final int read(byte[] bArr, int i5, int i11) throws IOException {
                return ((TE) AbstractC1062Ln.A01(this.A07)).read(bArr, i5, i11);
            }
        };
        if (this.A02 != null) {
            r12.A4T(this.A02);
        }
        return r12;
    }
}
