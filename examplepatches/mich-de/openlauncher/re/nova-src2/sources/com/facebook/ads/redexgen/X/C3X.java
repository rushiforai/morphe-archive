package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Point;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Pair;
import android.view.Surface;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.ads.androidx.media3.exoplayer.video.DummySurface;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomizations;
import com.vungle.ads.internal.protos.Sdk;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.3X, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C3X extends C4H {
    public static boolean A0y;
    public static boolean A0z;
    public static byte[] A10;
    public static String[] A11 = {"RYIMeRWQ62G39l2OVauIZdmncmqxQuSx", "bDEe1VxjMLIaeYGjemsZIiA5L2aoyT0v", "F7IinEiVJZurDSY1", "qTkMRglA5JedC5ti1cNf8dUydPKqW6Sn", "5", "zPq5xDhZFx", "aMb", "iHy682td1SJKWmhJCWg02OfRO3R0e"};
    public static final int[] A12;
    public C1171Qf A00;
    public float A01;
    public float A02;
    public float A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public int A0C;
    public int A0D;
    public int A0E;
    public int A0F;
    public int A0G;
    public int A0H;
    public long A0I;
    public long A0J;
    public long A0K;
    public long A0L;
    public long A0M;
    public long A0N;
    public long A0O;
    public long A0P;
    public long A0Q;
    public long A0R;
    public MediaFormat A0S;
    public Surface A0T;
    public Surface A0U;
    public C1259Tp A0V;
    public XY A0W;
    public InterfaceC1353Xo A0X;
    public Object A0Y;
    public boolean A0Z;
    public boolean A0a;
    public boolean A0b;
    public boolean A0c;
    public boolean A0d;
    public boolean A0e;
    public boolean A0f;
    public boolean A0g;

    @MetaExoPlayerCustomization
    public boolean A0h;
    public boolean A0i;
    public boolean A0j;
    public boolean A0k;
    public final int A0l;
    public final int A0m;
    public final int A0n;
    public final long A0o;
    public final Context A0p;
    public final C1340Xa A0q;
    public final C1357Xt A0r;
    public final C1359Xw A0s;
    public final YB A0t;
    public final boolean A0u;
    public final boolean A0v;
    public final long[] A0w;
    public final long[] A0x;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.restartVar(DebugInfoParser.java:193)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:141)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static Point A07(C1234Sq c1234Sq, VC vc) throws TK {
        boolean z11 = vc.A0A > vc.A0L;
        int i5 = z11 ? vc.A0A : vc.A0L;
        int i11 = z11 ? vc.A0L : vc.A0A;
        float f11 = i11;
        float f12 = i5;
        if (A11[4].length() != 1) {
            throw new RuntimeException();
        }
        String[] strArr = A11;
        strArr[2] = "275Rll9dAnXddPRl";
        strArr[6] = "wiQ";
        float f13 = f11 / f12;
        for (int i12 : A12) {
            int i13 = (int) (i12 * f13);
            if (i12 <= i5 || i13 <= i11) {
                return null;
            }
            if (N1.A02 >= 21) {
                int i14 = z11 ? i13 : i12;
                if (!z11) {
                    i12 = i13;
                }
                Point pointA0N = c1234Sq.A0N(i14, i12);
                if (c1234Sq.A0R(pointA0N.x, pointA0N.y, vc.A01)) {
                    return pointA0N;
                }
            } else {
                int iA05 = N1.A05(i12, 16) * 16;
                int iA052 = N1.A05(i13, 16) * 16;
                if (iA05 * iA052 <= TN.A00()) {
                    int i15 = z11 ? iA052 : iA05;
                    if (!z11) {
                        iA05 = iA052;
                    }
                    return new Point(i15, iA05);
                }
            }
        }
        return null;
    }

    public static String A0B(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A10, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 33);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0P() {
        A10 = new byte[]{-62, -57, -63, -62, -56, -50, -56, -54, -75, -69, -75, -72, 111, 95, 94, 91, 101, 94, 116, 110, 94, 93, 90, 100, 93, 121, -118, 122, AbstractJsonLexerKt.TC_INVALID, 121, 122, -70, -85, -87, -86, -81, -38, -83, -87, -107, -117, -124, -124, -124, -127, -75, -95, -105, -112, -112, -112, -48, -52, -43, -45, 111, 101, 94, 95, 94, -113, 98, 102, 99, 89, 82, 84, 82, -125, 86, 90, 111, 116, -126, 111, 102, 107, 121, 115, -99, -81, -79, -81, -69, -76, -116, -116, -99, -96, 118, -120, -118, -120, -108, -115, 101, 101, 118, 121, 118, -45, -27, -25, -27, -15, -22, -62, -62, -45, -42, -43, -58, -40, -38, -40, -28, -35, -75, -75, -58, -55, -28, -73, -76, -31, -41, -27, -30, -32, -44, -21, -109, -76, -91, -87, -74, -89, -69, -38, 10, 14, -6, -23, 8, 16, -2, 11, -26, -99, -49, -47, -49, -69, -74, -98, -111, -116, -116, -89, -88, -104, -52, -55, -72, -74, -91, -58, -53, -68, -74, -119, -37, -27, -38, -36, -28, -58, -54, -15, -119, -103, -120, -99, -112, -120, 103, 123, -110, 103, 121, 119, 120, 124, 110, 126, 109, -126, 117, 109, -117, 109, -128, -126, 94, -31, -15, -32, -11, -24, -32, -2, -32, -13, -11, -46, -2, -45, -22, -104, -122, -48, -35, -59, -61, -60, -61, -20, -42, -67, -65, 110, 123, 115, 92, 97, 91, 100, -33, -20, -11, -44, -49, -5, -27, -52, -52, AbstractJsonLexerKt.TC_INVALID, -85, -96, -95, -97, 92, -87, -99, -76, 92, -82, -95, -81, -85, -88, -79, -80, -91, -85, -86, 92, -99, -96, -90, -79, -81, -80, -95, -96, 92, -80, -85, 118, 92, -66, -22, -24, -28, -22, -50, -84, -81, -97, -96, -98, -99, -122, -115, -106, -120, -126, -96, -126, 116, -96, -111, -77, -80, -31, -24, -15, -29, -35, -5, -22, 11, 16, 1, -123, -116, -107, -121, -127, -97, -112, -78, -87, -83, 116, 123, -124, 118, 112, -114, -127, -112, -88, -114, -121, -115, -66, -83, -70, -101, -68, -87, -70, -89, -101, -62, -81, -83, -83, -83, -52, -71, -73, -73, -71, -123, 114, 112, 112, 117, -63, -82, -83, -84, -84, -88, -107, -108, -109, -107, -113, 124, 123, 122, 126, -80, -99, -99, -101, -101, -36, -9, 2, 9, -5, -39, -2, -5, -7, 1, -74, -15, 2, -5, -3, -9, -7, 15, -36, 8, -9, 3, -5, -23, -1, 16, -5, -62, -74, -43, -41, -35, -36, -45, -45, -19, -43, -48, -38, -59, -63, -60, -66, -125, -123, -117, -118, -127, -127, -101, -113, -109, -109, 109, 114, 108, 117, -94, -92, -86, -87, -96, -96, -70, -82, -78, -78, -116, -111, -115, -110, -80, -78, -72, -73, -82, -82, -56, -68, -64, -64, -102, -97, -100, -102, 106, 108, 114, 113, 104, 104, -126, 122, 101, 111, 88, 90, 83, 91, -77, -75, -69, -70, -79, -79, -53, -61, -82, -72, -93, -97, -94, -95, -106, -104, -98, -99, -108, -108, -82, -90, -111, -101, -122, -124, -128, -120, -75, -41, -67, -68, -77, -77, -51, -79, -80, -70, -91, -93, -97, -95, 115, -107, 123, 122, 113, 113, -117, 115, 110, 120, 99, 95, 93, 101, -61, -48, -68, -46, -64, -60, -101, -55, -45, -49, -88, -57, -83, -76, -116, -101, -122, -112, -110, 113, -116, -26, -11, -31, -33, -21, -53, -26, 119, -122, 116, 124, 123, 123, -118, -119, -127, -122, 96, 123, 109, 124, 124, 102, 120, 82, 109, -37, 0, -8, -5, 0, -5, 10, -65, -22, -57, -55, -60, -69, -72, -53, 110, 119, 114, 81, 112, 86, 85, -90, -112, -117, -68, -113, -117, -107, -112, 118, -108, 125, 124, 121, -104, -109, 121, -103, 126, -127, 124, -80, -73, -111, -103, -108, -107, -101, -48, -23, -14, -13, -6, -13, -92, -59, -74, -76, -75, -70, -26, -73, -76, -58, -33, -24, -23, -16, -23, -102, -59, -85, -86, -37, -82, -86, -107, -82, -73, -72, -65, -72, 105, -108, -127, -121, 111, -99, -80, -88, -84, -67, -72, -62, -80, -104, -59, -48, -82, 110, -122, -123, -118, -126, 100, -112, -123, -122, -124, 119, -118, -123, -122, -112, 115, -122, -113, -123, -122, -109, -122, -109, 115, -107, -102, -107, 107, 88, 78, 90, 109, 83, 114, 122, 107, 79, -97, -63, -58, -63, -103, -123, -59, -51, -64, -69, -64, -72, -89, -79, -114, -115, -118, -93, -94, -84, -119, -117, -121, -98, 118, 116, AbstractJsonLexerKt.TC_INVALID, 85, -114, -106, -106, -114, -109, -116, -89, -58, -67, -88, -60, -51, -53, -115, -84, 113, 87, 89, 82, -59, -83, -86, -34, -48, -64, -69, -60, -59, -66, -37, -82, -91, -84, -109, -112, -106, -48, -57, -50, -74, -79, -80, -98, -107, -100, -124, AbstractJsonLexerKt.TC_INVALID, AbstractJsonLexerKt.TC_INVALID, -87, -91, -98, -55, -53, -56, -80, -52, -44, -20, -27, -14, -8, -13, -15, -70, -121, -96, -81, -100, -93, 87, 124, -107, -92, -107, 96, 89, 99, -117, 95, 115, -104, -79, -64, -79, 125, 117, 121, 120, -89, 124, -113, -59, -89, -87, -92, -61, -90, -92, -88, -94, -117, 110, 108, 113, 125, 96, 95, 93, 92, -28, -56, -50, -54, -82, -77, -43, -62, -36, -46, 117, 124, 85, -62, -43, -44, -35, -39, -112, -92, -56, -93, -74, -75, -66, -70, 113, -97, -64, -59, -74, 113, -125, -57, -38, -39, -30, -34, -107, -61, -28, -23, -38, -107, -88, -123, -104, -95, -105, -104, -91, 83, -94, -88, -89, -93, -88, -89, 83, -103, -108, -100, -97, -104, -105, -59, -40, -26, -30, -33, -24, -25, -36, -30, -31, -26, -109, -24, -31, -34, -31, -30, -22, -31, -95, -109, -74, -30, -41, -40, -42, -109, -32, -44, -21, -109, -27, -40, -26, -30, -33, -24, -25, -36, -30, -31, -83, -109, -77, -83, -115, -89, -103, -109, -107, -112, -15, -21, -53, -24, -48, -50, -50, -27, -13, -60, -66, -98, -69, -93, -95, -95, -66, -88, -94, -126, -93, -114, -122, -123, -89, -119, -97, -95, 
        -109, -115, -98, 108, -97, -123, -33, -30, -36, -71, -48, -32, -30, -67, -63, -74, -49, -60, -41, -56, -62, -77, -43, -46, -127, -99, -100, -89, 78, -126, -113, -112, -102, -109, -94, 78, -127, -101, -119, 122, 116, 126, 122, 119, -115, -36, -54, -69, -75, -65, -69, -72, -32, -82, -100, -115, -121, -110, -113, -118, -96, -69, -87, -102, -108, -97, -100, -105, -76, -101, -74, -74, 103, -76, -88, -75, -64, 103, -70, -69, -71, -84, -88, -76, 103, -86, -81, -88, -75, -82, -84, -70, 115, 103, -70, -74, 103, -85, -71, -74, -73, -73, -80, -75, -82, 103, -74, -83, -83, -70, -84, -69, -127, 103, -91, -128, -54, -90, -89, -69, -74, -80, -113, -70, -73, -100, -100, -108, -80, -117, -73, -96, -93, -123, 114, 95, -123, 125, 121, 86, 91, 91, 88, -100, 115, 116, -95, -110, -108, -111, -126, 96, 88, -111, -33, -94, -35, -120, -100, -117, -112, -106, 84, -102, -116, -102, -102, -112, -106, -107, 84, -112, -117, -76, -56, -57, -62, -128, -71, -59, -74, -60, -109, -113, -62, -49, -59, -45, -48, -54, -59, -113, -62, -41, -110, -114, -59, -62, -41, -110, -59, -113, -59, -58, -60, -48, -59, -58, -45, -49, -34, -37, -36, -103, -50, -37, -32, -32, -37, -39, -8, 7, 4, 5, -62, 1, -6, -5, 9, -87, -72, -75, -74, 115, -72, -81, -83, -82, -70, -52, -37, -40, -39, -106, -35, -40, -39, -43, -24, -93, -23, -4, -71, -21, -24, -11, -18, -24, -13, -44, -43, -46, -23, -9, -12, -11, -37, -18, -23, -22, -12, -57, -6, -21, -21, -22, -9, -14, -8, -5, 1, 10, 14, 15, 0, 13, -66, -54, -71, -59, -67, -123, -54, -71, -52, -67, -5, 10, -4, 10, 4, 15, 6, 3, 3, 6, 11, 3, 0, 4, 2, 3, 15, -41, -29, -46, -50, -44, -92, -91, -36, -37, -50, -45, -29, -28, -37, -92, -77, 125, -120, -127, 105, -124, -88, 120, 111, 114, 112, -36, -43, -44, -33, -33, -85, -86, -90, -88, -46, -84, -85, -93, -87, -115, -106, -115, -105, 90, 84, -53, -42, -57, -50, -63, -75, -106, -109, 6, -50, 20, 8, 16, 1, 5, 10, 15, -22, -32, -13, -28, -70, -125, -126, -124, 126, -11, -18, -24, 1, -65, -77, -74, -66, 116, -77, -88, -69, -84, -75, -86, -64, -39, -98, -116, -38, -37, -32, -47, -30, -42, -29, -29, -34, -29, -36, -44, -56, -39, -48, -43, -42, -58, -51, -80, -92, -69, 112, -85, -88, -84, -86, -85, -73, -21, -33, -10, -85, -25, -20, -18, -13, -14, -85, -15, -25, -8, -29, -32, -44, -21, -96, -22, -36, -41, -25, -37, -15, -20, -1, -5, -10, 1, -41, -45, -41, -49, -75, -88, -76, -88, -69, -81, -22, -27, -33, -25, -24, -35, -15, -17, -37, -30, -89, 105, 104, 105, -101, -116, -103, -112, -105, -105, -118, -113, -67, -82, -69, -78, -71, -71, -84, -79, -71, -107, -122, -109, -118, -111, -111, -124, -119, -104, -36, -51, -38, -47, -40, -40, -53, -48, -32, -6, -4, -13, -7, -4, -13, -2, 3, 15, 2, 9, 2, -2, 16, 2, -20, 18, 17, 13, 18, 17, -33, 18, 3, 3, 2, 15, -48, -51, -46, -65, -46, -57, -51, -52, -117, -62, -61, -59, -48, -61, -61, -47, -107, 91, 82, 87, -102, 82, 83, 90, 10, -8, 5, 11, 6, 5, 0, -65, -73, -75, -68, -94, -75, -80, -79, -69, -114, -63, -78, -78, -79, -66, -93, -112, -104, -109, -98, -114, -95, -98, -90, -100, -117, -108, -121, -115, -99, -58, -57, -64, -64, -73, -66, -73, -74, AbstractJsonLexerKt.TC_INVALID, -62, -66, -77, -53, -76, -77, -75, -67, -87, -104, -91, -95, -104, -104, -110, -128, 104, -36, -49, -54, -53, -43, -107, -103, -51, -42, -42, 8, -5, -10, -9, 1, -63, -13, 8, -62, -61, -61, -74, -79, -78, -68, 124, -82, -61, -80, -101, -114, -119, -118, -108, 84, -119, -108, -111, -121, -98, 82, -101, -114, -104, -114, -108, -109, -46, -59, -64, -63, -53, -117, -60, -63, -46, -65, -39, -52, -57, -56, -46, -110, -48, -45, -105, -39, -112, -56, -42, -57, -70, -75, -74, -64, -128, -55, 126, -57, -65, -75, AbstractJsonLexerKt.TC_INVALID, -64, -65, -125, AbstractJsonLexerKt.TC_INVALID, -57, -63, -119, -5, -18, -23, -22, -12, -76, -3, -78, -5, -13, -23, -77, -12, -13, -73, -77, -5, -11, -66, -5, -27, -8, -9, -13, -14, -7, -22, -5, -12, -25, -26, -9, -23, -28, -12, -24, -5, -13, -13, -24, -9, -29, -22, -13, -21, -21, -32, -17, -37, -30, -22, -71};
    }

    static {
        A0P();
        A12 = new int[]{1920, 1600, 1440, 1280, 960, 854, 640, 540, 480};
    }

    @MetaExoPlayerCustomization
    public C3X(Context context, C1341Xc c1341Xc, C1344Xf c1344Xf, TG tg, long j11, InterfaceC1212Ru interfaceC1212Ru, boolean z11, boolean z12, Handler handler, YC yc, int i5, int i11, int i12, int i13, int i14) {
        super(2, c1341Xc, c1344Xf, tg, interfaceC1212Ru, z11, z12, i12, i13);
        this.A0e = true;
        this.A0Z = true;
        boolean z13 = false;
        this.A0f = false;
        this.A0K = -9223372036854775807L;
        this.A0c = false;
        this.A0h = false;
        this.A0v = XL.A03(XQ.A2Z);
        this.A0h = XL.A03(XQ.A1O);
        this.A0o = j11;
        this.A0l = i5;
        this.A0m = i11;
        this.A0p = context.getApplicationContext();
        this.A0n = i14;
        this.A0s = new C1359Xw(context);
        this.A0r = new C1357Xt(this.A0p);
        this.A0t = new YB(handler, yc);
        this.A0q = new C1340Xa(this.A0r, this, this.A0v);
        this.A0u = A0i();
        if (N1.A02 == 29 && N1.A06.startsWith(A0B(811, 6, 22))) {
            z13 = true;
        }
        this.A0a = z13;
        this.A0w = new long[10];
        this.A0x = new long[10];
        this.A0R = -9223372036854775807L;
        this.A0O = -9223372036854775807L;
        this.A0M = -9223372036854775807L;
        this.A08 = -1;
        this.A06 = -1;
        this.A01 = -1.0f;
        this.A02 = -1.0f;
        this.A0H = 1;
        A0F();
    }

    private int A00(VC vc) {
        if (vc.A0B != -1) {
            int i5 = 0;
            int i11 = vc.A0X.size();
            for (int initializationDataCount = 0; initializationDataCount < i11; initializationDataCount++) {
                int totalInitializationDataSize = vc.A0X.get(initializationDataCount).length;
                i5 += totalInitializationDataSize;
            }
            int totalInitializationDataSize2 = vc.A0B;
            return totalInitializationDataSize2 + i5;
        }
        int i12 = vc.A0L;
        String str = vc.A0W;
        int width = vc.A0A;
        return A02(str, i12, width);
    }

    public static int A01(TG tg, VC vc, boolean z11) throws TK, NumberFormatException {
        String mimeType = vc.A0W;
        if (!L8.A0F(mimeType)) {
            return 0;
        }
        DrmInitData drmInitData = vc.A0O;
        String mimeType2 = A11[5];
        if (mimeType2.length() == 10) {
            String[] strArr = A11;
            strArr[3] = "4WIAzxPkmNZM0HnozVlLcAJi4lpLtrSX";
            strArr[0] = "ImPv9HbUlRYmwalfuxil6RF5xU51dGSr";
            boolean requiresSecureDecryption = drmInitData != null;
            String str = vc.A0W;
            String mimeType3 = A11[4];
            if (mimeType3.length() == 1) {
                A11[1] = "2SfVYWqWVbqmIvTDx9Sy4z7vpVFv9Xu6";
                List<C1234Sq> listA8P = tg.A8P(str, requiresSecureDecryption, false);
                if (listA8P.isEmpty() && z11) {
                    listA8P = A0C(tg, vc);
                }
                if (requiresSecureDecryption && listA8P.isEmpty()) {
                    if (!requiresSecureDecryption) {
                        return 1;
                    }
                    String mimeType4 = vc.A0W;
                    return !tg.A8P(mimeType4, false, false).isEmpty() ? 2 : 1;
                }
                if (listA8P.isEmpty()) {
                    return PX.A00(1);
                }
                if (!C4H.A1G(vc)) {
                    return PX.A00(2);
                }
                C1234Sq c1234Sq = listA8P.get(0);
                boolean zA0S = c1234Sq.A0S(vc);
                if (zA0S && vc.A0L > 0) {
                    int i5 = vc.A0A;
                    if (A11[1].charAt(9) == '5') {
                        throw new RuntimeException();
                    }
                    A11[7] = "oaL22TZcJwPgWtKUDlbRaj7B2UzHz";
                    if (i5 > 0) {
                        if (N1.A02 >= 21) {
                            zA0S = c1234Sq.A0R(vc.A0L, vc.A0A, vc.A01);
                        } else {
                            boolean decoderCapable = vc.A0L * vc.A0A <= TN.A00();
                            zA0S = decoderCapable;
                            if (!zA0S) {
                                StringBuilder sb2 = new StringBuilder();
                                String mimeType5 = A0B(380, 29, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
                                StringBuilder sbAppend = sb2.append(mimeType5).append(vc.A0L);
                                String mimeType6 = A0B(1775, 1, 32);
                                StringBuilder sbAppend2 = sbAppend.append(mimeType6).append(vc.A0A);
                                String mimeType7 = A0B(1154, 3, 97);
                                StringBuilder sbAppend3 = sbAppend2.append(mimeType7);
                                String mimeType8 = N1.A04;
                                StringBuilder sbAppend4 = sbAppend3.append(mimeType8);
                                String mimeType9 = A0B(1153, 1, 19);
                                String string = sbAppend4.append(mimeType9).toString();
                                String mimeType10 = A0B(682, 23, 0);
                                MV.A04(mimeType10, string);
                            }
                        }
                    }
                }
                int i11 = c1234Sq.A04 ? 16 : 8;
                int adaptiveSupport = c1234Sq.A08 ? 32 : 0;
                return i11 | adaptiveSupport | (zA0S ? 4 : 3);
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0011 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x000d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A02(String str, int i5, int i11) {
        char c11;
        int iA05;
        int maxPixels;
        if (i5 == -1 || i11 == -1) {
            return -1;
        }
        switch (str.hashCode()) {
            case -1664118616:
                c11 = str.equals(A0B(1635, 10, 69)) ? (char) 0 : (char) 65535;
                switch (c11) {
                    case 0:
                    case 1:
                        iA05 = i5 * i11;
                        maxPixels = 2;
                        break;
                    case 2:
                        if (A0B(179, 14, 38).equals(N1.A06)) {
                            return -1;
                        }
                        iA05 = N1.A05(i5, 16) * N1.A05(i11, 16) * 16 * 16;
                        maxPixels = 2;
                        break;
                    case 3:
                        iA05 = i5 * i11;
                        maxPixels = 2;
                        break;
                    case 4:
                    case 5:
                        iA05 = i5 * i11;
                        if (A11[4].length() != 1) {
                            A11[4] = "Z";
                            maxPixels = 0;
                            break;
                        } else {
                            A11[5] = "cmGmFF6N6i";
                            maxPixels = 4;
                            break;
                        }
                    default:
                        return -1;
                }
                int minCompressionRatio = iA05 * 3;
                return minCompressionRatio / (maxPixels * 2);
            case -1662541442:
                if (str.equals(A0B(1682, 10, 59))) {
                    c11 = 4;
                }
                switch (c11) {
                }
                int minCompressionRatio2 = iA05 * 3;
                return minCompressionRatio2 / (maxPixels * 2);
            case 1187890754:
                if (str.equals(A0B(1692, 13, 66))) {
                    c11 = 1;
                }
                switch (c11) {
                }
                int minCompressionRatio22 = iA05 * 3;
                return minCompressionRatio22 / (maxPixels * 2);
            case 1331836730:
                if (A11[4].length() != 1) {
                    throw new RuntimeException();
                }
                String[] strArr = A11;
                strArr[2] = "zEgMswacNdCF1Ez2";
                strArr[6] = "Zow";
                if (str.equals(A0B(1655, 9, 44))) {
                    c11 = 2;
                }
                switch (c11) {
                }
                int minCompressionRatio222 = iA05 * 3;
                return minCompressionRatio222 / (maxPixels * 2);
            case 1599127256:
                if (str.equals(A0B(1705, 19, 48))) {
                    c11 = 3;
                }
                switch (c11) {
                }
                int minCompressionRatio2222 = iA05 * 3;
                return minCompressionRatio2222 / (maxPixels * 2);
            case 1599127257:
                if (str.equals(A0B(1724, 19, 100))) {
                    c11 = 5;
                }
                switch (c11) {
                }
                int minCompressionRatio22222 = iA05 * 3;
                return minCompressionRatio22222 / (maxPixels * 2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public long A03(long j11, long j12, long j13, long j14, boolean z11) {
        double playbackSpeed = A1f();
        long j15 = (long) ((j14 - j11) / playbackSpeed);
        if (z11) {
            return j15 - (j13 - j12);
        }
        return j15;
    }

    @MetaExoPlayerCustomization
    private final MediaFormat A08(VC vc, XY xy2, boolean z11, int i5) {
        MediaFormat mediaFormat = new MediaFormat();
        mediaFormat.setString(A0B(1462, 4, 73), vc.A0W);
        mediaFormat.setInteger(A0B(1755, 5, 95), vc.A0L);
        mediaFormat.setInteger(A0B(1307, 6, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), vc.A0A);
        MX.A06(mediaFormat, vc.A0X);
        MX.A03(mediaFormat, A0B(1286, 10, 55), vc.A01);
        MX.A04(mediaFormat, A0B(1548, 16, 61), vc.A0F);
        MX.A02(mediaFormat, vc.A0N);
        mediaFormat.setInteger(A0B(1447, 9, 82), xy2.A02);
        mediaFormat.setInteger(A0B(1423, 10, 34), xy2.A00);
        MX.A04(mediaFormat, A0B(1433, 14, 93), xy2.A01);
        if (N1.A02 >= 23) {
            mediaFormat.setInteger(A0B(1521, 8, 105), 0);
        }
        if (z11) {
            mediaFormat.setInteger(A0B(1173, 8, 50), 0);
        }
        AbstractC1360Xx.A03(this.A0z, mediaFormat);
        if (i5 != 0) {
            A0T(mediaFormat, i5);
        }
        return mediaFormat;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final XY A0A(C1234Sq c1234Sq, VC vc, VC[] vcArr) throws TK {
        int iMax = vc.A0L;
        int iMax2 = vc.A0A;
        int maxInputSize = A00(vc);
        int maxHeight = vcArr.length;
        if (maxHeight == 1) {
            return new XY(iMax, iMax2, maxInputSize);
        }
        int i5 = 0;
        for (VC vc2 : vcArr) {
            if (A0v(c1234Sq.A04, vc, vc2)) {
                int maxWidth = vc2.A0L;
                if (maxWidth != -1) {
                    int maxWidth2 = vc2.A0A;
                    int maxWidth3 = maxWidth2 == -1 ? 1 : 0;
                    i5 |= maxWidth3;
                    int maxWidth4 = vc2.A0L;
                    iMax = Math.max(iMax, maxWidth4);
                    int maxWidth5 = vc2.A0A;
                    iMax2 = Math.max(iMax2, maxWidth5);
                    int maxWidth6 = A00(vc2);
                    maxInputSize = Math.max(maxInputSize, maxWidth6);
                }
            }
        }
        if (i5 != 0) {
            StringBuilder sbAppend = new StringBuilder().append(A0B(921, 43, 82)).append(iMax);
            String strA0B = A0B(1775, 1, 32);
            String string = sbAppend.append(strA0B).append(iMax2).toString();
            String strA0B2 = A0B(682, 23, 0);
            MV.A07(strA0B2, string);
            Point pointA07 = A07(c1234Sq, vc);
            if (pointA07 != null) {
                int maxWidth7 = pointA07.x;
                iMax = Math.max(iMax, maxWidth7);
                int maxWidth8 = pointA07.y;
                iMax2 = Math.max(iMax2, maxWidth8);
                int maxWidth9 = A02(vc.A0W, iMax, iMax2);
                maxInputSize = Math.max(maxInputSize, maxWidth9);
                MV.A07(strA0B2, A0B(246, 34, 27) + iMax + strA0B + iMax2);
            }
        }
        return new XY(iMax, iMax2, maxInputSize);
    }

    public static List<C1234Sq> A0C(TG tg, VC vc) throws TK, NumberFormatException {
        ArrayList arrayList = new ArrayList();
        String alternativeMimeType = TN.A0P(vc);
        if (alternativeMimeType != null) {
            List<C1234Sq> listA8P = tg.A8P(alternativeMimeType, false, false);
            if (N1.A02 >= 26) {
                if (A0B(1664, 18, 4).equals(vc.A0W) && !listA8P.isEmpty()) {
                    return listA8P;
                }
                return arrayList;
            }
            return arrayList;
        }
        return arrayList;
    }

    public static List<C1234Sq> A0D(TG tg, VC vc, boolean z11) throws TK {
        String str = vc.A0W;
        if (str == null) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(tg.A8P(str, z11, false));
    }

    private void A0E() {
        InterfaceC1231Sn interfaceC1231SnA1j;
        this.A0i = false;
        if (N1.A02 >= 23 && this.A0k && (interfaceC1231SnA1j = A1j()) != null) {
            this.A00 = new C1171Qf(this, interfaceC1231SnA1j);
        }
    }

    private void A0F() {
        this.A0G = -1;
        this.A0E = -1;
        this.A03 = -1.0f;
        this.A0F = -1;
    }

    @MetaExoPlayerCustomization
    private void A0G() {
        if (this.A0q.A0G() && XL.A03(XQ.A2X)) {
            this.A0q.A0A();
            throw null;
        }
    }

    private void A0H() {
        if (this.A0m > 0) {
            int i5 = this.A05;
            String[] strArr = A11;
            if (strArr[3].charAt(30) != strArr[0].charAt(30)) {
                throw new RuntimeException();
            }
            A11[7] = "uBoqitpfydoOhLSRZySYXOWxOvzyx";
            if (i5 > 0 && this.A05 >= this.A0m) {
                this.A0t.A00(this.A05, SystemClock.elapsedRealtime() - this.A0I);
            }
        }
        this.A05 = 0;
        this.A0I = SystemClock.elapsedRealtime();
    }

    private void A0I() {
        InterfaceC1231Sn interfaceC1231SnA1j = A1j();
        if (interfaceC1231SnA1j == null) {
            return;
        }
        boolean z11 = this.A0c;
        String[] strArr = A11;
        if (strArr[2].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A11;
        strArr2[3] = "qgvmWAjeo4QKnBkBe41vOj4ta3jaB5SF";
        strArr2[0] = "pKUJPsH6HibKXRAAirXH3EqC5s6YUiSU";
        if (!z11 && interfaceC1231SnA1j.A9x() > 30) {
            A0V(super.A0g);
            this.A0c = true;
        }
    }

    private void A0J() {
        if (this.A09 > 0) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long now = this.A0J;
            long elapsedMs = jElapsedRealtime - now;
            this.A0t.A01(this.A09, elapsedMs);
            this.A09 = 0;
            this.A0J = jElapsedRealtime;
        }
    }

    private void A0K() {
        if (this.A08 == -1 && this.A06 == -1) {
            return;
        }
        if (this.A0G != this.A08 || this.A0E != this.A06 || this.A0F != this.A07 || this.A03 != this.A01) {
            this.A0t.A07(new C1259Tp(this.A08, this.A06, this.A07, this.A01));
            this.A0G = this.A08;
            this.A0E = this.A06;
            this.A0F = this.A07;
            this.A03 = this.A01;
        }
    }

    private void A0L() {
        if (this.A0i) {
            this.A0t.A0D(this.A0U);
        }
    }

    private void A0M() {
        if (this.A0G != -1 || this.A0E != -1) {
            this.A0t.A07(new C1259Tp(this.A0G, this.A0E, this.A0F, this.A03));
        }
    }

    private void A0N() {
        long jElapsedRealtime;
        if (this.A0o > 0) {
            jElapsedRealtime = SystemClock.elapsedRealtime() + this.A0o;
        } else {
            jElapsedRealtime = -9223372036854775807L;
        }
        this.A0M = jElapsedRealtime;
    }

    @MetaExoPlayerCustomization
    private void A0O() {
        super.A0h.A03(super.A0f);
    }

    private final void A0Q(int i5) {
        super.A0h.A04 += i5;
        this.A09 += i5;
        this.A05 += i5;
        super.A0h.A07 = Math.max(this.A05, super.A0h.A07);
        if (this.A09 >= this.A0l) {
            A0J();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A0R(long j11, long j12, float f11) {
        int iA01 = (int) KN.A01(j11);
        int iA012 = (int) KN.A01(j12);
        if (iA012 > 1000 && iA012 < 10000) {
            int i5 = iA01 + iA012;
            int positionMs = this.A0A;
            int presentationGapMs = this.A0B;
            if (i5 > positionMs + presentationGapMs + 1000) {
                int presentationGapMs2 = this.A0A;
                if (iA01 > presentationGapMs2) {
                    int positionMs2 = this.A0A;
                    int presentationGapMs3 = this.A0B;
                    if (iA01 < positionMs2 + presentationGapMs3) {
                        O7 o72 = super.A0h;
                        int i11 = o72.A0E;
                        int positionMs3 = this.A0A;
                        int presentationGapMs4 = this.A0B;
                        o72.A0E = i11 + ((int) ((((iA01 + iA012) - (positionMs3 + presentationGapMs4)) * f11) / 1000.0d));
                    } else {
                        int positionMs4 = this.A0A;
                        int presentationGapMs5 = this.A0B;
                        if (iA01 > positionMs4 + presentationGapMs5) {
                            int presentationGapMs6 = (int) ((iA012 * f11) / 1000.0d);
                            super.A0h.A0E += presentationGapMs6;
                        }
                    }
                }
                this.A0A = iA01;
                this.A0B = iA012;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0S(long j11, long j12, VC vc, MediaFormat mediaFormat) {
        if (this.A0X != null) {
            this.A0X.AHc(j11, j12, vc, mediaFormat);
        }
    }

    public static void A0T(MediaFormat mediaFormat, int i5) {
        mediaFormat.setFeatureEnabled(A0B(1609, 17, 49), true);
        mediaFormat.setInteger(A0B(1157, 16, 6), i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0U(Surface surface) throws AnonymousClass96 {
        boolean z11;
        if (surface == null) {
            if (this.A0T != null) {
                surface = this.A0T;
            } else {
                C1234Sq c1234SqA1k = A1k();
                if (c1234SqA1k != null && A0r(c1234SqA1k)) {
                    this.A0T = DummySurface.A01(this.A0p, c1234SqA1k.A06);
                    surface = this.A0T;
                }
            }
        }
        boolean zA03 = XL.A03(XQ.A0h);
        if (this.A0U != surface) {
            this.A0U = surface;
            this.A0Q = SystemClock.elapsedRealtime();
            int iA9n = A9n();
            boolean shouldReInitCodecUponSurfaceSetFailure = this.A0f;
            boolean z12 = false;
            if (shouldReInitCodecUponSurfaceSetFailure) {
                boolean shouldReInitCodecUponSurfaceSetFailure2 = ABM();
                z11 = shouldReInitCodecUponSurfaceSetFailure2;
            }
            if (iA9n == 1 || iA9n == 2) {
                InterfaceC1231Sn interfaceC1231SnA1j = A1j();
                int state = A11[4].length();
                if (state != 1) {
                    throw new RuntimeException();
                }
                A11[1] = "bAiVO2VhFVs3QTofeBFUfXHw06Wm2es2";
                if (!this.A0q.A0G()) {
                    int state2 = N1.A02;
                    if (state2 < 23 || interfaceC1231SnA1j == null || surface == null) {
                        A1n();
                        A1p();
                    } else {
                        boolean z13 = this.A0b;
                        int state3 = A11[4].length();
                        if (state3 != 1) {
                            throw new RuntimeException();
                        }
                        A11[1] = "RkzURDWRAG2e9shURQw0dKFNMHGw0Lnk";
                        if (!z13) {
                            if (zA03) {
                                try {
                                    A0d(interfaceC1231SnA1j, surface);
                                } catch (IllegalStateException unused) {
                                    A1n();
                                    String[] strArr = A11;
                                    String str = strArr[3];
                                    String str2 = strArr[0];
                                    int state4 = str.charAt(30);
                                    if (state4 != str2.charAt(30)) {
                                        A1p();
                                    } else {
                                        A11[1] = "ff1ESQVtQ0uCWsGnypZckqVL4ucmZPZZ";
                                        A1p();
                                    }
                                }
                            } else {
                                A0d(interfaceC1231SnA1j, surface);
                            }
                        }
                    }
                }
            }
            if (surface != null && surface != this.A0T) {
                A0M();
                A0E();
                if (iA9n == 2 || z11) {
                    A0N();
                }
                if (this.A0q.A0G()) {
                    if (XL.A03(XQ.A12) && this.A0q.A06 != null) {
                        z12 = true;
                    }
                    if (!z12) {
                        this.A0q.A0C(surface, C1088Mo.A04);
                        return;
                    }
                    return;
                }
                return;
            }
            A0F();
            A0E();
            if (!this.A0q.A0G()) {
                return;
            }
            this.A0q.A08();
            throw null;
        }
        if (surface != null && surface != this.A0T) {
            A0M();
            A0L();
        }
    }

    private void A0V(VC vc) {
        InterfaceC1231Sn codec = A1j();
        if (codec != null && vc != null) {
            Pair<Long, Integer> pairA9M = codec.A9M();
            if (((Long) pairA9M.first).longValue() > 0) {
                super.A0h.A04(pairA9M);
                this.A0t.A04(super.A0h.A00, vc);
            }
        }
    }

    private final void A0W(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11) {
        AbstractC1093Mt.A02(A0B(1262, 15, 100));
        interfaceC1231Sn.AIw(i5, false);
        AbstractC1093Mt.A00();
        A0Q(1);
    }

    @MetaExoPlayerCustomization
    private final void A0X(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11) {
        if (this.A0v) {
            A0Y(interfaceC1231Sn, i5, j11);
            return;
        }
        A0K();
        try {
            AbstractC1093Mt.A02(A0B(1529, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            interfaceC1231Sn.AIw(i5, true);
            long j12 = super.A0f;
            long startRenderTime = SystemClock.elapsedRealtime();
            super.A0f = j12 + (startRenderTime - jElapsedRealtime);
            this.A0P = SystemClock.elapsedRealtime() * 1000;
            super.A0h.A09++;
            A0H();
            A27();
            A0O();
        } finally {
            AbstractC1093Mt.A00();
        }
    }

    @MetaExoPlayerCustomization
    private final void A0Y(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11) {
        AbstractC1093Mt.A02(A0B(1529, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        interfaceC1231Sn.AIw(i5, true);
        long j12 = super.A0f;
        long startRenderTime = SystemClock.elapsedRealtime();
        super.A0f = j12 + (startRenderTime - jElapsedRealtime);
        AbstractC1093Mt.A00();
        super.A0h.A09++;
        A0H();
        if (!this.A0q.A0G()) {
            this.A0P = SystemClock.elapsedRealtime() * 1000;
            A0K();
            A27();
        }
    }

    private final void A0Z(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11) {
        AbstractC1093Mt.A02(A0B(1579, 15, 43));
        interfaceC1231Sn.AIw(i5, false);
        AbstractC1093Mt.A00();
        super.A0h.A0B++;
    }

    @MetaExoPlayerCustomization
    private final void A0a(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11, long j12) {
        if (this.A0v) {
            A0c(interfaceC1231Sn, i5, j11, j12, true);
            return;
        }
        A0K();
        A0S(j11, j12, super.A0g, this.A0S);
        try {
            AbstractC1093Mt.A02(A0B(1529, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            interfaceC1231Sn.AIv(i5, j12);
            long j13 = super.A0f;
            long startRenderTime = SystemClock.elapsedRealtime();
            super.A0f = j13 + (startRenderTime - jElapsedRealtime);
            this.A0P = SystemClock.elapsedRealtime() * 1000;
            super.A0h.A09++;
            A0H();
            A27();
            A0O();
            AbstractC1093Mt.A00();
            if (A11[7].length() != 29) {
                throw new RuntimeException();
            }
            A11[7] = "qw8m2lMMOBhtwDKiqr9qPQKZQhksW";
        } catch (Throwable th2) {
            AbstractC1093Mt.A00();
            throw th2;
        }
    }

    private final void A0b(@MetaExoPlayerCustomization InterfaceC1231Sn interfaceC1231Sn, int i5, long j11, long j12, boolean z11) {
        if (this.A0v) {
            A0c(interfaceC1231Sn, i5, j11, j12, z11);
            return;
        }
        A0K();
        A0S(j11, j12, super.A0g, this.A0S);
        try {
            AbstractC1093Mt.A02(A0B(1529, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            interfaceC1231Sn.AIv(i5, j12);
            long j13 = super.A0f;
            long startRenderTime = SystemClock.elapsedRealtime();
            super.A0f = j13 + (startRenderTime - jElapsedRealtime);
            this.A0P = SystemClock.elapsedRealtime() * 1000;
            super.A0h.A09++;
            A0H();
            A27();
            A0O();
        } finally {
            AbstractC1093Mt.A00();
        }
    }

    @MetaExoPlayerCustomization
    private final void A0c(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11, long j12, boolean z11) {
        if (z11) {
            VC vc = super.A0g;
            if (A11[7].length() != 29) {
                throw new RuntimeException();
            }
            A11[4] = "P";
            A0S(j11, j12, vc, this.A0S);
        }
        AbstractC1093Mt.A02(A0B(1529, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        interfaceC1231Sn.AIv(i5, j12);
        long j13 = super.A0f;
        long startRenderTime = SystemClock.elapsedRealtime();
        super.A0f = j13 + (startRenderTime - jElapsedRealtime);
        AbstractC1093Mt.A00();
        super.A0h.A09++;
        A0H();
        if (!this.A0q.A0G()) {
            this.A0P = SystemClock.elapsedRealtime() * 1000;
            A0K();
            A27();
            A0O();
        }
    }

    public static void A0d(InterfaceC1231Sn interfaceC1231Sn, Surface surface) {
        interfaceC1231Sn.AKt(surface);
    }

    @MetaExoPlayerCustomization
    private void A0f(Object obj) {
        this.A0d = ((Boolean) obj).booleanValue();
        A1j();
    }

    private boolean A0g() {
        if (this.A0n <= 0) {
            return false;
        }
        boolean z11 = this.A0K == -9223372036854775807L || System.currentTimeMillis() - this.A0K <= ((long) this.A0n);
        if (this.A0K == -9223372036854775807L) {
            MV.A07(A0B(682, 23, 0), A0B(901, 20, 18));
            this.A0K = System.currentTimeMillis();
        }
        return z11;
    }

    public static boolean A0h() {
        return N1.A02 >= 21;
    }

    public static boolean A0i() {
        if (N1.A02 <= 22 && A0B(1280, 6, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE).equals(N1.A03)) {
            String strA0B = A0B(725, 6, 86);
            String str = N1.A05;
            String[] strArr = A11;
            if (strArr[3].charAt(30) != strArr[0].charAt(30)) {
                throw new RuntimeException();
            }
            A11[5] = "hBo4sFlbfj";
            if (strA0B.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static boolean A0k(long j11) {
        return j11 < -30000;
    }

    public static boolean A0l(long j11) {
        return j11 < -500000;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean A0m(long j11, long j12) {
        boolean z11;
        boolean z12 = A9n() == 2;
        boolean isStarted = this.A0j;
        if (!isStarted) {
            if (!z12) {
                boolean isStarted2 = this.A0g;
                z11 = isStarted2;
            }
        } else {
            boolean z13 = this.A0i;
            if (A11[5].length() != 10) {
                throw new RuntimeException();
            }
            String[] strArr = A11;
            strArr[3] = "DsTcv7khaJnVA8M9XuBL8Qg5wFjhyDSr";
            strArr[0] = "YKx3K3PMQLLp7qgDz5oHLXhJn9ZQ21Sd";
            z11 = !z13;
        }
        long jElapsedRealtime = (SystemClock.elapsedRealtime() * 1000) - this.A0P;
        if (this.A0M == -9223372036854775807L && j11 >= A1i()) {
            if (z11) {
                return true;
            }
            if (z12) {
                boolean isStarted3 = A0p(j12, jElapsedRealtime);
                if (isStarted3) {
                    return true;
                }
            }
        }
        return false;
    }

    private final boolean A0n(long j11, long j12) {
        return A0l(j11);
    }

    private final boolean A0o(long j11, long j12) {
        return A0k(j11);
    }

    private final boolean A0p(long j11, long j12) {
        return A0k(j11) && j12 > 100000;
    }

    private final boolean A0q(InterfaceC1231Sn interfaceC1231Sn, int i5, long j11, long j12) throws AnonymousClass96 {
        int iA1Q = A1Q(j12);
        if (iA1Q == 0) {
            return false;
        }
        O7 o72 = super.A0h;
        int droppedSourceBufferCount = o72.A06;
        o72.A06 = droppedSourceBufferCount + 1;
        int droppedSourceBufferCount2 = this.A04;
        A0Q(droppedSourceBufferCount2 + iA1Q);
        A1m();
        if (!this.A0q.A0G()) {
            return true;
        }
        this.A0q.A09();
        throw null;
    }

    private boolean A0r(C1234Sq c1234Sq) {
        if (N1.A02 >= 23 && this.A0e) {
            boolean z11 = this.A0k;
            String[] strArr = A11;
            if (strArr[2].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            A11[4] = "E";
            if (!z11 && !A0u(c1234Sq.A03) && (!c1234Sq.A06 || DummySurface.A05(this.A0p))) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:404:0x09cb  */
    /* JADX WARN: Removed duplicated region for block: B:493:0x0bdf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final boolean A0u(String str) {
        char c11 = 0;
        if (str.startsWith(A0B(743, 10, 6))) {
            return false;
        }
        synchronized (C3X.class) {
            if (!A0z) {
                if (A0B(1253, 6, 102).equals(N1.A03)) {
                    A0y = true;
                } else {
                    char c12 = 27;
                    if (N1.A02 <= 27 && A0B(563, 5, 14).equals(N1.A03)) {
                        A0y = true;
                    } else if (N1.A02 < 27) {
                        String str2 = N1.A03;
                        switch (str2.hashCode()) {
                            case -2144781245:
                                if (!str2.equals(A0B(423, 14, 27))) {
                                    c12 = 65535;
                                    break;
                                } else {
                                    c12 = '+';
                                    break;
                                }
                            case -2144781185:
                                if (str2.equals(A0B(437, 14, 58))) {
                                    c12 = AbstractJsonLexerKt.COMMA;
                                    break;
                                }
                                break;
                            case -2144781160:
                                if (str2.equals(A0B(451, 14, 72))) {
                                    c12 = '-';
                                    break;
                                }
                                break;
                            case -2097309513:
                                if (str2.equals(A0B(604, 6, 58))) {
                                    c12 = '?';
                                    break;
                                }
                                break;
                            case -2022874474:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, 10, 108))) {
                                    c12 = 19;
                                    break;
                                }
                                break;
                            case -1978993182:
                                if (str2.equals(A0B(731, 6, 56))) {
                                    c12 = 'M';
                                    break;
                                }
                                break;
                            case -1978990237:
                                if (str2.equals(A0B(737, 6, 51))) {
                                    c12 = 'N';
                                    break;
                                }
                                break;
                            case -1936688988:
                                if (str2.equals(A0B(777, 6, 61))) {
                                    c12 = 'X';
                                    break;
                                }
                                break;
                            case -1936688066:
                                if (str2.equals(A0B(783, 6, 95))) {
                                    c12 = 'Y';
                                    break;
                                }
                                break;
                            case -1936688065:
                                if (str2.equals(A0B(789, 6, 45))) {
                                    c12 = 'Z';
                                    break;
                                }
                                break;
                            case -1931988508:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 10, 120))) {
                                    c12 = 11;
                                    break;
                                }
                                break;
                            case -1696512866:
                                if (str2.equals(A0B(1137, 6, 4))) {
                                    c12 = AbstractJsonLexerKt.BEGIN_OBJ;
                                    break;
                                }
                                break;
                            case -1680025915:
                                if (str2.equals(A0B(280, 7, 90))) {
                                    c12 = 18;
                                    break;
                                }
                                break;
                            case -1615810839:
                                if (str2.equals(A0B(803, 8, 99))) {
                                    c12 = AbstractJsonLexerKt.BEGIN_LIST;
                                    break;
                                }
                                break;
                            case -1554255044:
                                if (str2.equals(A0B(1626, 9, 18))) {
                                    c12 = 't';
                                    break;
                                }
                                break;
                            case -1481772737:
                                if (str2.equals(A0B(1494, 9, 44))) {
                                    c12 = 'T';
                                    break;
                                }
                                break;
                            case -1481772730:
                                if (str2.equals(A0B(1503, 9, 4))) {
                                    c12 = 'U';
                                    break;
                                }
                                break;
                            case -1481772729:
                                if (str2.equals(A0B(1512, 9, 75))) {
                                    c12 = 'V';
                                    break;
                                }
                                break;
                            case -1320080169:
                                if (str2.equals(A0B(521, 14, 11))) {
                                    c12 = ')';
                                    break;
                                }
                                break;
                            case -1217592143:
                                if (str2.equals(A0B(193, 11, 11))) {
                                    c12 = 15;
                                    break;
                                }
                                break;
                            case -1180384755:
                                if (str2.equals(A0B(1353, 6, 3))) {
                                    c12 = ';';
                                    break;
                                }
                                break;
                            case -1139198265:
                                if (str2.equals(A0B(1015, 9, 66))) {
                                    c12 = 'h';
                                    break;
                                }
                                break;
                            case -1052835013:
                                if (str2.equals(A0B(1466, 6, 38))) {
                                    c12 = 'K';
                                    break;
                                }
                                break;
                            case -993250464:
                                if (str2.equals(A0B(12, 7, 13))) {
                                    c12 = 3;
                                    break;
                                }
                                break;
                            case -993250458:
                                if (str2.equals(A0B(19, 7, 12))) {
                                    c12 = 4;
                                    break;
                                }
                                break;
                            case -965403638:
                                if (str2.equals(A0B(1564, 8, 1))) {
                                    c12 = 'j';
                                    break;
                                }
                                break;
                            case -958336948:
                                if (str2.equals(A0B(324, 11, 14))) {
                                    c12 = 29;
                                    break;
                                }
                                break;
                            case -879245230:
                                if (str2.equals(A0B(1603, 6, 7))) {
                                    c12 = 'p';
                                    break;
                                }
                                break;
                            case -842500323:
                                if (str2.equals(A0B(1472, 10, 91))) {
                                    c12 = 'L';
                                    break;
                                }
                                break;
                            case -821392978:
                                if (str2.equals(A0B(39, 7, 51))) {
                                    c12 = 7;
                                    break;
                                }
                                break;
                            case -797483286:
                                if (str2.equals(A0B(1006, 9, 107))) {
                                    c12 = 'i';
                                    break;
                                }
                                break;
                            case -794946968:
                                if (str2.equals(A0B(1743, 6, 99))) {
                                    c12 = AbstractJsonLexerKt.UNICODE_ESC;
                                    break;
                                }
                                break;
                            case -788334647:
                                if (str2.equals(A0B(1749, 6, 97))) {
                                    c12 = 'v';
                                    break;
                                }
                                break;
                            case -782144577:
                                if (str2.equals(A0B(753, 9, 55))) {
                                    c12 = 'O';
                                    break;
                                }
                                break;
                            case -575125681:
                                if (str2.equals(A0B(PglCryptUtils.UNKNOWN_ERR, 14, 77))) {
                                    c12 = '(';
                                    break;
                                }
                                break;
                            case -521118391:
                                if (str2.equals(A0B(TTAdConstant.IMAGE_LIST_CODE, 14, 109))) {
                                    c12 = '*';
                                    break;
                                }
                                break;
                            case -430914369:
                                if (str2.equals(A0B(817, 10, 11))) {
                                    c12 = AbstractJsonLexerKt.STRING_ESC;
                                    break;
                                }
                                break;
                            case -290434366:
                                if (str2.equals(A0B(1594, 9, 14))) {
                                    c12 = 'k';
                                    break;
                                }
                                break;
                            case -282781963:
                                if (str2.equals(A0B(171, 8, 120))) {
                                    c12 = 14;
                                    break;
                                }
                                break;
                            case -277133239:
                                if (str2.equals(A0B(1143, 7, 33))) {
                                    c12 = '|';
                                    break;
                                }
                                break;
                            case -173639913:
                                if (str2.equals(A0B(292, 12, 32))) {
                                    c12 = 26;
                                    break;
                                }
                                break;
                            case -56598463:
                                if (str2.equals(A0B(1767, 8, 91))) {
                                    c12 = 'x';
                                    break;
                                }
                                break;
                            case 2126:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 2, 52))) {
                                    c12 = 17;
                                    break;
                                }
                                break;
                            case 2564:
                                if (str2.equals(A0B(856, 2, 114))) {
                                    c12 = 'd';
                                    break;
                                }
                                break;
                            case 2715:
                                if (str2.equals(A0B(1114, 2, 46))) {
                                    c12 = 'q';
                                    break;
                                }
                                break;
                            case 2719:
                                if (str2.equals(A0B(1121, 2, 57))) {
                                    c12 = 's';
                                    break;
                                }
                                break;
                            case 3483:
                                if (str2.equals(A0B(1456, 2, 99))) {
                                    c12 = 'H';
                                    break;
                                }
                                break;
                            case 73405:
                                if (str2.equals(A0B(594, 3, 80))) {
                                    c12 = '>';
                                    break;
                                }
                                break;
                            case 75739:
                                if (str2.equals(A0B(668, 3, 25))) {
                                    c12 = 'D';
                                    break;
                                }
                                break;
                            case 76779:
                                if (str2.equals(A0B(679, 3, 87))) {
                                    c12 = 'J';
                                    break;
                                }
                                break;
                            case 78669:
                                if (str2.equals(A0B(766, 3, 84))) {
                                    c12 = 'R';
                                    break;
                                }
                                break;
                            case 79305:
                                if (str2.equals(A0B(795, 3, 56))) {
                                    c12 = '^';
                                    break;
                                }
                                break;
                            case 80618:
                                if (str2.equals(A0B(866, 3, 3))) {
                                    c12 = 'f';
                                    break;
                                }
                                break;
                            case 88274:
                                if (str2.equals(A0B(1150, 3, 7))) {
                                    c12 = AbstractJsonLexerKt.END_OBJ;
                                    break;
                                }
                                break;
                            case 98846:
                                if (str2.equals(A0B(1247, 3, 81))) {
                                    c12 = 22;
                                    break;
                                }
                                break;
                            case 98848:
                                if (str2.equals(A0B(1250, 3, 101))) {
                                    c12 = 23;
                                    break;
                                }
                                break;
                            case 99329:
                                if (str2.equals(A0B(1259, 3, 79))) {
                                    c12 = 24;
                                    break;
                                }
                                break;
                            case 101481:
                                if (str2.equals(A0B(1277, 3, 107))) {
                                    c12 = '&';
                                    break;
                                }
                                break;
                            case 1513190:
                                if (str2.equals(A0B(0, 4, 112))) {
                                    c12 = 0;
                                    break;
                                }
                                break;
                            case 1514184:
                                if (str2.equals(A0B(4, 4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
                                    c12 = 1;
                                    break;
                                }
                                break;
                            case 1514185:
                                if (str2.equals(A0B(8, 4, 99))) {
                                    c12 = 2;
                                    break;
                                }
                                break;
                            case 2436959:
                                if (str2.equals(A0B(762, 4, 0))) {
                                    c12 = 'Q';
                                    break;
                                }
                                break;
                            case 2463773:
                                if (str2.equals(A0B(838, 4, 83))) {
                                    c12 = '`';
                                    break;
                                }
                                break;
                            case 2464648:
                                if (str2.equals(A0B(847, 4, 25))) {
                                    c12 = 'b';
                                    break;
                                }
                                break;
                            case 2689555:
                                if (str2.equals(A0B(1133, 4, 12))) {
                                    c12 = 'z';
                                    break;
                                }
                                break;
                            case 3154429:
                                if (str2.equals(A0B(1296, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE))) {
                                    c12 = '\'';
                                    break;
                                }
                                break;
                            case 3284551:
                                if (str2.equals(A0B(1376, 4, 94))) {
                                    c12 = '@';
                                    break;
                                }
                                break;
                            case 3351335:
                                if (str2.equals(A0B(1458, 4, 113))) {
                                    c12 = 'I';
                                    break;
                                }
                                break;
                            case 3386211:
                                if (str2.equals(A0B(1482, 4, 22))) {
                                    c12 = 'P';
                                    break;
                                }
                                break;
                            case 41325051:
                                if (str2.equals(A0B(671, 8, 66))) {
                                    c12 = 'G';
                                    break;
                                }
                                break;
                            case 55178625:
                                if (str2.equals(A0B(160, 11, 54))) {
                                    c12 = '\r';
                                    break;
                                }
                                break;
                            case 61542055:
                                if (str2.equals(A0B(26, 5, 40))) {
                                    c12 = 5;
                                    break;
                                }
                                break;
                            case 65355429:
                                if (str2.equals(A0B(287, 5, 73))) {
                                    c12 = 25;
                                    break;
                                }
                                break;
                            case 66214468:
                                if (str2.equals(A0B(345, 5, 91))) {
                                    c12 = 31;
                                    break;
                                }
                                break;
                            case 66214470:
                                if (str2.equals(A0B(350, 5, 101))) {
                                    c12 = ' ';
                                    break;
                                }
                                break;
                            case 66214473:
                                if (str2.equals(A0B(355, 5, 30))) {
                                    c12 = '!';
                                    break;
                                }
                                break;
                            case 66215429:
                                if (str2.equals(A0B(360, 5, 90))) {
                                    c12 = AbstractJsonLexerKt.STRING;
                                    break;
                                }
                                break;
                            case 66215431:
                                if (str2.equals(A0B(365, 5, 65))) {
                                    c12 = '#';
                                    break;
                                }
                                break;
                            case 66215433:
                                if (str2.equals(A0B(370, 5, 40))) {
                                    c12 = '$';
                                    break;
                                }
                                break;
                            case 66216390:
                                if (str2.equals(A0B(375, 5, 73))) {
                                    c12 = '%';
                                    break;
                                }
                                break;
                            case 76402249:
                                if (str2.equals(A0B(798, 5, 88))) {
                                    c12 = '_';
                                    break;
                                }
                                break;
                            case 76404105:
                                if (str2.equals(A0B(842, 5, 81))) {
                                    c12 = 'a';
                                    break;
                                }
                                break;
                            case 76404911:
                                if (str2.equals(A0B(851, 5, 11))) {
                                    c12 = 'c';
                                    break;
                                }
                                break;
                            case 80963634:
                                if (str2.equals(A0B(1116, 5, 83))) {
                                    c12 = 'r';
                                    break;
                                }
                                break;
                            case 82882791:
                                if (str2.equals(A0B(1128, 5, 55))) {
                                    c12 = 'y';
                                    break;
                                }
                                break;
                            case 98715550:
                                if (str2.equals(A0B(1334, 5, 30))) {
                                    c12 = '8';
                                    break;
                                }
                                break;
                            case 101370885:
                                if (str2.equals(A0B(1380, 5, 45))) {
                                    c12 = 'A';
                                    break;
                                }
                                break;
                            case 102844228:
                                if (str2.equals(A0B(1385, 5, 104))) {
                                    c12 = 'B';
                                    break;
                                }
                                break;
                            case 165221241:
                                if (str2.equals(A0B(31, 8, 88))) {
                                    c12 = 6;
                                    break;
                                }
                                break;
                            case 182191441:
                                if (str2.equals(A0B(237, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                                    c12 = 21;
                                    break;
                                }
                                break;
                            case 245388979:
                                if (str2.equals(A0B(1415, 8, 70))) {
                                    c12 = 'F';
                                    break;
                                }
                                break;
                            case 287431619:
                                if (str2.equals(A0B(1300, 7, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                                    c12 = '1';
                                    break;
                                }
                                break;
                            case 307593612:
                                if (str2.equals(A0B(55, 8, 13))) {
                                    c12 = '\t';
                                    break;
                                }
                                break;
                            case 308517133:
                                if (str2.equals(A0B(63, 8, 1))) {
                                    c12 = '\n';
                                    break;
                                }
                                break;
                            case 316215098:
                                if (str2.equals(A0B(1037, 8, 38))) {
                                    c12 = 'l';
                                    break;
                                }
                                break;
                            case 316215116:
                                if (str2.equals(A0B(1045, 8, 103))) {
                                    c12 = 'm';
                                    break;
                                }
                                break;
                            case 316246811:
                                if (str2.equals(A0B(1053, 8, 57))) {
                                    c12 = 'n';
                                    break;
                                }
                                break;
                            case 316246818:
                                if (str2.equals(A0B(1061, 8, 70))) {
                                    c12 = 'o';
                                    break;
                                }
                                break;
                            case 407160593:
                                if (str2.equals(A0B(827, 11, 39))) {
                                    c12 = AbstractJsonLexerKt.END_LIST;
                                    break;
                                }
                                break;
                            case 507412548:
                                if (str2.equals(A0B(858, 8, 92))) {
                                    c12 = 'e';
                                    break;
                                }
                                break;
                            case 793982701:
                                if (str2.equals(A0B(465, 14, 2))) {
                                    c12 = '.';
                                    break;
                                }
                                break;
                            case 794038622:
                                if (str2.equals(A0B(479, 14, 75))) {
                                    c12 = '/';
                                    break;
                                }
                                break;
                            case 794040393:
                                if (str2.equals(A0B(493, 14, 46))) {
                                    c12 = '0';
                                    break;
                                }
                                break;
                            case 835649806:
                                if (str2.equals(A0B(1408, 7, 84))) {
                                    c12 = 'E';
                                    break;
                                }
                                break;
                            case 917340916:
                                if (str2.equals(A0B(46, 9, 63))) {
                                    c12 = '\b';
                                    break;
                                }
                                break;
                            case 958008161:
                                if (str2.equals(A0B(1367, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                                    c12 = '=';
                                    break;
                                }
                                break;
                            case 1060579533:
                                if (str2.equals(A0B(1486, 8, 10))) {
                                    c12 = 'S';
                                    break;
                                }
                                break;
                            case 1150207623:
                                if (str2.equals(A0B(624, 7, 67))) {
                                    c12 = 'C';
                                    break;
                                }
                                break;
                            case 1176899427:
                                if (str2.equals(A0B(1359, 8, 65))) {
                                    c12 = '<';
                                    break;
                                }
                                break;
                            case 1280332038:
                                if (str2.equals(A0B(1327, 7, 27))) {
                                    c12 = '3';
                                    break;
                                }
                                break;
                            case 1306947716:
                                if (str2.equals(A0B(335, 10, 39))) {
                                    c12 = 30;
                                    break;
                                }
                                break;
                            case 1349174697:
                                if (str2.equals(A0B(1313, 14, 78))) {
                                    c12 = '2';
                                    break;
                                }
                                break;
                            case 1522194893:
                                if (str2.equals(A0B(1760, 7, 99))) {
                                    c12 = 'w';
                                    break;
                                }
                                break;
                            case 1691543273:
                                if (str2.equals(A0B(230, 7, 10))) {
                                    c12 = 20;
                                    break;
                                }
                                break;
                            case 1709443163:
                                if (str2.equals(A0B(1339, 14, 82))) {
                                    c12 = '9';
                                    break;
                                }
                                break;
                            case 1865889110:
                                if (str2.equals(A0B(1572, 7, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
                                    c12 = 'g';
                                    break;
                                }
                                break;
                            case 1906253259:
                                if (str2.equals(A0B(769, 8, 109))) {
                                    c12 = 'W';
                                    break;
                                }
                                break;
                            case 1977196784:
                                if (str2.equals(A0B(582, 12, 113))) {
                                    c12 = AbstractJsonLexerKt.COLON;
                                    break;
                                }
                                break;
                            case 2006372676:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, 14, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE))) {
                                    c12 = 16;
                                    break;
                                }
                                break;
                            case 2029784656:
                                if (str2.equals(A0B(549, 7, 35))) {
                                    c12 = '4';
                                    break;
                                }
                                break;
                            case 2030379515:
                                if (str2.equals(A0B(556, 7, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE))) {
                                    c12 = '5';
                                    break;
                                }
                                break;
                            case 2033393791:
                                if (str2.equals(A0B(111, 12, 100))) {
                                    c12 = '\f';
                                    break;
                                }
                                break;
                            case 2047190025:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.AD_EXPIRED_VALUE, 10, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                                    break;
                                }
                                break;
                            case 2047252157:
                                if (str2.equals(A0B(Sdk.SDKError.Reason.LINK_COMMAND_OPEN_FAILED_VALUE, 10, 31))) {
                                    c12 = 28;
                                    break;
                                }
                                break;
                            case 2048319463:
                                if (str2.equals(A0B(568, 7, 18))) {
                                    c12 = '6';
                                    break;
                                }
                                break;
                            case 2048855701:
                                if (str2.equals(A0B(575, 7, 4))) {
                                    c12 = '7';
                                    break;
                                }
                                break;
                            default:
                                c12 = 65535;
                                break;
                        }
                        switch (c12) {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case '\b':
                            case '\t':
                            case '\n':
                            case 11:
                            case '\f':
                            case '\r':
                            case 14:
                            case 15:
                            case 16:
                            case 17:
                            case 18:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 23:
                            case 24:
                            case 25:
                            case 26:
                            case 27:
                            case 28:
                            case 29:
                            case 30:
                            case 31:
                            case ' ':
                            case '!':
                            case '\"':
                            case '#':
                            case '$':
                            case '%':
                            case '&':
                            case '\'':
                            case '(':
                            case ')':
                            case '*':
                            case '+':
                            case ',':
                            case '-':
                            case '.':
                            case '/':
                            case '0':
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                            case ':':
                            case ';':
                            case '<':
                            case '=':
                            case '>':
                            case '?':
                            case '@':
                            case 'A':
                            case 'B':
                            case 'C':
                            case 'D':
                            case 'E':
                            case 'F':
                            case 'G':
                            case 'H':
                            case 'I':
                            case 'J':
                            case 'K':
                            case 'L':
                            case 'M':
                            case 'N':
                            case 'O':
                            case 'P':
                            case 'Q':
                            case 'R':
                            case 'S':
                            case 'T':
                            case 'U':
                            case 'V':
                            case 'W':
                            case 'X':
                            case 'Y':
                            case 'Z':
                            case '[':
                            case ads_mobile_sdk.pd.N0 /* 92 */:
                            case ads_mobile_sdk.pd.O0 /* 93 */:
                            case ads_mobile_sdk.pd.P0 /* 94 */:
                            case ads_mobile_sdk.pd.f8203p0 /* 95 */:
                            case ads_mobile_sdk.pd.A0 /* 96 */:
                            case ads_mobile_sdk.pd.H0 /* 97 */:
                            case ads_mobile_sdk.pd.Q0 /* 98 */:
                            case ads_mobile_sdk.pd.R0 /* 99 */:
                            case 'd':
                            case 'e':
                            case 'f':
                            case 'g':
                            case 'h':
                            case 'i':
                            case 'j':
                            case 'k':
                            case 'l':
                            case 'm':
                            case 'n':
                            case 'o':
                            case 'p':
                            case 'q':
                            case 'r':
                            case 's':
                            case GZIP_ENCODE_ERROR_VALUE:
                            case ASSET_FAILED_STATUS_CODE_VALUE:
                            case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                            case JSON_ENCODE_ERROR_VALUE:
                            case 'x':
                            case TPAT_ERROR_VALUE:
                            case INVALID_ADS_ENDPOINT_VALUE:
                            case INVALID_RI_ENDPOINT_VALUE:
                            case INVALID_LOG_ERROR_ENDPOINT_VALUE:
                            case INVALID_METRICS_ENDPOINT_VALUE:
                                A0y = true;
                                break;
                        }
                        String str3 = N1.A06;
                        switch (str3.hashCode()) {
                            case -2038157993:
                                if (!str3.equals(A0B(877, 12, 48))) {
                                    c11 = 65535;
                                    break;
                                } else {
                                    c11 = '\b';
                                    break;
                                }
                            case -2038157992:
                                if (str3.equals(A0B(889, 12, 84))) {
                                    c11 = 5;
                                    break;
                                }
                                break;
                            case -1984447159:
                                if (str3.equals(A0B(719, 6, 49))) {
                                    c11 = 15;
                                    break;
                                }
                                break;
                            case -1458559768:
                                if (str3.equals(A0B(705, 14, 5))) {
                                    c11 = 16;
                                    break;
                                }
                                break;
                            case -1337484257:
                                if (str3.equals(A0B(148, 12, 59))) {
                                    c11 = 20;
                                    break;
                                }
                                break;
                            case -1152053872:
                                if (str3.equals(A0B(998, 8, 43))) {
                                    c11 = 19;
                                    break;
                                }
                                break;
                            case -1147076792:
                                if (str3.equals(A0B(631, 15, 99))) {
                                    c11 = 17;
                                    break;
                                }
                                break;
                            case -708142633:
                                if (str3.equals(A0B(869, 8, 79))) {
                                    c11 = 18;
                                    break;
                                }
                                break;
                            case -594534941:
                                if (str3.equals(A0B(597, 7, 3))) {
                                    c11 = 2;
                                    break;
                                }
                                break;
                            case -581948979:
                                if (str3.equals(A0B(1401, 7, 75))) {
                                    c11 = 11;
                                    break;
                                }
                                break;
                            case -401692983:
                                if (str3.equals(A0B(964, 8, 63))) {
                                    c11 = 23;
                                    break;
                                }
                                break;
                            case -399133966:
                                if (str3.equals(A0B(981, 8, 80))) {
                                    c11 = 7;
                                    break;
                                }
                                break;
                            case -154985182:
                                if (str3.equals(A0B(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 15, 82))) {
                                    c11 = '\t';
                                    break;
                                }
                                break;
                            case 2006354:
                                if (str3.equals(A0B(71, 4, 13))) {
                                    break;
                                }
                                break;
                            case 2006367:
                                if (str3.equals(A0B(75, 4, 4))) {
                                    c11 = 1;
                                    break;
                                }
                                break;
                            case 81951059:
                                if (str3.equals(A0B(1123, 5, 67))) {
                                    c11 = 24;
                                    break;
                                }
                                break;
                            case 439365079:
                                if (str3.equals(A0B(535, 14, 90))) {
                                    c11 = 22;
                                    break;
                                }
                                break;
                            case 511748841:
                                if (str3.equals(A0B(972, 9, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE))) {
                                    c11 = '\f';
                                    break;
                                }
                                break;
                            case 619782645:
                                if (str3.equals(A0B(89, 11, 20))) {
                                    c11 = 4;
                                    break;
                                }
                                break;
                            case 619782647:
                                if (str3.equals(A0B(100, 11, 113))) {
                                    c11 = 21;
                                    break;
                                }
                                break;
                            case 632760191:
                                if (str3.equals(A0B(989, 9, 52))) {
                                    c11 = 25;
                                    break;
                                }
                                break;
                            case 807317112:
                                if (str3.equals(A0B(610, 7, 40))) {
                                    c11 = 14;
                                    break;
                                }
                                break;
                            case 807374834:
                                if (str3.equals(A0B(617, 7, 43))) {
                                    c11 = 6;
                                    break;
                                }
                                break;
                            case 1070811680:
                                if (str3.equals(A0B(646, 13, 89))) {
                                    c11 = '\r';
                                    break;
                                }
                                break;
                            case 1682560972:
                                if (str3.equals(A0B(79, 10, 59))) {
                                    c11 = 3;
                                    break;
                                }
                                break;
                            case 1921424370:
                                if (str3.equals(A0B(1024, 13, 13))) {
                                    c11 = 26;
                                    break;
                                }
                                break;
                            case 2133907258:
                                if (str3.equals(A0B(659, 9, 40))) {
                                    c11 = '\n';
                                    break;
                                }
                                break;
                            default:
                                c11 = 65535;
                                break;
                        }
                        switch (c11) {
                            case 0:
                            case 1:
                            case 2:
                                A0y = true;
                                break;
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case '\b':
                            case '\t':
                            case '\n':
                            case 11:
                            case '\f':
                            case '\r':
                            case 14:
                            case 15:
                            case 16:
                            case 17:
                            case 18:
                            case 19:
                            case 20:
                            case 21:
                            case 22:
                            case 23:
                            case 24:
                            case 25:
                            case 26:
                                A0y = true;
                                break;
                        }
                    }
                }
                A0z = true;
            }
        }
        return A0y;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0v(boolean z11, VC vc, VC vc2) {
        if (vc.A0W.equals(vc2.A0W) && vc.A0F == vc2.A0F) {
            if (!z11) {
                int i5 = vc.A0L;
                if (A11[1].charAt(9) != '5') {
                    String[] strArr = A11;
                    strArr[2] = "Re9ApgitGxUJo4E1";
                    strArr[6] = "XXS";
                    if (i5 == vc2.A0L) {
                        int i11 = vc.A0A;
                        int i12 = vc2.A0A;
                        if (A11[1].charAt(9) != '5') {
                            String[] strArr2 = A11;
                            strArr2[3] = "pb1nOwe8niAjsswQ5ZTVk5zh1nDv9ZSU";
                            strArr2[0] = "tfbL2C7FYUAvSD84YSO7lyOOgsT48TSy";
                            if (i11 == i12) {
                                if (N1.A1E(vc.A0N, vc2.A0N)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
                throw new RuntimeException();
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1X() {
        super.A1X();
        this.A09 = 0;
        this.A0A = 0;
        this.A0B = 0;
        this.A0J = SystemClock.elapsedRealtime();
        this.A0P = SystemClock.elapsedRealtime() * 1000;
        if (this.A0v) {
            this.A0r.A0D();
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1Y() {
        this.A0M = -9223372036854775807L;
        A0J();
        A0H();
        if (this.A0v) {
            this.A0r.A0E();
        }
        super.A1Y();
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1Z() {
        this.A08 = -1;
        this.A06 = -1;
        this.A01 = -1.0f;
        this.A02 = -1.0f;
        this.A0R = -9223372036854775807L;
        this.A0O = -9223372036854775807L;
        this.A0C = 0;
        A0F();
        A0E();
        this.A0s.A08();
        this.A00 = null;
        this.A0k = false;
        this.A0A = 0;
        this.A0B = 0;
        A0G();
        try {
            super.A1Z();
        } finally {
            super.A0h.A02();
            this.A0t.A09(super.A0h);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1a(long j11, boolean z11) throws AnonymousClass96 {
        super.A1a(j11, z11);
        if (this.A0q.A0G()) {
            this.A0q.A09();
            throw null;
        }
        A0E();
        if (A11[4].length() == 1) {
            A11[1] = "BBQSV1tNuVp7XpEZEQVDi8HnQiR1YTyl";
            if (this.A0v) {
                this.A0r.A0C();
            }
            this.A0N = -9223372036854775807L;
            this.A0L = -9223372036854775807L;
            this.A0O = -9223372036854775807L;
            this.A0A = 0;
            this.A0B = 0;
            if (this.A0C != 0) {
                long[] jArr = this.A0w;
                int i5 = this.A0C - 1;
                if (A11[1].charAt(9) != '5') {
                    A11[1] = "oSGEJC0mATgTjcfAGyy4ajz3RDZv7Lqy";
                    this.A0R = jArr[i5];
                    this.A0C = 0;
                }
            }
            if (z11) {
                A0N();
            } else {
                this.A0M = -9223372036854775807L;
            }
            A0H();
            return;
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1b(boolean z11, boolean z12) throws AnonymousClass96 {
        super.A1b(z11, z12);
        this.A0k = A1V().A00;
        this.A0t.A0A(super.A0h);
        this.A0s.A09();
        this.A0g = z12;
        this.A0j = false;
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.AnonymousClass97
    public final void A1c(VC[] vcArr, long j11, long j12) throws AnonymousClass96 {
        if (this.A0R == -9223372036854775807L) {
            this.A0R = j12;
        } else {
            if (this.A0C == this.A0w.length) {
                MV.A07(A0B(682, 23, 0), A0B(1069, 45, 38) + this.A0w[this.A0C - 1]);
            } else {
                this.A0C++;
            }
            this.A0w[this.A0C - 1] = j12;
            this.A0x[this.A0C - 1] = this.A0O;
        }
        super.A1c(vcArr, j11, j12);
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final int A1g(InterfaceC1231Sn interfaceC1231Sn, C1234Sq c1234Sq, VC vc, VC vc2) {
        if (AbstractC1360Xx.A04(this.A0z, vc.A0L, vc.A0A, vc2.A0L, vc2.A0A)) {
            return 0;
        }
        if (A21() && vc.A0W.equals(vc2.A0W) && vc.A0F == vc2.A0F) {
            return 1;
        }
        boolean zA0v = A0v(c1234Sq.A04, vc, vc2);
        if (A11[1].charAt(9) == '5') {
            throw new RuntimeException();
        }
        String[] strArr = A11;
        strArr[2] = "05kf3O4m1PmcWtyk";
        strArr[6] = "ivl";
        if (zA0v) {
            int i5 = vc2.A0L;
            XY xy2 = this.A0W;
            if (A11[7].length() != 29) {
                throw new RuntimeException();
            }
            A11[5] = "x3LPq4mLq3";
            if (i5 <= xy2.A02 && vc2.A0A <= this.A0W.A00 && A00(vc2) <= this.A0W.A01) {
                return vc.A0A(vc2) ? 1 : 3;
            }
        }
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final int A1h(TG tg, InterfaceC1212Ru interfaceC1212Ru, VC vc) throws TK {
        if (A24(vc)) {
            return 20;
        }
        return A01(tg, vc, super.A0j);
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final List<C1234Sq> A1l(TG tg, VC vc, boolean z11) throws TK {
        return A0D(tg, vc, z11);
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1m() throws AnonymousClass96 {
        super.A1m();
        this.A04 = 0;
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1n() {
        try {
            super.A1n();
        } finally {
            this.A04 = 0;
            if (this.A0T != null) {
                if (this.A0U == this.A0T) {
                    this.A0U = null;
                }
                this.A0T.release();
                this.A0T = null;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1q(long j11) {
        super.A1q(j11);
        this.A04--;
        while (this.A0C != 0 && j11 >= this.A0x[0]) {
            this.A0R = this.A0w[0];
            this.A0C--;
            System.arraycopy(this.A0w, 1, this.A0w, 0, this.A0C);
            System.arraycopy(this.A0x, 1, this.A0x, 0, this.A0C);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0031  */
    @Override // com.facebook.ads.redexgen.X.C4H
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1r(VC vc) {
        boolean isSwitchingToDav1d;
        if (A24(vc)) {
            if (super.A0g != null) {
                isSwitchingToDav1d = !A0B(1645, 10, 113).equals(super.A0g.A0W);
            }
            if (isSwitchingToDav1d) {
                boolean isSwitchingToDav1d2 = this.A0q.A0G();
                if (isSwitchingToDav1d2) {
                    this.A0q.A0A();
                    throw null;
                }
            }
            this.A0q.A09 = false;
            return;
        }
        int iA00 = XL.A00(XP.A0B);
        if (iA00 <= 0 || vc == null) {
            return;
        }
        int i5 = vc.A0L;
        if (A11[7].length() != 29) {
            throw new RuntimeException();
        }
        A11[1] = "eA3sjnYK8PYaKj4ZxIZy4VKEWZVTdUhj";
        if (i5 <= iA00) {
            return;
        }
        this.A0q.A09 = false;
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1s(VC vc) throws AnonymousClass96 {
        super.A1s(vc);
        this.A0t.A05(vc, null);
        this.A02 = vc.A02;
        this.A0D = vc.A0F;
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1t(VC vc) throws AnonymousClass96 {
        if (!this.A0q.A0G()) {
            this.A0q.A0J(vc, A1i());
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1u(T2 t22) {
        this.A04++;
        this.A0O = Math.max(t22.A01, this.A0O);
        if (N1.A02 < 23 && this.A0k) {
            A27();
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1v(InterfaceC1231Sn interfaceC1231Sn, MediaFormat mediaFormat) {
        int integer;
        int integer2;
        this.A0S = mediaFormat;
        String strA0B = A0B(1229, 10, 37);
        boolean zContainsKey = mediaFormat.containsKey(strA0B);
        String strA0B2 = A0B(1239, 8, 72);
        String strA0B3 = A0B(1209, 11, 75);
        String strA0B4 = A0B(1220, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        boolean z11 = zContainsKey && mediaFormat.containsKey(strA0B4) && mediaFormat.containsKey(strA0B3) && mediaFormat.containsKey(strA0B2);
        if (z11) {
            integer = (mediaFormat.getInteger(strA0B) - mediaFormat.getInteger(strA0B4)) + 1;
        } else {
            integer = mediaFormat.getInteger(A0B(1755, 5, 95));
        }
        this.A08 = integer;
        if (z11) {
            integer2 = (mediaFormat.getInteger(strA0B3) - mediaFormat.getInteger(strA0B2)) + 1;
        } else {
            integer2 = mediaFormat.getInteger(A0B(1307, 6, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        }
        this.A06 = integer2;
        this.A01 = this.A02;
        if (N1.A02 >= 21) {
            int i5 = this.A0D;
            if (A11[5].length() == 10) {
                String[] strArr = A11;
                strArr[2] = "867Alqp2IE9rr1a1";
                strArr[6] = "BSf";
                if (i5 == 90 || this.A0D == 270) {
                    int i11 = this.A08;
                    int rotatedHeight = this.A06;
                    this.A08 = rotatedHeight;
                    this.A06 = i11;
                    this.A01 = 1.0f / this.A01;
                }
            }
            throw new RuntimeException();
        }
        if (!this.A0q.A0G()) {
            this.A07 = this.A0D;
        }
        int rotatedHeight2 = this.A0H;
        interfaceC1231Sn.ALA(rotatedHeight2);
        this.A0V = new C1259Tp(this.A08, this.A06, this.A07, this.A01);
        this.A0r.A0F(super.A0g.A01);
        if (this.A0q.A0G()) {
            C1340Xa c1340Xa = this.A0q;
            if (A11[1].charAt(9) != '5') {
                A11[1] = "9jhluCbSE08jdVbVPtpLuia4mkowKwVy";
                c1340Xa.A0D(super.A0g.A07().A0r(this.A08).A0f(this.A06).A0l(this.A07).A0Y(this.A01).A14());
                throw null;
            }
            throw new RuntimeException();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00d2  */
    @Override // com.facebook.ads.redexgen.X.C4H
    @MetaExoPlayerCustomizations
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1w(C1234Sq c1234Sq, InterfaceC1231Sn interfaceC1231Sn, VC vc, MediaCrypto mediaCrypto) throws TK {
        this.A0W = A0A(c1234Sq, vc, A1e());
        boolean z11 = false;
        MediaFormat mediaFormatA08 = A08(vc, this.A0W, this.A0u, 0);
        if (this.A0U == null) {
            AbstractC1062Ln.A08(A0r(c1234Sq));
            if (this.A0T == null) {
                DummySurface dummySurfaceA01 = DummySurface.A01(this.A0p, c1234Sq.A06);
                if (A11[7].length() == 29) {
                    A11[1] = "zipSymz4mf9og0vCT4cHcTaK4vUFN0av";
                    this.A0T = dummySurfaceA01;
                }
            }
            this.A0U = this.A0T;
            boolean z12 = this.A0z.A0L;
            String strA0B = A0B(1390, 11, 38);
            boolean z13 = (z12 || c1234Sq.A00 == null || !c1234Sq.A00.isFeatureSupported(strA0B)) ? false : true;
            if (c1234Sq.A03.equals(A0B(1181, 28, 64)) && this.A0z.A0C) {
                z11 = true;
            }
            if (N1.A02 >= 30) {
                C1341Xc c1341Xc = this.A0z;
                if (A11[7].length() == 29) {
                    String[] strArr = A11;
                    strArr[2] = "RmAod2PZIjrobZNg";
                    strArr[6] = "EQN";
                    if (c1341Xc.A0M) {
                        if (z13 && !z11) {
                            mediaFormatA08.setFeatureEnabled(strA0B, true);
                            mediaFormatA08.setInteger(strA0B, 1);
                        }
                    }
                }
            }
            if (this.A0q.A0G()) {
                mediaFormatA08 = this.A0q.A06(mediaFormatA08);
            }
            if (!this.A0q.A0G()) {
                this.A0q.A07();
                throw null;
            }
            interfaceC1231Sn.A5h(mediaFormatA08, this.A0U, mediaCrypto, 0, this.A0Y);
            if (N1.A02 >= 23 && this.A0k) {
                this.A00 = new C1171Qf(this, interfaceC1231Sn);
                return;
            }
            return;
        }
        boolean z122 = this.A0z.A0L;
        String strA0B2 = A0B(1390, 11, 38);
        if (z122) {
            if (c1234Sq.A03.equals(A0B(1181, 28, 64))) {
                z11 = true;
            }
            if (N1.A02 >= 30) {
            }
            if (this.A0q.A0G()) {
            }
            if (!this.A0q.A0G()) {
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    @MetaExoPlayerCustomization
    public final void A1x(String str) {
        this.A0t.A0F(str);
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final void A1y(String str, long j11, long j12) {
        this.A0t.A0G(str, j11, j12);
        this.A0b = A0u(str);
        if (this.A0v) {
            this.A0q.A0E(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    @MetaExoPlayerCustomization
    public final void A1z(String str, VC vc) throws AnonymousClass96 {
        this.A0t.A0F(str);
        if (!this.A0q.A0G()) {
            C1340Xa c1340Xa = this.A0q;
            long jA1i = A1i();
            if (A11[5].length() != 10) {
                throw new RuntimeException();
            }
            A11[4] = "d";
            c1340Xa.A0J(vc, jA1i);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final boolean A20() {
        return this.A0a && SystemClock.elapsedRealtime() - this.A0Q < 500;
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final boolean A22() {
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:101:0x01ed, code lost:
    
        if (com.facebook.ads.redexgen.X.N1.A02 < r11) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01f4, code lost:
    
        if (r6 >= 50000) goto L132;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01f8, code lost:
    
        A0a(r37, r39, r0, r23);
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x0201, code lost:
    
        r32.A0K = -9223372036854775807L;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0209, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x020a, code lost:
    
        r1 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x020f, code lost:
    
        if (A0g() != false) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x0211, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0212, code lost:
    
        throw r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x021c, code lost:
    
        if (r6 >= 30000) goto L132;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x0222, code lost:
    
        if (r6 <= 11000) goto L142;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x0233, code lost:
    
        if (com.facebook.ads.redexgen.X.C3X.A11[1].charAt(9) == '5') goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0235, code lost:
    
        com.facebook.ads.redexgen.X.C3X.A11[5] = "KF7ZC8HIwZ";
        r6 = r6 - com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x023e, code lost:
    
        r6 = r6 - com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x023f, code lost:
    
        java.lang.Thread.sleep(r6 / 1000);
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x0245, code lost:
    
        java.lang.Thread.currentThread().interrupt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x024c, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x024d, code lost:
    
        A0X(r37, r39, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0250, code lost:
    
        r32.A0K = -9223372036854775807L;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x0253, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0254, code lost:
    
        r1 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x0259, code lost:
    
        if (A0g() != false) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x025b, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x025c, code lost:
    
        throw r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x025d, code lost:
    
        r2 = r41 - r33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x0266, code lost:
    
        if (r32.A0g.A01 == (-1.0f)) goto L137;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x0268, code lost:
    
        r0 = r32.A0g.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x026c, code lost:
    
        A0R(r33, r2, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x0274, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0275, code lost:
    
        r0 = 30.0f;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0072, code lost:
    
        if (r10 == r32.A0T) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0078, code lost:
    
        if (A0k(r6) == false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x007a, code lost:
    
        A0Z(r37, r39, r0);
        r32.A0K = -9223372036854775807L;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0085, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0091, code lost:
    
        if (r10 == r32.A0T) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0094, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0095, code lost:
    
        r18 = android.os.SystemClock.elapsedRealtime() * 1000;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a2, code lost:
    
        if (A9n() != 2) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00a4, code lost:
    
        r15 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00a9, code lost:
    
        if (r32.A0i == false) goto L44;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00ab, code lost:
    
        if (r15 == false) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00b5, code lost:
    
        if (A0p(r6, r18 - r32.A0P) == false) goto L70;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00b7, code lost:
    
        r5 = 21;
        r2 = -9223372036854775807L;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c4, code lost:
    
        if (r32.A0q.A0G() == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00c6, code lost:
    
        r32.A0q.A0K(r32.A0g, r0, r44);
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00d0, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00d1, code lost:
    
        r5 = 21;
        r2 = -9223372036854775807L;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00d9, code lost:
    
        r15 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00df, code lost:
    
        if (com.facebook.ads.redexgen.X.N1.A02 < r5) goto L144;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00e1, code lost:
    
        r23 = java.lang.System.nanoTime();
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00e5, code lost:
    
        r6 = com.facebook.ads.redexgen.X.C3X.A11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00f9, code lost:
    
        if (r6[3].charAt(30) == r6[0].charAt(30)) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0100, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0101, code lost:
    
        com.facebook.ads.redexgen.X.C3X.A11[7] = "2QHTOj8kvcmWgIhhns8Rajex54zoF";
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0108, code lost:
    
        A0b(r37, r39, r0, r23, true);
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0112, code lost:
    
        r1 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0114, code lost:
    
        r1 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0119, code lost:
    
        if (A0g() != false) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x011b, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x011c, code lost:
    
        throw r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x011d, code lost:
    
        A0X(r37, r39, r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0120, code lost:
    
        r32.A0K = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x0123, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0124, code lost:
    
        r1 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0129, code lost:
    
        if (A0g() != false) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x012b, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x012c, code lost:
    
        throw r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x012d, code lost:
    
        if (r15 == false) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0133, code lost:
    
        if (r33 != r32.A0L) goto L74;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0135, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0136, code lost:
    
        r6 = r6 - (r18 - r35);
        r18 = java.lang.System.nanoTime();
        r23 = r32.A0s.A07(r41, r18 + (r6 * 1000));
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0150, code lost:
    
        if (r32.A0q.A0G() != false) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0152, code lost:
    
        r6 = (r23 - r18) / 1000;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x015a, code lost:
    
        if (A0n(r6, r35) == false) goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x015c, code lost:
    
        r11 = 21;
        r16 = com.facebook.ads.redexgen.X.C3X.A11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x016e, code lost:
    
        if (r16[2].length() == r16[6].length()) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0170, code lost:
    
        com.facebook.ads.redexgen.X.C3X.A11[5] = "JeMrXkiwyf";
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0185, code lost:
    
        if (A0q(r37, r39, r0, r33) == false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0187, code lost:
    
        return r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x0188, code lost:
    
        r16 = com.facebook.ads.redexgen.X.C3X.A11;
        r16[3] = "hdhMaNTNQgTUm79ORkLI0Fzd0F91yHSb";
        r16[0] = "A2R9MOy7HoGmmJRsJSNpUmOhRjd7gqSj";
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01a2, code lost:
    
        if (A0q(r37, r39, r0, r33) == false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01a5, code lost:
    
        r11 = 21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01ab, code lost:
    
        if (A0o(r6, r35) == false) goto L96;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01ad, code lost:
    
        A0W(r37, r39, r0);
        r2 = com.facebook.ads.redexgen.X.C3X.A11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x01c2, code lost:
    
        if (r2[3].charAt(30) == r2[0].charAt(30)) goto L94;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01c9, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x01ca, code lost:
    
        com.facebook.ads.redexgen.X.C3X.A11[1] = "fbU2VrE98PnDfYcDvsLqqJdsNJDNnw7d";
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x01d2, code lost:
    
        return true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x01d9, code lost:
    
        if (r32.A0q.A0G() == false) goto L100;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x01db, code lost:
    
        r32.A0q.A0B(r33, r35);
        r32.A0q.A0K(r32.A0g, r0, r44);
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x01ea, code lost:
    
        throw null;
     */
    @Override // com.facebook.ads.redexgen.X.C4H
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A23(long presentationTimeUs, long j11, InterfaceC1231Sn interfaceC1231Sn, ByteBuffer byteBuffer, int i5, int i11, long presentationTimeUs2, boolean z11, boolean z12) throws InterruptedException, AnonymousClass96 {
        boolean z13;
        A0I();
        if (this.A0L == -9223372036854775807L) {
            this.A0L = presentationTimeUs;
        }
        long j12 = this.A0N;
        if (A11[5].length() != 10) {
            throw new RuntimeException();
        }
        A11[4] = "T";
        if (presentationTimeUs2 != j12) {
            if (!this.A0q.A0G()) {
                this.A0r.A0G(presentationTimeUs2);
            }
            this.A0N = presentationTimeUs2;
        }
        long systemTimeNs = presentationTimeUs2 - this.A0R;
        if (z11) {
            A0Z(interfaceC1231Sn, i5, systemTimeNs);
            this.A0K = -9223372036854775807L;
            return true;
        }
        long j13 = presentationTimeUs2 - presentationTimeUs;
        Surface surface = this.A0U;
        String[] strArr = A11;
        if (strArr[3].charAt(30) != strArr[0].charAt(30)) {
            z13 = false;
        } else {
            A11[1] = "aXi14aOnggGvzxvmnKcC9iYpFhdSgDjX";
            z13 = false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.C4H
    public final boolean A25(C1234Sq c1234Sq) {
        return (this.A0U != null && (this.A0Z || this.A0U.isValid())) || A0r(c1234Sq);
    }

    public final Pair<ColorInfo, ColorInfo> A26(ColorInfo colorInfo) {
        if (!ColorInfo.A09(colorInfo)) {
            return Pair.create(ColorInfo.A09, ColorInfo.A09);
        }
        if (colorInfo.A03 == 7) {
            return Pair.create(colorInfo, colorInfo.A0A().A02(6).A03());
        }
        return Pair.create(colorInfo, colorInfo);
    }

    public final void A27() {
        this.A0j = true;
        if (!this.A0i) {
            this.A0i = true;
            this.A0t.A0D(this.A0U);
        }
    }

    @MetaExoPlayerCustomization
    public final boolean A28(long j11, long j12, boolean z11) {
        return A0k(j11) && !z11;
    }

    @Override // com.facebook.ads.redexgen.X.AnonymousClass97, com.facebook.ads.redexgen.X.PR
    public final void AAM(int i5, Object obj) throws AnonymousClass96 {
        if (i5 == 1) {
            A0U((Surface) obj);
            return;
        }
        if (A11[1].charAt(9) != '5') {
            A11[7] = "KREeACCHTlwu8ddK1Kzfi9bw16JB4";
            if (i5 == 4) {
                this.A0H = ((Integer) obj).intValue();
                InterfaceC1231Sn interfaceC1231SnA1j = A1j();
                if (interfaceC1231SnA1j == null) {
                    return;
                }
                int i11 = this.A0H;
                if (A11[4].length() != 1) {
                    A11[4] = "e";
                    interfaceC1231SnA1j.ALA(i11);
                    return;
                } else {
                    String[] strArr = A11;
                    strArr[3] = "xLrHRLKUW8a95n8rXuXAT7tESNXoYGSR";
                    strArr[0] = "zAWpFMEQW92aWBE2ysjWHFELYOwHv3Sb";
                    interfaceC1231SnA1j.ALA(i11);
                    return;
                }
            }
            if (i5 == 7) {
                InterfaceC1353Xo interfaceC1353Xo = (InterfaceC1353Xo) obj;
                if (A11[4].length() != 1) {
                    throw new RuntimeException();
                }
                A11[4] = "K";
                this.A0X = interfaceC1353Xo;
                return;
            }
            if (i5 == 10001) {
                A0f(obj);
                return;
            }
            if (i5 == 13) {
                this.A0q.A0F((List) AbstractC1062Ln.A01(obj));
                return;
            }
            if (i5 == 14) {
                C1088Mo c1088Mo = (C1088Mo) AbstractC1062Ln.A01(obj);
                if (c1088Mo.A03() == 0) {
                    return;
                }
                int iA02 = c1088Mo.A02();
                if (A11[1].charAt(9) != '5') {
                    A11[1] = "sATdPNQKTcJQDi0O9zGASS7KEwnur9li";
                    if (iA02 == 0 || this.A0U == null) {
                        return;
                    }
                    this.A0q.A0C(this.A0U, c1088Mo);
                    return;
                }
            } else {
                super.AAM(i5, obj);
                return;
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final boolean AB7() {
        boolean zAB7 = super.AB7();
        boolean isEnded = this.A0q.A0G();
        if (isEnded) {
            boolean isEnded2 = this.A0q.A0I();
            return zAB7 & isEnded2;
        }
        return zAB7;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0097, code lost:
    
        if (r5 != null) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x009d, code lost:
    
        if (r9.A0U == r9.A0T) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a3, code lost:
    
        if (A1j() == null) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00a7, code lost:
    
        if (r9.A0k == false) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00ac, code lost:
    
        if (r5 != null) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b6 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00b7  */
    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.InterfaceC1224Sg
    @MetaExoPlayerCustomizations
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean ABM() {
        if (!super.ABM() || this.A0i) {
            if (super.ABM() && (!this.A0q.A0G() || this.A0q.A0H())) {
                if (!this.A0h) {
                    Surface surface = this.A0U;
                    if (A11[5].length() == 10) {
                        A11[4] = "v";
                        if (surface != null) {
                            if (!this.A0i) {
                                Surface surface2 = this.A0T;
                                if (A11[1].charAt(9) != '5') {
                                    String[] strArr = A11;
                                    strArr[3] = "7RbqHGJzwVZCwqLB37kuqdrRw0UUy7Sa";
                                    strArr[0] = "wGqa3WBPHRZIm8XzyHsbalyq4C9m6DSG";
                                }
                            }
                            this.A0M = -9223372036854775807L;
                            return true;
                        }
                    }
                }
            }
            if (this.A0M != -9223372036854775807L) {
                return false;
            }
            if (SystemClock.elapsedRealtime() < this.A0M) {
                return true;
            }
            this.A0M = -9223372036854775807L;
            return false;
        }
        Surface surface3 = this.A0T;
        if (A11[1].charAt(9) != '5') {
            A11[7] = "B06qONTXcfa5EVD8D5PDXAL8fBLPP";
            if ((surface3 == null || this.A0U != this.A0T) && A1j() != null && !this.A0k) {
                ((AnonymousClass97) this).A0B = EnumC1362Xz.A08;
            }
            if (super.ABM()) {
                if (!this.A0h) {
                }
            }
            if (this.A0M != -9223372036854775807L) {
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.C4H, com.facebook.ads.redexgen.X.InterfaceC1224Sg
    public final void AJo(long j11, long j12) throws AnonymousClass96 {
        super.AJo(j11, j12);
        if (this.A0q.A0G()) {
            this.A0q.A0B(j11, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1224Sg, com.facebook.ads.redexgen.X.InterfaceC1153Pe
    public final String getName() {
        return A0B(682, 23, 0);
    }
}
