package com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx;

import android.content.Context;
import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.io.IOException;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class zb {
    public static com.bytedance.sdk.openadsdk.core.xkz.ycx ycx(Context context, XmlPullParser xmlPullParser, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list, int i5, double d5) throws XmlPullParserException, IOException {
        String name;
        xmlPullParser.require(2, lud.f26481ul, k.f40333g);
        com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.xkz.ycx();
        while (true) {
            if (xmlPullParser.next() == 3 && k.f40333g.equals(xmlPullParser.getName())) {
                ycxVar.ycx().jc(list);
                return ycxVar;
            }
            if (xmlPullParser.getEventType() == 2) {
                name = xmlPullParser.getName();
                name.getClass();
                switch (name) {
                    case "AdVerifications":
                        ycxVar.ycx(dj.ycx(xmlPullParser));
                        context = context;
                        break;
                    case "Creatives":
                        if (TextUtils.isEmpty(ycxVar.ul()) || ycxVar.sya() == null) {
                            while (xmlPullParser.next() != 3) {
                                if (xmlPullParser.getEventType() == 2) {
                                    if (k.f40342r.equals(xmlPullParser.getName())) {
                                        ycx(context, xmlPullParser, ycxVar, i5, d5);
                                    } else {
                                        lud.ycx(xmlPullParser);
                                    }
                                }
                            }
                        } else {
                            lud.ycx(xmlPullParser);
                        }
                        context = context;
                        xmlPullParser = xmlPullParser;
                        i5 = i5;
                        d5 = d5;
                        break;
                    case "Description":
                        ycxVar.zb(lud.zb(xmlPullParser, name));
                        break;
                    case "Error":
                        list.addAll(lud.ycx(xmlPullParser, name));
                        break;
                    case "Extensions":
                        while (true) {
                            if (xmlPullParser.getEventType() == 3 && "Extensions".equals(xmlPullParser.getName())) {
                                context = context;
                                xmlPullParser = xmlPullParser;
                                i5 = i5;
                                d5 = d5;
                                break;
                            } else {
                                xmlPullParser.next();
                                if (xmlPullParser.getEventType() == 2 && "AdVerifications".equals(xmlPullParser.getName())) {
                                    ycxVar.ycx(dj.ycx(xmlPullParser));
                                }
                            }
                        }
                        break;
                    case "AdTitle":
                        ycxVar.ycx(lud.zb(xmlPullParser, name));
                        break;
                    case "Impression":
                        ycxVar.ycx().ycx(lud.ycx(xmlPullParser, name));
                        break;
                    default:
                        lud.ycx(xmlPullParser);
                        context = context;
                        xmlPullParser = xmlPullParser;
                        i5 = i5;
                        d5 = d5;
                        break;
                }
            }
        }
    }

    public static void ycx(Context context, XmlPullParser xmlPullParser, com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar, int i5, double d5) throws XmlPullParserException, IOException {
        while (xmlPullParser.next() != 3) {
            if (xmlPullParser.getEventType() == 2) {
                if (k.f40343s.equals(xmlPullParser.getName()) && TextUtils.isEmpty(ycxVar.ul())) {
                    sya.ycx(xmlPullParser, ycxVar, i5, d5);
                } else if (k.N.equals(xmlPullParser.getName()) && ycxVar.sya() == null) {
                    ycxVar.ycx(ycx.ycx(context, xmlPullParser));
                } else {
                    lud.ycx(xmlPullParser);
                }
            }
        }
    }
}
