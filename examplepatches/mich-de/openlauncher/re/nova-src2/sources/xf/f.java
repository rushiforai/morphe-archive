package xf;

import ads_mobile_sdk.pd;
import android.content.Context;
import android.graphics.Point;
import android.media.MediaCodecInfo;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Pair;
import android.view.Surface;
import com.google.android.exoplayer2.mediacodec.MediaCodecDecoderException;
import com.google.android.exoplayer2.mediacodec.MediaCodecUtil$DecoderQueryException;
import com.google.android.exoplayer2.video.MediaCodecVideoDecoderException;
import com.google.android.exoplayer2.video.PlaceholderSurface;
import com.google.android.gms.internal.measurement.wg;
import fe.j0;
import fe.k0;
import fe.r1;
import fe.x;
import gf.t0;
import io.sentry.e3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import we.s;
import wf.v;
import xk.l0;
import xk.r2;
import xk.s0;
import xk.v0;

/* loaded from: classes3.dex */
public final class f extends we.n {

    /* renamed from: n1, reason: collision with root package name */
    public static final int[] f95783n1 = {1920, 1600, 1440, 1280, 960, 854, 640, 540, 480};

    /* renamed from: o1, reason: collision with root package name */
    public static boolean f95784o1;

    /* renamed from: p1, reason: collision with root package name */
    public static boolean f95785p1;
    public final Context E0;
    public final n F0;
    public final he.k G0;
    public final long H0;
    public final int I0;
    public final boolean J0;
    public wg K0;
    public boolean L0;
    public boolean M0;
    public Surface N0;
    public PlaceholderSurface O0;
    public boolean P0;
    public int Q0;
    public boolean R0;
    public boolean S0;
    public boolean T0;
    public long U0;
    public long V0;
    public long W0;
    public int X0;
    public int Y0;
    public int Z0;

    /* renamed from: a1, reason: collision with root package name */
    public long f95786a1;

    /* renamed from: b1, reason: collision with root package name */
    public long f95787b1;

    /* renamed from: c1, reason: collision with root package name */
    public long f95788c1;

    /* renamed from: d1, reason: collision with root package name */
    public int f95789d1;

    /* renamed from: e1, reason: collision with root package name */
    public int f95790e1;

    /* renamed from: f1, reason: collision with root package name */
    public int f95791f1;
    public int g1;
    public float h1;
    public p i1;

    /* renamed from: j1, reason: collision with root package name */
    public boolean f95792j1;

    /* renamed from: k1, reason: collision with root package name */
    public int f95793k1;

    /* renamed from: l1, reason: collision with root package name */
    public ea.a f95794l1;

    /* renamed from: m1, reason: collision with root package name */
    public i f95795m1;

