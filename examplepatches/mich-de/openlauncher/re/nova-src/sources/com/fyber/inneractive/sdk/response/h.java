package com.fyber.inneractive.sdk.response;

import android.util.Xml;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.s0;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f31066a;

    /* renamed from: b, reason: collision with root package name */
    public String f31067b;

    public h(String str) throws Exception {
        this.f31066a = false;
        try {
            a(str);
            this.f31066a = true;
            IAlog.a("parser: Parsing finished. parser is ready", new Object[0]);
        } catch (Exception e3) {
            IAlog.b("Error parsing Ad XML: %s", e3.getMessage());
            throw e3;
        }
    }

    public final void a(String str) throws XmlPullParserException, IOException, NumberFormatException {
        String text;
        IAlog.a("Start reading Response", new Object[0]);
        XmlPullParser xmlPullParserNewPullParser = Xml.newPullParser();
        xmlPullParserNewPullParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
        xmlPullParserNewPullParser.setInput(new StringReader(str));
        xmlPullParserNewPullParser.nextTag();
        xmlPullParserNewPullParser.require(2, null, "tns:Response");
        while (xmlPullParserNewPullParser.next() != 3) {
            if (xmlPullParserNewPullParser.getEventType() == 2) {
                if (xmlPullParserNewPullParser.getName().equals("tns:Ad")) {
                    xmlPullParserNewPullParser.require(2, null, "tns:Ad");
                    IAlog.a("Start reading Ad", new Object[0]);
                    if (xmlPullParserNewPullParser.next() == 4) {
                        text = xmlPullParserNewPullParser.getText();
                        xmlPullParserNewPullParser.nextTag();
                    } else {
                        IAlog.f("No text: %s", xmlPullParserNewPullParser.getName());
                        text = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    String strTrim = text.trim();
                    IAlog.e("Ad content: %s", strTrim);
                    if (strTrim == null) {
                        strTrim = null;
                    } else {
                        s0 s0Var = s0.f31221b;
                        s0Var.getClass();
                        int iIndexOf = strTrim.indexOf(38);
                        if (iIndexOf >= 0) {
                            StringWriter stringWriter = new StringWriter((int) ((strTrim.length() * 0.1d) + strTrim.length()));
                            try {
                                s0Var.a(stringWriter, strTrim, iIndexOf);
                            } catch (IOException unused) {
                            }
                            strTrim = stringWriter.toString();
                        }
                    }
                    this.f31067b = strTrim;
                } else {
                    if (xmlPullParserNewPullParser.getEventType() != 2) {
                        throw new IllegalStateException();
                    }
                    int i5 = 1;
                    while (i5 != 0) {
                        int next = xmlPullParserNewPullParser.next();
                        if (next == 2) {
                            i5++;
                        } else if (next == 3) {
                            i5--;
                        }
                    }
                }
            }
        }
    }
}
