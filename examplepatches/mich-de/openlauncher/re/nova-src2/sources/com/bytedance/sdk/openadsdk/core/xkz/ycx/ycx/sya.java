package com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx;

import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.openadsdk.core.xkz.sya.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.lud;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class sya {
    private static List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> sya(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        return ycx(xmlPullParser, false);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:17:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(XmlPullParser xmlPullParser, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar, int i5, double d5) throws XmlPullParserException, IOException {
        boolean z11 = false;
        while (true) {
            char c11 = 3;
            if (xmlPullParser.next() != 3 || !xmlPullParser.getName().equals(k.f40343s)) {
                if (xmlPullParser.getEventType() == 2) {
                    if (z11 && TextUtils.isEmpty(ycxVar.ul())) {
                        lud.ycx(xmlPullParser);
                    }
                    String name = xmlPullParser.getName();
                    name.getClass();
                    switch (name.hashCode()) {
                        case -2049897434:
                            if (!name.equals(k.f40350z)) {
                                c11 = 65535;
                                break;
                            } else {
                                c11 = 0;
                                break;
                            }
                        case -1927368268:
                            if (name.equals(k.f40345u)) {
                                c11 = 1;
                                break;
                            }
                            break;
                        case -385055469:
                            if (name.equals(k.f40346v)) {
                                c11 = 2;
                                break;
                            }
                            break;
                        case 70476538:
                            if (!name.equals(k.D)) {
                            }
                            break;
                        case 611554000:
                            if (name.equals(k.f40348x)) {
                                c11 = 4;
                                break;
                            }
                            break;
                    }
                    switch (c11) {
                        case 0:
                            ycx(xmlPullParser, ycxVar);
                            break;
                        case 1:
                            ycxVar.ycx(zb(xmlPullParser));
                            break;
                        case 2:
                            ycx(xmlPullParser, i5, d5, ycxVar);
                            z11 = true;
                            break;
                        case 3:
                            com.bytedance.sdk.openadsdk.core.xkz.zb zbVarYcx = ycx(xmlPullParser);
                            if (zbVarYcx != null && ycxVar.zb() == null) {
                                ycxVar.ycx(zbVarYcx);
                                break;
                            } else {
                                break;
                            }
                            break;
                        case 4:
                            ycx(xmlPullParser, ycxVar.ycx());
                            break;
                        default:
                            lud.ycx(xmlPullParser);
                            break;
                    }
                }
            } else {
                return;
            }
        }
    }

    public static double zb(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (lud.zb(xmlPullParser, k.f40345u).split(":").length != 3) {
            return 0.0d;
        }
        try {
            return (Integer.parseInt(r4[1].trim()) * 60) + (Integer.parseInt(r4[0].trim()) * 3600) + Float.parseFloat(r4[2].trim());
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "d+cjkAKuWcaSWdJP", "XOs5owq4bMikX8VcmBivJg==", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
            return 0.0d;
        }
    }

    private static String ycx(XmlPullParser xmlPullParser, int i5, double d5, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar) throws XmlPullParserException, IOException {
        double d11 = Double.NEGATIVE_INFINITY;
        String str = null;
        int i11 = Integer.MIN_VALUE;
        int i12 = Integer.MIN_VALUE;
        while (true) {
            if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals(k.f40346v)) {
                break;
            }
            if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(k.f40347w)) {
                String str2 = lud.f26481ul;
                String attributeValue = xmlPullParser.getAttributeValue(str2, TTConst.TRACK_TYPE);
                int iZb = lud.zb(xmlPullParser.getAttributeValue(str2, "width"));
                int iZb2 = lud.zb(xmlPullParser.getAttributeValue(str2, "height"));
                int iZb3 = lud.zb(xmlPullParser.getAttributeValue(str2, "bitrate"));
                String strZb = lud.zb(xmlPullParser, k.f40347w);
                if (iZb > 0 && iZb2 > 0 && com.bytedance.sdk.openadsdk.core.xkz.sya.dj.ycx.contains(attributeValue) && !TextUtils.isEmpty(strZb)) {
                    double dYcx = com.bytedance.sdk.openadsdk.core.xkz.sya.dj.ycx(i5, d5, iZb, iZb2, iZb3, attributeValue);
                    if (dYcx > d11) {
                        str = strZb;
                        d11 = dYcx;
                        i11 = iZb;
                        i12 = iZb2;
                    }
                }
            }
        }
        if (!TextUtils.isEmpty(str)) {
            ycxVar.dj(str);
            ycxVar.ycx(i11);
            ycxVar.zb(i12);
        }
        return str;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static com.bytedance.sdk.openadsdk.core.xkz.zb ycx(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        com.bytedance.sdk.openadsdk.core.xkz.zb zbVar;
        com.bytedance.sdk.openadsdk.core.xkz.zb zbVar2;
        int i5;
        int i11;
        int i12;
        ycx.EnumC0091ycx enumC0091ycx;
        com.bytedance.sdk.openadsdk.core.xkz.zb zbVar3 = null;
        while (true) {
            int i13 = 3;
            if (xmlPullParser.getEventType() == 3 && xmlPullParser.getName().equals(k.D)) {
                return zbVar3;
            }
            xmlPullParser.next();
            int i14 = 2;
            if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(k.E)) {
                String str = lud.f26481ul;
                int iZb = lud.zb(xmlPullParser.getAttributeValue(str, "width"));
                int iZb2 = lud.zb(xmlPullParser.getAttributeValue(str, "height"));
                if (iZb > 0 && iZb <= 300 && iZb2 > 0 && iZb2 <= 300) {
                    int iYcx = com.bytedance.sdk.openadsdk.core.xkz.zb.ycx.ycx(xmlPullParser.getAttributeValue(str, "offset"));
                    int iYcx2 = com.bytedance.sdk.openadsdk.core.xkz.zb.ycx.ycx(xmlPullParser.getAttributeValue(str, "duration"));
                    ArrayList arrayList = new ArrayList();
                    ArrayList arrayList2 = new ArrayList();
                    lud.ycx ycxVar = null;
                    String strZb = null;
                    while (true) {
                        if (xmlPullParser.next() == i13 && xmlPullParser.getName().equals(k.E)) {
                            if (ycxVar != null && (zbVar3 == null || TextUtils.isEmpty(zbVar3.lud()))) {
                                zbVar3 = new com.bytedance.sdk.openadsdk.core.xkz.zb(iZb, iZb2, iYcx, iYcx2, ycxVar.f26485zb, ycxVar.sya, ycxVar.ycx, arrayList, arrayList2, strZb);
                                lud.ycx(xmlPullParser, k.D, i13);
                            }
                        } else {
                            ArrayList arrayList3 = arrayList;
                            ArrayList arrayList4 = arrayList2;
                            if (xmlPullParser.getEventType() == i14) {
                                String name = xmlPullParser.getName();
                                name.getClass();
                                zbVar2 = zbVar3;
                                i5 = iYcx2;
                                switch (name) {
                                    case "IconViewTracking":
                                        i11 = 3;
                                        i12 = 2;
                                        arrayList4.add(new sya.ycx(lud.zb(xmlPullParser, k.L)).ycx());
                                        break;
                                    case "IFrameResource":
                                        i11 = 3;
                                        i12 = 2;
                                        if (ycxVar == null) {
                                            ycxVar = new lud.ycx(lud.zb(xmlPullParser, k.G), ycx.EnumC0091ycx.NONE, ycx.zb.IFRAME_RESOURCE);
                                            break;
                                        } else {
                                            lud.ycx(xmlPullParser);
                                            break;
                                        }
                                    case "StaticResource":
                                        i11 = 3;
                                        i12 = 2;
                                        ycx.EnumC0091ycx enumC0091ycx2 = ycx.EnumC0091ycx.NONE;
                                        String lowerCase = xmlPullParser.getAttributeValue(lud.f26481ul, "creativeType").toLowerCase();
                                        Set<String> set = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.ycx;
                                        String strZb2 = (set.contains(lowerCase) || com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.f26453zb.contains(lowerCase)) ? lud.zb(xmlPullParser, k.F) : null;
                                        if (set.contains(lowerCase)) {
                                            enumC0091ycx = ycx.EnumC0091ycx.IMAGE;
                                        } else {
                                            enumC0091ycx = ycx.EnumC0091ycx.JAVASCRIPT;
                                        }
                                        ycxVar = new lud.ycx(strZb2, enumC0091ycx, ycx.zb.STATIC_RESOURCE);
                                        break;
                                    case "IconClicks":
                                        while (true) {
                                            i11 = 3;
                                            if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals(k.I)) {
                                                i12 = 2;
                                                break;
                                            } else if (xmlPullParser.getEventType() == 2) {
                                                if (xmlPullParser.getName().equals(k.J)) {
                                                    strZb = lud.zb(xmlPullParser, k.J);
                                                } else if (xmlPullParser.getName().equals(k.K)) {
                                                    arrayList3.add(new sya.ycx(lud.zb(xmlPullParser, k.K)).ycx());
                                                }
                                            }
                                        }
                                        break;
                                    case "HTMLResource":
                                        if (ycxVar == null || ycxVar.sya == ycx.zb.IFRAME_RESOURCE) {
                                            ycxVar = new lud.ycx(lud.zb(xmlPullParser, k.H), ycx.EnumC0091ycx.NONE, ycx.zb.HTML_RESOURCE);
                                            zbVar3 = zbVar2;
                                            iYcx2 = i5;
                                            i13 = 3;
                                            i14 = 2;
                                            break;
                                        }
                                        i11 = 3;
                                        i12 = 2;
                                        lud.ycx(xmlPullParser);
                                        break;
                                    default:
                                        i11 = 3;
                                        i12 = 2;
                                        lud.ycx(xmlPullParser);
                                        break;
                                }
                                arrayList = arrayList3;
                                arrayList2 = arrayList4;
                            } else {
                                zbVar2 = zbVar3;
                                i5 = iYcx2;
                                i11 = i13;
                                i12 = i14;
                            }
                            i13 = i11;
                            i14 = i12;
                            zbVar3 = zbVar2;
                            iYcx2 = i5;
                            arrayList = arrayList3;
                            arrayList2 = arrayList4;
                        }
                    }
                } else {
                    zbVar = zbVar3;
                    lud.ycx(xmlPullParser);
                    zbVar3 = zbVar;
                }
            } else {
                zbVar = zbVar3;
                zbVar3 = zbVar;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0047  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void ycx(XmlPullParser xmlPullParser, com.bytedance.sdk.openadsdk.core.xkz.dj djVar) throws XmlPullParserException, IOException {
        while (true) {
            char c11 = 3;
            if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals(k.f40348x)) {
                return;
            }
            if (xmlPullParser.getEventType() == 2) {
                if (k.f40349y.equals(xmlPullParser.getName())) {
                    String attributeValue = xmlPullParser.getAttributeValue(lud.f26481ul, DatabaseConstants.EVENT_FIELD);
                    if (TextUtils.isEmpty(attributeValue)) {
                        lud.ycx(xmlPullParser, k.f40349y, 3);
                    } else {
                        attributeValue.getClass();
                        switch (attributeValue.hashCode()) {
                            case -1638835128:
                                if (!attributeValue.equals("midpoint")) {
                                    c11 = 65535;
                                    break;
                                } else {
                                    c11 = 0;
                                    break;
                                }
                            case -1337830390:
                                if (attributeValue.equals("thirdQuartile")) {
                                    c11 = 1;
                                    break;
                                }
                                break;
                            case -934426579:
                                if (attributeValue.equals("resume")) {
                                    c11 = 2;
                                    break;
                                }
                                break;
                            case -840405966:
                                if (!attributeValue.equals("unmute")) {
                                }
                                break;
                            case -599445191:
                                if (attributeValue.equals("complete")) {
                                    c11 = 4;
                                    break;
                                }
                                break;
                            case 3363353:
                                if (attributeValue.equals("mute")) {
                                    c11 = 5;
                                    break;
                                }
                                break;
                            case 3532159:
                                if (attributeValue.equals("skip")) {
                                    c11 = 6;
                                    break;
                                }
                                break;
                            case 94756344:
                                if (attributeValue.equals(n.f39150d)) {
                                    c11 = 7;
                                    break;
                                }
                                break;
                            case 106440182:
                                if (attributeValue.equals("pause")) {
                                    c11 = '\b';
                                    break;
                                }
                                break;
                            case 109757538:
                                if (attributeValue.equals("start")) {
                                    c11 = '\t';
                                    break;
                                }
                                break;
                            case 560220243:
                                if (attributeValue.equals("firstQuartile")) {
                                    c11 = '\n';
                                    break;
                                }
                                break;
                            case 1778167540:
                                if (attributeValue.equals("creativeView")) {
                                    c11 = 11;
                                    break;
                                }
                                break;
                        }
                        switch (c11) {
                            case 0:
                                djVar.ycx(lud.zb(xmlPullParser, k.f40349y), 0.5f);
                                break;
                            case 1:
                                djVar.ycx(lud.zb(xmlPullParser, k.f40349y), 0.75f);
                                break;
                            case 2:
                                djVar.sya(ycx(xmlPullParser, true));
                                break;
                            case 3:
                                djVar.ok(ycx(xmlPullParser, true));
                                break;
                            case 4:
                                djVar.dj(sya(xmlPullParser));
                                break;
                            case 5:
                                djVar.ea(ycx(xmlPullParser, true));
                                break;
                            case 6:
                                djVar.lt(sya(xmlPullParser));
                                break;
                            case 7:
                                djVar.lud(sya(xmlPullParser));
                                break;
                            case '\b':
                                djVar.zb(ycx(xmlPullParser, true));
                                break;
                            case '\t':
                            case 11:
                                djVar.ycx(lud.zb(xmlPullParser, k.f40349y), 0L);
                                break;
                            case '\n':
                                djVar.ycx(lud.zb(xmlPullParser, k.f40349y), 0.25f);
                                break;
                        }
                    }
                } else if (xmlPullParser.getEventType() == 4) {
                    xmlPullParser.nextTag();
                } else {
                    lud.ycx(xmlPullParser);
                }
            }
        }
    }

    private static void ycx(XmlPullParser xmlPullParser, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar) throws XmlPullParserException, IOException {
        while (true) {
            if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals(k.f40350z)) {
                return;
            }
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                name.getClass();
                if (name.equals(k.A)) {
                    ycxVar.sya(lud.zb(xmlPullParser, k.A));
                } else if (!name.equals(k.B)) {
                    lud.ycx(xmlPullParser);
                } else {
                    ycxVar.ycx().ul(lud.ycx(xmlPullParser, k.B));
                }
            }
        }
    }

    private static List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx(XmlPullParser xmlPullParser, boolean z11) throws XmlPullParserException, IOException {
        return lud.ycx(xmlPullParser, k.f40349y, z11);
    }
}
