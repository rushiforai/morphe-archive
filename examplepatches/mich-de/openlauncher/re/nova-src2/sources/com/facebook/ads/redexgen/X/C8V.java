package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.ApicFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.BinaryFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.ChapterFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.ChapterTocFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.CommentFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.GeobFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.Id3Frame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.MlltFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.PrivFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.TextInformationFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.UrlLinkFrame;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.8V, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C8V extends AbstractC1158Pn {
    public static byte[] A01;
    public static String[] A02 = {b.f42142b, "cj5A7A3gSiMrjq6AfdRtUzMbAEmYo4f3", "rN0JSnT6BKYEo3a1vAa71uiPZpT3Npi4", "TFfDjeYUbSMox1u3Lh", "USqEMSAtWn6GCJW8", "LWCCD3Qy9N2tqhYZ51Cp6k4Ti82bug", "tGTUqJzeCARhQZlaOnJcj6ftdoc", "hcOUpEd5Vf6AXCwQ9vkWGhfgcjokDV"};
    public static final InterfaceC1414a0 A03;
    public final InterfaceC1414a0 A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static ApicFrame A04(C1084Mk c1084Mk, int i5, int i11) {
        int iA02;
        String strA01;
        int iA0I = c1084Mk.A0I();
        Charset charsetA0M = A0M(iA0I);
        byte[] bArr = new byte[i5 - 1];
        c1084Mk.A0k(bArr, 0, i5 - 1);
        String strA0J = A0J(TTAdConstant.AD_ID_IS_NULL_CODE, 6, 32);
        if (i11 == 2) {
            iA02 = 2;
            strA01 = strA0J + XC.A01(new String(bArr, 0, 3, XA.A00));
            if (A0J(TTAdConstant.TARGET_URL_NOT_CONTAINS_TTCLID_CODE, 9, 76).equals(strA01)) {
                strA01 = A0J(TTAdConstant.DOWNLOAD_URL_CODE, 10, 56);
            }
        } else {
            iA02 = A02(bArr, 0);
            strA01 = XC.A01(new String(bArr, 0, iA02, XA.A00));
            if (strA01.indexOf(47) == -1) {
                strA01 = strA0J + strA01;
            }
        }
        int i12 = bArr[iA02 + 1] & 255;
        int i13 = iA02 + 2;
        int iA03 = A03(bArr, i13, iA0I);
        return new ApicFrame(strA01, new String(bArr, i13, iA03 - i13, charsetA0M), i12, A0Q(bArr, A00(iA0I) + iA03, bArr.length));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 20 out of bounds for length 19
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static ChapterFrame A06(C1084Mk c1084Mk, int i5, int i11, boolean z11, int i12, InterfaceC1414a0 interfaceC1414a0) {
        int iA09 = c1084Mk.A09();
        int iA02 = A02(c1084Mk.A0l(), iA09);
        String str = new String(c1084Mk.A0l(), iA09, iA02 - iA09, XA.A00);
        c1084Mk.A0f(iA02 + 1);
        int iA0C = c1084Mk.A0C();
        int iA0C2 = c1084Mk.A0C();
        long jA0Q = c1084Mk.A0Q();
        if (jA0Q == 4294967295L) {
            jA0Q = -1;
        }
        long jA0Q2 = c1084Mk.A0Q();
        String[] strArr = A02;
        if (strArr[4].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[4] = "16GLdZTfXwhLC42l";
        strArr2[6] = "GYTFmdJXXk2kcTCmyq6sFxfgRhF";
        if (jA0Q2 == 4294967295L) {
            jA0Q2 = -1;
        }
        ArrayList arrayList = new ArrayList();
        int i13 = iA09 + i5;
        while (c1084Mk.A09() < i13) {
            Id3Frame id3FrameA0B = A0B(i11, c1084Mk, z11, i12, interfaceC1414a0);
            if (id3FrameA0B != null) {
                arrayList.add(id3FrameA0B);
            }
        }
        return new ChapterFrame(str, iA0C, iA0C2, jA0Q, jA0Q2, (Id3Frame[]) arrayList.toArray(new Id3Frame[0]));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 10
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static GeobFrame A09(C1084Mk c1084Mk, int i5) {
        int iA0I = c1084Mk.A0I();
        Charset charsetA0M = A0M(iA0I);
        byte[] bArr = new byte[i5 - 1];
        c1084Mk.A0k(bArr, 0, i5 - 1);
        int iA02 = A02(bArr, 0);
        String str = new String(bArr, 0, iA02, XA.A00);
        int i11 = iA02 + 1;
        int iA03 = A03(bArr, i11, iA0I);
        String strA0L = A0L(bArr, i11, iA03, charsetA0M);
        int iA00 = A00(iA0I) + iA03;
        int iA032 = A03(bArr, iA00, iA0I);
        return new GeobFrame(str, strA0L, A0L(bArr, iA00, iA032, charsetA0M), A0Q(bArr, A00(iA0I) + iA032, bArr.length));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static MlltFrame A0C(C1084Mk c1084Mk, int i5) {
        int iA0M = c1084Mk.A0M();
        int iA0K = c1084Mk.A0K();
        int iA0K2 = c1084Mk.A0K();
        int iA0I = c1084Mk.A0I();
        int iA0I2 = c1084Mk.A0I();
        C1083Mj c1083Mj = new C1083Mj();
        c1083Mj.A0C(c1084Mk);
        int i11 = ((i5 - 10) * 8) / (iA0I + iA0I2);
        int[] iArr = new int[i11];
        int[] iArr2 = new int[i11];
        for (int i12 = 0; i12 < i11; i12++) {
            int iA04 = c1083Mj.A04(iA0I);
            int iA042 = c1083Mj.A04(iA0I2);
            iArr[i12] = iA04;
            iArr2[i12] = iA042;
        }
        return new MlltFrame(iA0M, iA0K, iA0K2, iArr, iArr2);
    }

    public static String A0J(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0N() {
        A01 = new byte[]{61, 40, 46, 64, 110, 40, 110, 40, 110, 40, 21, 83, 21, 83, 21, 83, 21, 83, 49, 61, 123, 111, 124, 112, 120, 78, 116, 103, 120, 32, 3, 38, 51, 38, 103, 51, 40, 40, 103, 52, 47, 40, 53, 51, 103, 51, 40, 103, 37, 34, 103, 38, 41, 103, 14, 3, 116, 103, 51, 38, 32, 102, 65, 73, 76, 69, 68, 0, 84, 79, 0, 68, 69, 67, 79, 68, 69, 0, 70, 82, 65, 77, 69, 26, 0, 73, 68, 29, 59, 28, 20, 17, 24, 25, 93, 9, 18, 93, 11, 28, 17, 20, 25, 28, 9, 24, 93, 52, 57, 78, 93, 9, 28, 26, 93, 10, 20, 9, 21, 93, 16, 28, 23, 18, 15, 43, 24, 15, 14, 20, 18, 19, 64, 74, 126, 109, 97, 105, 44, AbstractJsonLexerKt.TC_INVALID, 101, 118, 105, 44, 105, 116, 111, 105, 105, 104, AbstractJsonLexerKt.TC_INVALID, 44, 126, 105, 97, 109, 101, 98, 101, 98, 107, 44, 120, 109, 107, 44, 104, 109, 120, 109, 71, 106, 61, 74, 107, 109, 97, 106, 107, 124, 15, 55, 53, 44, 44, 57, 56, 124, 21, 24, 111, 124, 40, 61, 59, 124, 43, 53, 40, 52, 124, 49, 61, 54, 51, 46, 10, 57, 46, 47, 53, 51, 50, 97, 110, 124, 61, 50, 56, 124, 41, 50, 56, 57, 58, 53, 50, 57, 56, 124, 63, 51, 49, 44, 46, 57, 47, 47, 53, 51, 50, 124, 47, 63, 52, 57, 49, 57, 107, 83, 81, 72, 72, 93, 92, 24, 113, 124, 11, 24, 76, 89, 95, 24, 79, 81, 76, 80, 24, 77, 86, 75, 77, 72, 72, 87, 74, 76, 93, 92, 24, 85, 89, 82, 87, 74, 110, 93, 74, 75, 81, 87, 86, 5, 65, 121, 123, 98, 98, 123, 124, 117, 50, 103, 124, 97, 103, 98, 98, 125, 96, 102, 119, 118, 50, 113, 125, AbstractJsonLexerKt.TC_INVALID, 98, 96, 119, 97, 97, 119, 118, 50, 125, 96, 50, 119, 124, 113, 96, 107, 98, 102, 119, 118, 50, 116, 96, 115, AbstractJsonLexerKt.TC_INVALID, 119, 50, 62, 62, 62, 23, 44, 39, 58, 50, 39, 33, 54, 39, 38, 98, 36, 43, 48, 49, 54, 98, 54, 42, 48, 39, 39, 98, 32, 59, 54, 39, 49, 98, 45, 36, 98, 11, 6, 113, 98, 54, 35, 37, 98, 42, 39, 35, 38, 39, 48, 120, 98, 114, 58, 35, 44, 44, 44, 48, 52, 56, 62, 60, 118, 40, 44, 32, 38, 36, 110, 43, 49, 36, 38, 92, 88, 84, 82, 80, 26, 95, 69, 82};
    }

    static {
        A0N();
        A03 = new InterfaceC1414a0() { // from class: com.facebook.ads.redexgen.X.Pc
            @Override // com.facebook.ads.redexgen.X.InterfaceC1414a0
            public final boolean A6z(int i5, int i11, int i12, int i13, int i14) {
                return C8V.A0O(i5, i11, i12, i13, i14);
            }
        };
    }

    public C8V() {
        this(null);
    }

    public C8V(InterfaceC1414a0 interfaceC1414a0) {
        this.A00 = interfaceC1414a0;
    }

    public static int A00(int i5) {
        if (i5 == 0 || i5 == 3) {
            return 1;
        }
        return 2;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A01(C1084Mk c1084Mk, int i5) {
        byte[] bArrA0l = c1084Mk.A0l();
        int iA09 = c1084Mk.A09();
        int relativePosition = iA09;
        while (startPosition < iA09 + i5) {
            int startPosition = bArrA0l[relativePosition];
            if ((startPosition & 255) == 255 && bArrA0l[relativePosition + 1] == 0) {
                int i11 = relativePosition + 2;
                int startPosition2 = relativePosition + 1;
                System.arraycopy(bArrA0l, i11, bArrA0l, startPosition2, (i5 - (relativePosition - iA09)) - 2);
                i5--;
            }
            relativePosition++;
        }
        return i5;
    }

    /* JADX WARN: Incorrect condition in loop: B:3:0x0001 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A02(byte[] bArr, int i5) {
        while (i5 < i) {
            int i11 = bArr[i5];
            if (i11 == 0) {
                return i5;
            }
            i5++;
        }
        int i12 = bArr.length;
        return i12;
    }

    /* JADX WARN: Incorrect condition in loop: B:8:0x000d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A03(byte[] bArr, int i5, int i11) {
        int iA02 = A02(bArr, i5);
        if (i11 == 0 || i11 == 3) {
            return iA02;
        }
        while (iA02 < terminationPos - 1) {
            int terminationPos = iA02 - i5;
            if (terminationPos % 2 == 0) {
                int terminationPos2 = iA02 + 1;
                if (bArr[terminationPos2] == 0) {
                    return iA02;
                }
            }
            int terminationPos3 = iA02 + 1;
            iA02 = A02(bArr, terminationPos3);
        }
        int terminationPos4 = bArr.length;
        return terminationPos4;
    }

    public static BinaryFrame A05(C1084Mk c1084Mk, int i5, String str) {
        byte[] bArr = new byte[i5];
        c1084Mk.A0k(bArr, 0, i5);
        return new BinaryFrame(str, bArr);
    }

    public static ChapterTocFrame A07(C1084Mk c1084Mk, int i5, int i11, boolean z11, int elementIdEndIndex, InterfaceC1414a0 interfaceC1414a0) {
        int iA09 = c1084Mk.A09();
        int iA02 = A02(c1084Mk.A0l(), iA09);
        String str = new String(c1084Mk.A0l(), iA09, iA02 - iA09, XA.A00);
        c1084Mk.A0f(iA02 + 1);
        int framePosition = c1084Mk.A0I();
        boolean z12 = (framePosition & 2) != 0;
        boolean z13 = (framePosition & 1) != 0;
        int iA0I = c1084Mk.A0I();
        String[] strArr = new String[iA0I];
        for (int i12 = 0; i12 < iA0I; i12++) {
            int startIndex = c1084Mk.A09();
            int iA022 = A02(c1084Mk.A0l(), startIndex);
            int elementIdEndIndex2 = iA022 - startIndex;
            strArr[i12] = new String(c1084Mk.A0l(), startIndex, elementIdEndIndex2, XA.A00);
            c1084Mk.A0f(iA022 + 1);
        }
        ArrayList arrayList = new ArrayList();
        int i13 = iA09 + i5;
        while (c1084Mk.A09() < i13) {
            Id3Frame id3FrameA0B = A0B(i11, c1084Mk, z11, elementIdEndIndex, interfaceC1414a0);
            if (id3FrameA0B != null) {
                arrayList.add(id3FrameA0B);
            }
        }
        return new ChapterTocFrame(str, z12, z13, strArr, (Id3Frame[]) arrayList.toArray(new Id3Frame[0]));
    }

    public static CommentFrame A08(C1084Mk c1084Mk, int i5) {
        if (i5 < 4) {
            return null;
        }
        int textStartIndex = c1084Mk.A0I();
        Charset charsetA0M = A0M(textStartIndex);
        byte[] bArr = new byte[3];
        c1084Mk.A0k(bArr, 0, 3);
        String description = new String(bArr, 0, 3);
        int encoding = i5 - 4;
        byte[] data = new byte[encoding];
        int encoding2 = i5 - 4;
        c1084Mk.A0k(data, 0, encoding2);
        int encoding3 = A03(data, 0, textStartIndex);
        String language = new String(data, 0, encoding3, charsetA0M);
        int iA00 = A00(textStartIndex) + encoding3;
        int encoding4 = A03(data, iA00, textStartIndex);
        return new CommentFrame(description, language, A0L(data, iA00, encoding4, charsetA0M));
    }

    public static C1415a1 A0A(C1084Mk c1084Mk) {
        int iA07 = c1084Mk.A07();
        String strA0J = A0J(170, 10, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        if (iA07 < 10) {
            MV.A07(strA0J, A0J(30, 31, 62));
            return null;
        }
        int iA0K = c1084Mk.A0K();
        boolean z11 = false;
        if (iA0K != 4801587) {
            MV.A07(strA0J, A0J(348, 50, 59) + String.format(A0J(0, 4, 97), Integer.valueOf(iA0K)));
            return null;
        }
        int iA0I = c1084Mk.A0I();
        c1084Mk.A0g(1);
        int framesSize = c1084Mk.A0I();
        int extendedHeaderSize = c1084Mk.A0H();
        if (iA0I == 2) {
            int id2 = framesSize & 64;
            int id3 = id2 != 0 ? 1 : 0;
            if (id3 != 0) {
                MV.A07(strA0J, A0J(180, 68, 37));
                return null;
            }
        } else if (iA0I == 3) {
            int i5 = framesSize & 64;
            if (A02[3].length() == 3) {
                throw new RuntimeException();
            }
            A02[0] = "pllyyO0jSkbVxRBNu1SFBoHx8r2sOd";
            int id4 = i5 != 0 ? 1 : 0;
            if (id4 != 0) {
                int id5 = c1084Mk.A0C();
                c1084Mk.A0g(id5);
                extendedHeaderSize -= id5 + 4;
            }
        } else if (iA0I == 4) {
            int id6 = framesSize & 64;
            int id7 = id6 != 0 ? 1 : 0;
            if (id7 != 0) {
                int majorVersion = c1084Mk.A0H();
                int id8 = majorVersion - 4;
                c1084Mk.A0g(id8);
                extendedHeaderSize -= majorVersion;
            }
            int id9 = framesSize & 16;
            int id10 = id9 != 0 ? 1 : 0;
            if (id10 != 0) {
                extendedHeaderSize -= 10;
            }
        } else {
            MV.A07(strA0J, A0J(248, 46, 65) + iA0I);
            return null;
        }
        if (iA0I < 4) {
            int id11 = framesSize & 128;
            if (id11 != 0) {
                z11 = true;
            }
        }
        return new C1415a1(iA0I, z11, extendedHeaderSize);
    }

    /* JADX WARN: Removed duplicated region for block: B:154:0x0238  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x025b  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x0290  */
    /* JADX WARN: Removed duplicated region for block: B:180:0x029f A[Catch: all -> 0x02e1, TryCatch #0 {all -> 0x02e1, blocks: (B:92:0x013f, B:182:0x02a9, B:94:0x0147, B:101:0x015d, B:103:0x0165, B:133:0x01e1, B:134:0x01e7, B:140:0x01f7, B:147:0x0209, B:161:0x024e, B:167:0x0265, B:179:0x029a, B:180:0x029f), top: B:188:0x0135 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Id3Frame A0B(int frameId3, C1084Mk c1084Mk, boolean z11, int i5, InterfaceC1414a0 interfaceC1414a0) {
        int iA0I;
        int iA0K;
        int iA0M;
        Id3Frame id3FrameA05;
        int frameId2 = c1084Mk.A0I();
        int frameId1 = c1084Mk.A0I();
        int frameId0 = c1084Mk.A0I();
        if (frameId3 >= 3) {
            iA0I = c1084Mk.A0I();
        } else {
            iA0I = 0;
        }
        if (frameId3 == 4) {
            int frameSize = c1084Mk.A0L();
            if (!z11) {
                iA0K = (frameSize & 255) | (((frameSize >> 8) & 255) << 7) | (((frameSize >> 16) & 255) << 14) | (((frameSize >> 24) & 255) << 21);
            } else {
                iA0K = frameSize;
            }
        } else if (frameId3 == 3) {
            iA0K = c1084Mk.A0L();
        } else {
            iA0K = c1084Mk.A0K();
        }
        if (frameId3 >= 3) {
            iA0M = c1084Mk.A0M();
        } else {
            iA0M = 0;
        }
        int frameSize2 = A02[0].length();
        if (frameSize2 != 19) {
            A02[3] = "xkx3apvo31jkPgr5AN31ZqqPcB15x4w";
            if (frameId2 == 0 && frameId1 == 0 && frameId0 == 0 && iA0I == 0 && iA0K == 0 && iA0M == 0) {
                int frameSize3 = c1084Mk.A0A();
                c1084Mk.A0f(frameSize3);
                return null;
            }
            int flags = c1084Mk.A09() + iA0K;
            int nextFramePosition = c1084Mk.A0A();
            String strA0J = A0J(170, 10, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
            if (flags > nextFramePosition) {
                MV.A07(strA0J, A0J(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 37, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
                c1084Mk.A0f(c1084Mk.A0A());
                return null;
            }
            if (interfaceC1414a0 != null && !interfaceC1414a0.A6z(frameId3, frameId2, frameId1, frameId0, iA0I)) {
                return null;
            }
            int frameSize4 = 0;
            boolean hasGroupIdentifier = false;
            boolean hasDataLength = false;
            int i11 = 0;
            boolean z12 = false;
            if (frameId3 == 3) {
                i11 = (iA0M & 128) != 0 ? 1 : 0;
                hasGroupIdentifier = (iA0M & 64) != 0;
                z12 = (iA0M & 32) != 0;
                frameSize4 = i11;
            } else if (frameId3 == 4) {
                z12 = (iA0M & 64) != 0;
                frameSize4 = (iA0M & 8) != 0 ? 1 : 0;
                hasGroupIdentifier = (iA0M & 4) != 0;
                hasDataLength = (iA0M & 2) != 0;
                i11 = (iA0M & 1) != 0 ? 1 : 0;
            }
            if (frameSize4 != 0 || hasGroupIdentifier) {
                MV.A07(strA0J, A0J(294, 50, 107));
                return null;
            }
            if (z12) {
                iA0K--;
                c1084Mk.A0g(1);
            }
            if (i11 != 0) {
                iA0K -= 4;
                c1084Mk.A0g(4);
            }
            if (hasDataLength) {
                iA0K = A01(c1084Mk, iA0K);
            }
            try {
                if (frameId2 == 84 && frameId1 == 88 && frameId0 == 88 && (frameId3 == 2 || iA0I == 88)) {
                    id3FrameA05 = A0E(c1084Mk, iA0K);
                } else if (frameId2 == 84) {
                    id3FrameA05 = A0F(c1084Mk, iA0K, A0K(frameId3, frameId2, frameId1, frameId0, iA0I));
                } else if (frameId2 == 87 && frameId1 == 88 && frameId0 == 88 && (frameId3 == 2 || iA0I == 88)) {
                    id3FrameA05 = A0G(c1084Mk, iA0K);
                } else if (frameId2 == 87) {
                    id3FrameA05 = A0H(c1084Mk, iA0K, A0K(frameId3, frameId2, frameId1, frameId0, iA0I));
                } else {
                    if (frameId2 == 80) {
                        String[] strArr = A02;
                        if (strArr[7].length() == strArr[5].length()) {
                            String[] strArr2 = A02;
                            strArr2[1] = "3Rmled7pOU2MIFm80fDikiUgpbd3LEyL";
                            strArr2[2] = "hew1IOjEcjVUCeARNBOOJbNfjgwkGxJB";
                            if (frameId1 == 82 && frameId0 == 73 && iA0I == 86) {
                                id3FrameA05 = A0D(c1084Mk, iA0K);
                            }
                        }
                    }
                    if (frameId2 == 71 && frameId1 == 69 && frameId0 == 79 && (iA0I == 66 || frameId3 == 2)) {
                        id3FrameA05 = A09(c1084Mk, iA0K);
                    } else {
                        String[] strArr3 = A02;
                        String str = strArr3[1];
                        String str2 = strArr3[2];
                        int frameSize5 = str.charAt(15);
                        if (frameSize5 != str2.charAt(15)) {
                            A02[0] = "hLiqWaU2VKQGxb7qu5NekskVW";
                            if (frameId3 != 2 ? !(frameId2 != 65 || frameId1 != 80 || frameId0 != 73 || iA0I != 67) : !(frameId2 != 80 || frameId1 != 73 || frameId0 != 67)) {
                                id3FrameA05 = A04(c1084Mk, iA0K, frameId3);
                            } else if (frameId2 == 67 && frameId1 == 79 && frameId0 == 77 && (iA0I == 77 || frameId3 == 2)) {
                                id3FrameA05 = A08(c1084Mk, iA0K);
                            } else if (frameId2 == 67) {
                                String[] strArr4 = A02;
                                if (strArr4[1].charAt(15) != strArr4[2].charAt(15)) {
                                    A02[3] = "WRLDsLsRIWfesP2br";
                                    if (frameId1 == 72) {
                                        if (frameId0 == 65 && iA0I == 80) {
                                            id3FrameA05 = A06(c1084Mk, iA0K, frameId3, z11, i5, interfaceC1414a0);
                                        } else if (frameId2 == 67 && frameId1 == 84 && frameId0 == 79 && iA0I == 67) {
                                            id3FrameA05 = A07(c1084Mk, iA0K, frameId3, z11, i5, interfaceC1414a0);
                                        } else if (frameId2 != 77) {
                                            id3FrameA05 = A05(c1084Mk, iA0K, A0K(frameId3, frameId2, frameId1, frameId0, iA0I));
                                        } else if (A02[3].length() != 3) {
                                            String[] strArr5 = A02;
                                            strArr5[7] = "9iw4en5w9JOYJKcMErTHNJTWSACkJY";
                                            strArr5[5] = "3VadItTRNagJu0YfKnz18yFaBCd9zL";
                                            if (frameId1 == 76) {
                                                if (frameId0 == 76 && iA0I == 84) {
                                                    id3FrameA05 = A0C(c1084Mk, iA0K);
                                                }
                                            }
                                        } else if (frameId1 == 76) {
                                        }
                                    }
                                } else {
                                    String[] strArr6 = A02;
                                    strArr6[1] = "TqjjqncCc8SNUp0iowWlF0GQKU84swFz";
                                    strArr6[2] = "FaXpscmVu9s0bcRjOAQpdBtEjkIewf4R";
                                    if (frameId1 == 72) {
                                    }
                                }
                            }
                        }
                    }
                }
                if (id3FrameA05 == null) {
                    MV.A07(strA0J, A0J(61, 27, 89) + A0K(frameId3, frameId2, frameId1, frameId0, iA0I) + A0J(18, 12, 100) + iA0K);
                }
                return id3FrameA05;
            } finally {
                c1084Mk.A0f(flags);
            }
        }
        throw new RuntimeException();
    }

    public static PrivFrame A0D(C1084Mk c1084Mk, int i5) {
        byte[] bArr = new byte[i5];
        c1084Mk.A0k(bArr, 0, i5);
        int iA02 = A02(bArr, 0);
        return new PrivFrame(new String(bArr, 0, iA02, XA.A00), A0Q(bArr, iA02 + 1, bArr.length));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<java.lang.String> */
    public static TextInformationFrame A0E(C1084Mk c1084Mk, int i5) {
        if (i5 < 1) {
            return null;
        }
        int iA0I = c1084Mk.A0I();
        int encoding = i5 - 1;
        byte[] bArr = new byte[encoding];
        int encoding2 = i5 - 1;
        c1084Mk.A0k(bArr, 0, encoding2);
        int iA03 = A03(bArr, 0, iA0I);
        String str = new String(bArr, 0, iA03, A0M(iA0I));
        int encoding3 = A00(iA0I);
        return new TextInformationFrame(A0J(344, 4, 31), str, A0I(bArr, iA0I, encoding3 + iA03));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<java.lang.String> */
    public static TextInformationFrame A0F(C1084Mk c1084Mk, int i5, String str) {
        if (i5 < 1) {
            return null;
        }
        int iA0I = c1084Mk.A0I();
        int encoding = i5 - 1;
        byte[] data = new byte[encoding];
        c1084Mk.A0k(data, 0, i5 - 1);
        return new TextInformationFrame(str, null, A0I(data, iA0I, 0));
    }

    public static UrlLinkFrame A0G(C1084Mk c1084Mk, int i5) {
        if (i5 < 1) {
            String[] strArr = A02;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[4] = "SPxeGoZSNSgTbWym";
            strArr2[6] = "33lkerVVGiVeq1xCyMDroZS8rCI";
            return null;
        }
        int iA0I = c1084Mk.A0I();
        int encoding = i5 - 1;
        byte[] bArr = new byte[encoding];
        int encoding2 = i5 - 1;
        c1084Mk.A0k(bArr, 0, encoding2);
        int iA03 = A03(bArr, 0, iA0I);
        String str = new String(bArr, 0, iA03, A0M(iA0I));
        int descriptionEndIndex = A00(iA0I) + iA03;
        String description = A0L(bArr, descriptionEndIndex, A02(bArr, descriptionEndIndex), XA.A00);
        return new UrlLinkFrame(A0J(398, 4, 13), str, description);
    }

    public static UrlLinkFrame A0H(C1084Mk c1084Mk, int i5, String str) {
        byte[] bArr = new byte[i5];
        c1084Mk.A0k(bArr, 0, i5);
        return new UrlLinkFrame(str, null, new String(bArr, 0, A02(bArr, 0), XA.A00));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<java.lang.String> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<java.lang.String> */
    public static AbstractC07549l<String> A0I(byte[] bArr, int i5, int i11) {
        int length = bArr.length;
        String strA0J = A0J(0, 0, 96);
        if (i11 >= length) {
            return AbstractC07549l.A04(strA0J);
        }
        C06344e c06344eA01 = AbstractC07549l.A01();
        int valueEndIndex = A03(bArr, i11, i5);
        while (i11 < valueEndIndex) {
            int valueStartIndex = valueEndIndex - i11;
            c06344eA01.A04(new String(bArr, i11, valueStartIndex, A0M(i5)));
            i11 = valueEndIndex + A00(i5);
            valueEndIndex = A03(bArr, i11, i5);
        }
        AbstractC07549l<String> abstractC07549lA05 = c06344eA01.A05();
        return abstractC07549lA05.isEmpty() ? AbstractC07549l.A04(strA0J) : abstractC07549lA05;
    }

    public static String A0K(int i5, int i11, int i12, int i13, int i14) {
        return i5 == 2 ? String.format(Locale.US, A0J(4, 6, 50), Integer.valueOf(i11), Integer.valueOf(i12), Integer.valueOf(i13)) : String.format(Locale.US, A0J(10, 8, 73), Integer.valueOf(i11), Integer.valueOf(i12), Integer.valueOf(i13), Integer.valueOf(i14));
    }

    public static String A0L(byte[] bArr, int i5, int i11, Charset charset) {
        if (i11 <= i5 || i11 > bArr.length) {
            String strA0J = A0J(0, 0, 96);
            String[] strArr = A02;
            if (strArr[4].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[4] = "Ajw25UA1JzSG5nck";
            strArr2[6] = "CW3KTU3u5THrbhQ2QNxXB8tc6gb";
            return strA0J;
        }
        return new String(bArr, i5, i11 - i5, charset);
    }

    public static Charset A0M(int i5) {
        switch (i5) {
            case 1:
                return XA.A02;
            case 2:
                return XA.A03;
            case 3:
                return XA.A05;
            default:
                return XA.A00;
        }
    }

    public static /* synthetic */ boolean A0O(int i5, int i11, int i12, int i13, int i14) {
        return false;
    }

    public static boolean A0P(C1084Mk c1084Mk, int i5, int i11, boolean z11) throws Throwable {
        int iA0C;
        long jA0Q;
        int iA0M;
        int iA09 = c1084Mk.A09();
        while (true) {
            try {
                if (c1084Mk.A07() < i11) {
                    c1084Mk.A0f(iA09);
                    return true;
                }
                if (i5 >= 3) {
                    try {
                        iA0C = c1084Mk.A0C();
                        jA0Q = c1084Mk.A0Q();
                        iA0M = c1084Mk.A0M();
                    } catch (Throwable th2) {
                        th = th2;
                        c1084Mk.A0f(iA09);
                        throw th;
                    }
                } else {
                    iA0C = c1084Mk.A0K();
                    jA0Q = c1084Mk.A0K();
                    iA0M = 0;
                }
                if (iA0C == 0 && jA0Q == 0 && iA0M == 0) {
                    c1084Mk.A0f(iA09);
                    return true;
                }
                if (i5 == 4 && !z11) {
                    if ((8421504 & jA0Q) != 0) {
                        c1084Mk.A0f(iA09);
                        return false;
                    }
                    jA0Q = (((jA0Q >> 24) & 255) << 21) | (jA0Q & 255) | (((jA0Q >> 8) & 255) << 7) | (((jA0Q >> 16) & 255) << 14);
                }
                boolean z12 = false;
                boolean z13 = false;
                if (i5 == 4) {
                    z12 = (iA0M & 64) != 0;
                    z13 = (iA0M & 1) != 0;
                } else if (i5 == 3) {
                    int minimumFrameSize = iA0M & 32;
                    z12 = minimumFrameSize != 0;
                    int minimumFrameSize2 = iA0M & 128;
                    z13 = minimumFrameSize2 != 0;
                }
                int minimumFrameSize3 = 0;
                if (z12) {
                    minimumFrameSize3 = 0 + 1;
                }
                if (z13) {
                    minimumFrameSize3 += 4;
                }
                if (jA0Q < minimumFrameSize3) {
                    c1084Mk.A0f(iA09);
                    return false;
                }
                int minimumFrameSize4 = c1084Mk.A07();
                if (minimumFrameSize4 >= jA0Q) {
                    int minimumFrameSize5 = (int) jA0Q;
                    c1084Mk.A0g(minimumFrameSize5);
                } else {
                    c1084Mk.A0f(iA09);
                    return false;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    public static byte[] A0Q(byte[] bArr, int i5, int i11) {
        if (i11 <= i5) {
            return N1.A07;
        }
        return Arrays.copyOfRange(bArr, i5, i11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1158Pn
    public final Metadata A0R(C07368e c07368e, ByteBuffer byteBuffer) {
        return A0S(byteBuffer.array(), byteBuffer.limit());
    }

    public final Metadata A0S(byte[] bArr, int i5) {
        ArrayList arrayList = new ArrayList();
        C1084Mk c1084Mk = new C1084Mk(bArr, i5);
        C1415a1 c1415a1A0A = A0A(c1084Mk);
        if (c1415a1A0A == null) {
            return null;
        }
        int startPosition = c1084Mk.A09();
        int frameHeaderSize = c1415a1A0A.A01 == 2 ? 6 : 10;
        int iA01 = c1415a1A0A.A00;
        if (c1415a1A0A.A02) {
            iA01 = A01(c1084Mk, c1415a1A0A.A00);
        }
        c1084Mk.A0e(startPosition + iA01);
        boolean z11 = false;
        if (!A0P(c1084Mk, c1415a1A0A.A01, frameHeaderSize, false)) {
            if (c1415a1A0A.A01 == 4 && A0P(c1084Mk, 4, frameHeaderSize, true)) {
                z11 = true;
            } else {
                MV.A07(A0J(170, 10, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), A0J(88, 45, 4) + c1415a1A0A.A01);
                return null;
            }
        }
        while (c1084Mk.A07() >= frameHeaderSize) {
            Id3Frame id3FrameA0B = A0B(c1415a1A0A.A01, c1084Mk, z11, frameHeaderSize, this.A00);
            if (id3FrameA0B != null) {
                arrayList.add(id3FrameA0B);
            }
        }
        return new Metadata(arrayList);
    }
}
