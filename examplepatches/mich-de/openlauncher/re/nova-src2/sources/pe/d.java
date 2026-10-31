package pe;

import ai.k0;
import com.google.android.exoplayer2.ParserException;
import java.io.IOException;
import java.io.StringReader;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;
import xk.l0;
import xk.r2;
import xk.s0;
import xk.v0;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final String[] f82551a = {"Camera:MotionPhoto", "GCamera:MotionPhoto", "Camera:MicroVideo", "GCamera:MicroVideo"};

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f82552b = {"Camera:MotionPhotoPresentationTimestampUs", "GCamera:MotionPhotoPresentationTimestampUs", "Camera:MicroVideoPresentationTimestampUs", "GCamera:MicroVideoPresentationTimestampUs"};

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f82553c = {"Camera:MicroVideoOffset", "GCamera:MicroVideoOffset"};

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00c8, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static k0 a(String str) throws XmlPullParserException, IOException, NumberFormatException {
        XmlPullParser xmlPullParserNewPullParser = XmlPullParserFactory.newInstance().newPullParser();
        xmlPullParserNewPullParser.setInput(new StringReader(str));
        xmlPullParserNewPullParser.next();
        if (!wf.a.x(xmlPullParserNewPullParser, "x:xmpmeta")) {
            throw ParserException.a("Couldn't find xmp metadata", null);
        }
        l0 l0Var = v0.f96030b;
        r2 r2VarB = r2.f96007e;
        long j11 = -9223372036854775807L;
        loop0: while (true) {
            xmlPullParserNewPullParser.next();
            if (wf.a.x(xmlPullParserNewPullParser, "rdf:Description")) {
                int i5 = 0;
                int i11 = 0;
                while (true) {
                    if (i11 >= 4) {
                        break loop0;
                    }
                    String strT = wf.a.t(xmlPullParserNewPullParser, f82551a[i11]);
                    if (strT == null) {
                        i11++;
                    } else {
                        if (Integer.parseInt(strT) != 1) {
                            break;
                        }
                        int i12 = 0;
                        while (true) {
                            if (i12 >= 4) {
                                break;
                            }
                            String strT2 = wf.a.t(xmlPullParserNewPullParser, f82552b[i12]);
                            if (strT2 != null) {
                                j11 = Long.parseLong(strT2);
                                if (j11 == -1) {
                                    break;
                                }
                            } else {
                                i12++;
                            }
                        }
                        j11 = -9223372036854775807L;
                        while (true) {
                            if (i5 >= 2) {
                                l0 l0Var2 = v0.f96030b;
                                r2VarB = r2.f96007e;
                                break;
                            }
                            String strT3 = wf.a.t(xmlPullParserNewPullParser, f82553c[i5]);
                            if (strT3 != null) {
                                r2VarB = v0.t(new b("image/jpeg", 0L, 0L), new b("video/mp4", Long.parseLong(strT3), 0L));
                                break;
                            }
                            i5++;
                        }
                    }
                }
            } else if (wf.a.x(xmlPullParserNewPullParser, "Container:Directory")) {
                r2VarB = b(xmlPullParserNewPullParser, "Container", "Item");
            } else if (wf.a.x(xmlPullParserNewPullParser, "GContainer:Directory")) {
                r2VarB = b(xmlPullParserNewPullParser, "GContainer", "GContainerItem");
            }
            if (wf.a.w(xmlPullParserNewPullParser, "x:xmpmeta")) {
                if (!r2VarB.isEmpty()) {
                    return new k0(j11, r2VarB, 8);
                }
            }
        }
    }

    public static r2 b(XmlPullParser xmlPullParser, String str, String str2) throws XmlPullParserException, IOException {
        s0 s0VarL = v0.l();
        String strConcat = str.concat(":Item");
        String strConcat2 = str.concat(":Directory");
        do {
            xmlPullParser.next();
            if (wf.a.x(xmlPullParser, strConcat)) {
                String strConcat3 = str2.concat(":Mime");
                String strConcat4 = str2.concat(":Semantic");
                String strConcat5 = str2.concat(":Length");
                String strConcat6 = str2.concat(":Padding");
                String strT = wf.a.t(xmlPullParser, strConcat3);
                String strT2 = wf.a.t(xmlPullParser, strConcat4);
                String strT3 = wf.a.t(xmlPullParser, strConcat5);
                String strT4 = wf.a.t(xmlPullParser, strConcat6);
                if (strT == null || strT2 == null) {
                    return r2.f96007e;
                }
                s0VarL.a(new b(strT, strT3 != null ? Long.parseLong(strT3) : 0L, strT4 != null ? Long.parseLong(strT4) : 0L));
            }
        } while (!wf.a.w(xmlPullParser, strConcat2));
        return s0VarL.f();
    }
}
