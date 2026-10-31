package com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx;

import android.content.Context;
import android.graphics.Point;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import com.bytedance.sdk.openadsdk.core.xkz.sya.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.lud;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.io.IOException;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class ycx {
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static com.bytedance.sdk.openadsdk.core.xkz.sya ycx(Context context, XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        float f11;
        com.bytedance.sdk.openadsdk.core.xkz.sya syaVar;
        lud.ycx ycxVar;
        int i5;
        char c11;
        if (context == null) {
            lud.ycx(xmlPullParser);
            return null;
        }
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        int i11 = displayMetrics.widthPixels;
        int i12 = displayMetrics.heightPixels;
        float f12 = displayMetrics.density;
        int i13 = (int) (i11 / f12);
        int i14 = (int) (i12 / f12);
        float f13 = Float.MIN_VALUE;
        com.bytedance.sdk.openadsdk.core.xkz.sya syaVar2 = null;
        while (true) {
            int i15 = 3;
            if (xmlPullParser.getEventType() == 3 && xmlPullParser.getName().equals(k.N)) {
                return syaVar2;
            }
            xmlPullParser.next();
            int i16 = 2;
            if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(k.O)) {
                String str = lud.f26481ul;
                int iZb = lud.zb(xmlPullParser.getAttributeValue(str, "width"));
                int iZb2 = lud.zb(xmlPullParser.getAttributeValue(str, "height"));
                if (iZb < 300 || iZb2 < 250) {
                    f11 = f13;
                    syaVar = syaVar2;
                    lud.ycx(xmlPullParser);
                    f13 = f11;
                    syaVar2 = syaVar;
                } else {
                    lud.ycx ycxVar2 = new lud.ycx();
                    while (true) {
                        if (xmlPullParser.getEventType() != i15 || !xmlPullParser.getName().equals(k.O)) {
                            int i17 = iZb2;
                            int i18 = iZb;
                            xmlPullParser.next();
                            if (xmlPullParser.getEventType() == i16) {
                                String name = xmlPullParser.getName();
                                name.getClass();
                                float f14 = f13;
                                com.bytedance.sdk.openadsdk.core.xkz.sya syaVar3 = syaVar2;
                                char c12 = 65535;
                                switch (name.hashCode()) {
                                    case -375340334:
                                        if (name.equals(k.G)) {
                                            c11 = 0;
                                            c12 = c11;
                                            break;
                                        }
                                        break;
                                    case -348198615:
                                        if (name.equals(k.P)) {
                                            c11 = 1;
                                            c12 = c11;
                                            break;
                                        }
                                        break;
                                    case 611554000:
                                        if (name.equals(k.f40348x)) {
                                            c12 = 2;
                                            break;
                                        }
                                        break;
                                    case 676623548:
                                        if (name.equals(k.F)) {
                                            c12 = 3;
                                            break;
                                        }
                                        break;
                                    case 1877773523:
                                        if (name.equals(k.Q)) {
                                            c11 = 4;
                                            c12 = c11;
                                            break;
                                        }
                                        break;
                                    case 1928285401:
                                        if (name.equals(k.H)) {
                                            c11 = 5;
                                            c12 = c11;
                                            break;
                                        }
                                        break;
                                }
                                switch (c12) {
                                    case 0:
                                        lud.ycx ycxVar3 = ycxVar2;
                                        i5 = 2;
                                        Point pointYcx = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.ycx(context, i18, i17, ycx.zb.HTML_RESOURCE);
                                        int i19 = pointYcx.x;
                                        int i21 = pointYcx.y;
                                        ycx.zb zbVar = ycx.zb.IFRAME_RESOURCE;
                                        ycx.EnumC0091ycx enumC0091ycx = ycx.EnumC0091ycx.NONE;
                                        float fYcx = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx(i13, i14, i19, i21, zbVar, enumC0091ycx);
                                        String strZb = lud.zb(xmlPullParser, k.G);
                                        if (!TextUtils.isEmpty(strZb) && fYcx > ycxVar3.f26484ul && fYcx > f14) {
                                            ycxVar3.f26484ul = fYcx;
                                            ycxVar3.ycx(strZb, enumC0091ycx, zbVar);
                                            ycxVar2 = ycxVar3;
                                            i16 = i5;
                                            iZb = i18;
                                            iZb2 = i17;
                                            f13 = f14;
                                            syaVar2 = syaVar3;
                                            i15 = 3;
                                            break;
                                        } else {
                                            lud.ycx(xmlPullParser, k.G, 3);
                                            ycxVar2 = ycxVar3;
                                            i15 = 3;
                                            i16 = 2;
                                            iZb = i18;
                                            iZb2 = i17;
                                            f13 = f14;
                                            syaVar2 = syaVar3;
                                            break;
                                        }
                                    case 1:
                                        i5 = 2;
                                        ycxVar2.f26482dj = lud.zb(xmlPullParser, k.P);
                                        i16 = i5;
                                        iZb = i18;
                                        iZb2 = i17;
                                        f13 = f14;
                                        syaVar2 = syaVar3;
                                        i15 = 3;
                                        break;
                                    case 2:
                                        ycxVar = ycxVar2;
                                        while (true) {
                                            if (xmlPullParser.next() == 3 && xmlPullParser.getName().equals(k.f40348x)) {
                                                iZb = i18;
                                                ycxVar2 = ycxVar;
                                                iZb2 = i17;
                                                f13 = f14;
                                                syaVar2 = syaVar3;
                                                i15 = 3;
                                                i16 = 2;
                                                break;
                                            } else if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equals(k.f40349y)) {
                                                ycxVar.zb(lud.zb(xmlPullParser, k.f40349y));
                                            }
                                        }
                                        break;
                                    case 3:
                                        ycxVar = ycxVar2;
                                        ycx.EnumC0091ycx enumC0091ycx2 = ycx.EnumC0091ycx.NONE;
                                        String lowerCase = xmlPullParser.getAttributeValue(lud.f26481ul, "creativeType").toLowerCase();
                                        Set<String> set = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.ycx;
                                        ycx.EnumC0091ycx enumC0091ycx3 = set.contains(lowerCase) ? ycx.EnumC0091ycx.IMAGE : ycx.EnumC0091ycx.JAVASCRIPT;
                                        ycx.zb zbVar2 = ycx.zb.STATIC_RESOURCE;
                                        Point pointYcx2 = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.ycx(context, i18, i17, zbVar2);
                                        float fYcx2 = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx(i13, i14, pointYcx2.x, pointYcx2.y, zbVar2, enumC0091ycx3);
                                        String strZb2 = (set.contains(lowerCase) || com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.f26453zb.contains(lowerCase)) ? lud.zb(xmlPullParser, k.F) : null;
                                        if (fYcx2 >= ycxVar.f26484ul && fYcx2 > f14 && !TextUtils.isEmpty(strZb2)) {
                                            ycxVar.f26484ul = fYcx2;
                                            ycxVar.ycx(strZb2, enumC0091ycx3, zbVar2);
                                            iZb = i18;
                                            ycxVar2 = ycxVar;
                                            iZb2 = i17;
                                            f13 = f14;
                                            syaVar2 = syaVar3;
                                            i15 = 3;
                                            i16 = 2;
                                            break;
                                        } else {
                                            lud.ycx(xmlPullParser, k.F, 3);
                                            iZb = i18;
                                            ycxVar2 = ycxVar;
                                            iZb2 = i17;
                                            f13 = f14;
                                            i16 = 2;
                                            i15 = 3;
                                            syaVar2 = syaVar3;
                                            break;
                                        }
                                    case 4:
                                        ycxVar2.ycx(lud.zb(xmlPullParser, k.Q));
                                        iZb = i18;
                                        iZb2 = i17;
                                        f13 = f14;
                                        syaVar2 = syaVar3;
                                        i15 = 3;
                                        i16 = 2;
                                        break;
                                    case 5:
                                        ycx.zb zbVar3 = ycx.zb.HTML_RESOURCE;
                                        Point pointYcx3 = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx.ycx(context, i18, i17, zbVar3);
                                        int i22 = pointYcx3.x;
                                        int i23 = pointYcx3.y;
                                        ycx.EnumC0091ycx enumC0091ycx4 = ycx.EnumC0091ycx.NONE;
                                        ycxVar = ycxVar2;
                                        float fYcx3 = com.bytedance.sdk.openadsdk.core.xkz.sya.ycx(i13, i14, i22, i23, zbVar3, enumC0091ycx4);
                                        String strZb3 = lud.zb(xmlPullParser, k.H);
                                        if (!TextUtils.isEmpty(strZb3) && fYcx3 > ycxVar.f26484ul && fYcx3 > f14) {
                                            ycxVar.f26484ul = fYcx3;
                                            ycxVar.ycx(strZb3, enumC0091ycx4, zbVar3);
                                            iZb = i18;
                                            ycxVar2 = ycxVar;
                                            iZb2 = i17;
                                            f13 = f14;
                                            syaVar2 = syaVar3;
                                            i15 = 3;
                                            i16 = 2;
                                            break;
                                        } else {
                                            lud.ycx(xmlPullParser, k.H, 3);
                                            iZb = i18;
                                            ycxVar2 = ycxVar;
                                            iZb2 = i17;
                                            f13 = f14;
                                            syaVar2 = syaVar3;
                                            i16 = 2;
                                            i15 = 3;
                                            break;
                                        }
                                        break;
                                    default:
                                        lud.ycx(xmlPullParser);
                                        ycxVar = ycxVar2;
                                        iZb = i18;
                                        ycxVar2 = ycxVar;
                                        iZb2 = i17;
                                        f13 = f14;
                                        syaVar2 = syaVar3;
                                        i15 = 3;
                                        i16 = 2;
                                        break;
                                }
                            } else {
                                iZb = i18;
                                iZb2 = i17;
                            }
                        } else if (!TextUtils.isEmpty(ycxVar2.ycx) && ycxVar2.f26484ul >= f13) {
                            com.bytedance.sdk.openadsdk.core.xkz.sya syaVar4 = new com.bytedance.sdk.openadsdk.core.xkz.sya(iZb, iZb2, ycxVar2.f26485zb, ycxVar2.sya, ycxVar2.ycx, ycxVar2.lud, ycxVar2.f26483lt, ycxVar2.f26482dj);
                            f13 = ycxVar2.f26484ul;
                            syaVar2 = syaVar4;
                        }
                    }
                }
            } else {
                f11 = f13;
                syaVar = syaVar2;
                f13 = f11;
                syaVar2 = syaVar;
            }
        }
    }
}
