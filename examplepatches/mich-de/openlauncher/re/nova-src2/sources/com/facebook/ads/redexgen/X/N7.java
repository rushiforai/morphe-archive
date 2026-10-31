package com.facebook.ads.redexgen.X;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: assets/audience_network/classes.dex */
public abstract class N7 {
    public static String A00(XmlPullParser xmlPullParser, String str) {
        int attributeCount = xmlPullParser.getAttributeCount();
        for (int i5 = 0; i5 < attributeCount; i5++) {
            if (xmlPullParser.getAttributeName(i5).equals(str)) {
                return xmlPullParser.getAttributeValue(i5);
            }
        }
        return null;
    }

    public static boolean A01(XmlPullParser xmlPullParser) throws XmlPullParserException {
        return xmlPullParser.getEventType() == 3;
    }

    public static boolean A02(XmlPullParser xmlPullParser) throws XmlPullParserException {
        return xmlPullParser.getEventType() == 2;
    }

    public static boolean A03(XmlPullParser xmlPullParser, String str) throws XmlPullParserException {
        return A01(xmlPullParser) && xmlPullParser.getName().equals(str);
    }

    public static boolean A04(XmlPullParser xmlPullParser, String str) throws XmlPullParserException {
        return A02(xmlPullParser) && xmlPullParser.getName().equals(str);
    }
}
