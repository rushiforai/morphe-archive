package com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx;

import android.content.Context;
import android.text.TextUtils;
import android.util.Xml;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.xkz.jc;
import com.bytedance.sdk.openadsdk.core.xkz.sya.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.ycx.zb;
import com.bytedance.sdk.openadsdk.core.xkz.zb.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public class lud extends com.bytedance.sdk.openadsdk.core.xkz.ycx.zb {

    /* renamed from: ul, reason: collision with root package name */
    public static final String f26481ul = null;

    public lud(Context context, int i5, int i11) {
        super(context, i5, i11);
    }

    private void sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx(com.bytedance.sdk.openadsdk.core.xkz.zb.sya.ycx((tn) null, (List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya>) Collections.singletonList(new sya.ycx(str).ycx()), this.ycx > 0 ? com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.NO_ADS_VAST_RESPONSE : com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.UNDEFINED_ERROR, -1L, (String) null, (String) null), (sya.zb) null);
    }

    public static int zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return Integer.MIN_VALUE;
        }
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "be8+gTuxZfeVRtttjQOzLUk=", "T+EEmxc=", 235);
            return Integer.MIN_VALUE;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x0078 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // com.bytedance.sdk.openadsdk.core.xkz.ycx.zb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public com.bytedance.sdk.openadsdk.core.xkz.ycx ycx(String str, File file, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) throws Throwable {
        InputStream byteArrayInputStream;
        this.lud = 0;
        InputStream inputStream = null;
        if (this.f26488zb == null) {
            this.lud = -1;
            return null;
        }
        if (TextUtils.isEmpty(str) && file == null) {
            this.lud = -2;
            return null;
        }
        try {
            byteArrayInputStream = !TextUtils.isEmpty(str) ? new ByteArrayInputStream(str.getBytes("UTF-8")) : new FileInputStream(file);
            try {
                try {
                    XmlPullParser xmlPullParserNewPullParser = Xml.newPullParser();
                    xmlPullParserNewPullParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
                    xmlPullParserNewPullParser.setInput(byteArrayInputStream, "UTF-8");
                    xmlPullParserNewPullParser.nextTag();
                    com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVarYcx = ycx(xmlPullParserNewPullParser, list);
                    ycx(ycxVarYcx);
                    try {
                        byteArrayInputStream.close();
                        return ycxVarYcx;
                    } catch (IOException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "be8+gTuxZfeVRtttjQOzLUk=", "S+8/hgauX8aTXu9QgA==", 89);
                        return ycxVarYcx;
                    }
                } catch (Exception e11) {
                    e = e11;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "be8+gTuxZfeVRtttjQOzLUk=", "S+8/hgauX8aTXu9QgA==", 82);
                    this.lud = -3;
                    ycx((com.bytedance.sdk.openadsdk.core.xkz.ycx) null);
                    if (byteArrayInputStream != null) {
                        try {
                            byteArrayInputStream.close();
                        } catch (IOException e12) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "be8+gTuxZfeVRtttjQOzLUk=", "S+8/hgauX8aTXu9QgA==", 89);
                        }
                    }
                    return null;
                }
            } catch (Throwable th2) {
                th = th2;
                inputStream = byteArrayInputStream;
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e13) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J5xpJZ0k/CAbUkVw==", "be8+gTuxZfeVRtttjQOzLUk=", "S+8/hgauX8aTXu9QgA==", 89);
                    }
                }
                throw th;
            }
        } catch (Exception e14) {
            e = e14;
            byteArrayInputStream = null;
        } catch (Throwable th3) {
            th = th3;
            if (inputStream != null) {
            }
            throw th;
        }
    }

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        String f26482dj;
        ycx.zb sya;
        String ycx;

        /* renamed from: zb, reason: collision with root package name */
        ycx.EnumC0091ycx f26485zb;
        final List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> lud = new ArrayList();

        /* renamed from: lt, reason: collision with root package name */
        final List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> f26483lt = new ArrayList();

        /* renamed from: ul, reason: collision with root package name */
        float f26484ul = Float.MIN_VALUE;

        public ycx() {
        }

        public void ycx(String str, ycx.EnumC0091ycx enumC0091ycx, ycx.zb zbVar) {
            this.ycx = str;
            this.f26485zb = enumC0091ycx;
            this.sya = zbVar;
        }

        public void zb(String str) {
            this.f26483lt.add(new sya.ycx(str).ycx());
        }

        public void ycx(String str) {
            this.lud.add(new sya.ycx(str).ycx());
        }

        public ycx(String str, ycx.EnumC0091ycx enumC0091ycx, ycx.zb zbVar) {
            ycx(str, enumC0091ycx, zbVar);
        }
    }

    public static String zb(XmlPullParser xmlPullParser, String str) throws XmlPullParserException, IOException {
        String strTrim;
        String str2 = f26481ul;
        xmlPullParser.require(2, str2, str);
        if (xmlPullParser.next() == 4) {
            strTrim = xmlPullParser.getText().trim();
            xmlPullParser.nextTag();
        } else {
            strTrim = b.f42142b;
        }
        xmlPullParser.require(3, str2, str);
        return strTrim;
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x00d2, code lost:
    
        continue;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1 */
    /* JADX WARN: Type inference failed for: r16v2, types: [com.bytedance.sdk.openadsdk.core.xkz.ycx] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private com.bytedance.sdk.openadsdk.core.xkz.ycx zb(XmlPullParser xmlPullParser, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) throws Throwable {
        ?? r16;
        String name;
        File file = null;
        if (this.ycx >= 5) {
            ycx(xmlPullParser);
            return null;
        }
        com.bytedance.sdk.openadsdk.core.xkz.dj djVar = new com.bytedance.sdk.openadsdk.core.xkz.dj();
        String str = null;
        com.bytedance.sdk.openadsdk.core.xkz.sya syaVarYcx = null;
        Set<jc> setYcx = null;
        while (true) {
            if (xmlPullParser.getEventType() == 3 && k.f40334h.equals(xmlPullParser.getName())) {
                com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVarYcx = ycx(str, file, list);
                if (ycxVarYcx != null) {
                    if (ycxVarYcx.sya() == null) {
                        ycxVarYcx.ycx(syaVarYcx);
                    }
                    ycxVarYcx.ycx().ycx(djVar);
                    if (setYcx != null) {
                        ycxVarYcx.ycx(setYcx);
                    }
                }
                return ycxVarYcx;
            }
            xmlPullParser.next();
            if (xmlPullParser.getEventType() == 2) {
                name = xmlPullParser.getName();
                name.getClass();
                r16 = file;
                switch (name) {
                    case "VASTAdTagURI":
                        String strYcx = ycx(zb(xmlPullParser, k.f40335i), list);
                        if (TextUtils.isEmpty(strYcx)) {
                            ycx(xmlPullParser, k.f40334h, 3);
                            this.lud = -2;
                            return r16;
                        }
                        str = strYcx;
                        continue;
                    case "Error":
                        list.add(new sya.ycx(zb(xmlPullParser, k.f40331e)).ycx());
                        continue;
                    case "TrackingEvents":
                        sya.ycx(xmlPullParser, djVar);
                        continue;
                    case "CompanionAds":
                        syaVarYcx = com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.ycx.ycx(this.f26488zb, xmlPullParser);
                        continue;
                    case "ClickTracking":
                        djVar.ul(ycx(xmlPullParser, k.B));
                        continue;
                    case "Impression":
                        djVar.ycx(ycx(xmlPullParser, name));
                        continue;
                }
                while (true) {
                    if (xmlPullParser.getEventType() != 3 || !"Extensions".equals(xmlPullParser.getName())) {
                        xmlPullParser.next();
                        if (xmlPullParser.getEventType() == 2 && "AdVerifications".equals(xmlPullParser.getName())) {
                            setYcx = dj.ycx(xmlPullParser);
                        }
                    }
                }
            } else {
                r16 = file;
            }
            file = r16;
        }
    }

    private void ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar) {
        if (this.f26487lt == null) {
            this.f26487lt = new zb.ycx();
        }
        zb.ycx ycxVar2 = this.f26487lt;
        ycxVar2.ycx = this.lud;
        ycxVar2.f26489zb = this.ycx;
        if (ycxVar != null) {
            ycxVar2.sya = ycxVar.ycx().f26420zb.size() <= 0;
        }
    }

    private com.bytedance.sdk.openadsdk.core.xkz.ycx ycx(XmlPullParser xmlPullParser, List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list) throws Throwable {
        XmlPullParser xmlPullParser2;
        List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list2;
        XmlPullParser xmlPullParser3;
        List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> list3;
        xmlPullParser.require(2, f26481ul, "VAST");
        boolean z11 = false;
        String strZb = null;
        while (xmlPullParser.next() != 1) {
            if (xmlPullParser.getEventType() == 2) {
                String name = xmlPullParser.getName();
                if (k.f40331e.equals(name)) {
                    strZb = zb(xmlPullParser, name);
                } else {
                    if (k.f40332f.equals(name)) {
                        if (ycx(xmlPullParser.getAttributeValue(f26481ul, "sequence"))) {
                            while (true) {
                                if (xmlPullParser.next() == 3 && k.f40332f.equals(xmlPullParser.getName())) {
                                    xmlPullParser2 = xmlPullParser;
                                    list2 = list;
                                    z11 = true;
                                    break;
                                }
                                if (xmlPullParser.getEventType() == 2) {
                                    String name2 = xmlPullParser.getName();
                                    if (k.f40333g.equals(name2)) {
                                        xmlPullParser3 = xmlPullParser;
                                        list3 = list;
                                        com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVarYcx = zb.ycx(this.f26488zb, xmlPullParser3, list3, this.sya, this.f26486dj);
                                        if (ycxVarYcx != null) {
                                            if (!TextUtils.isEmpty(ycxVarYcx.ul())) {
                                                return ycxVarYcx;
                                            }
                                            this.lud = -6;
                                            return null;
                                        }
                                    } else {
                                        xmlPullParser3 = xmlPullParser;
                                        list3 = list;
                                        if (k.f40334h.equals(name2)) {
                                            com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVarZb = zb(xmlPullParser3, list3);
                                            if (ycxVarZb != null) {
                                                return ycxVarZb;
                                            }
                                        } else {
                                            ycx(xmlPullParser3);
                                        }
                                    }
                                    xmlPullParser = xmlPullParser3;
                                    list = list3;
                                }
                            }
                        } else {
                            ycx(xmlPullParser);
                            z11 = true;
                        }
                    } else {
                        xmlPullParser2 = xmlPullParser;
                        list2 = list;
                        ycx(xmlPullParser2);
                    }
                    xmlPullParser = xmlPullParser2;
                    list = list2;
                }
            }
        }
        if (!z11) {
            this.lud = -4;
            sya(strZb);
        }
        if (this.lud == 0) {
            this.lud = -5;
        }
        return null;
    }

    public static List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx(XmlPullParser xmlPullParser, String str) throws XmlPullParserException, IOException {
        return ycx(xmlPullParser, str, false);
    }

    public static List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx(XmlPullParser xmlPullParser, String str, boolean z11) throws XmlPullParserException, IOException {
        return ycx(zb(xmlPullParser, str), z11);
    }

    public static void ycx(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (xmlPullParser.getEventType() != 2) {
            throw new IllegalStateException();
        }
        int i5 = 1;
        while (i5 != 0) {
            int next = xmlPullParser.next();
            if (next == 2) {
                i5++;
            } else if (next == 3) {
                i5--;
            }
        }
    }

    public static void ycx(XmlPullParser xmlPullParser, String str, int i5) throws XmlPullParserException, IOException {
        while (xmlPullParser.getEventType() != 1) {
            if (str.equals(xmlPullParser.getName()) && xmlPullParser.getEventType() == i5) {
                return;
            } else {
                xmlPullParser.next();
            }
        }
    }

    private static List<com.bytedance.sdk.openadsdk.core.xkz.zb.sya> ycx(String str, boolean z11) {
        if (TextUtils.isEmpty(str)) {
            return new ArrayList();
        }
        return Collections.singletonList(new sya.ycx(str).ycx(z11).ycx());
    }
}
