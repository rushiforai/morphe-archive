package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.text.Cue;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.48, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass48 extends AnonymousClass89 {
    public static byte[] A0I;
    public static String[] A0J = {"5avthSGNkh5nCkdsZIi", "L7ywCvhw", "hcOfJ", "5OsTCrdsimt4RFq0qGqjElJ", "wTm22FlZF43Koip7lRcC4ioY9aXXXMpL", "iAEOK", "pdCqApPDO85ILCqbyu426ZzonGdtH", "8UARrx67oil6FdkvMzqyfSv"};
    public static final int[] A0K;
    public static final int[] A0L;
    public static final int[] A0M;
    public static final int[] A0N;
    public static final int[] A0O;
    public static final int[] A0P;
    public static final int[] A0Q;
    public static final boolean[] A0R;
    public byte A00;
    public byte A01;
    public int A02;
    public int A03;
    public long A05;
    public List<C1251Th> A07;
    public List<C1251Th> A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public final int A0C;
    public final int A0D;
    public final int A0E;
    public final long A0F;
    public final C1084Mk A0G = new C1084Mk();
    public final ArrayList<C1509bY> A0H = new ArrayList<>();
    public C1509bY A06 = new C1509bY(0, 4);
    public int A04 = 0;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0I = new byte[]{108, 74, 78, 25, 31, 23, 107, 74, 76, 64, 75, 74, 93, 111, 72, 80, 71, 74, 79, 66, 6, 69, 78, 71, 72, 72, 67, 74, 8, 6, 98, 67, 64, 71, 83, 74, 82, 79, 72, 65, 6, 82, 73, 6, 101, 101, 23, 8, 6, 23, 23, 11, 14, 4, 6, 19, 14, 8, 9, 72, 31, 74, 10, 23, 83, 74, 4, 2, 6, 74, 81, 87, 95};
    }

    static {
        A09();
        A0M = new int[]{11, 1, 3, 12, 14, 5, 7, 9};
        A0L = new int[]{0, 4, 8, 12, 16, 20, 24, 28};
        A0Q = new int[]{-1, -16711936, -16776961, -16711681, -65536, -256, -65281};
        A0K = new int[]{32, 33, 34, 35, 36, 37, 38, 39, 40, 41, Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 233, 93, 237, 243, androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 120, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 231, 247, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 241, 9632};
        A0N = new int[]{174, 176, 189, 191, 8482, 162, 163, 9834, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 32, 232, Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 234, 238, 244, 251};
        A0O = new int[]{193, 201, 211, Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, 252, 8216, 161, 42, 39, 8212, 169, 8480, 8226, 8220, 8221, 192, 194, 199, 200, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 235, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 239, Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, 249, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 171, 187};
        A0P = new int[]{195, Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 236, Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 242, Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 245, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 92, 94, 95, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, 196, 228, Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, 246, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 165, 164, 9474, 197, 229, Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, 248, 9484, 9488, 9492, 9496};
        A0R = new boolean[]{false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false, false, true, true, false, true, false, false, true, false, true, true, false, true, false, false, true, true, false, false, true, false, true, true, false};
    }

    public AnonymousClass48(String str, int i5, long j11) {
        this.A0F = j11 > 0 ? 1000 * j11 : -9223372036854775807L;
        this.A0C = A06(48, 25, 26).equals(str) ? 2 : 3;
        switch (i5) {
            case 1:
                this.A0D = 0;
                this.A0E = 0;
                break;
            case 2:
                this.A0D = 1;
                this.A0E = 0;
                break;
            case 3:
                this.A0D = 0;
                this.A0E = 1;
                break;
            case 4:
                this.A0D = 1;
                this.A0E = 1;
                break;
            default:
                MV.A07(A06(0, 13, 82), A06(13, 35, 91));
                this.A0D = 0;
                this.A0E = 0;
                break;
        }
        A0E(0);
        A08();
        this.A0A = true;
        this.A05 = -9223372036854775807L;
    }

    public static char A00(byte b11) {
        int index = A0K[(b11 & AbstractJsonLexerKt.TC_INVALID) - 32];
        return (char) index;
    }

    public static char A01(byte b11) {
        int index = A0O[b11 & 31];
        return (char) index;
    }

    public static char A02(byte b11) {
        int index = A0P[b11 & 31];
        return (char) index;
    }

    public static char A03(byte b11) {
        int index = A0N[b11 & 15];
        return (char) index;
    }

    public static char A04(byte b11, byte b12) {
        if ((b11 & 1) == 0) {
            char cA01 = A01(b12);
            if (A0J[1].length() != 8) {
                throw new RuntimeException();
            }
            String[] strArr = A0J;
            strArr[3] = "or9hMb2GTVnsuDDJtVDKwJP";
            strArr[7] = "v53taZhdbGsZv6EdprRx1cb";
            return cA01;
        }
        return A02(b12);
    }

    public static int A05(byte b11) {
        return (b11 >> 3) & 1;
    }

    private List<C1251Th> A07() {
        int iMin = 2;
        int size = this.A0H.size();
        ArrayList arrayList = new ArrayList(size);
        for (int i5 = 0; i5 < size; i5++) {
            C1251Th c1251ThA08 = this.A0H.get(i5).A08(Integer.MIN_VALUE);
            arrayList.add(c1251ThA08);
            if (c1251ThA08 != null) {
                int positionAnchor = c1251ThA08.A08;
                iMin = Math.min(iMin, positionAnchor);
            }
        }
        List<Cue> displayCues = new ArrayList<>(size);
        for (int i11 = 0; i11 < size; i11++) {
            C1251Th c1251Th = (C1251Th) arrayList.get(i11);
            if (c1251Th != null) {
                int cueBuilderCount = c1251Th.A08;
                if (cueBuilderCount != iMin) {
                    c1251Th = (C1251Th) AbstractC1062Ln.A01(this.A0H.get(i11).A08(iMin));
                }
                displayCues.add(c1251Th);
            }
        }
        return displayCues;
    }

    private void A08() {
        this.A06.A0C(this.A02);
        this.A0H.clear();
        this.A0H.add(this.A06);
    }

    private void A0A(byte b11) {
        this.A06.A0B(' ');
        int style = (b11 >> 1) & 7;
        this.A06.A0F(style, (b11 & 1) == 1);
    }

    private void A0B(byte b11) {
        switch (b11) {
            case 32:
                A0E(2);
                break;
            case 33:
            case 34:
            case 35:
            case 36:
            case 40:
            default:
                if (this.A02 != 0) {
                    switch (b11) {
                        case 33:
                            this.A06.A09();
                            break;
                        case 44:
                            this.A07 = Collections.emptyList();
                            if (this.A02 == 1 || this.A02 == 3) {
                                A08();
                                break;
                            }
                            break;
                        case 45:
                            if (this.A02 == 1 && !this.A06.A0G()) {
                                this.A06.A0A();
                                break;
                            }
                            break;
                        case 46:
                            A08();
                            break;
                        case 47:
                            this.A07 = A07();
                            A08();
                            break;
                    }
                }
                break;
            case 37:
                A0E(1);
                A0F(2);
                break;
            case 38:
                A0E(1);
                A0F(3);
                break;
            case 39:
                A0E(1);
                A0F(4);
                break;
            case 41:
                A0E(3);
                break;
        }
    }

    private void A0C(byte b11, byte b12) {
        int i5 = A0M[b11 & 7];
        int row = b12 & 32;
        int row2 = row != 0 ? 1 : 0;
        if (row2 != 0) {
            i5++;
        }
        int row3 = this.A06.A03;
        if (i5 != row3) {
            int row4 = this.A02;
            if (row4 != 1 && !this.A06.A0G()) {
                this.A06 = new C1509bY(this.A02, this.A03);
                this.A0H.add(this.A06);
            }
            C1509bY c1509bY = this.A06;
            if (A0J[4].charAt(12) == 'w') {
                throw new RuntimeException();
            }
            String[] strArr = A0J;
            strArr[3] = "DcsChnubJ5w4sO391Pamf6w";
            strArr[7] = "OeJDKNTkUiCX6ocwK3eoY7M";
            c1509bY.A03 = i5;
        }
        int cursorOrStyle = (b12 & 16) == 16 ? 1 : 0;
        int row5 = b12 & 1;
        boolean isCursor = row5 == 1;
        int row6 = b12 >> 1;
        int i11 = row6 & 7;
        C1509bY c1509bY2 = this.A06;
        int row7 = cursorOrStyle != 0 ? 8 : i11;
        c1509bY2.A0F(row7, isCursor);
        if (cursorOrStyle != 0) {
            C1509bY c1509bY3 = this.A06;
            int row8 = A0L[i11];
            c1509bY3.A02 = row8;
        }
    }

    private void A0D(byte b11, byte b12) {
        if (A0L(b11)) {
            this.A0A = false;
        }
        if (!A0K(b11)) {
            return;
        }
        switch (b12) {
            case 32:
            case 37:
            case 38:
            case 39:
            case 41:
            case 47:
                this.A0A = true;
                break;
            case 42:
            case 43:
                this.A0A = false;
                break;
        }
    }

    private void A0E(int i5) {
        if (this.A02 == i5) {
            return;
        }
        int i11 = this.A02;
        this.A02 = i5;
        if (i5 == 3) {
            int i12 = 0;
            while (true) {
                int size = this.A0H.size();
                String[] strArr = A0J;
                String str = strArr[3];
                String str2 = strArr[7];
                int i13 = str.length();
                int oldCaptionMode = str2.length();
                if (i13 != oldCaptionMode) {
                    throw new RuntimeException();
                }
                A0J[1] = "t04SQziW";
                if (i12 < size) {
                    this.A0H.get(i12).A0D(i5);
                    i12++;
                } else {
                    return;
                }
            }
        } else {
            A08();
            if (i11 == 3 || i5 == 1 || i5 == 0) {
                this.A07 = Collections.emptyList();
            }
        }
    }

    private void A0F(int i5) {
        this.A03 = i5;
        this.A06.A0E(i5);
    }

    private boolean A0G() {
        return (this.A0F == -9223372036854775807L || this.A05 == -9223372036854775807L || A0V() - this.A05 < this.A0F) ? false : true;
    }

    private boolean A0H(byte b11) {
        if (A0I(b11)) {
            this.A04 = A05(b11);
        }
        return this.A04 == this.A0D;
    }

    public static boolean A0I(byte b11) {
        return (b11 & 224) == 0;
    }

    public static boolean A0J(byte b11) {
        return (b11 & 240) == 16;
    }

    public static boolean A0K(byte b11) {
        return (b11 & 247) == 20;
    }

    public static boolean A0L(byte b11) {
        return 1 <= b11 && b11 <= 15;
    }

    public static boolean A0M(byte b11, byte b12) {
        return (b11 & 246) == 18 && (b12 & 224) == 32;
    }

    public static boolean A0N(byte b11, byte b12) {
        return (b11 & 247) == 17 && (b12 & 240) == 32;
    }

    public static boolean A0O(byte b11, byte b12) {
        return (b11 & 246) == 20 && (b12 & 240) == 32;
    }

    public static boolean A0P(byte b11, byte b12) {
        return (b11 & 240) == 16 && (b12 & 192) == 64;
    }

    public static boolean A0Q(byte b11, byte b12) {
        return (b11 & 247) == 17 && (b12 & 240) == 48;
    }

    public static boolean A0R(byte b11, byte b12) {
        return (b11 & 247) == 23 && b12 >= 33 && b12 <= 35;
    }

    private boolean A0S(boolean z11, byte b11, byte b12) {
        if (z11 && A0J(b11)) {
            if (this.A0B && this.A00 == b11 && this.A01 == b12) {
                this.A0B = false;
                return true;
            }
            this.A0B = true;
            this.A00 = b11;
            if (A0J[4].charAt(12) != 'w') {
                A0J[4] = "EXG4zTRNuhoKHo36gTZJWdwUCSkho82B";
                this.A01 = b12;
            } else {
                throw new RuntimeException();
            }
        } else {
            this.A0B = false;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89
    /* renamed from: A0W */
    public final /* bridge */ /* synthetic */ C8B A6Q() throws C1135Oj {
        return super.A6Q();
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1115Np
    /* renamed from: A0X, reason: merged with bridge method [inline-methods] */
    public final C8A A6S() throws C1135Oj {
        C8A outputBuffer = super.A6S();
        if (outputBuffer != null) {
            return outputBuffer;
        }
        if (A0G()) {
            C8A c8aA0Y = A0Y();
            if (A0J[1].length() != 8) {
                throw new RuntimeException();
            }
            String[] strArr = A0J;
            strArr[5] = "5suUi";
            strArr[2] = "gJClB";
            if (c8aA0Y != null) {
                this.A07 = Collections.emptyList();
                this.A05 = -9223372036854775807L;
                c8aA0Y.A0C(A0V(), A0Z(), Long.MAX_VALUE);
                return c8aA0Y;
            }
        }
        String[] strArr2 = A0J;
        if (strArr2[6].length() == strArr2[0].length()) {
            throw new RuntimeException();
        }
        A0J[1] = "FI5BPZoo";
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89
    public final C1133Oh A0Z() {
        this.A08 = this.A07;
        return new C1133Oh((List) AbstractC1062Ln.A01(this.A07));
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89
    /* renamed from: A0a */
    public final /* bridge */ /* synthetic */ void AIW(C8B c8b) throws C1135Oj {
        super.AIW(c8b);
    }

    /* JADX WARN: Removed duplicated region for block: B:110:0x0016 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00de  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x00a5 A[SYNTHETIC] */
    @Override // com.facebook.ads.redexgen.X.AnonymousClass89
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0b(C8B c8b) {
        ByteBuffer subtitleData = (ByteBuffer) AbstractC1062Ln.A01(c8b.A02);
        this.A0G.A0j(subtitleData.array(), subtitleData.limit());
        boolean z11 = false;
        while (true) {
            if (this.A0G.A07() >= this.A0C) {
                byte ccData2 = this.A0C == 2 ? (byte) -4 : (byte) this.A0G.A0I();
                int iA0I = this.A0G.A0I();
                int iA0I2 = this.A0G.A0I();
                if ((ccData2 & 2) == 0 && (ccData2 & 1) == this.A0E) {
                    byte b11 = (byte) (iA0I & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                    byte b12 = (byte) (iA0I2 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                    if (A0J[1].length() != 8) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A0J;
                    strArr[5] = "zzZOL";
                    strArr[2] = "Ii7YA";
                    if (b11 != 0 || b12 != 0) {
                        boolean z12 = this.A09;
                        this.A09 = (ccData2 & 4) == 4 && A0R[iA0I] && A0R[iA0I2];
                        if (!A0S(this.A09, b11, b12)) {
                            boolean z13 = this.A09;
                            if (A0J[4].charAt(12) != 'w') {
                                A0J[4] = "OQPfwdakyQEEoguuPgoXIjpRrx5nAeXz";
                                if (!z13) {
                                    if (!z12) {
                                        A08();
                                        z11 = true;
                                    }
                                } else {
                                    A0D(b11, b12);
                                    if (this.A0A && A0H(b11)) {
                                        boolean zA0I = A0I(b11);
                                        if (A0J[1].length() != 8) {
                                            String[] strArr2 = A0J;
                                            strArr2[5] = "qrfjn";
                                            strArr2[2] = "qcX0c";
                                            if (zA0I) {
                                            }
                                        } else if (zA0I) {
                                            if (A0Q(b11, b12)) {
                                                this.A06.A0B(A03(b12));
                                            } else if (A0M(b11, b12)) {
                                                this.A06.A09();
                                                this.A06.A0B(A04(b11, b12));
                                            } else if (A0N(b11, b12)) {
                                                A0A(b12);
                                            } else if (A0P(b11, b12)) {
                                                A0C(b11, b12);
                                            } else if (!A0R(b11, b12)) {
                                                if (A0O(b11, b12)) {
                                                    A0B(b12);
                                                }
                                            } else {
                                                this.A06.A04 = b12 - 32;
                                            }
                                        } else {
                                            C1509bY c1509bY = this.A06;
                                            String[] strArr3 = A0J;
                                            if (strArr3[3].length() != strArr3[7].length()) {
                                                String[] strArr4 = A0J;
                                                strArr4[6] = "cQQGewpSHeyD1TxEZlNzeXFV7EUQS";
                                                strArr4[0] = "FZt20IToQ9Y3dkLnOsO";
                                                c1509bY.A0B(A00(b11));
                                                if ((b12 & 224) != 0) {
                                                    this.A06.A0B(A00(b12));
                                                }
                                            } else {
                                                String[] strArr5 = A0J;
                                                strArr5[3] = "FODveKOqM7gv8wpB8GnQzFJ";
                                                strArr5[7] = "SCaId2ImMQy7oB4WYOLvjJ1";
                                                c1509bY.A0B(A00(b11));
                                                if ((b12 & 224) != 0) {
                                                }
                                            }
                                        }
                                        z11 = true;
                                    }
                                }
                            } else {
                                String[] strArr6 = A0J;
                                strArr6[3] = "axBiQb0Rj1DOhL8QGkD5Lmk";
                                strArr6[7] = "v2K7g7OXfsXZiNtAGVex1VH";
                                if (!z13) {
                                    if (!z12) {
                                    }
                                } else {
                                    A0D(b11, b12);
                                    if (this.A0A) {
                                        boolean zA0I2 = A0I(b11);
                                        if (A0J[1].length() != 8) {
                                        }
                                        z11 = true;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if (z11) {
                    if (this.A02 == 1 || this.A02 == 3) {
                        this.A07 = A07();
                        this.A05 = A0V();
                        return;
                    }
                    return;
                }
                return;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89
    public final boolean A0d() {
        return this.A07 != this.A08;
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1115Np
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1136Ok
    public final /* bridge */ /* synthetic */ void AKz(long j11) {
        super.AKz(j11);
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass89, com.facebook.ads.redexgen.X.InterfaceC1115Np
    public final void flush() {
        super.flush();
        this.A07 = null;
        this.A08 = null;
        A0E(0);
        A0F(4);
        A08();
        this.A09 = false;
        this.A0B = false;
        this.A00 = (byte) 0;
        this.A01 = (byte) 0;
        this.A04 = 0;
        this.A0A = true;
        this.A05 = -9223372036854775807L;
    }
}
