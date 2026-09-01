package defpackage;

import android.util.Base64;
import android.util.JsonReader;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class rd2 {
    public static final rz2 a;

    static {
        yb6 yb6Var = new yb6();
        yf0 yf0Var = yf0.a;
        yb6Var.a(pd2.class, yf0Var);
        yb6Var.a(vh0.class, yf0Var);
        eg0 eg0Var = eg0.a;
        yb6Var.a(od2.class, eg0Var);
        yb6Var.a(ei0.class, eg0Var);
        bg0 bg0Var = bg0.a;
        yb6Var.a(wc2.class, bg0Var);
        yb6Var.a(fi0.class, bg0Var);
        cg0 cg0Var = cg0.a;
        yb6Var.a(vc2.class, cg0Var);
        yb6Var.a(gi0.class, cg0Var);
        ug0 ug0Var = ug0.a;
        yb6Var.a(nd2.class, ug0Var);
        yb6Var.a(ej0.class, ug0Var);
        tg0 tg0Var = tg0.a;
        yb6Var.a(md2.class, tg0Var);
        yb6Var.a(dj0.class, tg0Var);
        dg0 dg0Var = dg0.a;
        yb6Var.a(xc2.class, dg0Var);
        yb6Var.a(ii0.class, dg0Var);
        og0 og0Var = og0.a;
        yb6Var.a(ld2.class, og0Var);
        yb6Var.a(ki0.class, og0Var);
        fg0 fg0Var = fg0.a;
        yb6Var.a(fd2.class, fg0Var);
        yb6Var.a(li0.class, fg0Var);
        hg0 hg0Var = hg0.a;
        yb6Var.a(dd2.class, hg0Var);
        yb6Var.a(mi0.class, hg0Var);
        kg0 kg0Var = kg0.a;
        yb6Var.a(cd2.class, kg0Var);
        yb6Var.a(qi0.class, kg0Var);
        lg0 lg0Var = lg0.a;
        yb6Var.a(bd2.class, lg0Var);
        yb6Var.a(si0.class, lg0Var);
        ig0 ig0Var = ig0.a;
        yb6Var.a(zc2.class, ig0Var);
        yb6Var.a(oi0.class, ig0Var);
        wf0 wf0Var = wf0.a;
        yb6Var.a(rc2.class, wf0Var);
        yb6Var.a(yh0.class, wf0Var);
        vf0 vf0Var = vf0.a;
        yb6Var.a(qc2.class, vf0Var);
        yb6Var.a(zh0.class, vf0Var);
        jg0 jg0Var = jg0.a;
        yb6Var.a(ad2.class, jg0Var);
        yb6Var.a(pi0.class, jg0Var);
        gg0 gg0Var = gg0.a;
        yb6Var.a(yc2.class, gg0Var);
        yb6Var.a(ni0.class, gg0Var);
        xf0 xf0Var = xf0.a;
        yb6Var.a(sc2.class, xf0Var);
        yb6Var.a(ai0.class, xf0Var);
        mg0 mg0Var = mg0.a;
        yb6Var.a(ed2.class, mg0Var);
        yb6Var.a(ui0.class, mg0Var);
        ng0 ng0Var = ng0.a;
        yb6Var.a(gd2.class, ng0Var);
        yb6Var.a(wi0.class, ng0Var);
        pg0 pg0Var = pg0.a;
        yb6Var.a(hd2.class, pg0Var);
        yb6Var.a(xi0.class, pg0Var);
        sg0 sg0Var = sg0.a;
        yb6Var.a(kd2.class, sg0Var);
        yb6Var.a(bj0.class, sg0Var);
        qg0 qg0Var = qg0.a;
        yb6Var.a(jd2.class, qg0Var);
        yb6Var.a(zi0.class, qg0Var);
        rg0 rg0Var = rg0.a;
        yb6Var.a(id2.class, rg0Var);
        yb6Var.a(aj0.class, rg0Var);
        zf0 zf0Var = zf0.a;
        yb6Var.a(uc2.class, zf0Var);
        yb6Var.a(bi0.class, zf0Var);
        ag0 ag0Var = ag0.a;
        yb6Var.a(tc2.class, ag0Var);
        yb6Var.a(ci0.class, ag0Var);
        yb6Var.d = true;
        a = new rz2(24, yb6Var);
    }

    public static ai0 c(JsonReader jsonReader) throws IOException {
        jsonReader.beginObject();
        String strNextString = null;
        String strNextString2 = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            if (strNextName.equals("key")) {
                strNextString = jsonReader.nextString();
                if (strNextString == null) {
                    z72.c("Null key");
                    return null;
                }
            } else if (strNextName.equals("value")) {
                strNextString2 = jsonReader.nextString();
                if (strNextString2 == null) {
                    z72.c("Null value");
                    return null;
                }
            } else {
                jsonReader.skipValue();
            }
        }
        jsonReader.endObject();
        if (strNextString != null && strNextString2 != null) {
            return new ai0(strNextString, strNextString2);
        }
        StringBuilder sb = new StringBuilder();
        if (strNextString == null) {
            sb.append(" key");
        }
        if (strNextString2 == null) {
            sb.append(" value");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x024d  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x03bd  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0020  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.ki0 d(android.util.JsonReader r29) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 1328
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rd2.d(android.util.JsonReader):ki0");
    }

    public static oi0 e(JsonReader jsonReader) throws IOException {
        jsonReader.beginObject();
        byte b = 0;
        int iNextInt = 0;
        String strNextString = null;
        String strNextString2 = null;
        List listB = null;
        oi0 oi0VarE = null;
        while (true) {
            if (!jsonReader.hasNext()) {
                jsonReader.endObject();
                if (b == 1 && strNextString != null && listB != null) {
                    return new oi0(strNextString, strNextString2, listB, oi0VarE, iNextInt);
                }
                StringBuilder sb = new StringBuilder();
                if (strNextString == null) {
                    sb.append(" type");
                }
                if (listB == null) {
                    sb.append(" frames");
                }
                if ((b & 1) == 0) {
                    sb.append(" overflowCount");
                }
                ygf.f(ka1.u("Missing required properties:", sb));
                return null;
            }
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "frames":
                    listB = b(jsonReader, new z72(11));
                    if (listB == null) {
                        z72.c("Null frames");
                        return null;
                    }
                    break;
                    break;
                case "reason":
                    strNextString2 = jsonReader.nextString();
                    break;
                case "type":
                    strNextString = jsonReader.nextString();
                    if (strNextString == null) {
                        z72.c("Null type");
                        return null;
                    }
                    break;
                    break;
                case "causedBy":
                    oi0VarE = e(jsonReader);
                    break;
                case "overflowCount":
                    iNextInt = jsonReader.nextInt();
                    b = (byte) (b | 1);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
    }

    public static si0 f(JsonReader jsonReader) throws IOException {
        ri0 ri0Var = new ri0();
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "offset":
                    ri0Var.d = jsonReader.nextLong();
                    ri0Var.f = (byte) (ri0Var.f | 2);
                    break;
                case "symbol":
                    String strNextString = jsonReader.nextString();
                    if (strNextString == null) {
                        z72.c("Null symbol");
                        return null;
                    }
                    ri0Var.b = strNextString;
                    break;
                    break;
                case "pc":
                    ri0Var.a = jsonReader.nextLong();
                    ri0Var.f = (byte) (ri0Var.f | 1);
                    break;
                case "file":
                    ri0Var.c = jsonReader.nextString();
                    break;
                case "importance":
                    ri0Var.e = jsonReader.nextInt();
                    ri0Var.f = (byte) (ri0Var.f | 4);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return ri0Var.a();
    }

    public static ui0 g(JsonReader jsonReader) throws IOException {
        ti0 ti0Var = new ti0();
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            switch (strNextName) {
                case "pid":
                    ti0Var.b = jsonReader.nextInt();
                    ti0Var.e = (byte) (ti0Var.e | 1);
                    break;
                case "processName":
                    String strNextString = jsonReader.nextString();
                    if (strNextString == null) {
                        z72.c("Null processName");
                        return null;
                    }
                    ti0Var.a = strNextString;
                    break;
                    break;
                case "defaultProcess":
                    ti0Var.d = jsonReader.nextBoolean();
                    ti0Var.e = (byte) (ti0Var.e | 4);
                    break;
                case "importance":
                    ti0Var.c = jsonReader.nextInt();
                    ti0Var.e = (byte) (ti0Var.e | 2);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return ti0Var.a();
    }

    public static vh0 i(String str) throws IOException {
        try {
            JsonReader jsonReader = new JsonReader(new StringReader(str));
            try {
                vh0 vh0VarH = h(jsonReader);
                jsonReader.close();
                return vh0VarH;
            } finally {
            }
        } catch (IllegalStateException e) {
            throw new IOException(e);
        }
    }

    public static yh0 a(JsonReader jsonReader) throws IOException {
        xh0 xh0Var = new xh0();
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            byte b = -1;
            switch (strNextName.hashCode()) {
                case -1516200806:
                    if (strNextName.equals("buildIdMappingForArch")) {
                        b = 0;
                    }
                    break;
                case 110987:
                    if (strNextName.equals("pid")) {
                        b = 1;
                    }
                    break;
                case 111312:
                    if (strNextName.equals("pss")) {
                        b = 2;
                    }
                    break;
                case 113234:
                    if (strNextName.equals("rss")) {
                        b = 3;
                    }
                    break;
                case 55126294:
                    if (strNextName.equals("timestamp")) {
                        b = 4;
                    }
                    break;
                case 202325402:
                    if (strNextName.equals("processName")) {
                        b = 5;
                    }
                    break;
                case 722137681:
                    if (strNextName.equals("reasonCode")) {
                        b = 6;
                    }
                    break;
                case 723857505:
                    if (strNextName.equals("traceFile")) {
                        b = 7;
                    }
                    break;
                case 2125650548:
                    if (strNextName.equals(AXoTRPEGKEve.eZlnidJAd)) {
                        b = 8;
                    }
                    break;
            }
            switch (b) {
                case 0:
                    xh0Var.i = b(jsonReader, new z72(6));
                    break;
                case 1:
                    xh0Var.a = jsonReader.nextInt();
                    xh0Var.j = (byte) (xh0Var.j | 1);
                    break;
                case 2:
                    xh0Var.e = jsonReader.nextLong();
                    xh0Var.j = (byte) (xh0Var.j | 8);
                    break;
                case 3:
                    xh0Var.f = jsonReader.nextLong();
                    xh0Var.j = (byte) (xh0Var.j | 16);
                    break;
                case 4:
                    xh0Var.g = jsonReader.nextLong();
                    xh0Var.j = (byte) (xh0Var.j | 32);
                    break;
                case 5:
                    String strNextString = jsonReader.nextString();
                    if (strNextString == null) {
                        z72.c("Null processName");
                        return null;
                    }
                    xh0Var.b = strNextString;
                    break;
                    break;
                case 6:
                    xh0Var.c = jsonReader.nextInt();
                    xh0Var.j = (byte) (xh0Var.j | 2);
                    break;
                case 7:
                    xh0Var.h = jsonReader.nextString();
                    break;
                case 8:
                    xh0Var.d = jsonReader.nextInt();
                    xh0Var.j = (byte) (xh0Var.j | 4);
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return xh0Var.a();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x023e, code lost:
    
        r2 = new java.lang.StringBuilder();
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x0243, code lost:
    
        if (r3 != null) goto L152;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x0245, code lost:
    
        r2.append(" rolloutId");
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x024a, code lost:
    
        if (r4 != null) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x024c, code lost:
    
        r2.append(" variantId");
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x0251, code lost:
    
        defpackage.ygf.f(defpackage.ka1.u("Missing required properties:", r2));
     */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0311  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0101  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List b(android.util.JsonReader r22, defpackage.z72 r23) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 1058
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rd2.b(android.util.JsonReader, z72):java.util.List");
    }

    public static vh0 h(JsonReader jsonReader) throws IOException {
        byte b;
        byte b2;
        byte b3;
        Charset charset = pd2.a;
        uh0 uh0Var = new uh0();
        jsonReader.beginObject();
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            strNextName.getClass();
            int iHashCode = strNextName.hashCode();
            String str = uvlZTF.jZbTmOs;
            switch (iHashCode) {
                case -2118372775:
                    b = !strNextName.equals("ndkPayload") ? (byte) -1 : (byte) 0;
                    break;
                case -1962630338:
                    b = !strNextName.equals("sdkVersion") ? (byte) -1 : (byte) 1;
                    break;
                case -1907185581:
                    b = !strNextName.equals("appQualitySessionId") ? (byte) -1 : (byte) 2;
                    break;
                case -1375141843:
                    b = !strNextName.equals("appExitInfo") ? (byte) -1 : (byte) 3;
                    break;
                case -911706486:
                    b = !strNextName.equals("buildVersion") ? (byte) -1 : (byte) 4;
                    break;
                case -401988390:
                    b = !strNextName.equals("firebaseAuthenticationToken") ? (byte) -1 : (byte) 5;
                    break;
                case 344431858:
                    b = !strNextName.equals("gmpAppId") ? (byte) -1 : (byte) 6;
                    break;
                case 719853845:
                    b = !strNextName.equals(str) ? (byte) -1 : (byte) 7;
                    break;
                case 1047652060:
                    b = !strNextName.equals("firebaseInstallationId") ? (byte) -1 : (byte) 8;
                    break;
                case 1874684019:
                    b = !strNextName.equals("platform") ? (byte) -1 : (byte) 9;
                    break;
                case 1975623094:
                    b = !strNextName.equals("displayVersion") ? (byte) -1 : (byte) 10;
                    break;
                case 1984987798:
                    b = !strNextName.equals("session") ? (byte) -1 : (byte) 11;
                    break;
                default:
                    b = -1;
                    break;
            }
            switch (b) {
                case 0:
                    jsonReader.beginObject();
                    List listB = null;
                    String strNextString = null;
                    while (jsonReader.hasNext()) {
                        String strNextName2 = jsonReader.nextName();
                        strNextName2.getClass();
                        if (strNextName2.equals("files")) {
                            listB = b(jsonReader, new z72(7));
                            if (listB == null) {
                                z72.c("Null files");
                                return null;
                            }
                        } else if (strNextName2.equals("orgId")) {
                            strNextString = jsonReader.nextString();
                        } else {
                            jsonReader.skipValue();
                        }
                    }
                    jsonReader.endObject();
                    if (listB == null) {
                        ygf.f(Plbho.CCMWbpnpHmUdyxF);
                        return null;
                    }
                    uh0Var.k = new bi0(listB, strNextString);
                    continue;
                    break;
                case 1:
                    String strNextString2 = jsonReader.nextString();
                    if (strNextString2 == null) {
                        z72.c("Null sdkVersion");
                        return null;
                    }
                    uh0Var.a = strNextString2;
                    break;
                    break;
                case 2:
                    uh0Var.g = jsonReader.nextString();
                    break;
                case 3:
                    uh0Var.l = a(jsonReader);
                    break;
                case 4:
                    String strNextString3 = jsonReader.nextString();
                    if (strNextString3 == null) {
                        z72.c("Null buildVersion");
                        return null;
                    }
                    uh0Var.h = strNextString3;
                    break;
                    break;
                case 5:
                    uh0Var.f = jsonReader.nextString();
                    break;
                case 6:
                    String strNextString4 = jsonReader.nextString();
                    if (strNextString4 == null) {
                        z72.c("Null gmpAppId");
                        return null;
                    }
                    uh0Var.b = strNextString4;
                    break;
                    break;
                case 7:
                    String strNextString5 = jsonReader.nextString();
                    if (strNextString5 == null) {
                        z72.c("Null installationUuid");
                        return null;
                    }
                    uh0Var.d = strNextString5;
                    break;
                    break;
                case 8:
                    uh0Var.e = jsonReader.nextString();
                    break;
                case 9:
                    uh0Var.c = jsonReader.nextInt();
                    uh0Var.m = (byte) (uh0Var.m | 1);
                    break;
                case 10:
                    String strNextString6 = jsonReader.nextString();
                    if (strNextString6 == null) {
                        z72.c("Null displayVersion");
                        return null;
                    }
                    uh0Var.i = strNextString6;
                    break;
                    break;
                case 11:
                    di0 di0Var = new di0();
                    di0Var.f = false;
                    di0Var.m = (byte) (di0Var.m | 2);
                    jsonReader.beginObject();
                    while (jsonReader.hasNext()) {
                        String strNextName3 = jsonReader.nextName();
                        strNextName3.getClass();
                        switch (strNextName3.hashCode()) {
                            case -2128794476:
                                b2 = !strNextName3.equals("startedAt") ? (byte) -1 : (byte) 0;
                                break;
                            case -1907185581:
                                b2 = !strNextName3.equals("appQualitySessionId") ? (byte) -1 : (byte) 1;
                                break;
                            case -1618432855:
                                b2 = !strNextName3.equals("identifier") ? (byte) -1 : (byte) 2;
                                break;
                            case -1606742899:
                                b2 = !strNextName3.equals("endedAt") ? (byte) -1 : (byte) 3;
                                break;
                            case -1335157162:
                                b2 = !strNextName3.equals("device") ? (byte) -1 : (byte) 4;
                                break;
                            case -1291329255:
                                b2 = !strNextName3.equals(CspinKvYN.reFihGPNvwxRg) ? (byte) -1 : (byte) 5;
                                break;
                            case 3556:
                                b2 = !strNextName3.equals("os") ? (byte) -1 : (byte) 6;
                                break;
                            case 96801:
                                b2 = !strNextName3.equals("app") ? (byte) -1 : (byte) 7;
                                break;
                            case 3599307:
                                b2 = !strNextName3.equals("user") ? (byte) -1 : (byte) 8;
                                break;
                            case 286956243:
                                b2 = !strNextName3.equals("generator") ? (byte) -1 : (byte) 9;
                                break;
                            case 1025385094:
                                b2 = !strNextName3.equals("crashed") ? (byte) -1 : (byte) 10;
                                break;
                            case 2047016109:
                                b2 = !strNextName3.equals("generatorType") ? (byte) -1 : (byte) 11;
                                break;
                            default:
                                b2 = -1;
                                break;
                        }
                        switch (b2) {
                            case 0:
                                di0Var.d = jsonReader.nextLong();
                                di0Var.m = (byte) (di0Var.m | 1);
                                break;
                            case 1:
                                di0Var.c = jsonReader.nextString();
                                break;
                            case 2:
                                di0Var.b = new String(Base64.decode(jsonReader.nextString(), 2), pd2.a);
                                break;
                            case 3:
                                di0Var.e = Long.valueOf(jsonReader.nextLong());
                                break;
                            case 4:
                                hi0 hi0Var = new hi0();
                                jsonReader.beginObject();
                                while (jsonReader.hasNext()) {
                                    String strNextName4 = jsonReader.nextName();
                                    strNextName4.getClass();
                                    switch (strNextName4) {
                                        case "simulator":
                                            hi0Var.f = jsonReader.nextBoolean();
                                            hi0Var.j = (byte) (hi0Var.j | 16);
                                            break;
                                        case "manufacturer":
                                            String strNextString7 = jsonReader.nextString();
                                            if (strNextString7 != null) {
                                                hi0Var.h = strNextString7;
                                                break;
                                            } else {
                                                z72.c("Null manufacturer");
                                                break;
                                            }
                                            break;
                                        case "ram":
                                            hi0Var.d = jsonReader.nextLong();
                                            hi0Var.j = (byte) (hi0Var.j | 4);
                                            break;
                                        case "arch":
                                            hi0Var.a = jsonReader.nextInt();
                                            hi0Var.j = (byte) (hi0Var.j | 1);
                                            break;
                                        case "diskSpace":
                                            hi0Var.e = jsonReader.nextLong();
                                            hi0Var.j = (byte) (hi0Var.j | 8);
                                            break;
                                        case "cores":
                                            hi0Var.c = jsonReader.nextInt();
                                            hi0Var.j = (byte) (hi0Var.j | 2);
                                            break;
                                        case "model":
                                            String strNextString8 = jsonReader.nextString();
                                            if (strNextString8 != null) {
                                                hi0Var.b = strNextString8;
                                                break;
                                            } else {
                                                z72.c("Null model");
                                                break;
                                            }
                                            break;
                                        case "state":
                                            hi0Var.g = jsonReader.nextInt();
                                            hi0Var.j = (byte) (hi0Var.j | 32);
                                            break;
                                        case "modelClass":
                                            String strNextString9 = jsonReader.nextString();
                                            if (strNextString9 != null) {
                                                hi0Var.i = strNextString9;
                                                break;
                                            } else {
                                                z72.c("Null modelClass");
                                                break;
                                            }
                                            break;
                                        default:
                                            jsonReader.skipValue();
                                            break;
                                    }
                                }
                                jsonReader.endObject();
                                di0Var.j = hi0Var.a();
                                break;
                            case 5:
                                ArrayList arrayList = new ArrayList();
                                jsonReader.beginArray();
                                while (jsonReader.hasNext()) {
                                    arrayList.add(d(jsonReader));
                                }
                                jsonReader.endArray();
                                di0Var.k = DesugarCollections.unmodifiableList(arrayList);
                                break;
                            case 6:
                                cj0 cj0Var = new cj0();
                                jsonReader.beginObject();
                                while (jsonReader.hasNext()) {
                                    String strNextName5 = jsonReader.nextName();
                                    strNextName5.getClass();
                                    switch (strNextName5) {
                                        case "buildVersion":
                                            String strNextString10 = jsonReader.nextString();
                                            if (strNextString10 != null) {
                                                cj0Var.c = strNextString10;
                                                break;
                                            } else {
                                                z72.c("Null buildVersion");
                                                break;
                                            }
                                            break;
                                        case "jailbroken":
                                            cj0Var.d = jsonReader.nextBoolean();
                                            cj0Var.e = (byte) (cj0Var.e | 2);
                                            break;
                                        case "version":
                                            String strNextString11 = jsonReader.nextString();
                                            if (strNextString11 != null) {
                                                cj0Var.b = strNextString11;
                                                break;
                                            } else {
                                                z72.c("Null version");
                                                break;
                                            }
                                            break;
                                        case "platform":
                                            cj0Var.a = jsonReader.nextInt();
                                            cj0Var.e = (byte) (cj0Var.e | 1);
                                            break;
                                        default:
                                            jsonReader.skipValue();
                                            break;
                                    }
                                }
                                jsonReader.endObject();
                                di0Var.i = cj0Var.a();
                                break;
                            case 7:
                                jsonReader.beginObject();
                                String strNextString12 = null;
                                String strNextString13 = null;
                                String strNextString14 = null;
                                String strNextString15 = null;
                                String strNextString16 = null;
                                String strNextString17 = null;
                                while (jsonReader.hasNext()) {
                                    String strNextName6 = jsonReader.nextName();
                                    strNextName6.getClass();
                                    switch (strNextName6.hashCode()) {
                                        case -1618432855:
                                            b3 = !strNextName6.equals("identifier") ? (byte) -1 : (byte) 0;
                                            break;
                                        case -519438642:
                                            b3 = !strNextName6.equals("developmentPlatform") ? (byte) -1 : (byte) 1;
                                            break;
                                        case 213652010:
                                            b3 = !strNextName6.equals("developmentPlatformVersion") ? (byte) -1 : (byte) 2;
                                            break;
                                        case 351608024:
                                            b3 = !strNextName6.equals("version") ? (byte) -1 : (byte) 3;
                                            break;
                                        case 719853845:
                                            b3 = !strNextName6.equals(str) ? (byte) -1 : (byte) 4;
                                            break;
                                        case 1975623094:
                                            b3 = !strNextName6.equals("displayVersion") ? (byte) -1 : (byte) 5;
                                            break;
                                        default:
                                            b3 = -1;
                                            break;
                                    }
                                    switch (b3) {
                                        case 0:
                                            strNextString17 = jsonReader.nextString();
                                            if (strNextString17 == null) {
                                                z72.c("Null identifier");
                                            }
                                            break;
                                        case 1:
                                            strNextString15 = jsonReader.nextString();
                                            break;
                                        case 2:
                                            strNextString16 = jsonReader.nextString();
                                            break;
                                        case 3:
                                            strNextString12 = jsonReader.nextString();
                                            if (strNextString12 == null) {
                                                z72.c("Null version");
                                            }
                                            break;
                                        case 4:
                                            strNextString14 = jsonReader.nextString();
                                            break;
                                        case 5:
                                            strNextString13 = jsonReader.nextString();
                                            break;
                                        default:
                                            jsonReader.skipValue();
                                            break;
                                    }
                                }
                                jsonReader.endObject();
                                if (strNextString17 == null || strNextString12 == null) {
                                    StringBuilder sb = new StringBuilder();
                                    if (strNextString17 == null) {
                                        sb.append(" identifier");
                                    }
                                    if (strNextString12 == null) {
                                        sb.append(" version");
                                    }
                                    ygf.f(ka1.u("Missing required properties:", sb));
                                } else {
                                    di0Var.g = new fi0(strNextString17, strNextString12, strNextString13, strNextString14, strNextString15, strNextString16);
                                }
                                break;
                            case 8:
                                jsonReader.beginObject();
                                String strNextString18 = null;
                                while (jsonReader.hasNext()) {
                                    if (jsonReader.nextName().equals("identifier")) {
                                        strNextString18 = jsonReader.nextString();
                                        if (strNextString18 == null) {
                                            z72.c("Null identifier");
                                            break;
                                        }
                                    } else {
                                        jsonReader.skipValue();
                                    }
                                }
                                jsonReader.endObject();
                                if (strNextString18 == null) {
                                    ygf.f("Missing required properties: identifier");
                                } else {
                                    di0Var.h = new ej0(strNextString18);
                                }
                                break;
                            case 9:
                                String strNextString19 = jsonReader.nextString();
                                if (strNextString19 == null) {
                                    z72.c("Null generator");
                                } else {
                                    di0Var.a = strNextString19;
                                }
                                break;
                            case 10:
                                di0Var.f = jsonReader.nextBoolean();
                                di0Var.m = (byte) (di0Var.m | 2);
                                break;
                            case 11:
                                di0Var.l = jsonReader.nextInt();
                                di0Var.m = (byte) (di0Var.m | 4);
                                break;
                            default:
                                jsonReader.skipValue();
                                break;
                        }
                        return null;
                    }
                    jsonReader.endObject();
                    uh0Var.j = di0Var.a();
                    break;
                default:
                    jsonReader.skipValue();
                    break;
            }
        }
        jsonReader.endObject();
        return uh0Var.a();
    }
}
