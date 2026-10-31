package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import com.facebook.ads.NativeAd;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.72, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass72 extends C0799Be {
    public static byte[] A0F;
    public static String[] A0G = {"w8SaG80T2ViDswT0nuPqmO1k9PeWB2f4", "UURxMUTfZc9jwsOYbWOlFtgRDjishG7U", "9p2g", "INN2HtqAhA5mL7XMOZvCKioUM5knrUS", "jJ2vtS0EUQfOTi08AXeyZLsGcMcBRimM", "tfwtSjwp5OyBefaBVI6bmHBmegOniKqc", "X1GPG", "H9xTXQ8zpmNFyIrG3lrWgeNRJB9mffvE"};
    public static final String A0H;
    public Uri A00;
    public NativeAd A01;
    public InterfaceC2224nG A02;
    public InterfaceC2474rO A03;
    public C0804Bj A04;
    public C5Z A05;
    public String A06;
    public String A07;
    public String A08;
    public final C1729f8 A09;
    public final C0958Hi A0A;
    public final BM A0B;
    public final BG A0C;
    public final BE A0D;
    public final String A0E;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0F = new byte[]{122, -104, -91, 94, -85, 87, -86, -85, -104, -87, -85, 87, 120, -84, -101, -96, -100, -91, -102, -100, -123, -100, -85, -82, -90, -87, -94, 120, -102, -85, -96, -83, -96, -85, -80, 101, 87, -124, -104, -94, -100, 87, -86, -84, -87, -100, 87, -85, -97, -104, -85, 87, -96, -85, 94, -86, 87, -96, -91, 87, -80, -90, -84, -87, 87, 120, -91, -101, -87, -90, -96, -101, -124, -104, -91, -96, -99, -100, -86, -85, 101, -81, -92, -93, 87, -99, -96, -93, -100, 101, -77, -32, -32, -35, -32, -88, -114, 109, 105, 104, -100, -117, -112, -116, -107, -118, -116, 117, -116, -101, -98, -106, -103, -110, 113, -103, -105, -104, 68, -105, -119, -104, 103, -112, -115, -119, -110, -104, 120, -109, -113, -119, -110, 68, -118, -115, -106, -105, -104, 113, -103, -105, -104, 68, -105, -119, -104, 122, -115, -120, -119, -109, 121, 118, 109, 68, -109, -106, 68, -105, -119, -104, 122, -115, -120, -119, -109, 113, 116, 104, 68, -118, -115, -106, -105, -104, -16, -3, -18, -16, -14, 3, -8, 5, -8, 3, 8, -80, -71, -74, -78, -69, -63, -95, -68, -72, -78, -69, -7, -22, -5, -4, -14, -9, -16, -107, -105, -118, -119, -118, -117, -114, -109, -118, -119, 116, -105, -114, -118, -109, -103, -122, -103, -114, -108, -109, 112, -118, -98, -48, -55, -60, -52, -48, -64, -92, -65, -39, -41, -55, -78, -59, -40, -51, -38, -55, -89, -40, -59, -90, -39, -40, -40, -45, -46, -41, -54, -59, -58, -48, -83, -48, -56, -56, -58, -45, -22, -35, -40, -39, -29, -63, -60, -72, -120, 123, 118, 119, -127, 101, 119, 119, 125, 102, 123, AbstractJsonLexerKt.TC_INVALID, 119, -40, -53, -58, -57, -47, -73, -76, -82, -3, -16, -21, -20, -10, -26, -5, -16, -12, -20, -26, -9, -10, -13, -13, -16, -11, -18, -26, -16, -11, -5, -20, -7, -3, -24, -13, -87, -100, -104, -86, -121, -84, -93, -104};
    }

    static {
        A03();
        A0H = AnonymousClass72.class.getSimpleName();
    }

    public AnonymousClass72(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A0E = UUID.randomUUID().toString();
        this.A0D = new BE() { // from class: com.facebook.ads.redexgen.X.75
            public static String[] A01 = {"3HJrVJ73tbjG2wlGP0Bv3sg114RWReqh", "KjbZJ14", "byIXsJDFT4cdH01hLIEiCoP3oVFxRmF5", "CAUeU9lKsEQJQ8oJs88JTqk7GAcDU2io", "xLviaKB4KZIhZN1GU0dHl8c6bwXdm9iC", "IMgVgO", "Wh2MWpRo7VbT5p9HRfne6LI8Uh8KJseH", "ItjfoHp0lrctiWkbEjfK3EyEN624ZUfA"};

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AGH();
                    if (A01[1].length() != 7) {
                        throw new RuntimeException();
                    }
                    A01[4] = "hS5VQsWNORhrf4LLsxqD30oOzabUAqI4";
                }
            }
        };
        this.A0C = new BG() { // from class: com.facebook.ads.redexgen.X.74
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                if (this.A00.A03 != null) {
                    this.A00.A03.onPause();
                }
            }
        };
        this.A0B = new BM() { // from class: com.facebook.ads.redexgen.X.73
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AER();
                }
            }
        };
        this.A09 = new C1729f8(this, c0958Hi);
        this.A0A = c0958Hi;
        A02();
    }

    public AnonymousClass72(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A0E = UUID.randomUUID().toString();
        this.A0D = new BE() { // from class: com.facebook.ads.redexgen.X.75
            public static String[] A01 = {"3HJrVJ73tbjG2wlGP0Bv3sg114RWReqh", "KjbZJ14", "byIXsJDFT4cdH01hLIEiCoP3oVFxRmF5", "CAUeU9lKsEQJQ8oJs88JTqk7GAcDU2io", "xLviaKB4KZIhZN1GU0dHl8c6bwXdm9iC", "IMgVgO", "Wh2MWpRo7VbT5p9HRfne6LI8Uh8KJseH", "ItjfoHp0lrctiWkbEjfK3EyEN624ZUfA"};

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AGH();
                    if (A01[1].length() != 7) {
                        throw new RuntimeException();
                    }
                    A01[4] = "hS5VQsWNORhrf4LLsxqD30oOzabUAqI4";
                }
            }
        };
        this.A0C = new BG() { // from class: com.facebook.ads.redexgen.X.74
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                if (this.A00.A03 != null) {
                    this.A00.A03.onPause();
                }
            }
        };
        this.A0B = new BM() { // from class: com.facebook.ads.redexgen.X.73
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AER();
                }
            }
        };
        this.A09 = new C1729f8(this, c0958Hi);
        this.A0A = c0958Hi;
        A02();
    }

    public AnonymousClass72(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A0E = UUID.randomUUID().toString();
        this.A0D = new BE() { // from class: com.facebook.ads.redexgen.X.75
            public static String[] A01 = {"3HJrVJ73tbjG2wlGP0Bv3sg114RWReqh", "KjbZJ14", "byIXsJDFT4cdH01hLIEiCoP3oVFxRmF5", "CAUeU9lKsEQJQ8oJs88JTqk7GAcDU2io", "xLviaKB4KZIhZN1GU0dHl8c6bwXdm9iC", "IMgVgO", "Wh2MWpRo7VbT5p9HRfne6LI8Uh8KJseH", "ItjfoHp0lrctiWkbEjfK3EyEN624ZUfA"};

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AGH();
                    if (A01[1].length() != 7) {
                        throw new RuntimeException();
                    }
                    A01[4] = "hS5VQsWNORhrf4LLsxqD30oOzabUAqI4";
                }
            }
        };
        this.A0C = new BG() { // from class: com.facebook.ads.redexgen.X.74
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                if (this.A00.A03 != null) {
                    this.A00.A03.onPause();
                }
            }
        };
        this.A0B = new BM() { // from class: com.facebook.ads.redexgen.X.73
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (this.A00.A03 != null) {
                    this.A00.A03.AER();
                }
            }
        };
        this.A09 = new C1729f8(this, c0958Hi);
        this.A0A = c0958Hi;
        A02();
    }

    private void A02() {
        getEventBus().A03(this.A0D, this.A0C, this.A0B);
    }

    private void A04(Intent intent) {
        if (this.A05 == null) {
            A05(A01(114, 25, 19));
            return;
        }
        if (this.A00 == null && this.A08 == null) {
            A05(A01(139, 37, 19));
            return;
        }
        intent.putExtra(A01(237, 18, 83), this.A07);
        intent.putExtra(A01(Sdk.SDKError.Reason.MRAID_UNRECOGNIZED_COMMAND_VALUE, 8, 34), EnumC2295oR.A0A);
        intent.putExtra(A01(287, 8, 81), ((Uri) YQ.A00(this.A00)).toString());
        intent.putExtra(A01(187, 11, 60), this.A06 == null ? A01(0, 0, 39) : this.A06);
        intent.putExtra(A01(266, 8, 99), this.A08);
        intent.putExtra(A01(Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 24, 20), AbstractC2385px.A00(this.A0A));
        intent.putExtra(A01(274, 13, 1), getCurrentPositionInMillis());
        intent.putExtra(A01(229, 8, 74), this.A0E);
        intent.putExtra(A01(255, 11, 80), this.A05.A0c());
        intent.putExtra(A01(295, 27, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), getVideoProgressReportIntervalMs());
        intent.addFlags(268435456);
    }

    private void A05(String str) {
        this.A0A.A08().ABz(A01(198, 7, 120), AbstractC2126lf.A28, new C2127lg(AdErrorType.PARSER_FAILURE.getDefaultErrorMessage(), A01(90, 7, 93) + str));
        if (AdInternalSettings.isDebugBuild()) {
            Log.w(A0H, str);
        }
    }

    public final void A0s() {
        if (this.A01 != null) {
            NativeAd nativeAd = this.A01;
            if (A0G[7].charAt(1) == 'c') {
                throw new RuntimeException();
            }
            A0G[2] = "JYCL";
            nativeAd.onCtaBroadcast();
        }
    }

    public final void A0t() {
        AdActivityIntent adActivityIntentA06 = C2337p8.A06(this.A0A);
        A04(adActivityIntentA06);
        try {
            A0j(false, 6);
            setVisibility(8);
            C2337p8.A0D(this.A0A, adActivityIntentA06);
        } catch (Exception e3) {
            this.A0A.A08().ABz(A01(176, 11, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), AbstractC2126lf.A0D, new C2127lg(e3));
            Log.e(A01(97, 17, 22), A01(0, 90, 38), e3);
        }
    }

    public InterfaceC2474rO getListener() {
        return this.A03;
    }

    public String getUniqueId() {
        return this.A0E;
    }

    @Override // com.facebook.ads.redexgen.X.C0799Be, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.A09.A02();
    }

    @Override // com.facebook.ads.redexgen.X.C0799Be, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        this.A09.A03();
        super.onDetachedFromWindow();
    }

    public void setAdEventManager(InterfaceC2224nG interfaceC2224nG) {
        this.A02 = interfaceC2224nG;
    }

    public void setClientToken(String str) {
        C5Z c5z;
        if (this.A04 != null) {
            this.A04.A07();
        }
        if (this.A05 != null) {
            this.A05.A0p();
        }
        this.A06 = str;
        C0804Bj c0804Bj = null;
        if (str != null) {
            c5z = new C5Z(this.A0A, this.A02, this, str);
        } else {
            c5z = null;
        }
        this.A05 = c5z;
        if (this.A05 != null && C2203mv.A20(this.A0A)) {
            if (str != null) {
                c0804Bj = new C0804Bj(this.A0A, this.A02, this, str, false, this.A05, null);
            }
            this.A04 = c0804Bj;
            return;
        }
        this.A04 = null;
    }

    public void setEnableBackgroundVideo(boolean z11) {
        this.A0F.setBackgroundPlaybackEnabled(z11);
    }

    public void setListener(InterfaceC2474rO interfaceC2474rO) {
        this.A03 = interfaceC2474rO;
    }

    public void setNativeAd(NativeAd nativeAd) {
        this.A01 = nativeAd;
    }

    public void setVideoCTA(String str) {
        this.A07 = str;
    }

    @Override // com.facebook.ads.redexgen.X.C0799Be
    public void setVideoMPD(String str) {
        if (str != null && this.A05 == null) {
            A05(A01(114, 25, 19));
        } else {
            this.A08 = str;
            super.setVideoMPD(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C0799Be
    public void setVideoURI(Uri uri) {
        if (uri != null && this.A05 == null) {
            A05(A01(114, 25, 19));
        } else {
            this.A00 = uri;
            super.setVideoURI(uri);
        }
    }
}
