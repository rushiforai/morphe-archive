package com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx;

import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.openadsdk.core.xkz.jc;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class dj {
    public static Set<jc> ycx(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        jc jcVarYcx;
        if (xmlPullParser == null) {
            return new HashSet();
        }
        HashSet hashSet = new HashSet();
        while (xmlPullParser.next() != 3) {
            if (xmlPullParser.getEventType() == 2) {
                if ("Verification".equals(xmlPullParser.getName())) {
                    String attributeValue = xmlPullParser.getAttributeValue(lud.f26481ul, "vendor");
                    String strZb = null;
                    String strZb2 = null;
                    String strZb3 = null;
                    while (true) {
                        if (xmlPullParser.getEventType() != 3 || !"Verification".equals(xmlPullParser.getName())) {
                            xmlPullParser.next();
                            if (xmlPullParser.getEventType() == 2) {
                                String name = xmlPullParser.getName();
                                name.getClass();
                                switch (name) {
                                    case "Tracking":
                                        if (!"verificationNotExecuted".equals(xmlPullParser.getAttributeValue(lud.f26481ul, DatabaseConstants.EVENT_FIELD))) {
                                            break;
                                        } else {
                                            strZb3 = lud.zb(xmlPullParser, k.f40349y);
                                            break;
                                        }
                                    case "JavaScriptResource":
                                        if (!"omid".equals(xmlPullParser.getAttributeValue(lud.f26481ul, "apiFramework"))) {
                                            break;
                                        } else {
                                            strZb = lud.zb(xmlPullParser, "JavaScriptResource");
                                            break;
                                        }
                                    case "VerificationParameters":
                                        strZb2 = lud.zb(xmlPullParser, "VerificationParameters");
                                        break;
                                }
                            }
                        } else if (!TextUtils.isEmpty(strZb) && (jcVarYcx = jc.ycx(strZb, attributeValue, strZb2, strZb3)) != null) {
                            hashSet.add(jcVarYcx);
                        }
                    }
                } else {
                    lud.ycx(xmlPullParser);
                }
            }
        }
        return hashSet;
    }
}
