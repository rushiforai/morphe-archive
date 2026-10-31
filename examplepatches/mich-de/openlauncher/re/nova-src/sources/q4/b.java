package q4;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.LinearGradient;
import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.SweepGradient;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Base64;
import android.util.Xml;
import c3.r1;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final float[][] f83613a = {new float[]{0.401288f, 0.650173f, -0.051461f}, new float[]{-0.250268f, 1.204414f, 0.045854f}, new float[]{-0.002079f, 0.048952f, 0.953127f}};

    /* renamed from: b, reason: collision with root package name */
    public static final float[][] f83614b = {new float[]{1.8620678f, -1.0112547f, 0.14918678f}, new float[]{0.38752654f, 0.62144744f, -0.00897398f}, new float[]{-0.0158415f, -0.03412294f, 1.0499644f}};

    /* renamed from: c, reason: collision with root package name */
    public static final float[] f83615c = {95.047f, 100.0f, 108.883f};

    /* renamed from: d, reason: collision with root package name */
    public static final float[][] f83616d = {new float[]{0.41233894f, 0.35762063f, 0.18051042f}, new float[]{0.2126f, 0.7152f, 0.0722f}, new float[]{0.01932141f, 0.11916382f, 0.9503448f}};

    /* renamed from: e, reason: collision with root package name */
    public static final Object f83617e = new Object();

    /* renamed from: f, reason: collision with root package name */
    public static Method f83618f;

    /* renamed from: g, reason: collision with root package name */
    public static boolean f83619g;

    /* JADX WARN: Code restructure failed: missing block: B:75:0x0185, code lost:
    
        throw new org.xmlpull.v1.XmlPullParserException(r29.getPositionDescription() + ": <item> tag requires a 'color' attribute and a 'offset' attribute!");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Shader c(Resources resources, XmlResourceParser xmlResourceParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, IOException {
        float f11;
        int color;
        float f12;
        int i5;
        float f13;
        float f14;
        String name = xmlResourceParser.getName();
        if (!name.equals("gradient")) {
            throw new XmlPullParserException(xmlResourceParser.getPositionDescription() + ": invalid gradient color tag " + name);
        }
        TypedArray typedArrayK = fg.a.K(resources, theme, attributeSet, m4.a.f76001d);
        float f15 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "startX") != null ? typedArrayK.getFloat(8, 0.0f) : 0.0f;
        float f16 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "startY") != null ? typedArrayK.getFloat(9, 0.0f) : 0.0f;
        float f17 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "endX") != null ? typedArrayK.getFloat(10, 0.0f) : 0.0f;
        float f18 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "endY") != null ? typedArrayK.getFloat(11, 0.0f) : 0.0f;
        float f19 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "centerX") != null ? typedArrayK.getFloat(3, 0.0f) : 0.0f;
        float f21 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "centerY") != null ? typedArrayK.getFloat(4, 0.0f) : 0.0f;
        int i11 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", TTConst.TRACK_TYPE) != null ? typedArrayK.getInt(2, 0) : 0;
        int color2 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "startColor") != null ? typedArrayK.getColor(0, 0) : 0;
        boolean z11 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "centerColor") != null;
        int color3 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "centerColor") != null ? typedArrayK.getColor(7, 0) : 0;
        if (xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "endColor") != null) {
            f11 = f15;
            color = typedArrayK.getColor(1, 0);
        } else {
            f11 = f15;
            color = 0;
        }
        if (xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "tileMode") != null) {
            f12 = f16;
            i5 = typedArrayK.getInt(6, 0);
        } else {
            f12 = f16;
            i5 = 0;
        }
        float f22 = xmlResourceParser.getAttributeValue("http://schemas.android.com/apk/res/android", "gradientRadius") != null ? typedArrayK.getFloat(5, 0.0f) : 0.0f;
        typedArrayK.recycle();
        int depth = xmlResourceParser.getDepth() + 1;
        ArrayList arrayList = new ArrayList(20);
        float f23 = f22;
        ArrayList arrayList2 = new ArrayList(20);
        while (true) {
            int next = xmlResourceParser.next();
            f13 = f17;
            if (next == 1) {
                f14 = f18;
                break;
            }
            int depth2 = xmlResourceParser.getDepth();
            f14 = f18;
            if (depth2 < depth && next == 3) {
                break;
            }
            if (next == 2 && depth2 <= depth && xmlResourceParser.getName().equals("item")) {
                TypedArray typedArrayK2 = fg.a.K(resources, theme, attributeSet, m4.a.f76002e);
                boolean zHasValue = typedArrayK2.hasValue(0);
                boolean zHasValue2 = typedArrayK2.hasValue(1);
                if (!zHasValue || !zHasValue2) {
                    break;
                }
                int color4 = typedArrayK2.getColor(0, 0);
                float f24 = typedArrayK2.getFloat(1, 0.0f);
                typedArrayK2.recycle();
                arrayList2.add(Integer.valueOf(color4));
                arrayList.add(Float.valueOf(f24));
            }
            f17 = f13;
            f18 = f14;
        }
        r1 r1Var = arrayList2.size() > 0 ? new r1(arrayList2, arrayList) : null;
        if (r1Var == null) {
            r1Var = z11 ? new r1(color2, color3, color) : new r1(color2, color);
        }
        if (i11 != 1) {
            if (i11 != 2) {
                return new LinearGradient(f11, f12, f13, f14, r1Var.f19415a, r1Var.f19416b, i5 != 1 ? i5 != 2 ? Shader.TileMode.CLAMP : Shader.TileMode.MIRROR : Shader.TileMode.REPEAT);
            }
            return new SweepGradient(f19, f21, r1Var.f19415a, r1Var.f19416b);
        }
        if (f23 > 0.0f) {
            return new RadialGradient(f19, f21, f23, r1Var.f19415a, r1Var.f19416b, i5 != 1 ? i5 != 2 ? Shader.TileMode.CLAMP : Shader.TileMode.MIRROR : Shader.TileMode.REPEAT);
        }
        throw new XmlPullParserException("<gradient> tag requires 'gradientRadius' attribute with radial type");
    }

    public static int d(float f11) {
        if (f11 < 1.0f) {
            return -16777216;
        }
        if (f11 > 99.0f) {
            return -1;
        }
        float f12 = (f11 + 16.0f) / 116.0f;
        float f13 = f11 > 8.0f ? f12 * f12 * f12 : f11 / 903.2963f;
        float f14 = f12 * f12 * f12;
        boolean z11 = f14 > 0.008856452f;
        float f15 = z11 ? f14 : ((f12 * 116.0f) - 16.0f) / 903.2963f;
        if (!z11) {
            f14 = ((f12 * 116.0f) - 16.0f) / 903.2963f;
        }
        float[] fArr = f83615c;
        return r4.a.e(f15 * fArr[0], f13 * fArr[1], f14 * fArr[2]);
    }

    public static float e(int i5) {
        float f11 = i5 / 255.0f;
        return (f11 <= 0.04045f ? f11 / 12.92f : (float) Math.pow((f11 + 0.055f) / 1.055f, 2.4000000953674316d)) * 100.0f;
    }

    public static d h(XmlResourceParser xmlResourceParser, Resources resources) throws XmlPullParserException, Resources.NotFoundException, IOException {
        int next;
        do {
            next = xmlResourceParser.next();
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next != 2) {
            throw new XmlPullParserException("No start tag found");
        }
        xmlResourceParser.require(2, null, "font-family");
        if (!xmlResourceParser.getName().equals("font-family")) {
            j(xmlResourceParser);
            return null;
        }
        TypedArray typedArrayObtainAttributes = resources.obtainAttributes(Xml.asAttributeSet(xmlResourceParser), m4.a.f75999b);
        String string = typedArrayObtainAttributes.getString(0);
        String string2 = typedArrayObtainAttributes.getString(5);
        String string3 = typedArrayObtainAttributes.getString(6);
        String string4 = typedArrayObtainAttributes.getString(2);
        int resourceId = typedArrayObtainAttributes.getResourceId(1, 0);
        int integer = typedArrayObtainAttributes.getInteger(3, 1);
        int integer2 = typedArrayObtainAttributes.getInteger(4, 500);
        String string5 = typedArrayObtainAttributes.getString(7);
        typedArrayObtainAttributes.recycle();
        if (string != null && string2 != null && string3 != null) {
            while (xmlResourceParser.next() != 3) {
                j(xmlResourceParser);
            }
            List listI = i(resources, resourceId);
            return new g(new x4.c(string, string2, listI, string3), string4 != null ? new x4.c(string, string2, listI, string4) : null, integer, integer2, string5);
        }
        ArrayList arrayList = new ArrayList();
        while (xmlResourceParser.next() != 3) {
            if (xmlResourceParser.getEventType() == 2) {
                if (xmlResourceParser.getName().equals("font")) {
                    TypedArray typedArrayObtainAttributes2 = resources.obtainAttributes(Xml.asAttributeSet(xmlResourceParser), m4.a.f76000c);
                    int i5 = typedArrayObtainAttributes2.getInt(typedArrayObtainAttributes2.hasValue(8) ? 8 : 1, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE);
                    boolean z11 = 1 == typedArrayObtainAttributes2.getInt(typedArrayObtainAttributes2.hasValue(6) ? 6 : 2, 0);
                    int i11 = typedArrayObtainAttributes2.hasValue(9) ? 9 : 3;
                    String string6 = typedArrayObtainAttributes2.getString(typedArrayObtainAttributes2.hasValue(7) ? 7 : 4);
                    int i12 = typedArrayObtainAttributes2.getInt(i11, 0);
                    int i13 = typedArrayObtainAttributes2.hasValue(5) ? 5 : 0;
                    int resourceId2 = typedArrayObtainAttributes2.getResourceId(i13, 0);
                    String string7 = typedArrayObtainAttributes2.getString(i13);
                    typedArrayObtainAttributes2.recycle();
                    while (xmlResourceParser.next() != 3) {
                        j(xmlResourceParser);
                    }
                    arrayList.add(new f(z11, i5, string7, i12, string6, resourceId2));
                } else {
                    j(xmlResourceParser);
                }
            }
        }
        if (arrayList.isEmpty()) {
            return null;
        }
        return new e((f[]) arrayList.toArray(new f[0]));
    }

    public static List i(Resources resources, int i5) throws Resources.NotFoundException {
        if (i5 == 0) {
            return Collections.EMPTY_LIST;
        }
        TypedArray typedArrayObtainTypedArray = resources.obtainTypedArray(i5);
        try {
            if (typedArrayObtainTypedArray.length() == 0) {
                return Collections.EMPTY_LIST;
            }
            ArrayList arrayList = new ArrayList();
            if (typedArrayObtainTypedArray.getType(0) == 1) {
                for (int i11 = 0; i11 < typedArrayObtainTypedArray.length(); i11++) {
                    int resourceId = typedArrayObtainTypedArray.getResourceId(i11, 0);
                    if (resourceId != 0) {
                        String[] stringArray = resources.getStringArray(resourceId);
                        ArrayList arrayList2 = new ArrayList();
                        for (String str : stringArray) {
                            arrayList2.add(Base64.decode(str, 0));
                        }
                        arrayList.add(arrayList2);
                    }
                }
            } else {
                String[] stringArray2 = resources.getStringArray(i5);
                ArrayList arrayList3 = new ArrayList();
                for (String str2 : stringArray2) {
                    arrayList3.add(Base64.decode(str2, 0));
                }
                arrayList.add(arrayList3);
            }
            return arrayList;
        } finally {
            typedArrayObtainTypedArray.recycle();
        }
    }

    public static void j(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        int i5 = 1;
        while (i5 > 0) {
            int next = xmlPullParser.next();
            if (next == 2) {
                i5++;
            } else if (next == 3) {
                i5--;
            }
        }
    }

    public static float k() {
        return ((float) Math.pow((50.0f + 16.0d) / 116.0d, 3.0d)) * 100.0f;
    }

    public void a(int i5) {
        new Handler(Looper.getMainLooper()).post(new ab.k(this, i5, 9));
    }

    public void b(Typeface typeface) {
        new Handler(Looper.getMainLooper()).post(new kz.c(23, this, typeface));
    }

    public abstract void f(int i5);

    public abstract void g(Typeface typeface);
}
