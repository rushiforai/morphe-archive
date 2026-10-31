package vf;

import ads_mobile_sdk.pd;
import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.view.Surface;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdError;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import o9.d4;
import xk.r2;

/* loaded from: classes3.dex */
public final class o implements we.j {

    /* renamed from: a, reason: collision with root package name */
    public boolean f92705a;

    /* renamed from: b, reason: collision with root package name */
    public int f92706b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f92707c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f92708d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f92709e;

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:13:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public o(Context context) {
        String strT;
        int[] iArr;
        TelephonyManager telephonyManager;
        this.f92707c = context == null ? null : context.getApplicationContext();
        int i5 = wf.v.f94376a;
        if (context == null || (telephonyManager = (TelephonyManager) context.getSystemService("phone")) == null) {
            strT = vk.b0.t(Locale.getDefault().getCountry());
        } else {
            String networkCountryIso = telephonyManager.getNetworkCountryIso();
            if (!TextUtils.isEmpty(networkCountryIso)) {
                strT = vk.b0.t(networkCountryIso);
            }
        }
        r2 r2Var = p.n;
        strT.getClass();
        char c11 = 65535;
        switch (strT.hashCode()) {
            case 2083:
                if (strT.equals("AD")) {
                    c11 = 0;
                    break;
                }
                break;
            case 2084:
                if (strT.equals("AE")) {
                    c11 = 1;
                    break;
                }
                break;
            case 2085:
                if (strT.equals("AF")) {
                    c11 = 2;
                    break;
                }
                break;
            case 2086:
                if (strT.equals("AG")) {
                    c11 = 3;
                    break;
                }
                break;
            case 2088:
                if (strT.equals("AI")) {
                    c11 = 4;
                    break;
                }
                break;
            case 2091:
                if (strT.equals("AL")) {
                    c11 = 5;
                    break;
                }
                break;
            case 2092:
                if (strT.equals("AM")) {
                    c11 = 6;
                    break;
                }
                break;
            case 2094:
                if (strT.equals("AO")) {
                    c11 = 7;
                    break;
                }
                break;
            case 2096:
                if (strT.equals("AQ")) {
                    c11 = '\b';
                    break;
                }
                break;
            case 2097:
                if (strT.equals("AR")) {
                    c11 = '\t';
                    break;
                }
                break;
            case 2098:
                if (strT.equals("AS")) {
                    c11 = '\n';
                    break;
                }
                break;
            case 2099:
                if (strT.equals("AT")) {
                    c11 = 11;
                    break;
                }
                break;
            case AdError.BROKEN_MEDIA_ERROR_CODE /* 2100 */:
                if (strT.equals("AU")) {
                    c11 = '\f';
                    break;
                }
                break;
            case 2102:
                if (strT.equals("AW")) {
                    c11 = '\r';
                    break;
                }
                break;
            case 2103:
                if (strT.equals("AX")) {
                    c11 = 14;
                    break;
                }
                break;
            case 2105:
                if (strT.equals("AZ")) {
                    c11 = 15;
                    break;
                }
                break;
            case 2111:
                if (strT.equals("BA")) {
                    c11 = 16;
                    break;
                }
                break;
            case 2112:
                if (strT.equals("BB")) {
                    c11 = 17;
                    break;
                }
                break;
            case 2114:
                if (strT.equals("BD")) {
                    c11 = 18;
                    break;
                }
                break;
            case 2115:
                if (strT.equals("BE")) {
                    c11 = 19;
                    break;
                }
                break;
            case 2116:
                if (strT.equals("BF")) {
                    c11 = 20;
                    break;
                }
                break;
            case 2117:
                if (strT.equals("BG")) {
                    c11 = 21;
                    break;
                }
                break;
            case 2118:
                if (strT.equals("BH")) {
                    c11 = 22;
                    break;
                }
                break;
            case 2119:
                if (strT.equals("BI")) {
                    c11 = 23;
                    break;
                }
                break;
            case 2120:
                if (strT.equals("BJ")) {
                    c11 = 24;
                    break;
                }
                break;
            case 2122:
                if (strT.equals("BL")) {
                    c11 = 25;
                    break;
                }
                break;
            case 2123:
                if (strT.equals("BM")) {
                    c11 = 26;
                    break;
                }
                break;
            case 2124:
                if (strT.equals("BN")) {
                    c11 = 27;
                    break;
                }
                break;
            case 2125:
                if (strT.equals("BO")) {
                    c11 = 28;
                    break;
                }
                break;
            case 2127:
                if (strT.equals("BQ")) {
                    c11 = 29;
                    break;
                }
                break;
            case 2129:
                if (strT.equals("BS")) {
                    c11 = 30;
                    break;
                }
                break;
            case 2130:
                if (strT.equals("BT")) {
                    c11 = 31;
                    break;
                }
                break;
            case 2133:
                if (strT.equals("BW")) {
                    c11 = ' ';
                    break;
                }
                break;
            case 2135:
                if (strT.equals("BY")) {
                    c11 = '!';
                    break;
                }
                break;
            case 2136:
                if (strT.equals("BZ")) {
                    c11 = AbstractJsonLexerKt.STRING;
                    break;
                }
                break;
            case 2142:
                if (strT.equals("CA")) {
                    c11 = '#';
                    break;
                }
                break;
            case 2145:
                if (strT.equals("CD")) {
                    c11 = '$';
                    break;
                }
                break;
            case 2147:
                if (strT.equals("CF")) {
                    c11 = '%';
                    break;
                }
                break;
            case 2148:
                if (strT.equals("CG")) {
                    c11 = '&';
                    break;
                }
                break;
            case 2149:
                if (strT.equals("CH")) {
                    c11 = '\'';
                    break;
                }
                break;
            case 2150:
                if (strT.equals("CI")) {
                    c11 = '(';
                    break;
                }
                break;
            case 2152:
                if (strT.equals("CK")) {
                    c11 = ')';
                    break;
                }
                break;
            case 2153:
                if (strT.equals("CL")) {
                    c11 = '*';
                    break;
                }
                break;
            case 2154:
                if (strT.equals("CM")) {
                    c11 = '+';
                    break;
                }
                break;
            case 2155:
                if (strT.equals("CN")) {
                    c11 = AbstractJsonLexerKt.COMMA;
                    break;
                }
                break;
            case 2156:
                if (strT.equals("CO")) {
                    c11 = '-';
                    break;
                }
                break;
            case 2159:
                if (strT.equals("CR")) {
                    c11 = '.';
                    break;
                }
                break;
            case 2162:
                if (strT.equals("CU")) {
                    c11 = '/';
                    break;
                }
                break;
            case 2163:
                if (strT.equals("CV")) {
                    c11 = '0';
                    break;
                }
                break;
            case 2164:
                if (strT.equals("CW")) {
                    c11 = '1';
                    break;
                }
                break;
            case 2165:
                if (strT.equals("CX")) {
                    c11 = '2';
                    break;
                }
                break;
            case 2166:
                if (strT.equals("CY")) {
                    c11 = '3';
                    break;
                }
                break;
            case 2167:
                if (strT.equals("CZ")) {
                    c11 = '4';
                    break;
                }
                break;
            case 2177:
                if (strT.equals("DE")) {
                    c11 = '5';
                    break;
                }
                break;
            case 2182:
                if (strT.equals("DJ")) {
                    c11 = '6';
                    break;
                }
                break;
            case 2183:
                if (strT.equals("DK")) {
                    c11 = '7';
                    break;
                }
                break;
            case 2185:
                if (strT.equals("DM")) {
                    c11 = '8';
                    break;
                }
                break;
            case 2187:
                if (strT.equals("DO")) {
                    c11 = '9';
                    break;
                }
                break;
            case 2198:
                if (strT.equals("DZ")) {
                    c11 = AbstractJsonLexerKt.COLON;
                    break;
                }
                break;
            case 2206:
                if (strT.equals("EC")) {
                    c11 = ';';
                    break;
                }
                break;
            case 2208:
                if (strT.equals("EE")) {
                    c11 = '<';
                    break;
                }
                break;
            case 2210:
                if (strT.equals("EG")) {
                    c11 = '=';
                    break;
                }
                break;
            case 2221:
                if (strT.equals("ER")) {
                    c11 = '>';
                    break;
                }
                break;
            case 2222:
                if (strT.equals("ES")) {
                    c11 = '?';
                    break;
                }
                break;
            case 2223:
                if (strT.equals("ET")) {
                    c11 = '@';
                    break;
                }
                break;
            case 2243:
                if (strT.equals("FI")) {
                    c11 = 'A';
                    break;
                }
                break;
            case 2244:
                if (strT.equals("FJ")) {
                    c11 = 'B';
                    break;
                }
                break;
            case 2245:
                if (strT.equals("FK")) {
                    c11 = 'C';
                    break;
                }
                break;
            case 2247:
                if (strT.equals("FM")) {
                    c11 = 'D';
                    break;
                }
                break;
            case 2249:
                if (strT.equals("FO")) {
                    c11 = 'E';
                    break;
                }
                break;
            case 2252:
                if (strT.equals("FR")) {
                    c11 = 'F';
                    break;
                }
                break;
            case 2266:
                if (strT.equals("GA")) {
                    c11 = 'G';
                    break;
                }
                break;
            case 2267:
                if (strT.equals("GB")) {
                    c11 = 'H';
                    break;
                }
                break;
            case 2269:
                if (strT.equals("GD")) {
                    c11 = 'I';
                    break;
                }
                break;
            case 2270:
                if (strT.equals("GE")) {
                    c11 = 'J';
                    break;
                }
                break;
            case 2271:
                if (strT.equals("GF")) {
                    c11 = 'K';
                    break;
                }
                break;
            case 2272:
                if (strT.equals("GG")) {
                    c11 = 'L';
                    break;
                }
                break;
            case 2273:
                if (strT.equals("GH")) {
                    c11 = 'M';
                    break;
                }
                break;
            case 2274:
                if (strT.equals("GI")) {
                    c11 = 'N';
                    break;
                }
                break;
            case 2277:
                if (strT.equals("GL")) {
                    c11 = 'O';
                    break;
                }
                break;
            case 2278:
                if (strT.equals("GM")) {
                    c11 = 'P';
                    break;
                }
                break;
            case 2279:
                if (strT.equals("GN")) {
                    c11 = 'Q';
                    break;
                }
                break;
            case 2281:
                if (strT.equals("GP")) {
                    c11 = 'R';
                    break;
                }
                break;
            case 2282:
                if (strT.equals("GQ")) {
                    c11 = 'S';
                    break;
                }
                break;
            case 2283:
                if (strT.equals("GR")) {
                    c11 = 'T';
                    break;
                }
                break;
            case 2285:
                if (strT.equals("GT")) {
                    c11 = 'U';
                    break;
                }
                break;
            case 2286:
                if (strT.equals("GU")) {
                    c11 = 'V';
                    break;
                }
                break;
            case 2288:
                if (strT.equals("GW")) {
                    c11 = 'W';
                    break;
                }
                break;
            case 2290:
                if (strT.equals("GY")) {
                    c11 = 'X';
                    break;
                }
                break;
            case 2307:
                if (strT.equals("HK")) {
                    c11 = 'Y';
                    break;
                }
                break;
            case 2314:
                if (strT.equals("HR")) {
                    c11 = 'Z';
                    break;
                }
                break;
            case 2316:
                if (strT.equals("HT")) {
                    c11 = AbstractJsonLexerKt.BEGIN_LIST;
                    break;
                }
                break;
            case 2317:
                if (strT.equals("HU")) {
                    c11 = AbstractJsonLexerKt.STRING_ESC;
                    break;
                }
                break;
            case 2331:
                if (strT.equals("ID")) {
                    c11 = AbstractJsonLexerKt.END_LIST;
                    break;
                }
                break;
            case 2332:
                if (strT.equals("IE")) {
                    c11 = '^';
                    break;
                }
                break;
            case 2339:
                if (strT.equals("IL")) {
                    c11 = '_';
                    break;
                }
                break;
            case 2340:
                if (strT.equals("IM")) {
                    c11 = '`';
                    break;
                }
                break;
            case 2341:
                if (strT.equals("IN")) {
                    c11 = 'a';
                    break;
                }
                break;
            case 2342:
                if (strT.equals("IO")) {
                    c11 = 'b';
                    break;
                }
                break;
            case 2344:
                if (strT.equals("IQ")) {
                    c11 = 'c';
                    break;
                }
                break;
            case 2345:
                if (strT.equals("IR")) {
                    c11 = 'd';
                    break;
                }
                break;
            case 2346:
                if (strT.equals("IS")) {
                    c11 = 'e';
                    break;
                }
                break;
            case 2347:
                if (strT.equals("IT")) {
                    c11 = 'f';
                    break;
                }
                break;
            case 2363:
                if (strT.equals("JE")) {
                    c11 = 'g';
                    break;
                }
                break;
            case 2371:
                if (strT.equals("JM")) {
                    c11 = 'h';
                    break;
                }
                break;
            case 2373:
                if (strT.equals("JO")) {
                    c11 = 'i';
                    break;
                }
                break;
            case 2374:
                if (strT.equals("JP")) {
                    c11 = 'j';
                    break;
                }
                break;
            case 2394:
                if (strT.equals("KE")) {
                    c11 = 'k';
                    break;
                }
                break;
            case 2396:
                if (strT.equals("KG")) {
                    c11 = 'l';
                    break;
                }
                break;
            case 2397:
                if (strT.equals("KH")) {
                    c11 = 'm';
                    break;
                }
                break;
            case 2398:
                if (strT.equals("KI")) {
                    c11 = 'n';
                    break;
                }
                break;
            case 2402:
                if (strT.equals("KM")) {
                    c11 = 'o';
                    break;
                }
                break;
            case 2403:
                if (strT.equals("KN")) {
                    c11 = 'p';
                    break;
                }
                break;
            case 2405:
                if (strT.equals("KP")) {
                    c11 = 'q';
                    break;
                }
                break;
            case 2407:
                if (strT.equals("KR")) {
                    c11 = 'r';
                    break;
                }
                break;
            case 2412:
                if (strT.equals("KW")) {
                    c11 = 's';
                    break;
                }
                break;
            case 2414:
                if (strT.equals("KY")) {
                    c11 = 't';
                    break;
                }
                break;
            case 2415:
                if (strT.equals("KZ")) {
                    c11 = AbstractJsonLexerKt.UNICODE_ESC;
                    break;
                }
                break;
            case 2421:
                if (strT.equals("LA")) {
                    c11 = 'v';
                    break;
                }
                break;
            case 2422:
                if (strT.equals("LB")) {
                    c11 = 'w';
                    break;
                }
                break;
            case 2423:
                if (strT.equals("LC")) {
                    c11 = 'x';
                    break;
                }
                break;
            case 2429:
                if (strT.equals("LI")) {
                    c11 = 'y';
                    break;
                }
                break;
            case 2431:
                if (strT.equals("LK")) {
                    c11 = 'z';
                    break;
                }
                break;
            case 2438:
                if (strT.equals("LR")) {
                    c11 = AbstractJsonLexerKt.BEGIN_OBJ;
                    break;
                }
                break;
            case 2439:
                if (strT.equals("LS")) {
                    c11 = '|';
                    break;
                }
                break;
            case 2440:
                if (strT.equals("LT")) {
                    c11 = AbstractJsonLexerKt.END_OBJ;
                    break;
                }
                break;
            case 2441:
                if (strT.equals("LU")) {
                    c11 = '~';
                    break;
                }
                break;
            case 2442:
                if (strT.equals("LV")) {
                    c11 = 127;
                    break;
                }
                break;
            case 2445:
                if (strT.equals("LY")) {
                    c11 = 128;
                    break;
                }
                break;
            case 2452:
                if (strT.equals("MA")) {
                    c11 = 129;
                    break;
                }
                break;
            case 2454:
                if (strT.equals("MC")) {
                    c11 = 130;
                    break;
                }
                break;
            case 2455:
                if (strT.equals("MD")) {
                    c11 = 131;
                    break;
                }
                break;
            case 2456:
                if (strT.equals("ME")) {
                    c11 = 132;
                    break;
                }
                break;
            case 2457:
                if (strT.equals("MF")) {
                    c11 = 133;
                    break;
                }
                break;
            case 2458:
                if (strT.equals("MG")) {
                    c11 = 134;
                    break;
                }
                break;
            case 2459:
                if (strT.equals("MH")) {
                    c11 = 135;
                    break;
                }
                break;
            case 2462:
                if (strT.equals("MK")) {
                    c11 = 136;
                    break;
                }
                break;
            case 2463:
                if (strT.equals("ML")) {
                    c11 = 137;
                    break;
                }
                break;
            case 2464:
                if (strT.equals("MM")) {
                    c11 = 138;
                    break;
                }
                break;
            case 2465:
                if (strT.equals("MN")) {
                    c11 = 139;
                    break;
                }
                break;
            case 2466:
                if (strT.equals("MO")) {
                    c11 = 140;
                    break;
                }
                break;
            case 2467:
                if (strT.equals("MP")) {
                    c11 = 141;
                    break;
                }
                break;
            case 2468:
                if (strT.equals("MQ")) {
                    c11 = 142;
                    break;
                }
                break;
            case 2469:
                if (strT.equals("MR")) {
                    c11 = 143;
                    break;
                }
                break;
            case 2470:
                if (strT.equals("MS")) {
                    c11 = 144;
                    break;
                }
                break;
            case 2471:
                if (strT.equals("MT")) {
                    c11 = 145;
                    break;
                }
                break;
            case 2472:
                if (strT.equals("MU")) {
                    c11 = 146;
                    break;
                }
                break;
            case 2473:
                if (strT.equals("MV")) {
                    c11 = 147;
                    break;
                }
                break;
            case 2474:
                if (strT.equals("MW")) {
                    c11 = 148;
                    break;
                }
                break;
            case 2475:
                if (strT.equals("MX")) {
                    c11 = 149;
                    break;
                }
                break;
            case 2476:
                if (strT.equals("MY")) {
                    c11 = 150;
                    break;
                }
                break;
            case 2477:
                if (strT.equals("MZ")) {
                    c11 = 151;
                    break;
                }
                break;
            case 2483:
                if (strT.equals("NA")) {
                    c11 = 152;
                    break;
                }
                break;
            case 2485:
                if (strT.equals("NC")) {
                    c11 = 153;
                    break;
                }
                break;
            case 2487:
                if (strT.equals("NE")) {
                    c11 = 154;
                    break;
                }
                break;
            case 2489:
                if (strT.equals("NG")) {
                    c11 = 155;
                    break;
                }
                break;
            case 2491:
                if (strT.equals("NI")) {
                    c11 = 156;
                    break;
                }
                break;
            case 2494:
                if (strT.equals("NL")) {
                    c11 = 157;
                    break;
                }
                break;
            case 2497:
                if (strT.equals("NO")) {
                    c11 = 158;
                    break;
                }
                break;
            case 2498:
                if (strT.equals("NP")) {
                    c11 = 159;
                    break;
                }
                break;
            case 2500:
                if (strT.equals("NR")) {
                    c11 = 160;
                    break;
                }
                break;
            case 2503:
                if (strT.equals("NU")) {
                    c11 = 161;
                    break;
                }
                break;
            case 2508:
                if (strT.equals("NZ")) {
                    c11 = 162;
                    break;
                }
                break;
            case 2526:
                if (strT.equals("OM")) {
                    c11 = 163;
                    break;
                }
                break;
            case 2545:
                if (strT.equals("PA")) {
                    c11 = 164;
                    break;
                }
                break;
            case 2549:
                if (strT.equals("PE")) {
                    c11 = 165;
                    break;
                }
                break;
            case 2550:
                if (strT.equals("PF")) {
                    c11 = 166;
                    break;
                }
                break;
            case 2551:
                if (strT.equals("PG")) {
                    c11 = 167;
                    break;
                }
                break;
            case 2552:
                if (strT.equals("PH")) {
                    c11 = 168;
                    break;
                }
                break;
            case 2555:
                if (strT.equals("PK")) {
                    c11 = 169;
                    break;
                }
                break;
            case 2556:
                if (strT.equals("PL")) {
                    c11 = 170;
                    break;
                }
                break;
            case 2557:
                if (strT.equals("PM")) {
                    c11 = 171;
                    break;
                }
                break;
            case 2562:
                if (strT.equals("PR")) {
                    c11 = 172;
                    break;
                }
                break;
            case 2563:
                if (strT.equals("PS")) {
                    c11 = 173;
                    break;
                }
                break;
            case 2564:
                if (strT.equals("PT")) {
                    c11 = 174;
                    break;
                }
                break;
            case 2567:
                if (strT.equals("PW")) {
                    c11 = 175;
                    break;
                }
                break;
            case 2576:
                if (strT.equals("QA")) {
                    c11 = 176;
                    break;
                }
                break;
            case 2611:
                if (strT.equals("RE")) {
                    c11 = 177;
                    break;
                }
                break;
            case 2621:
                if (strT.equals("RO")) {
                    c11 = 178;
                    break;
                }
                break;
            case 2625:
                if (strT.equals("RS")) {
                    c11 = 179;
                    break;
                }
                break;
            case 2627:
                if (strT.equals("RU")) {
                    c11 = 180;
                    break;
                }
                break;
            case 2629:
                if (strT.equals("RW")) {
                    c11 = 181;
                    break;
                }
                break;
            case 2638:
                if (strT.equals("SA")) {
                    c11 = 182;
                    break;
                }
                break;
            case 2639:
                if (strT.equals("SB")) {
                    c11 = 183;
                    break;
                }
                break;
            case 2640:
                if (strT.equals("SC")) {
                    c11 = 184;
                    break;
                }
                break;
            case 2641:
                if (strT.equals("SD")) {
                    c11 = 185;
                    break;
                }
                break;
            case 2642:
                if (strT.equals("SE")) {
                    c11 = 186;
                    break;
                }
                break;
            case 2644:
                if (strT.equals("SG")) {
                    c11 = 187;
                    break;
                }
                break;
            case 2645:
                if (strT.equals("SH")) {
                    c11 = 188;
                    break;
                }
                break;
            case 2646:
                if (strT.equals("SI")) {
                    c11 = 189;
                    break;
                }
                break;
            case 2648:
                if (strT.equals("SK")) {
                    c11 = 190;
                    break;
                }
                break;
            case 2649:
                if (strT.equals("SL")) {
                    c11 = 191;
                    break;
                }
                break;
            case 2650:
                if (strT.equals("SM")) {
                    c11 = 192;
                    break;
                }
                break;
            case 2651:
                if (strT.equals("SN")) {
                    c11 = 193;
                    break;
                }
                break;
            case 2652:
                if (strT.equals("SO")) {
                    c11 = 194;
                    break;
                }
                break;
            case 2655:
                if (strT.equals("SR")) {
                    c11 = 195;
                    break;
                }
                break;
            case 2656:
                if (strT.equals("SS")) {
                    c11 = 196;
                    break;
                }
                break;
            case 2657:
                if (strT.equals("ST")) {
                    c11 = 197;
                    break;
                }
                break;
            case 2659:
                if (strT.equals("SV")) {
                    c11 = 198;
                    break;
                }
                break;
            case 2661:
                if (strT.equals("SX")) {
                    c11 = 199;
                    break;
                }
                break;
            case 2662:
                if (strT.equals("SY")) {
                    c11 = 200;
                    break;
                }
                break;
            case 2663:
                if (strT.equals("SZ")) {
                    c11 = 201;
                    break;
                }
                break;
            case 2671:
                if (strT.equals("TC")) {
                    c11 = 202;
                    break;
                }
                break;
            case 2672:
                if (strT.equals("TD")) {
                    c11 = 203;
                    break;
                }
                break;
            case 2675:
                if (strT.equals("TG")) {
                    c11 = 204;
                    break;
                }
                break;
            case 2676:
                if (strT.equals("TH")) {
                    c11 = 205;
                    break;
                }
                break;
            case 2678:
                if (strT.equals("TJ")) {
                    c11 = 206;
                    break;
                }
                break;
            case 2679:
                if (strT.equals("TK")) {
                    c11 = 207;
                    break;
                }
                break;
            case 2680:
                if (strT.equals("TL")) {
                    c11 = 208;
                    break;
                }
                break;
            case 2681:
                if (strT.equals("TM")) {
                    c11 = 209;
                    break;
                }
                break;
            case 2682:
                if (strT.equals("TN")) {
                    c11 = 210;
                    break;
                }
                break;
            case 2683:
                if (strT.equals("TO")) {
                    c11 = 211;
                    break;
                }
                break;
            case 2686:
                if (strT.equals("TR")) {
                    c11 = 212;
                    break;
                }
                break;
            case 2688:
                if (strT.equals("TT")) {
                    c11 = 213;
                    break;
                }
                break;
            case 2690:
                if (strT.equals("TV")) {
                    c11 = 214;
                    break;
                }
                break;
            case 2691:
                if (strT.equals("TW")) {
                    c11 = 215;
                    break;
                }
                break;
            case 2694:
                if (strT.equals("TZ")) {
                    c11 = 216;
                    break;
                }
                break;
            case 2700:
                if (strT.equals("UA")) {
                    c11 = 217;
                    break;
                }
                break;
            case 2706:
                if (strT.equals("UG")) {
                    c11 = 218;
                    break;
                }
                break;
            case 2718:
                if (strT.equals("US")) {
                    c11 = 219;
                    break;
                }
                break;
            case 2724:
                if (strT.equals("UY")) {
                    c11 = 220;
                    break;
                }
                break;
            case 2725:
                if (strT.equals("UZ")) {
                    c11 = 221;
                    break;
                }
                break;
            case 2731:
                if (strT.equals("VA")) {
                    c11 = 222;
                    break;
                }
                break;
            case 2733:
                if (strT.equals("VC")) {
                    c11 = 223;
                    break;
                }
                break;
            case 2735:
                if (strT.equals("VE")) {
                    c11 = 224;
                    break;
                }
                break;
            case 2737:
                if (strT.equals("VG")) {
                    c11 = 225;
                    break;
                }
                break;
            case 2739:
                if (strT.equals("VI")) {
                    c11 = 226;
                    break;
                }
                break;
            case 2744:
                if (strT.equals("VN")) {
                    c11 = 227;
                    break;
                }
                break;
            case 2751:
                if (strT.equals("VU")) {
                    c11 = 228;
                    break;
                }
                break;
            case 2767:
                if (strT.equals("WF")) {
                    c11 = 229;
                    break;
                }
                break;
            case 2780:
                if (strT.equals("WS")) {
                    c11 = 230;
                    break;
                }
                break;
            case 2803:
                if (strT.equals("XK")) {
                    c11 = 231;
                    break;
                }
                break;
            case 2828:
                if (strT.equals("YE")) {
                    c11 = 232;
                    break;
                }
                break;
            case 2843:
                if (strT.equals("YT")) {
                    c11 = 233;
                    break;
                }
                break;
            case 2855:
                if (strT.equals("ZA")) {
                    c11 = 234;
                    break;
                }
                break;
            case 2867:
                if (strT.equals("ZM")) {
                    c11 = 235;
                    break;
                }
                break;
            case 2877:
                if (strT.equals("ZW")) {
                    c11 = 236;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
            case 26:
            case 29:
            case 'I':
            case 'O':
            case 'p':
            case GZIP_ENCODE_ERROR_VALUE:
            case 'x':
            case STALE_CACHED_RESPONSE_VALUE:
                iArr = new int[]{1, 2, 0, 0, 2, 2};
                break;
            case 1:
                iArr = new int[]{1, 4, 4, 4, 4, 0};
                break;
            case 2:
            case 'P':
                iArr = new int[]{4, 3, 3, 4, 2, 2};
                break;
            case 3:
                iArr = new int[]{2, 4, 1, 2, 2, 2};
                break;
            case 4:
                iArr = new int[]{0, 2, 0, 3, 2, 2};
                break;
            case 5:
            case 231:
                iArr = new int[]{1, 1, 1, 1, 2, 2};
                break;
            case 6:
                iArr = new int[]{2, 3, 2, 3, 2, 2};
                break;
            case 7:
                iArr = new int[]{4, 4, 3, 2, 2, 2};
                break;
            case '\b':
            case '>':
            case 188:
                iArr = new int[]{4, 2, 2, 2, 2, 2};
                break;
            case '\t':
            case 'l':
            case AD_NOT_LOADED_VALUE:
            case AD_RESPONSE_RETRY_AFTER_VALUE:
                iArr = new int[]{2, 1, 1, 1, 2, 2};
                break;
            case '\n':
                iArr = new int[]{2, 2, 3, 3, 2, 2};
                break;
            case 11:
                iArr = new int[]{1, 0, 1, 1, 0, 0};
                break;
            case '\f':
                iArr = new int[]{0, 1, 1, 1, 2, 0};
                break;
            case '\r':
                iArr = new int[]{1, 3, 4, 4, 2, 2};
                break;
            case 14:
            case TPAT_ERROR_VALUE:
            case 144:
            case 171:
            case 192:
                iArr = new int[]{0, 2, 2, 2, 2, 2};
                break;
            case 15:
            case 'K':
            case 128:
            case 169:
            case 194:
            case 211:
                iArr = new int[]{3, 2, 3, 3, 2, 2};
                break;
            case 16:
                iArr = new int[]{1, 2, 1, 1, 2, 2};
                break;
            case 17:
            case '8':
            case 'E':
            case 'N':
                iArr = new int[]{0, 2, 0, 0, 2, 2};
                break;
            case 18:
                iArr = new int[]{2, 1, 3, 3, 2, 2};
                break;
            case 19:
                iArr = new int[]{0, 1, 4, 4, 3, 2};
                break;
            case 20:
                iArr = new int[]{4, 3, 4, 3, 2, 2};
                break;
            case 21:
            case 145:
            case 190:
                iArr = new int[]{0, 0, 0, 0, 1, 2};
                break;
            case 22:
                iArr = new int[]{1, 2, 1, 3, 4, 2};
                break;
            case 23:
            case '[':
            case 'o':
            case STORE_REGION_CODE_ERROR_VALUE:
            case 154:
            case ModuleDescriptor.MODULE_VERSION /* 185 */:
            case AD_IS_LOADING_VALUE:
            case AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE:
            case 232:
                iArr = new int[]{4, 4, 4, 4, 2, 2};
                break;
            case 24:
                iArr = new int[]{4, 4, 3, 3, 2, 2};
                break;
            case 25:
            case '2':
            case INVALID_WATERFALL_PLACEMENT_ID_VALUE:
                iArr = new int[]{1, 2, 2, 2, 2, 2};
                break;
            case 27:
            case '1':
                iArr = new int[]{2, 2, 0, 0, 2, 2};
                break;
            case 28:
                iArr = new int[]{1, 2, 3, 2, 2, 2};
                break;
            case 30:
                iArr = new int[]{4, 4, 2, 2, 2, 2};
                break;
            case 31:
                iArr = new int[]{3, 1, 3, 2, 2, 2};
                break;
            case ' ':
                iArr = new int[]{3, 2, 1, 0, 2, 2};
                break;
            case '!':
                iArr = new int[]{0, 1, 2, 3, 2, 2};
                break;
            case '\"':
                iArr = new int[]{2, 4, 2, 1, 2, 2};
                break;
            case '#':
                iArr = new int[]{0, 2, 2, 2, 3, 2};
                break;
            case '$':
                iArr = new int[]{4, 2, 3, 2, 2, 2};
                break;
            case '%':
            case 'n':
                iArr = new int[]{4, 2, 4, 2, 2, 2};
                break;
            case '&':
            case '=':
            case 'W':
                iArr = new int[]{3, 4, 3, 3, 2, 2};
                break;
            case '\'':
                iArr = new int[]{0, 0, 0, 1, 0, 2};
                break;
            case '(':
            case ':':
            case INVALID_RI_ENDPOINT_VALUE:
                iArr = new int[]{3, 4, 4, 4, 2, 2};
                break;
            case ')':
            case 166:
                iArr = new int[]{2, 2, 2, 1, 2, 2};
                break;
            case '*':
            case pd.f8203p0 /* 95 */:
                iArr = new int[]{1, 2, 2, 2, 3, 2};
                break;
            case '+':
                iArr = new int[]{3, 3, 3, 3, 2, 2};
                break;
            case ',':
                iArr = new int[]{2, 0, 1, 1, 3, 2};
                break;
            case '-':
                iArr = new int[]{2, 3, 4, 3, 2, 2};
                break;
            case '.':
                iArr = new int[]{2, 3, 4, 4, 2, 2};
                break;
            case '/':
            case '6':
            case 200:
            case AD_ALREADY_FAILED_VALUE:
            case INVALID_BID_PAYLOAD_VALUE:
                iArr = new int[]{4, 3, 4, 4, 2, 2};
                break;
            case '0':
                iArr = new int[]{2, 1, 0, 0, 2, 2};
                break;
            case '3':
            case 's':
                iArr = new int[]{1, 0, 0, 0, 0, 2};
                break;
            case '4':
            case 158:
                iArr = new int[]{0, 0, 2, 0, 1, 2};
                break;
            case '5':
                iArr = new int[]{0, 1, 2, 2, 2, 3};
                break;
            case '7':
                iArr = new int[]{0, 0, 3, 2, 0, 2};
                break;
            case '9':
                iArr = new int[]{3, 4, 4, 4, 4, 2};
                break;
            case ';':
                iArr = new int[]{2, 3, 2, 1, 2, 2};
                break;
            case '<':
            case 'e':
            case ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE:
            case 174:
            case 186:
            case AD_RESPONSE_EMPTY_VALUE:
                iArr = new int[]{0, 0, 0, 0, 0, 2};
                break;
            case '?':
            case pd.P0 /* 94 */:
                iArr = new int[]{0, 1, 1, 1, 2, 2};
                break;
            case '@':
                iArr = new int[]{4, 3, 3, 1, 2, 2};
                break;
            case 'A':
                iArr = new int[]{0, 0, 0, 3, 0, 2};
                break;
            case 'B':
                iArr = new int[]{3, 1, 2, 2, 2, 2};
                break;
            case 'C':
            case 'k':
            case 'q':
                iArr = new int[]{3, 2, 2, 2, 2, 2};
                break;
            case 'D':
                iArr = new int[]{4, 2, 4, 1, 2, 2};
                break;
            case 'F':
                iArr = new int[]{1, 2, 3, 1, 0, 2};
                break;
            case 'G':
            case AD_ALREADY_LOADED_VALUE:
                iArr = new int[]{3, 4, 1, 0, 2, 2};
                break;
            case 'H':
                iArr = new int[]{0, 0, 1, 1, 1, 1};
                break;
            case 'J':
                iArr = new int[]{1, 1, 1, 2, 2, 2};
                break;
            case 'L':
            case PRIVACY_ICON_FALLBACK_ERROR_VALUE:
                iArr = new int[]{0, 2, 0, 1, 2, 2};
                break;
            case 'M':
            case 152:
            case 228:
                iArr = new int[]{3, 3, 3, 2, 2, 2};
                break;
            case 'Q':
                iArr = new int[]{4, 3, 4, 2, 2, 2};
                break;
            case 'R':
            case 142:
                iArr = new int[]{2, 1, 2, 3, 2, 2};
                break;
            case 'S':
                iArr = new int[]{4, 2, 1, 4, 2, 2};
                break;
            case 'T':
            case 'Z':
            case 189:
                iArr = new int[]{1, 0, 0, 0, 1, 2};
                break;
            case 'U':
                iArr = new int[]{2, 3, 2, 2, 2, 2};
                break;
            case 'V':
            case 165:
                iArr = new int[]{1, 2, 4, 4, 4, 2};
                break;
            case 'X':
                iArr = new int[]{3, 2, 2, 1, 2, 2};
                break;
            case 'Y':
                iArr = new int[]{0, 1, 2, 3, 2, 0};
                break;
            case pd.N0 /* 92 */:
                iArr = new int[]{0, 0, 0, 1, 3, 2};
                break;
            case pd.O0 /* 93 */:
                iArr = new int[]{3, 1, 2, 2, 3, 2};
                break;
            case pd.A0 /* 96 */:
            case AD_RESPONSE_TIMED_OUT_VALUE:
                iArr = new int[]{0, 2, 1, 1, 2, 2};
                break;
            case pd.H0 /* 97 */:
                iArr = new int[]{1, 1, 3, 2, 3, 3};
                break;
            case pd.Q0 /* 98 */:
            case INVALID_CONFIG_RESPONSE_VALUE:
            case INVALID_GZIP_BID_PAYLOAD_VALUE:
            case 229:
                iArr = new int[]{4, 2, 2, 4, 2, 2};
                break;
            case pd.R0 /* 99 */:
                iArr = new int[]{3, 2, 2, 3, 2, 2};
                break;
            case 'd':
                iArr = new int[]{3, 0, 1, 1, 4, 1};
                break;
            case 'f':
                iArr = new int[]{0, 0, 0, 1, 1, 2};
                break;
            case 'g':
            case 233:
                iArr = new int[]{4, 2, 2, 3, 2, 2};
                break;
            case 'h':
                iArr = new int[]{2, 4, 3, 2, 2, 2};
                break;
            case 'i':
                iArr = new int[]{2, 1, 1, 2, 2, 2};
                break;
            case 'j':
                iArr = new int[]{0, 1, 1, 2, 2, 4};
                break;
            case 'm':
                iArr = new int[]{2, 1, 4, 2, 2, 2};
                break;
            case 'r':
                iArr = new int[]{0, 1, 1, 3, 4, 4};
                break;
            case ASSET_FAILED_STATUS_CODE_VALUE:
                iArr = new int[]{2, 1, 2, 2, 2, 2};
                break;
            case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                iArr = new int[]{1, 2, 1, 3, 2, 2};
                break;
            case JSON_ENCODE_ERROR_VALUE:
                iArr = new int[]{3, 3, 2, 4, 2, 2};
                break;
            case INVALID_ADS_ENDPOINT_VALUE:
                iArr = new int[]{3, 1, 3, 3, 4, 2};
                break;
            case INVALID_LOG_ERROR_ENDPOINT_VALUE:
                iArr = new int[]{3, 3, 2, 2, 2, 2};
                break;
            case INVALID_METRICS_ENDPOINT_VALUE:
                iArr = new int[]{0, 0, 0, 0, 2, 2};
                break;
            case ASSET_FAILED_INSUFFICIENT_SPACE_VALUE:
                iArr = new int[]{1, 0, 3, 2, 1, 4};
                break;
            case EMPTY_TPAT_ERROR_VALUE:
                iArr = new int[]{3, 3, 1, 1, 2, 2};
                break;
            case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                iArr = new int[]{0, 2, 2, 0, 2, 2};
                break;
            case MRAID_JS_WRITE_FAILED_VALUE:
            case 179:
                iArr = new int[]{1, 0, 0, 0, 2, 2};
                break;
            case OMSDK_DOWNLOAD_JS_ERROR_VALUE:
                iArr = new int[]{2, 0, 0, 1, 2, 2};
                break;
            case OMSDK_JS_WRITE_FAILED_VALUE:
            case 177:
                iArr = new int[]{1, 2, 1, 2, 2, 2};
                break;
            case PRIVACY_URL_ERROR_VALUE:
                iArr = new int[]{1, 0, 0, 1, 3, 2};
                break;
            case TPAT_RETRY_FAILED_VALUE:
            case 167:
                iArr = new int[]{4, 3, 3, 2, 2, 2};
                break;
            case CONFIG_REFRESH_FAILED_VALUE:
                iArr = new int[]{2, 4, 2, 3, 2, 2};
                break;
            case 139:
                iArr = new int[]{2, 0, 1, 2, 2, 2};
                break;
            case 140:
            case 141:
                iArr = new int[]{0, 2, 4, 4, 2, 2};
                break;
            case 143:
            case 236:
                iArr = new int[]{4, 2, 4, 4, 2, 2};
                break;
            case 146:
                iArr = new int[]{3, 1, 1, 2, 2, 2};
                break;
            case 147:
                iArr = new int[]{3, 4, 1, 4, 2, 2};
                break;
            case 148:
                iArr = new int[]{4, 2, 3, 3, 2, 2};
                break;
            case 149:
                iArr = new int[]{2, 4, 3, 4, 2, 2};
                break;
            case PerAppFeatureCatalog.MAX_TOOLS /* 150 */:
                iArr = new int[]{1, 0, 3, 1, 3, 2};
                break;
            case 151:
                iArr = new int[]{3, 1, 2, 1, 2, 2};
                break;
            case 153:
                iArr = new int[]{3, 3, 4, 4, 2, 2};
                break;
            case 155:
                iArr = new int[]{3, 4, 2, 1, 2, 2};
                break;
            case 156:
            case 164:
            case 198:
                iArr = new int[]{2, 3, 3, 3, 2, 2};
                break;
            case 157:
                iArr = new int[]{0, 2, 2, 3, 0, 3};
                break;
            case 159:
                iArr = new int[]{2, 2, 4, 3, 2, 2};
                break;
            case 160:
            case 161:
                iArr = new int[]{4, 2, 2, 1, 2, 2};
                break;
            case 162:
            case 170:
                iArr = new int[]{1, 1, 2, 2, 4, 2};
                break;
            case 163:
                iArr = new int[]{2, 3, 1, 3, 4, 2};
                break;
            case 168:
                iArr = new int[]{2, 1, 3, 3, 3, 0};
                break;
            case 172:
                iArr = new int[]{2, 0, 2, 1, 2, 1};
                break;
            case TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173 /* 173 */:
                iArr = new int[]{3, 4, 1, 2, 2, 2};
                break;
            case 175:
                iArr = new int[]{2, 2, 4, 1, 2, 2};
                break;
            case 176:
                iArr = new int[]{2, 4, 4, 4, 4, 2};
                break;
            case 178:
                iArr = new int[]{0, 0, 1, 2, 1, 2};
                break;
            case 180:
                iArr = new int[]{1, 0, 0, 0, 4, 3};
                break;
            case 181:
                iArr = new int[]{3, 4, 2, 0, 2, 2};
                break;
            case 182:
                iArr = new int[]{3, 1, 1, 1, 2, 2};
                break;
            case 183:
                iArr = new int[]{4, 2, 4, 3, 2, 2};
                break;
            case 184:
            case INVALID_JSON_BID_PAYLOAD_VALUE:
                iArr = new int[]{4, 2, 1, 1, 2, 2};
                break;
            case 187:
                iArr = new int[]{1, 1, 2, 2, 2, 1};
                break;
            case 191:
            case MRAID_JS_DOES_NOT_EXIST_VALUE:
                iArr = new int[]{3, 3, 4, 3, 2, 2};
                break;
            case 193:
                iArr = new int[]{4, 4, 4, 3, 2, 2};
                break;
            case 195:
                iArr = new int[]{2, 4, 3, 0, 2, 2};
                break;
            case 196:
                iArr = new int[]{4, 3, 2, 3, 2, 2};
                break;
            case 197:
                iArr = new int[]{2, 2, 1, 2, 2, 2};
                break;
            case 199:
            case AD_CONSUMED_VALUE:
                iArr = new int[]{1, 2, 1, 0, 2, 2};
                break;
            case 201:
                iArr = new int[]{3, 3, 3, 4, 2, 2};
                break;
            case AD_IS_PLAYING_VALUE:
                iArr = new int[]{0, 2, 2, 3, 3, 4};
                break;
            case PLACEMENT_AD_TYPE_MISMATCH_VALUE:
                iArr = new int[]{2, 2, 2, 4, 2, 2};
                break;
            case PLACEMENT_SLEEP_VALUE:
                iArr = new int[]{1, 1, 0, 0, 2, 2};
                break;
            case INVALID_ADUNIT_BID_PAYLOAD_VALUE:
                iArr = new int[]{1, 4, 1, 3, 2, 2};
                break;
            case AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE:
                iArr = new int[]{3, 4, 3, 2, 2, 2};
                break;
            case MRAID_JS_COPY_FAILED_VALUE:
                iArr = new int[]{1, 0, 2, 2, 3, 1};
                break;
            case AD_LOAD_FAIL_RETRY_AFTER_VALUE:
                iArr = new int[]{2, 2, 3, 4, 2, 2};
                break;
            case AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE:
                iArr = new int[]{2, 2, 1, 1, 2, 2};
                break;
            case INVALID_CSB_DATA_VALUE:
                iArr = new int[]{0, 3, 3, 4, 2, 2};
                break;
            case 230:
                iArr = new int[]{3, 1, 3, 1, 2, 2};
                break;
            case 234:
                iArr = new int[]{3, 2, 2, 1, 1, 2};
                break;
            case 235:
                iArr = new int[]{3, 3, 4, 2, 2, 2};
                break;
            default:
                iArr = new int[]{2, 2, 2, 2, 2, 2};
                break;
        }
        HashMap map = new HashMap(8);
        map.put(0, 1000000L);
        r2 r2Var2 = p.n;
        map.put(2, (Long) r2Var2.get(iArr[0]));
        map.put(3, (Long) p.o.get(iArr[1]));
        map.put(4, (Long) p.f92710p.get(iArr[2]));
        map.put(5, (Long) p.f92711q.get(iArr[3]));
        map.put(10, (Long) p.f92712r.get(iArr[4]));
        map.put(9, (Long) p.f92713s.get(iArr[5]));
        map.put(7, (Long) r2Var2.get(iArr[0]));
        this.f92708d = map;
        this.f92706b = 2000;
        this.f92709e = wf.q.f94367a;
        this.f92705a = true;
    }

    public static void n(o oVar, MediaFormat mediaFormat, Surface surface, MediaCrypto mediaCrypto) {
        we.e eVar = (we.e) oVar.f92708d;
        MediaCodec mediaCodec = (MediaCodec) oVar.f92707c;
        HandlerThread handlerThread = eVar.f94227b;
        wf.a.i(eVar.f94228c == null);
        handlerThread.start();
        Handler handler = new Handler(handlerThread.getLooper());
        mediaCodec.setCallback(eVar, handler);
        eVar.f94228c = handler;
        wf.a.b("configureCodec");
        mediaCodec.configure(mediaFormat, surface, mediaCrypto, 0);
        wf.a.q();
        we.d dVar = (we.d) oVar.f92709e;
        HandlerThread handlerThread2 = dVar.f94221b;
        if (!dVar.f94225f) {
            handlerThread2.start();
            dVar.f94222c = new m.h(dVar, handlerThread2.getLooper());
            dVar.f94225f = true;
        }
        wf.a.b("startCodec");
        mediaCodec.start();
        wf.a.q();
        oVar.f92706b = 1;
    }

    public static String o(int i5, String str) {
        StringBuilder sb2 = new StringBuilder(str);
        if (i5 == 1) {
            sb2.append("Audio");
        } else if (i5 == 2) {
            sb2.append("Video");
        } else {
            sb2.append("Unknown(");
            sb2.append(i5);
            sb2.append(")");
        }
        return sb2.toString();
    }

    @Override // we.j
    public MediaFormat a() {
        MediaFormat mediaFormat;
        we.e eVar = (we.e) this.f92708d;
        synchronized (eVar.f94226a) {
            try {
                mediaFormat = eVar.f94233h;
                if (mediaFormat == null) {
                    throw new IllegalStateException();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return mediaFormat;
    }

    @Override // we.j
    public void b(ea.a aVar, Handler handler) {
        ((MediaCodec) this.f92707c).setOnFrameRenderedListener(new we.a(this, aVar, 0), handler);
    }

    @Override // we.j
    public void c(int i5) {
        ((MediaCodec) this.f92707c).setVideoScalingMode(i5);
    }

    @Override // we.j
    public ByteBuffer d(int i5) {
        return ((MediaCodec) this.f92707c).getInputBuffer(i5);
    }

    @Override // we.j
    public void e(Surface surface) {
        ((MediaCodec) this.f92707c).setOutputSurface(surface);
    }

    @Override // we.j
    public void f(int i5, ie.c cVar, long j11) {
        we.d dVar = (we.d) this.f92709e;
        RuntimeException runtimeException = (RuntimeException) dVar.f94223d.getAndSet(null);
        if (runtimeException != null) {
            throw runtimeException;
        }
        we.c cVarB = we.d.b();
        cVarB.f94213a = i5;
        cVarB.f94214b = 0;
        cVarB.f94216d = j11;
        cVarB.f94217e = 0;
        MediaCodec.CryptoInfo cryptoInfo = cVarB.f94215c;
        cryptoInfo.numSubSamples = cVar.f61562f;
        int[] iArr = cVar.f61560d;
        int[] iArrCopyOf = cryptoInfo.numBytesOfClearData;
        if (iArr != null) {
            if (iArrCopyOf == null || iArrCopyOf.length < iArr.length) {
                iArrCopyOf = Arrays.copyOf(iArr, iArr.length);
            } else {
                System.arraycopy(iArr, 0, iArrCopyOf, 0, iArr.length);
            }
        }
        cryptoInfo.numBytesOfClearData = iArrCopyOf;
        int[] iArr2 = cVar.f61561e;
        int[] iArrCopyOf2 = cryptoInfo.numBytesOfEncryptedData;
        if (iArr2 != null) {
            if (iArrCopyOf2 == null || iArrCopyOf2.length < iArr2.length) {
                iArrCopyOf2 = Arrays.copyOf(iArr2, iArr2.length);
            } else {
                System.arraycopy(iArr2, 0, iArrCopyOf2, 0, iArr2.length);
            }
        }
        cryptoInfo.numBytesOfEncryptedData = iArrCopyOf2;
        byte[] bArr = cVar.f61558b;
        byte[] bArrCopyOf = cryptoInfo.key;
        if (bArr != null) {
            if (bArrCopyOf == null || bArrCopyOf.length < bArr.length) {
                bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
            } else {
                System.arraycopy(bArr, 0, bArrCopyOf, 0, bArr.length);
            }
        }
        bArrCopyOf.getClass();
        cryptoInfo.key = bArrCopyOf;
        byte[] bArr2 = cVar.f61557a;
        byte[] bArrCopyOf2 = cryptoInfo.iv;
        if (bArr2 != null) {
            if (bArrCopyOf2 == null || bArrCopyOf2.length < bArr2.length) {
                bArrCopyOf2 = Arrays.copyOf(bArr2, bArr2.length);
            } else {
                System.arraycopy(bArr2, 0, bArrCopyOf2, 0, bArr2.length);
            }
        }
        bArrCopyOf2.getClass();
        cryptoInfo.iv = bArrCopyOf2;
        cryptoInfo.mode = cVar.f61559c;
        if (wf.v.f94376a >= 24) {
            cryptoInfo.setPattern(new MediaCodec.CryptoInfo.Pattern(cVar.f61563g, cVar.f61564h));
        }
        dVar.f94222c.obtainMessage(1, cVarB).sendToTarget();
    }

    @Override // we.j
    public void flush() {
        ((we.d) this.f92709e).a();
        ((MediaCodec) this.f92707c).flush();
        we.e eVar = (we.e) this.f92708d;
        synchronized (eVar.f94226a) {
            eVar.f94236k++;
            Handler handler = eVar.f94228c;
            int i5 = wf.v.f94376a;
            handler.post(new d4(eVar, 14));
        }
        ((MediaCodec) this.f92707c).start();
    }

    @Override // we.j
    public void g(Bundle bundle) {
        ((MediaCodec) this.f92707c).setParameters(bundle);
    }

    @Override // we.j
    public void h(int i5, long j11) {
        ((MediaCodec) this.f92707c).releaseOutputBuffer(i5, j11);
    }

    @Override // we.j
    public int i() {
        we.e eVar = (we.e) this.f92708d;
        synchronized (eVar.f94226a) {
            try {
                boolean z11 = true;
                int iD = -1;
                if (eVar.f94236k > 0 || eVar.f94237l) {
                    return -1;
                }
                IllegalStateException illegalStateException = eVar.f94238m;
                if (illegalStateException != null) {
                    eVar.f94238m = null;
                    throw illegalStateException;
                }
                MediaCodec.CodecException codecException = eVar.f94235j;
                if (codecException != null) {
                    eVar.f94235j = null;
                    throw codecException;
                }
                ma0.c cVar = eVar.f94229d;
                if (cVar.f76183c != 0) {
                    z11 = false;
                }
                if (!z11) {
                    iD = cVar.d();
                }
                return iD;
            } finally {
            }
        }
    }

    @Override // we.j
    public int j(MediaCodec.BufferInfo bufferInfo) {
        we.e eVar = (we.e) this.f92708d;
        synchronized (eVar.f94226a) {
            try {
                boolean z11 = true;
                if (eVar.f94236k > 0 || eVar.f94237l) {
                    return -1;
                }
                IllegalStateException illegalStateException = eVar.f94238m;
                if (illegalStateException != null) {
                    eVar.f94238m = null;
                    throw illegalStateException;
                }
                MediaCodec.CodecException codecException = eVar.f94235j;
                if (codecException != null) {
                    eVar.f94235j = null;
                    throw codecException;
                }
                ma0.c cVar = eVar.f94230e;
                if (cVar.f76183c != 0) {
                    z11 = false;
                }
                if (z11) {
                    return -1;
                }
                int iD = cVar.d();
                if (iD >= 0) {
                    wf.a.j(eVar.f94233h);
                    MediaCodec.BufferInfo bufferInfo2 = (MediaCodec.BufferInfo) eVar.f94231f.remove();
                    bufferInfo.set(bufferInfo2.offset, bufferInfo2.size, bufferInfo2.presentationTimeUs, bufferInfo2.flags);
                } else if (iD == -2) {
                    eVar.f94233h = (MediaFormat) eVar.f94232g.remove();
                }
                return iD;
            } finally {
            }
        }
    }

    @Override // we.j
    public void k(int i5, int i11, int i12, long j11) {
        we.d dVar = (we.d) this.f92709e;
        RuntimeException runtimeException = (RuntimeException) dVar.f94223d.getAndSet(null);
        if (runtimeException != null) {
            throw runtimeException;
        }
        we.c cVarB = we.d.b();
        cVarB.f94213a = i5;
        cVarB.f94214b = i11;
        cVarB.f94216d = j11;
        cVarB.f94217e = i12;
        m.h hVar = dVar.f94222c;
        int i13 = wf.v.f94376a;
        hVar.obtainMessage(0, cVarB).sendToTarget();
    }

    @Override // we.j
    public void l(int i5, boolean z11) {
        ((MediaCodec) this.f92707c).releaseOutputBuffer(i5, z11);
    }

    @Override // we.j
    public ByteBuffer m(int i5) {
        return ((MediaCodec) this.f92707c).getOutputBuffer(i5);
    }

    @Override // we.j
    public void release() {
        try {
            if (this.f92706b == 1) {
                we.d dVar = (we.d) this.f92709e;
                if (dVar.f94225f) {
                    dVar.a();
                    dVar.f94221b.quit();
                }
                dVar.f94225f = false;
                we.e eVar = (we.e) this.f92708d;
                synchronized (eVar.f94226a) {
                    eVar.f94237l = true;
                    eVar.f94227b.quit();
                    eVar.a();
                }
            }
            this.f92706b = 2;
        } finally {
            if (!this.f92705a) {
                ((MediaCodec) this.f92707c).release();
                this.f92705a = true;
            }
        }
    }

    public o(MediaCodec mediaCodec, HandlerThread handlerThread, HandlerThread handlerThread2) {
        this.f92707c = mediaCodec;
        this.f92708d = new we.e(handlerThread);
        this.f92709e = new we.d(mediaCodec, handlerThread2);
        this.f92706b = 0;
    }
}