    public f(Context context, we.i iVar, Handler handler, x xVar) {
        super(2, iVar, 30.0f);
        this.H0 = 5000L;
        this.I0 = 50;
        Context applicationContext = context.getApplicationContext();
        this.E0 = applicationContext;
        this.F0 = new n(applicationContext);
        this.G0 = new he.k(handler, xVar);
        this.J0 = "NVIDIA".equals(v.f94378c);
        this.V0 = -9223372036854775807L;
        this.f95790e1 = -1;
        this.f95791f1 = -1;
        this.h1 = -1.0f;
        this.Q0 = 1;
        this.f95793k1 = 0;
        this.i1 = null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x008b A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ab  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean r0(String str) {
        boolean z11;
        boolean z12;
        boolean z13 = false;
        if (str.startsWith("OMX.google")) {
            return false;
        }
        synchronized (f.class) {
            try {
                if (!f95784o1) {
                    int i5 = v.f94376a;
                    char c11 = 28;
                    if (i5 <= 28) {
                        String str2 = v.f94377b;
                        str2.getClass();
                        switch (str2.hashCode()) {
                            case -1339091551:
                                if (!str2.equals("dangal")) {
                                    z12 = -1;
                                    break;
                                } else {
                                    z12 = false;
                                    break;
                                }
                            case -1220081023:
                                if (str2.equals("dangalFHD")) {
                                    z12 = true;
                                    break;
                                }
                                break;
                            case -1220066608:
                                if (str2.equals("dangalUHD")) {
                                    z12 = 2;
                                    break;
                                }
                                break;
                            case -1012436106:
                                if (str2.equals("oneday")) {
                                    z12 = 3;
                                    break;
                                }
                                break;
                            case -760312546:
                                if (str2.equals("aquaman")) {
                                    z12 = 4;
                                    break;
                                }
                                break;
                            case -64886864:
                                if (str2.equals("magnolia")) {
                                    z12 = 5;
                                    break;
                                }
                                break;
                            case 3415681:
                                if (str2.equals("once")) {
                                    z12 = 6;
                                    break;
                                }
                                break;
                            case 825323514:
                                if (str2.equals("machuca")) {
                                    z12 = 7;
                                    break;
                                }
                                break;
                        }
                        switch (z12) {
                            default:
                                if (i5 > 27 || !"HWEML".equals(v.f94377b)) {
                                    String str3 = v.f94379d;
                                    str3.getClass();
                                    switch (str3.hashCode()) {
                                        case -349662828:
                                            if (!str3.equals("AFTJMST12")) {
                                                z11 = -1;
                                                break;
                                            } else {
                                                z11 = false;
                                                break;
                                            }
                                        case -321033677:
                                            if (str3.equals("AFTKMST12")) {
                                                z11 = true;
                                                break;
                                            }
                                            break;
                                        case 2006354:
                                            if (str3.equals("AFTA")) {
                                                z11 = 2;
                                                break;
                                            }
                                            break;
                                        case 2006367:
                                            if (str3.equals("AFTN")) {
                                                z11 = 3;
                                                break;
                                            }
                                            break;
                                        case 2006371:
                                            if (str3.equals("AFTR")) {
                                                z11 = 4;
                                                break;
                                            }
                                            break;
                                        case 1785421873:
                                            if (str3.equals("AFTEU011")) {
                                                z11 = 5;
                                                break;
                                            }
                                            break;
                                        case 1785421876:
                                            if (str3.equals("AFTEU014")) {
                                                z11 = 6;
                                                break;
                                            }
                                            break;
                                        case 1798172390:
                                            if (str3.equals("AFTSO001")) {
                                                z11 = 7;
                                                break;
                                            }
                                            break;
                                        case 2119412532:
                                            if (str3.equals("AFTEUFF014")) {
                                                z11 = 8;
                                                break;
                                            }
                                            break;
                                    }
                                    switch (z11) {
                                        default:
                                            if (i5 <= 26) {
                                                String str4 = v.f94377b;
                                                str4.getClass();
                                                switch (str4.hashCode()) {
                                                    case -2144781245:
                                                        if (!str4.equals("GIONEE_SWW1609")) {
                                                            c11 = 65535;
                                                            break;
                                                        } else {
                                                            c11 = 0;
                                                            break;
                                                        }
                                                    case -2144781185:
                                                        if (str4.equals("GIONEE_SWW1627")) {
                                                            c11 = 1;
                                                            break;
                                                        }
                                                        break;
                                                    case -2144781160:
                                                        if (str4.equals("GIONEE_SWW1631")) {
                                                            c11 = 2;
                                                            break;
                                                        }
                                                        break;
                                                    case -2097309513:
                                                        if (str4.equals("K50a40")) {
                                                            c11 = 3;
                                                            break;
                                                        }
                                                        break;
                                                    case -2022874474:
                                                        if (str4.equals("CP8676_I02")) {
                                                            c11 = 4;
                                                            break;
                                                        }
                                                        break;
                                                    case -1978993182:
                                                        if (str4.equals("NX541J")) {
                                                            c11 = 5;
                                                            break;
                                                        }
                                                        break;
                                                    case -1978990237:
                                                        if (str4.equals("NX573J")) {
                                                            c11 = 6;
                                                            break;
                                                        }
                                                        break;
                                                    case -1936688988:
                                                        if (str4.equals("PGN528")) {
                                                            c11 = 7;
                                                            break;
                                                        }
                                                        break;
                                                    case -1936688066:
                                                        if (str4.equals("PGN610")) {
                                                            c11 = '\b';
                                                            break;
                                                        }
                                                        break;
                                                    case -1936688065:
                                                        if (str4.equals("PGN611")) {
                                                            c11 = '\t';
                                                            break;
                                                        }
                                                        break;
                                                    case -1931988508:
                                                        if (str4.equals("AquaPowerM")) {
                                                            c11 = '\n';
                                                            break;
                                                        }
                                                        break;
                                                    case -1885099851:
                                                        if (str4.equals("RAIJIN")) {
                                                            c11 = 11;
                                                            break;
                                                        }
                                                        break;
                                                    case -1696512866:
                                                        if (str4.equals("XT1663")) {
                                                            c11 = '\f';
                                                            break;
                                                        }
                                                        break;
                                                    case -1680025915:
                                                        if (str4.equals("ComioS1")) {
                                                            c11 = '\r';
                                                            break;
                                                        }
                                                        break;
                                                    case -1615810839:
                                                        if (str4.equals("Phantom6")) {
                                                            c11 = 14;
                                                            break;
                                                        }
                                                        break;
                                                    case -1600724499:
                                                        if (str4.equals("pacificrim")) {
                                                            c11 = 15;
                                                            break;
                                                        }
                                                        break;
                                                    case -1554255044:
                                                        if (str4.equals("vernee_M5")) {
                                                            c11 = 16;
                                                            break;
                                                        }
                                                        break;
                                                    case -1481772737:
                                                        if (str4.equals("panell_dl")) {
                                                            c11 = 17;
                                                            break;
                                                        }
                                                        break;
                                                    case -1481772730:
                                                        if (str4.equals("panell_ds")) {
                                                            c11 = 18;
                                                            break;
                                                        }
                                                        break;
                                                    case -1481772729:
                                                        if (str4.equals("panell_dt")) {
                                                            c11 = 19;
                                                            break;
                                                        }
                                                        break;
                                                    case -1320080169:
                                                        if (str4.equals("GiONEE_GBL7319")) {
                                                            c11 = 20;
                                                            break;
                                                        }
                                                        break;
                                                    case -1217592143:
                                                        if (str4.equals("BRAVIA_ATV2")) {
                                                            c11 = 21;
                                                            break;
                                                        }
                                                        break;
                                                    case -1180384755:
                                                        if (str4.equals("iris60")) {
                                                            c11 = 22;
                                                            break;
                                                        }
                                                        break;
                                                    case -1139198265:
                                                        if (str4.equals("Slate_Pro")) {
                                                            c11 = 23;
                                                            break;
                                                        }
                                                        break;
                                                    case -1052835013:
                                                        if (str4.equals("namath")) {
                                                            c11 = 24;
                                                            break;
                                                        }
                                                        break;
                                                    case -993250464:
                                                        if (str4.equals("A10-70F")) {
                                                            c11 = 25;
                                                            break;
                                                        }
                                                        break;
                                                    case -993250458:
                                                        if (str4.equals("A10-70L")) {
                                                            c11 = 26;
                                                            break;
                                                        }
                                                        break;
                                                    case -965403638:
                                                        if (str4.equals("s905x018")) {
                                                            c11 = 27;
                                                            break;
                                                        }
                                                        break;
                                                    case -958336948:
                                                        if (!str4.equals("ELUGA_Ray_X")) {
                                                        }
                                                        break;
                                                    case -879245230:
                                                        if (str4.equals("tcl_eu")) {
                                                            c11 = 29;
                                                            break;
                                                        }
                                                        break;
                                                    case -842500323:
                                                        if (str4.equals("nicklaus_f")) {
                                                            c11 = 30;
                                                            break;
                                                        }
                                                        break;
                                                    case -821392978:
                                                        if (str4.equals("A7000-a")) {
                                                            c11 = 31;
                                                            break;
                                                        }
                                                        break;
                                                    case -797483286:
                                                        if (str4.equals("SVP-DTV15")) {
                                                            c11 = ' ';
                                                            break;
                                                        }
                                                        break;
                                                    case -794946968:
                                                        if (str4.equals("watson")) {
                                                            c11 = '!';
                                                            break;
                                                        }
                                                        break;
                                                    case -788334647:
                                                        if (str4.equals("whyred")) {
                                                            c11 = AbstractJsonLexerKt.STRING;
                                                            break;
                                                        }
                                                        break;
                                                    case -782144577:
                                                        if (str4.equals("OnePlus5T")) {
                                                            c11 = '#';
                                                            break;
                                                        }
                                                        break;
                                                    case -575125681:
                                                        if (str4.equals("GiONEE_CBL7513")) {
                                                            c11 = '$';
                                                            break;
                                                        }
                                                        break;
                                                    case -521118391:
                                                        if (str4.equals("GIONEE_GBL7360")) {
                                                            c11 = '%';
                                                            break;
                                                        }
                                                        break;
                                                    case -430914369:
                                                        if (str4.equals("Pixi4-7_3G")) {
                                                            c11 = '&';
                                                            break;
                                                        }
                                                        break;
                                                    case -290434366:
                                                        if (str4.equals("taido_row")) {
                                                            c11 = '\'';
                                                            break;
                                                        }
                                                        break;
                                                    case -282781963:
                                                        if (str4.equals("BLACK-1X")) {
                                                            c11 = '(';
                                                            break;
                                                        }
                                                        break;
                                                    case -277133239:
                                                        if (str4.equals("Z12_PRO")) {
                                                            c11 = ')';
                                                            break;
                                                        }
                                                        break;
                                                    case -173639913:
                                                        if (str4.equals("ELUGA_A3_Pro")) {
                                                            c11 = '*';
                                                            break;
                                                        }
                                                        break;
                                                    case -56598463:
                                                        if (str4.equals("woods_fn")) {
                                                            c11 = '+';
                                                            break;
                                                        }
                                                        break;
                                                    case 2126:
                                                        if (str4.equals("C1")) {
                                                            c11 = AbstractJsonLexerKt.COMMA;
                                                            break;
                                                        }
                                                        break;
                                                    case 2564:
                                                        if (str4.equals("Q5")) {
                                                            c11 = '-';
                                                            break;
                                                        }
                                                        break;
                                                    case 2715:
                                                        if (str4.equals("V1")) {
                                                            c11 = '.';
                                                            break;
                                                        }
                                                        break;
                                                    case 2719:
                                                        if (str4.equals("V5")) {
                                                            c11 = '/';
                                                            break;
                                                        }
                                                        break;
                                                    case 3091:
                                                        if (str4.equals("b5")) {
                                                            c11 = '0';
                                                            break;
                                                        }
                                                        break;
                                                    case 3483:
                                                        if (str4.equals("mh")) {
                                                            c11 = '1';
                                                            break;
                                                        }
                                                        break;
                                                    case 73405:
                                                        if (str4.equals("JGZ")) {
                                                            c11 = '2';
                                                            break;
                                                        }
                                                        break;
                                                    case 75537:
                                                        if (str4.equals("M04")) {
                                                            c11 = '3';
                                                            break;
                                                        }
                                                        break;
                                                    case 75739:
                                                        if (str4.equals("M5c")) {
                                                            c11 = '4';
                                                            break;
                                                        }
                                                        break;
                                                    case 76779:
                                                        if (str4.equals("MX6")) {
                                                            c11 = '5';
                                                            break;
                                                        }
                                                        break;
                                                    case 78669:
                                                        if (str4.equals("P85")) {
                                                            c11 = '6';
                                                            break;
                                                        }
                                                        break;
                                                    case 79305:
                                                        if (str4.equals("PLE")) {
                                                            c11 = '7';
                                                            break;
                                                        }
                                                        break;
                                                    case 80618:
                                                        if (str4.equals("QX1")) {
                                                            c11 = '8';
                                                            break;
                                                        }
                                                        break;
                                                    case 88274:
                                                        if (str4.equals("Z80")) {
                                                            c11 = '9';
                                                            break;
                                                        }
                                                        break;
                                                    case 98846:
                                                        if (str4.equals("cv1")) {
                                                            c11 = AbstractJsonLexerKt.COLON;
                                                            break;
                                                        }
                                                        break;
                                                    case 98848:
                                                        if (str4.equals("cv3")) {
                                                            c11 = ';';
                                                            break;
                                                        }
                                                        break;
                                                    case 99329:
                                                        if (str4.equals("deb")) {
                                                            c11 = '<';
                                                            break;
                                                        }
                                                        break;
                                                    case 101481:
                                                        if (str4.equals("flo")) {
                                                            c11 = '=';
                                                            break;
                                                        }
                                                        break;
                                                    case 1513190:
                                                        if (str4.equals("1601")) {
                                                            c11 = '>';
                                                            break;
                                                        }
                                                        break;
                                                    case 1514184:
                                                        if (str4.equals("1713")) {
                                                            c11 = '?';
                                                            break;
                                                        }
                                                        break;
                                                    case 1514185:
                                                        if (str4.equals("1714")) {
                                                            c11 = '@';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133089:
                                                        if (str4.equals("F01H")) {
                                                            c11 = 'A';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133091:
                                                        if (str4.equals("F01J")) {
                                                            c11 = 'B';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133120:
                                                        if (str4.equals("F02H")) {
                                                            c11 = 'C';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133151:
                                                        if (str4.equals("F03H")) {
                                                            c11 = 'D';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133182:
                                                        if (str4.equals("F04H")) {
                                                            c11 = 'E';
                                                            break;
                                                        }
                                                        break;
                                                    case 2133184:
                                                        if (str4.equals("F04J")) {
                                                            c11 = 'F';
                                                            break;
                                                        }
                                                        break;
                                                    case 2436959:
                                                        if (str4.equals("P681")) {
                                                            c11 = 'G';
                                                            break;
                                                        }
                                                        break;
                                                    case 2463773:
                                                        if (str4.equals("Q350")) {
                                                            c11 = 'H';
                                                            break;
                                                        }
                                                        break;
                                                    case 2464648:
                                                        if (str4.equals("Q427")) {
                                                            c11 = 'I';
                                                            break;
                                                        }
                                                        break;
                                                    case 2689555:
                                                        if (str4.equals("XE2X")) {
                                                            c11 = 'J';
                                                            break;
                                                        }
                                                        break;
                                                    case 3154429:
                                                        if (str4.equals("fugu")) {
                                                            c11 = 'K';
                                                            break;
                                                        }
                                                        break;
                                                    case 3284551:
                                                        if (str4.equals("kate")) {
                                                            c11 = 'L';
                                                            break;
                                                        }
                                                        break;
                                                    case 3351335:
                                                        if (str4.equals("mido")) {
                                                            c11 = 'M';
                                                            break;
                                                        }
                                                        break;
                                                    case 3386211:
                                                        if (str4.equals("p212")) {
                                                            c11 = 'N';
                                                            break;
                                                        }
                                                        break;
                                                    case 41325051:
                                                        if (str4.equals("MEIZU_M5")) {
                                                            c11 = 'O';
                                                            break;
                                                        }
                                                        break;
                                                    case 51349633:
                                                        if (str4.equals("601LV")) {
                                                            c11 = 'P';
                                                            break;
                                                        }
                                                        break;
                                                    case 51350594:
                                                        if (str4.equals("602LV")) {
                                                            c11 = 'Q';
                                                            break;
                                                        }
                                                        break;
                                                    case 55178625:
                                                        if (str4.equals("Aura_Note_2")) {
                                                            c11 = 'R';
                                                            break;
                                                        }
                                                        break;
                                                    case 61542055:
                                                        if (str4.equals("A1601")) {
                                                            c11 = 'S';
                                                            break;
                                                        }
                                                        break;
                                                    case 65355429:
                                                        if (str4.equals("E5643")) {
                                                            c11 = 'T';
                                                            break;
                                                        }
                                                        break;
                                                    case 66214468:
                                                        if (str4.equals("F3111")) {
                                                            c11 = 'U';
                                                            break;
                                                        }
                                                        break;
                                                    case 66214470:
                                                        if (str4.equals("F3113")) {
                                                            c11 = 'V';
                                                            break;
                                                        }
                                                        break;
                                                    case 66214473:
                                                        if (str4.equals("F3116")) {
                                                            c11 = 'W';
                                                            break;
                                                        }
                                                        break;
                                                    case 66215429:
                                                        if (str4.equals("F3211")) {
                                                            c11 = 'X';
                                                            break;
                                                        }
                                                        break;
                                                    case 66215431:
                                                        if (str4.equals("F3213")) {
                                                            c11 = 'Y';
                                                            break;
                                                        }
                                                        break;
                                                    case 66215433:
                                                        if (str4.equals("F3215")) {
                                                            c11 = 'Z';
                                                            break;
                                                        }
                                                        break;
                                                    case 66216390:
                                                        if (str4.equals("F3311")) {
                                                            c11 = AbstractJsonLexerKt.BEGIN_LIST;
                                                            break;
                                                        }
                                                        break;
                                                    case 76402249:
                                                        if (str4.equals("PRO7S")) {
                                                            c11 = AbstractJsonLexerKt.STRING_ESC;
                                                            break;
                                                        }
                                                        break;
                                                    case 76404105:
                                                        if (str4.equals("Q4260")) {
                                                            c11 = AbstractJsonLexerKt.END_LIST;
                                                            break;
                                                        }
                                                        break;
                                                    case 76404911:
                                                        if (str4.equals("Q4310")) {
                                                            c11 = '^';
                                                            break;
                                                        }
                                                        break;
                                                    case 80963634:
                                                        if (str4.equals("V23GB")) {
                                                            c11 = '_';
                                                            break;
                                                        }
                                                        break;
                                                    case 82882791:
                                                        if (str4.equals("X3_HK")) {
                                                            c11 = '`';
                                                            break;
                                                        }
                                                        break;
                                                    case 98715550:
                                                        if (str4.equals("i9031")) {
                                                            c11 = 'a';
                                                            break;
                                                        }
                                                        break;
                                                    case 101370885:
                                                        if (str4.equals("l5460")) {
                                                            c11 = 'b';
                                                            break;
                                                        }
                                                        break;
                                                    case 102844228:
                                                        if (str4.equals("le_x6")) {
                                                            c11 = 'c';
                                                            break;
                                                        }
                                                        break;
                                                    case 165221241:
                                                        if (str4.equals("A2016a40")) {
                                                            c11 = 'd';
                                                            break;
                                                        }
                                                        break;
                                                    case 182191441:
                                                        if (str4.equals("CPY83_I00")) {
                                                            c11 = 'e';
                                                            break;
                                                        }
                                                        break;
                                                    case 245388979:
                                                        if (str4.equals("marino_f")) {
                                                            c11 = 'f';
                                                            break;
                                                        }
                                                        break;
                                                    case 287431619:
                                                        if (str4.equals("griffin")) {
                                                            c11 = 'g';
                                                            break;
                                                        }
                                                        break;
                                                    case 307593612:
                                                        if (str4.equals("A7010a48")) {
                                                            c11 = 'h';
                                                            break;
                                                        }
                                                        break;
                                                    case 308517133:
                                                        if (str4.equals("A7020a48")) {
                                                            c11 = 'i';
                                                            break;
                                                        }
                                                        break;
                                                    case 316215098:
                                                        if (str4.equals("TB3-730F")) {
                                                            c11 = 'j';
                                                            break;
                                                        }
                                                        break;
                                                    case 316215116:
                                                        if (str4.equals("TB3-730X")) {
                                                            c11 = 'k';
                                                            break;
                                                        }
                                                        break;
                                                    case 316246811:
                                                        if (str4.equals("TB3-850F")) {
                                                            c11 = 'l';
                                                            break;
                                                        }
                                                        break;
                                                    case 316246818:
                                                        if (str4.equals("TB3-850M")) {
                                                            c11 = 'm';
                                                            break;
                                                        }
                                                        break;
                                                    case 407160593:
                                                        if (str4.equals("Pixi5-10_4G")) {
                                                            c11 = 'n';
                                                            break;
                                                        }
                                                        break;
                                                    case 507412548:
                                                        if (str4.equals("QM16XE_U")) {
                                                            c11 = 'o';
                                                            break;
                                                        }
                                                        break;
                                                    case 793982701:
                                                        if (str4.equals("GIONEE_WBL5708")) {
                                                            c11 = 'p';
                                                            break;
                                                        }
                                                        break;
                                                    case 794038622:
                                                        if (str4.equals("GIONEE_WBL7365")) {
                                                            c11 = 'q';
                                                            break;
                                                        }
                                                        break;
                                                    case 794040393:
                                                        if (str4.equals("GIONEE_WBL7519")) {
                                                            c11 = 'r';
                                                            break;
                                                        }
                                                        break;
                                                    case 835649806:
                                                        if (str4.equals("manning")) {
                                                            c11 = 's';
                                                            break;
                                                        }
                                                        break;
                                                    case 917340916:
                                                        if (str4.equals("A7000plus")) {
                                                            c11 = 't';
                                                            break;
                                                        }
                                                        break;
                                                    case 958008161:
                                                        if (str4.equals("j2xlteins")) {
                                                            c11 = AbstractJsonLexerKt.UNICODE_ESC;
                                                            break;
                                                        }
                                                        break;
                                                    case 1060579533:
                                                        if (str4.equals("panell_d")) {
                                                            c11 = 'v';
                                                            break;
                                                        }
                                                        break;
                                                    case 1150207623:
                                                        if (str4.equals("LS-5017")) {
                                                            c11 = 'w';
                                                            break;
                                                        }
                                                        break;
                                                    case 1176899427:
                                                        if (str4.equals("itel_S41")) {
                                                            c11 = 'x';
                                                            break;
                                                        }
                                                        break;
                                                    case 1280332038:
                                                        if (str4.equals("hwALE-H")) {
                                                            c11 = 'y';
                                                            break;
                                                        }
                                                        break;
                                                    case 1306947716:
                                                        if (str4.equals("EverStar_S")) {
                                                            c11 = 'z';
                                                            break;
                                                        }
                                                        break;
                                                    case 1349174697:
                                                        if (str4.equals("htc_e56ml_dtul")) {
                                                            c11 = AbstractJsonLexerKt.BEGIN_OBJ;
                                                            break;
                                                        }
                                                        break;
                                                    case 1522194893:
                                                        if (str4.equals("woods_f")) {
                                                            c11 = '|';
                                                            break;
                                                        }
                                                        break;
                                                    case 1691543273:
                                                        if (str4.equals("CPH1609")) {
                                                            c11 = AbstractJsonLexerKt.END_OBJ;
                                                            break;
                                                        }
                                                        break;
                                                    case 1691544261:
                                                        if (str4.equals("CPH1715")) {
                                                            c11 = '~';
                                                            break;
                                                        }
                                                        break;
                                                    case 1709443163:
                                                        if (str4.equals("iball8735_9806")) {
                                                            c11 = 127;
                                                            break;
                                                        }
                                                        break;
                                                    case 1865889110:
                                                        if (str4.equals("santoni")) {
                                                            c11 = 128;
                                                            break;
                                                        }
                                                        break;
                                                    case 1906253259:
                                                        if (str4.equals("PB2-670M")) {
                                                            c11 = 129;
                                                            break;
                                                        }
                                                        break;
                                                    case 1977196784:
                                                        if (str4.equals("Infinix-X572")) {
                                                            c11 = 130;
                                                            break;
                                                        }
                                                        break;
                                                    case 2006372676:
                                                        if (str4.equals("BRAVIA_ATV3_4K")) {
                                                            c11 = 131;
                                                            break;
                                                        }
                                                        break;
                                                    case 2019281702:
                                                        if (str4.equals("DM-01K")) {
                                                            c11 = 132;
                                                            break;
                                                        }
                                                        break;
                                                    case 2029784656:
                                                        if (str4.equals("HWBLN-H")) {
                                                            c11 = 133;
                                                            break;
                                                        }
                                                        break;
                                                    case 2030379515:
                                                        if (str4.equals("HWCAM-H")) {
                                                            c11 = 134;
                                                            break;
                                                        }
                                                        break;
                                                    case 2033393791:
                                                        if (str4.equals("ASUS_X00AD_2")) {
                                                            c11 = 135;
                                                            break;
                                                        }
                                                        break;
                                                    case 2047190025:
                                                        if (str4.equals("ELUGA_Note")) {
                                                            c11 = 136;
                                                            break;
                                                        }
                                                        break;
                                                    case 2047252157:
                                                        if (str4.equals("ELUGA_Prim")) {
                                                            c11 = 137;
                                                            break;
                                                        }
                                                        break;
                                                    case 2048319463:
                                                        if (str4.equals("HWVNS-H")) {
                                                            c11 = 138;
                                                            break;
                                                        }
                                                        break;
                                                    case 2048855701:
                                                        if (str4.equals("HWWAS-H")) {
                                                            c11 = 139;
                                                            break;
                                                        }
                                                        break;
                                                }
                                                switch (c11) {
                                                    default:
                                                        if (str3.equals("JSN-L21")) {
                                                        }
                                                        break;
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
                                                    case pd.N0 /* 92 */:
                                                    case pd.O0 /* 93 */:
                                                    case pd.P0 /* 94 */:
                                                    case pd.f8203p0 /* 95 */:
                                                    case pd.A0 /* 96 */:
                                                    case pd.H0 /* 97 */:
                                                    case pd.Q0 /* 98 */:
                                                    case pd.R0 /* 99 */:
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
                                                    case ASSET_FAILED_INSUFFICIENT_SPACE_VALUE:
                                                    case ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE:
                                                    case 128:
                                                    case EMPTY_TPAT_ERROR_VALUE:
                                                    case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                                                    case MRAID_JS_WRITE_FAILED_VALUE:
                                                    case OMSDK_DOWNLOAD_JS_ERROR_VALUE:
                                                    case OMSDK_JS_WRITE_FAILED_VALUE:
                                                    case STORE_REGION_CODE_ERROR_VALUE:
                                                    case INVALID_CONFIG_RESPONSE_VALUE:
                                                    case PRIVACY_URL_ERROR_VALUE:
                                                    case TPAT_RETRY_FAILED_VALUE:
                                                    case CONFIG_REFRESH_FAILED_VALUE:
                                                    case 139:
                                                        z13 = true;
                                                        break;
                                                }
                                            }
                                            break;
                                        case false:
                                        case true:
                                        case true:
                                        case true:
                                        case true:
                                        case true:
                                        case true:
                                        case true:
                                        case true:
                                            break;
                                    }
                                }
                                break;
                            case false:
                            case true:
                            case true:
                            case true:
                            case true:
                            case true:
                            case true:
                            case true:
                                break;
                        }
                        f95785p1 = z13;
                        f95784o1 = true;
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return f95785p1;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int s0(we.l lVar, k0 k0Var) {
        int iIntValue;
        int i5 = k0Var.f54886q;
        int i11 = k0Var.f54887r;
        if (i5 != -1 && i11 != -1) {
            String str = k0Var.f54883l;
            char c11 = 1;
            if ("video/dolby-vision".equals(str)) {
                Pair pairD = s.d(k0Var);
                str = (pairD == null || !((iIntValue = ((Integer) pairD.first).intValue()) == 512 || iIntValue == 1 || iIntValue == 2)) ? "video/hevc" : "video/avc";
            }
            str.getClass();
            switch (str.hashCode()) {
                case -1664118616:
                    if (!str.equals("video/3gpp")) {
                        c11 = 65535;
                        break;
                    } else {
                        c11 = 0;
                        break;
                    }
                case -1662735862:
                    if (!str.equals("video/av01")) {
                    }
                    break;
                case -1662541442:
                    if (str.equals("video/hevc")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case 1187890754:
                    if (str.equals("video/mp4v-es")) {
                        c11 = 3;
                        break;
                    }
                    break;
                case 1331836730:
                    if (str.equals("video/avc")) {
                        c11 = 4;
                        break;
                    }
                    break;
                case 1599127256:
                    if (str.equals("video/x-vnd.on2.vp8")) {
                        c11 = 5;
                        break;
                    }
                    break;
                case 1599127257:
                    if (str.equals("video/x-vnd.on2.vp9")) {
                        c11 = 6;
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                case 1:
                case 3:
                case 5:
                    return ((i5 * i11) * 3) / 4;
                case 2:
                    return Math.max(2097152, ((i5 * i11) * 3) / 4);
                case 4:
                    String str2 = v.f94379d;
                    if (!"BRAVIA 4K 2015".equals(str2) && (!"Amazon".equals(v.f94378c) || (!"KFSOWI".equals(str2) && (!"AFTS".equals(str2) || !lVar.f94255f)))) {
                        return ((v.f(i11, 16) * v.f(i5, 16)) * 768) / 4;
                    }
                    break;
                case 6:
                    return ((i5 * i11) * 3) / 8;
            }
        }
        return -1;
    }

    public static v0 t0(Context context, we.o oVar, k0 k0Var, boolean z11, boolean z12) {
        String str = k0Var.f54883l;
        if (str == null) {
            l0 l0Var = v0.f96030b;
            return r2.f96007e;
        }
        oVar.getClass();
        List listE = s.e(str, z11, z12);
        String strB = s.b(k0Var);
        if (strB == null) {
            return v0.o(listE);
        }
        List listE2 = s.e(strB, z11, z12);
        if (v.f94376a >= 26 && "video/dolby-vision".equals(k0Var.f54883l) && !listE2.isEmpty() && !e.a(context)) {
            return v0.o(listE2);
        }
        s0 s0VarL = v0.l();
        s0VarL.e(listE);
        s0VarL.e(listE2);
        return s0VarL.f();
    }

    public static int u0(we.l lVar, k0 k0Var) {
        int i5 = k0Var.f54884m;
        List list = k0Var.n;
        if (i5 == -1) {
            return s0(lVar, k0Var);
        }
        int size = list.size();
        int length = 0;
        for (int i11 = 0; i11 < size; i11++) {
            length += ((byte[]) list.get(i11)).length;
        }
        return k0Var.f54884m + length;
    }

    @Override // we.n
    public final ie.g A(we.l lVar, k0 k0Var, k0 k0Var2) {
        ie.g gVarB = lVar.b(k0Var, k0Var2);
        int i5 = gVarB.f61589e;
        int i11 = k0Var2.f54886q;
        wg wgVar = this.K0;
        if (i11 > wgVar.f33198a || k0Var2.f54887r > wgVar.f33199b) {
            i5 |= 256;
        }
        if (u0(lVar, k0Var2) > this.K0.f33200c) {
            i5 |= 64;
        }
        int i12 = i5;
        return new ie.g(lVar.f94250a, k0Var, k0Var2, i12 != 0 ? 0 : gVarB.f61588d, i12);
    }

    public final boolean A0(we.l lVar) {
        if (v.f94376a < 23 || this.f95792j1 || r0(lVar.f94250a)) {
            return false;
        }
        return !lVar.f94255f || PlaceholderSurface.b(this.E0);
    }

    @Override // we.n
    public final MediaCodecDecoderException B(IllegalStateException illegalStateException, we.l lVar) {
        Surface surface = this.N0;
        MediaCodecVideoDecoderException mediaCodecVideoDecoderException = new MediaCodecVideoDecoderException(illegalStateException, lVar);
        if (surface != null) {
            surface.isValid();
        }
        return mediaCodecVideoDecoderException;
    }

    public final void B0(we.j jVar, int i5) {
        wf.a.b("skipVideoBuffer");
        jVar.l(i5, false);
        wf.a.q();
        this.f94295z0.f61572f++;
    }

    public final void C0(int i5, int i11) {
        ie.e eVar = this.f94295z0;
        eVar.f61574h += i5;
        int i12 = i5 + i11;
        eVar.f61573g += i12;
        this.X0 += i12;
        int i13 = this.Y0 + i12;
        this.Y0 = i13;
        eVar.f61575i = Math.max(i13, eVar.f61575i);
        int i14 = this.I0;
        if (i14 <= 0 || this.X0 < i14) {
            return;
        }
        v0();
    }

    public final void D0(long j11) {
        ie.e eVar = this.f94295z0;
        eVar.f61577k += j11;
        eVar.f61578l++;
        this.f95788c1 += j11;
        this.f95789d1++;
    }

    @Override // we.n
    public final boolean J() {
        return this.f95792j1 && v.f94376a < 23;
    }

    @Override // we.n
    public final float K(float f11, k0[] k0VarArr) {
        float fMax = -1.0f;
        for (k0 k0Var : k0VarArr) {
            float f12 = k0Var.f54888s;
            if (f12 != -1.0f) {
                fMax = Math.max(fMax, f12);
            }
        }
        if (fMax == -1.0f) {
            return -1.0f;
        }
        return fMax * f11;
    }

    @Override // we.n
    public final ArrayList L(we.o oVar, k0 k0Var, boolean z11) {
        v0 v0VarT0 = t0(this.E0, oVar, k0Var, z11, this.f95792j1);
        Pattern pattern = s.f94301a;
        ArrayList arrayList = new ArrayList(v0VarT0);
        Collections.sort(arrayList, new ay.g(new k30.e(k0Var, 29), 10));
        return arrayList;
    }

    @Override // we.n
    public final we.h N(we.l lVar, k0 k0Var, MediaCrypto mediaCrypto, float f11) {
        int i5;
        a aVar;
        wg wgVar;
        Point point;
        Point point2;
        MediaCodecInfo.VideoCapabilities videoCapabilities;
        int i11;
        char c11;
        boolean z11;
        Pair pairD;
        int iS0;
        PlaceholderSurface placeholderSurface = this.O0;
        if (placeholderSurface != null && placeholderSurface.f31599a != lVar.f94255f) {
            if (this.N0 == placeholderSurface) {
                this.N0 = null;
            }
            placeholderSurface.release();
            this.O0 = null;
        }
        String str = lVar.f94252c;
        k0[] k0VarArr = this.f54727h;
        k0VarArr.getClass();
        int i12 = k0Var.f54886q;
        float f12 = k0Var.f54888s;
        int i13 = k0Var.f54887r;
        a aVar2 = k0Var.f54893x;
        int iU0 = u0(lVar, k0Var);
        if (k0VarArr.length == 1) {
            if (iU0 != -1 && (iS0 = s0(lVar, k0Var)) != -1) {
                iU0 = Math.min((int) (iU0 * 1.5f), iS0);
            }
            wgVar = new wg(i12, i13, iU0);
            i5 = i13;
            aVar = aVar2;
        } else {
            int length = k0VarArr.length;
            int iMax = i12;
            int iMax2 = i13;
            int i14 = 0;
            boolean z12 = false;
            while (i14 < length) {
                k0 k0Var2 = k0VarArr[i14];
                int i15 = i14;
                if (aVar2 != null && k0Var2.f54893x == null) {
                    j0 j0VarA = k0Var2.a();
                    j0VarA.f54866w = aVar2;
                    k0Var2 = new k0(j0VarA);
                }
                ie.g gVarB = lVar.b(k0Var, k0Var2);
                k0[] k0VarArr2 = k0VarArr;
                int i16 = k0Var2.f54887r;
                if (gVarB.f61588d != 0) {
                    int i17 = k0Var2.f54886q;
                    i11 = length;
                    c11 = 65535;
                    z12 |= i17 == -1 || i16 == -1;
                    iMax = Math.max(iMax, i17);
                    iMax2 = Math.max(iMax2, i16);
                    iU0 = Math.max(iU0, u0(lVar, k0Var2));
                } else {
                    i11 = length;
                    c11 = 65535;
                }
                i14 = i15 + 1;
                k0VarArr = k0VarArr2;
                length = i11;
            }
            if (z12) {
                wf.a.D("MediaCodecVideoRenderer", "Resolutions unknown. Codec max resolution: " + iMax + "x" + iMax2);
                boolean z13 = i13 > i12;
                int i18 = z13 ? i13 : i12;
                boolean z14 = z13;
                int i19 = z13 ? i12 : i13;
                float f13 = i19 / i18;
                aVar = aVar2;
                int i21 = 0;
                while (i21 < 9) {
                    int i22 = f95783n1[i21];
                    int i23 = i21;
                    int i24 = (int) (i22 * f13);
                    if (i22 <= i18 || i24 <= i19) {
                        break;
                    }
                    int i25 = i19;
                    int i26 = i18;
                    if (v.f94376a >= 21) {
                        int i27 = z14 ? i24 : i22;
                        if (!z14) {
                            i22 = i24;
                        }
                        MediaCodecInfo.CodecCapabilities codecCapabilities = lVar.f94253d;
                        if (codecCapabilities == null || (videoCapabilities = codecCapabilities.getVideoCapabilities()) == null) {
                            point2 = null;
                        } else {
                            int widthAlignment = videoCapabilities.getWidthAlignment();
                            int heightAlignment = videoCapabilities.getHeightAlignment();
                            point2 = new Point(v.f(i27, widthAlignment) * widthAlignment, v.f(i22, heightAlignment) * heightAlignment);
                        }
                        i5 = i13;
                        if (lVar.e(f12, point2.x, point2.y)) {
                            point = point2;
                            break;
                        }
                        i21 = i23 + 1;
                        i13 = i5;
                        i19 = i25;
                        i18 = i26;
                    } else {
                        i5 = i13;
                        try {
                            int iF = v.f(i22, 16) * 16;
                            int iF2 = v.f(i24, 16) * 16;
                            if (iF * iF2 <= s.i()) {
                                int i28 = z14 ? iF2 : iF;
                                if (!z14) {
                                    iF = iF2;
                                }
                                point2 = new Point(i28, iF);
                                point = point2;
                                break;
                            }
                            i21 = i23 + 1;
                            i13 = i5;
                            i19 = i25;
                            i18 = i26;
                        } catch (MediaCodecUtil$DecoderQueryException unused) {
                        }
                    }
                }
                i5 = i13;
                point = null;
                if (point != null) {
                    iMax = Math.max(iMax, point.x);
                    iMax2 = Math.max(iMax2, point.y);
                    j0 j0VarA2 = k0Var.a();
                    j0VarA2.f54859p = iMax;
                    j0VarA2.f54860q = iMax2;
                    iU0 = Math.max(iU0, s0(lVar, new k0(j0VarA2)));
                    wf.a.D("MediaCodecVideoRenderer", "Codec max resolution adjusted to: " + iMax + "x" + iMax2);
                }
            } else {
                i5 = i13;
                aVar = aVar2;
            }
            wgVar = new wg(iMax, iMax2, iU0);
        }
        this.K0 = wgVar;
        int i29 = this.f95792j1 ? this.f95793k1 : 0;
        MediaFormat mediaFormat = new MediaFormat();
        mediaFormat.setString("mime", str);
        mediaFormat.setInteger("width", i12);
        mediaFormat.setInteger("height", i5);
        wf.a.B(mediaFormat, k0Var.n);
        if (f12 != -1.0f) {
            mediaFormat.setFloat("frame-rate", f12);
        }
        wf.a.y(mediaFormat, "rotation-degrees", k0Var.f54889t);
        if (aVar != null) {
            a aVar3 = aVar;
            wf.a.y(mediaFormat, "color-transfer", aVar3.f95763c);
            wf.a.y(mediaFormat, "color-standard", aVar3.f95761a);
            wf.a.y(mediaFormat, "color-range", aVar3.f95762b);
            byte[] bArr = aVar3.f95764d;
            if (bArr != null) {
                mediaFormat.setByteBuffer("hdr-static-info", ByteBuffer.wrap(bArr));
            }
        }
        if ("video/dolby-vision".equals(k0Var.f54883l) && (pairD = s.d(k0Var)) != null) {
            wf.a.y(mediaFormat, "profile", ((Integer) pairD.first).intValue());
        }
        mediaFormat.setInteger("max-width", wgVar.f33198a);
        mediaFormat.setInteger("max-height", wgVar.f33199b);
        wf.a.y(mediaFormat, "max-input-size", wgVar.f33200c);
        if (v.f94376a >= 23) {
            mediaFormat.setInteger("priority", 0);
            if (f11 != -1.0f) {
                mediaFormat.setFloat("operating-rate", f11);
            }
        }
        if (this.J0) {
            z11 = true;
            mediaFormat.setInteger("no-post-process", 1);
            mediaFormat.setInteger("auto-frc", 0);
        } else {
            z11 = true;
        }
        if (i29 != 0) {
            mediaFormat.setFeatureEnabled("tunneled-playback", z11);
            mediaFormat.setInteger("audio-session-id", i29);
        }
        if (this.N0 == null) {
            if (!A0(lVar)) {
                throw new IllegalStateException();
            }
            if (this.O0 == null) {
                this.O0 = PlaceholderSurface.d(this.E0, lVar.f94255f);
            }
            this.N0 = this.O0;
        }
        return new we.h(lVar, mediaFormat, k0Var, this.N0, mediaCrypto);
    }

    @Override // we.n
    public final void O(ie.f fVar) {
        if (this.M0) {
            ByteBuffer byteBuffer = fVar.f61583g;
            byteBuffer.getClass();
            if (byteBuffer.remaining() >= 7) {
                byte b11 = byteBuffer.get();
                short s11 = byteBuffer.getShort();
                short s12 = byteBuffer.getShort();
                byte b12 = byteBuffer.get();
                byte b13 = byteBuffer.get();
                byteBuffer.position(0);
                if (b11 == -75 && s11 == 60 && s12 == 1 && b12 == 4) {
                    if (b13 == 0 || b13 == 1) {
                        byte[] bArr = new byte[byteBuffer.remaining()];
                        byteBuffer.get(bArr);
                        byteBuffer.position(0);
                        we.j jVar = this.I;
                        Bundle bundle = new Bundle();
                        bundle.putByteArray("hdr10-plus-info", bArr);
                        jVar.g(bundle);
                    }
                }
            }
        }
    }

    @Override // we.n
    public final void S(Exception exc) {
        wf.a.p("MediaCodecVideoRenderer", "Video codec error", exc);
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new o(kVar, exc, 2));
        }
    }

    @Override // we.n
    public final void T(long j11, long j12, String str) {
        String str2;
        MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArr;
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            str2 = str;
            handler.post(new o(kVar, str2, j11, j12));
        } else {
            str2 = str;
        }
        this.L0 = r0(str2);
        we.l lVar = this.P;
        lVar.getClass();
        boolean z11 = false;
        if (v.f94376a >= 29 && "video/x-vnd.on2.vp9".equals(lVar.f94251b)) {
            MediaCodecInfo.CodecCapabilities codecCapabilities = lVar.f94253d;
            if (codecCapabilities == null || (codecProfileLevelArr = codecCapabilities.profileLevels) == null) {
                codecProfileLevelArr = new MediaCodecInfo.CodecProfileLevel[0];
            }
            int length = codecProfileLevelArr.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    break;
                }
                if (codecProfileLevelArr[i5].profile == 16384) {
                    z11 = true;
                    break;
                }
                i5++;
            }
        }
        this.M0 = z11;
        if (v.f94376a < 23 || !this.f95792j1) {
            return;
        }
        we.j jVar = this.I;
        jVar.getClass();
        this.f95794l1 = new ea.a(this, jVar);
    }

    @Override // we.n
    public final void U(String str) {
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new o(kVar, str, 1));
        }
    }

    @Override // we.n
    public final ie.g V(e3 e3Var) throws Exception {
        ie.g gVarV = super.V(e3Var);
        k0 k0Var = (k0) e3Var.f67209c;
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new o(kVar, k0Var, gVarV));
        }
        return gVarV;
    }

    @Override // we.n
    public final void W(k0 k0Var, MediaFormat mediaFormat) {
        we.j jVar = this.I;
        if (jVar != null) {
            jVar.c(this.Q0);
        }
        if (this.f95792j1) {
            this.f95790e1 = k0Var.f54886q;
            this.f95791f1 = k0Var.f54887r;
        } else {
            mediaFormat.getClass();
            boolean z11 = mediaFormat.containsKey("crop-right") && mediaFormat.containsKey("crop-left") && mediaFormat.containsKey("crop-bottom") && mediaFormat.containsKey("crop-top");
            this.f95790e1 = z11 ? (mediaFormat.getInteger("crop-right") - mediaFormat.getInteger("crop-left")) + 1 : mediaFormat.getInteger("width");
            this.f95791f1 = z11 ? (mediaFormat.getInteger("crop-bottom") - mediaFormat.getInteger("crop-top")) + 1 : mediaFormat.getInteger("height");
        }
        float f11 = k0Var.f54890u;
        int i5 = k0Var.f54889t;
        this.h1 = f11;
        if (v.f94376a < 21) {
            this.g1 = i5;
        } else if (i5 == 90 || i5 == 270) {
            int i11 = this.f95790e1;
            this.f95790e1 = this.f95791f1;
            this.f95791f1 = i11;
            this.h1 = 1.0f / f11;
        }
        float f12 = k0Var.f54888s;
        n nVar = this.F0;
        nVar.f95813f = f12;
        c cVar = nVar.f95808a;
        cVar.f95774a.c();
        cVar.f95775b.c();
        cVar.f95776c = false;
        cVar.f95777d = -9223372036854775807L;
        cVar.f95778e = 0;
        nVar.b();
    }

    @Override // we.n
    public final void Y(long j11) {
        super.Y(j11);
        if (this.f95792j1) {
            return;
        }
        this.Z0--;
    }

    @Override // we.n
    public final void Z() {
        q0();
    }

    @Override // we.n
    public final void a0(ie.f fVar) {
        boolean z11 = this.f95792j1;
        if (!z11) {
            this.Z0++;
        }
        if (v.f94376a >= 23 || !z11) {
            return;
        }
        long j11 = fVar.f61582f;
        p0(j11);
        x0();
        this.f94295z0.f61571e++;
        w0();
        Y(j11);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v11, types: [android.view.Surface] */
    @Override // fe.c, fe.n1
    public final void b(int i5, Object obj) throws Exception {
        Handler handler;
        Handler handler2;
        int iIntValue;
        n nVar = this.F0;
        if (i5 != 1) {
            if (i5 == 7) {
                this.f95795m1 = (i) obj;
                return;
            }
            if (i5 == 10) {
                int iIntValue2 = ((Integer) obj).intValue();
                if (this.f95793k1 != iIntValue2) {
                    this.f95793k1 = iIntValue2;
                    if (this.f95792j1) {
                        e0();
                        return;
                    }
                    return;
                }
                return;
            }
            if (i5 != 4) {
                if (i5 == 5 && nVar.f95817j != (iIntValue = ((Integer) obj).intValue())) {
                    nVar.f95817j = iIntValue;
                    nVar.c(true);
                    return;
                }
                return;
            }
            int iIntValue3 = ((Integer) obj).intValue();
            this.Q0 = iIntValue3;
            we.j jVar = this.I;
            if (jVar != null) {
                jVar.c(iIntValue3);
                return;
            }
            return;
        }
        PlaceholderSurface placeholderSurfaceD = obj instanceof Surface ? (Surface) obj : null;
        if (placeholderSurfaceD == null) {
            PlaceholderSurface placeholderSurface = this.O0;
            if (placeholderSurface != null) {
                placeholderSurfaceD = placeholderSurface;
            } else {
                we.l lVar = this.P;
                if (lVar != null && A0(lVar)) {
                    placeholderSurfaceD = PlaceholderSurface.d(this.E0, lVar.f94255f);
                    this.O0 = placeholderSurfaceD;
                }
            }
        }
        Surface surface = this.N0;
        he.k kVar = this.G0;
        if (surface == placeholderSurfaceD) {
            if (placeholderSurfaceD == null || placeholderSurfaceD == this.O0) {
                return;
            }
            p pVar = this.i1;
            if (pVar != null && (handler = kVar.f59744a) != null) {
                handler.post(new s90.s0(9, kVar, pVar));
            }
            if (this.P0) {
                Surface surface2 = this.N0;
                Handler handler3 = kVar.f59744a;
                if (handler3 != null) {
                    handler3.post(new com.google.firebase.crashlytics.internal.common.j(kVar, surface2, SystemClock.elapsedRealtime()));
                    return;
                }
                return;
            }
            return;
        }
        this.N0 = placeholderSurfaceD;
        nVar.getClass();
        PlaceholderSurface placeholderSurface2 = placeholderSurfaceD instanceof PlaceholderSurface ? null : placeholderSurfaceD;
        if (nVar.f95812e != placeholderSurface2) {
            nVar.a();
            nVar.f95812e = placeholderSurface2;
            nVar.c(true);
        }
        this.P0 = false;
        int i11 = this.f54725f;
        we.j jVar2 = this.I;
        if (jVar2 != null) {
            if (v.f94376a < 23 || placeholderSurfaceD == null || this.L0) {
                e0();
                Q();
            } else {
                jVar2.e(placeholderSurfaceD);
            }
        }
        if (placeholderSurfaceD == null || placeholderSurfaceD == this.O0) {
            this.i1 = null;
            q0();
            return;
        }
        p pVar2 = this.i1;
        if (pVar2 != null && (handler2 = kVar.f59744a) != null) {
            handler2.post(new s90.s0(9, kVar, pVar2));
        }
        q0();
        if (i11 == 2) {
            long j11 = this.H0;
            this.V0 = j11 > 0 ? SystemClock.elapsedRealtime() + j11 : -9223372036854775807L;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x007d  */
    @Override // we.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean c0(long j11, long j12, we.j jVar, ByteBuffer byteBuffer, int i5, int i11, int i12, long j13, boolean z11, boolean z12, k0 k0Var) throws Exception {
        long j14;
        long j15;
        long j16;
        long j17;
        boolean z13;
        boolean z14;
        long j18;
        boolean z15;
        boolean z16;
        long j19;
        long j21;
        long j22;
        jVar.getClass();
        if (this.U0 == -9223372036854775807L) {
            this.U0 = j11;
        }
        if (j13 != this.f95786a1) {
            n nVar = this.F0;
            j16 = -1;
            long j23 = nVar.n;
            if (j23 != -1) {
                nVar.f95821p = j23;
                nVar.f95822q = nVar.o;
            }
            nVar.f95820m++;
            c cVar = nVar.f95808a;
            long j24 = j13 * 1000;
            j14 = 1000;
            cVar.f95774a.b(j24);
            if (cVar.f95774a.a()) {
                cVar.f95776c = false;
                j15 = 0;
            } else {
                j15 = 0;
                if (cVar.f95777d != -9223372036854775807L) {
                    if (cVar.f95776c) {
                        b bVar = cVar.f95775b;
                        long j25 = bVar.f95769d;
                        if (j25 == 0 ? false : bVar.f95772g[(int) ((j25 - 1) % 15)]) {
                            cVar.f95775b.c();
                            j22 = j24;
                            cVar.f95775b.b(cVar.f95777d);
                        } else {
                            j22 = j24;
                        }
                        cVar.f95776c = true;
                        j24 = j22;
                        cVar.f95775b.b(j24);
                    }
                }
            }
            if (cVar.f95776c && cVar.f95775b.a()) {
                b bVar2 = cVar.f95774a;
                cVar.f95774a = cVar.f95775b;
                cVar.f95775b = bVar2;
                cVar.f95776c = false;
            }
            cVar.f95777d = j24;
            cVar.f95778e = cVar.f95774a.a() ? 0 : cVar.f95778e + 1;
            nVar.b();
            this.f95786a1 = j13;
        } else {
            j14 = 1000;
            j15 = 0;
            j16 = -1;
        }
        long j26 = this.B0;
        long j27 = j13 - j26;
        if (z11 && !z12) {
            B0(jVar, i5);
            return true;
        }
        double d5 = this.G;
        boolean z17 = this.f54725f == 2;
        long jElapsedRealtime = SystemClock.elapsedRealtime() * j14;
        long j28 = (long) ((j13 - j11) / d5);
        if (z17) {
            j28 -= jElapsedRealtime - j12;
        }
        if (this.N0 == this.O0) {
            if (!(j28 < -30000)) {
                return false;
            }
            B0(jVar, i5);
            D0(j28);
            return true;
        }
        long j29 = jElapsedRealtime - this.f95787b1;
        if (this.T0 ? this.R0 : !(z17 || this.S0)) {
            j17 = j29;
            z13 = false;
        } else {
            j17 = j29;
            z13 = true;
        }
        if (this.V0 != -9223372036854775807L || j11 < j26) {
            z14 = false;
        } else {
            if (!z13) {
                if (z17) {
                    if (((j28 > (-30000L) ? 1 : (j28 == (-30000L) ? 0 : -1)) < 0) && j17 > 100000) {
                    }
                }
                z14 = false;
            }
            z14 = true;
        }
        if (z14) {
            long jNanoTime = System.nanoTime();
            i iVar = this.f95795m1;
            if (iVar != null) {
                iVar.a(j27, jNanoTime, k0Var, this.K);
            }
            if (v.f94376a >= 21) {
                z0(jVar, i5, jNanoTime);
            } else {
                y0(jVar, i5);
            }
            D0(j28);
            return true;
        }
        if (!z17 || j11 == this.U0) {
            return false;
        }
        long jNanoTime2 = System.nanoTime();
        long j31 = (j28 * j14) + jNanoTime2;
        n nVar2 = this.F0;
        if (nVar2.f95821p == j16 || !nVar2.f95808a.f95774a.a()) {
            j18 = jNanoTime2;
        } else {
            c cVar2 = nVar2.f95808a;
            if (cVar2.f95774a.a()) {
                b bVar3 = cVar2.f95774a;
                long j32 = bVar3.f95770e;
                j21 = j32 == j15 ? j15 : bVar3.f95771f / j32;
            } else {
                j21 = -9223372036854775807L;
            }
            j18 = jNanoTime2;
            long j33 = nVar2.f95822q + ((long) (((nVar2.f95820m - nVar2.f95821p) * j21) / nVar2.f95816i));
            if (Math.abs(j31 - j33) <= 20000000) {
                j31 = j33;
            } else {
                nVar2.f95820m = j15;
                long j34 = j16;
                nVar2.f95821p = j34;
                nVar2.n = j34;
            }
        }
        nVar2.n = nVar2.f95820m;
        nVar2.o = j31;
        m mVar = nVar2.f95810c;
        if (mVar != null && nVar2.f95818k != -9223372036854775807L) {
            long j35 = mVar.f95804a;
            if (j35 != -9223372036854775807L) {
                long j36 = nVar2.f95818k;
                long j37 = (((j31 - j35) / j36) * j36) + j35;
                if (j31 <= j37) {
                    j19 = j37 - j36;
                } else {
                    j19 = j37;
                    j37 = j36 + j37;
                }
                if (j37 - j31 >= j31 - j19) {
                    j37 = j19;
                }
                j31 = j37 - nVar2.f95819l;
            }
        }
        long j38 = j31;
        long j39 = (j38 - j18) / j14;
        boolean z18 = this.V0 != -9223372036854775807L;
        if (j39 < -500000 && !z12) {
            t0 t0Var = this.f54726g;
            t0Var.getClass();
            int iF = t0Var.f(j11 - this.f54728i);
            if (iF == 0) {
                z16 = false;
            } else {
                if (z18) {
                    ie.e eVar = this.f94295z0;
                    eVar.f61570d += iF;
                    eVar.f61572f += this.Z0;
                } else {
                    this.f94295z0.f61576j++;
                    C0(iF, this.Z0);
                }
                if (H()) {
                    Q();
                }
                z16 = true;
            }
            if (z16) {
                return false;
            }
        }
        if (((j39 > (-30000L) ? 1 : (j39 == (-30000L) ? 0 : -1)) < 0) && !z12) {
            if (z18) {
                B0(jVar, i5);
                z15 = true;
            } else {
                wf.a.b("dropVideoBuffer");
                jVar.l(i5, false);
                wf.a.q();
                z15 = true;
                C0(0, 1);
            }
            D0(j39);
            return z15;
        }
        if (v.f94376a >= 21) {
            if (j39 >= 50000) {
                return false;
            }
            i iVar2 = this.f95795m1;
            if (iVar2 != null) {
                iVar2.a(j27, j38, k0Var, this.K);
            }
            z0(jVar, i5, j38);
            D0(j39);
            return true;
        }
        if (j39 >= 30000) {
            return false;
        }
        if (j39 > 11000) {
            try {
                Thread.sleep((j39 - com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) / j14);
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
                return false;
            }
        }
        i iVar3 = this.f95795m1;
        if (iVar3 != null) {
            iVar3.a(j27, j38, k0Var, this.K);
        }
        y0(jVar, i5);
        D0(j39);
        return true;
    }

    @Override // we.n
    public final void g0() {
        super.g0();
        this.Z0 = 0;
    }

    @Override // fe.c
    public final String h() {
        return "MediaCodecVideoRenderer";
    }

    @Override // we.n, fe.c
    public final boolean k() {
        PlaceholderSurface placeholderSurface;
        if (super.k() && (this.R0 || (((placeholderSurface = this.O0) != null && this.N0 == placeholderSurface) || this.I == null || this.f95792j1))) {
            this.V0 = -9223372036854775807L;
            return true;
        }
        if (this.V0 == -9223372036854775807L) {
            return false;
        }
        if (SystemClock.elapsedRealtime() < this.V0) {
            return true;
        }
        this.V0 = -9223372036854775807L;
        return false;
    }

    @Override // we.n
    public final boolean k0(we.l lVar) {
        return this.N0 != null || A0(lVar);
    }

    @Override // we.n, fe.c
    public final void l() {
        he.k kVar = this.G0;
        this.i1 = null;
        q0();
        this.P0 = false;
        this.f95794l1 = null;
        try {
            super.l();
            ie.e eVar = this.f94295z0;
            kVar.getClass();
            synchronized (eVar) {
            }
            Handler handler = kVar.f59744a;
            if (handler != null) {
                handler.post(new s90.s0(10, kVar, eVar));
            }
        } catch (Throwable th2) {
            ie.e eVar2 = this.f94295z0;
            kVar.getClass();
            synchronized (eVar2) {
                Handler handler2 = kVar.f59744a;
                if (handler2 != null) {
                    handler2.post(new s90.s0(10, kVar, eVar2));
                }
                throw th2;
            }
        }
    }

    @Override // fe.c
    public final void m(boolean z11, boolean z12) {
        this.f94295z0 = new ie.e();
        r1 r1Var = this.f54722c;
        r1Var.getClass();
        boolean z13 = r1Var.f54977a;
        wf.a.i((z13 && this.f95793k1 == 0) ? false : true);
        if (this.f95792j1 != z13) {
            this.f95792j1 = z13;
            e0();
        }
        ie.e eVar = this.f94295z0;
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new o(kVar, eVar, 4));
        }
        this.S0 = z12;
        this.T0 = false;
    }

    @Override // we.n
    public final int m0(we.o oVar, k0 k0Var) {
        boolean z11;
        int i5 = 0;
        if (!wf.j.i(k0Var.f54883l)) {
            return fe.c.e(0, 0, 0);
        }
        boolean z12 = k0Var.o != null;
        Context context = this.E0;
        v0 v0VarT0 = t0(context, oVar, k0Var, z12, false);
        if (z12 && v0VarT0.isEmpty()) {
            v0VarT0 = t0(context, oVar, k0Var, false, false);
        }
        if (v0VarT0.isEmpty()) {
            return fe.c.e(1, 0, 0);
        }
        int i11 = k0Var.E;
        if (i11 != 0 && i11 != 2) {
            return fe.c.e(2, 0, 0);
        }
        we.l lVar = (we.l) v0VarT0.get(0);
        boolean zC = lVar.c(k0Var);
        if (zC) {
            z11 = true;
        } else {
            for (int i12 = 1; i12 < v0VarT0.size(); i12++) {
                we.l lVar2 = (we.l) v0VarT0.get(i12);
                if (lVar2.c(k0Var)) {
                    z11 = false;
                    zC = true;
                    lVar = lVar2;
                    break;
                }
            }
            z11 = true;
        }
        int i13 = zC ? 4 : 3;
        int i14 = lVar.d(k0Var) ? 16 : 8;
        int i15 = lVar.f94256g ? 64 : 0;
        int i16 = z11 ? 128 : 0;
        if (v.f94376a >= 26 && "video/dolby-vision".equals(k0Var.f54883l) && !e.a(context)) {
            i16 = 256;
        }
        if (zC) {
            v0 v0VarT02 = t0(context, oVar, k0Var, z12, true);
            if (!v0VarT02.isEmpty()) {
                Pattern pattern = s.f94301a;
                ArrayList arrayList = new ArrayList(v0VarT02);
                Collections.sort(arrayList, new ay.g(new k30.e(k0Var, 29), 10));
                we.l lVar3 = (we.l) arrayList.get(0);
                if (lVar3.c(k0Var) && lVar3.d(k0Var)) {
                    i5 = 32;
                }
            }
        }
        return i13 | i14 | i5 | i15 | i16;
    }

    @Override // we.n, fe.c
    public final void n(long j11, boolean z11) throws Exception {
        super.n(j11, z11);
        q0();
        n nVar = this.F0;
        nVar.f95820m = 0L;
        nVar.f95821p = -1L;
        nVar.n = -1L;
        this.f95786a1 = -9223372036854775807L;
        this.U0 = -9223372036854775807L;
        this.Y0 = 0;
        if (!z11) {
            this.V0 = -9223372036854775807L;
        } else {
            long j12 = this.H0;
            this.V0 = j12 > 0 ? SystemClock.elapsedRealtime() + j12 : -9223372036854775807L;
        }
    }

    @Override // fe.c
    public final void o() {
        try {
            try {
                C();
                e0();
                je.f fVar = this.C;
                if (fVar != null) {
                    fVar.t(null);
                }
                this.C = null;
            } catch (Throwable th2) {
                je.f fVar2 = this.C;
                if (fVar2 != null) {
                    fVar2.t(null);
                }
                this.C = null;
                throw th2;
            }
        } finally {
            PlaceholderSurface placeholderSurface = this.O0;
            if (placeholderSurface != null) {
                if (this.N0 == placeholderSurface) {
                    this.N0 = null;
                }
                placeholderSurface.release();
                this.O0 = null;
            }
        }
    }

    @Override // fe.c
    public final void p() {
        this.X0 = 0;
        this.W0 = SystemClock.elapsedRealtime();
        this.f95787b1 = SystemClock.elapsedRealtime() * 1000;
        this.f95788c1 = 0L;
        this.f95789d1 = 0;
        n nVar = this.F0;
        nVar.f95811d = true;
        nVar.f95820m = 0L;
        nVar.f95821p = -1L;
        nVar.n = -1L;
        k kVar = nVar.f95809b;
        if (kVar != null) {
            m mVar = nVar.f95810c;
            mVar.getClass();
            mVar.f95805b.sendEmptyMessage(1);
            kVar.c(new wm.b(nVar, 4));
        }
        nVar.c(false);
    }

    @Override // fe.c
    public final void q() {
        this.V0 = -9223372036854775807L;
        v0();
        int i5 = this.f95789d1;
        if (i5 != 0) {
            long j11 = this.f95788c1;
            he.k kVar = this.G0;
            Handler handler = kVar.f59744a;
            if (handler != null) {
                handler.post(new o(kVar, j11, i5));
            }
            this.f95788c1 = 0L;
            this.f95789d1 = 0;
        }
        n nVar = this.F0;
        nVar.f95811d = false;
        k kVar2 = nVar.f95809b;
        if (kVar2 != null) {
            kVar2.a();
            m mVar = nVar.f95810c;
            mVar.getClass();
            mVar.f95805b.sendEmptyMessage(2);
        }
        nVar.a();
    }

    public final void q0() {
        we.j jVar;
        this.R0 = false;
        if (v.f94376a < 23 || !this.f95792j1 || (jVar = this.I) == null) {
            return;
        }
        this.f95794l1 = new ea.a(this, jVar);
    }

    public final void v0() {
        if (this.X0 > 0) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long j11 = jElapsedRealtime - this.W0;
            int i5 = this.X0;
            he.k kVar = this.G0;
            Handler handler = kVar.f59744a;
            if (handler != null) {
                handler.post(new o(kVar, i5, j11));
            }
            this.X0 = 0;
            this.W0 = jElapsedRealtime;
        }
    }

    @Override // we.n, fe.c
    public final void w(float f11, float f12) throws Exception {
        super.w(f11, f12);
        n nVar = this.F0;
        nVar.f95816i = f11;
        nVar.f95820m = 0L;
        nVar.f95821p = -1L;
        nVar.n = -1L;
        nVar.c(false);
    }

    public final void w0() {
        this.T0 = true;
        if (this.R0) {
            return;
        }
        this.R0 = true;
        Surface surface = this.N0;
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new com.google.firebase.crashlytics.internal.common.j(kVar, surface, SystemClock.elapsedRealtime()));
        }
        this.P0 = true;
    }

    public final void x0() {
        int i5 = this.f95790e1;
        if (i5 == -1 && this.f95791f1 == -1) {
            return;
        }
        p pVar = this.i1;
        if (pVar != null && pVar.f95826a == i5 && pVar.f95827b == this.f95791f1 && pVar.f95828c == this.g1 && pVar.f95829d == this.h1) {
            return;
        }
        p pVar2 = new p(i5, this.h1, this.f95791f1, this.g1);
        this.i1 = pVar2;
        he.k kVar = this.G0;
        Handler handler = kVar.f59744a;
        if (handler != null) {
            handler.post(new s90.s0(9, kVar, pVar2));
        }
    }

    public final void y0(we.j jVar, int i5) {
        x0();
        wf.a.b("releaseOutputBuffer");
        jVar.l(i5, true);
        wf.a.q();
        this.f95787b1 = SystemClock.elapsedRealtime() * 1000;
        this.f94295z0.f61571e++;
        this.Y0 = 0;
        w0();
    }

    public final void z0(we.j jVar, int i5, long j11) {
        x0();
        wf.a.b("releaseOutputBuffer");
        jVar.h(i5, j11);
        wf.a.q();
        this.f95787b1 = SystemClock.elapsedRealtime() * 1000;
        this.f94295z0.f61571e++;
        this.Y0 = 0;
        w0();
    }
}
