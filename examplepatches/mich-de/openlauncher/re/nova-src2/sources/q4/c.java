package q4;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.graphics.Color;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.util.StateSet;
import android.util.TypedValue;
import android.util.Xml;
import java.io.IOException;
import java.lang.reflect.Array;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f83620a = new ThreadLocal();

    public static ColorStateList a(Resources resources, XmlResourceParser xmlResourceParser, Resources.Theme theme) throws XmlPullParserException, IOException {
        int next;
        AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xmlResourceParser);
        do {
            next = xmlResourceParser.next();
            if (next == 2) {
                break;
            }
        } while (next != 1);
        if (next == 2) {
            return b(resources, xmlResourceParser, attributeSetAsAttributeSet, theme);
        }
        throw new XmlPullParserException("No start tag found");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0092  */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v2, types: [android.content.res.Resources] */
    /* JADX WARN: Type inference failed for: r0v37 */
    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r1v40, types: [java.lang.Object, java.lang.Object[]] */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r9v19 */
    /* JADX WARN: Type inference failed for: r9v20 */
    /* JADX WARN: Type inference failed for: r9v5, types: [android.content.res.TypedArray] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ColorStateList b(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) throws XmlPullParserException, Resources.NotFoundException, IOException {
        int depth;
        int color;
        int[] iArr;
        int i5;
        int iD;
        float f11;
        int i11;
        float fCbrt;
        float f12;
        float f13;
        TypedValue typedValue;
        ?? r02 = resources;
        AttributeSet attributeSet2 = attributeSet;
        Resources.Theme theme2 = theme;
        String name = xmlPullParser.getName();
        if (!name.equals("selector")) {
            throw new XmlPullParserException(xmlPullParser.getPositionDescription() + ": invalid color state list tag " + name);
        }
        boolean z11 = 1;
        int depth2 = xmlPullParser.getDepth() + 1;
        int[][] iArr2 = new int[20][];
        int[] iArr3 = new int[20];
        int i12 = 0;
        int i13 = 0;
        while (true) {
            int next = xmlPullParser.next();
            if (next == z11 || ((depth = xmlPullParser.getDepth()) < depth2 && next == 3)) {
                break;
            }
            if (next == 2 && depth <= depth2 && xmlPullParser.getName().equals("item")) {
                int[] iArr4 = m4.a.f75998a;
                ?? ObtainAttributes = theme2 == null ? r02.obtainAttributes(attributeSet2, iArr4) : theme2.obtainStyledAttributes(attributeSet2, iArr4, i12, i12);
                int resourceId = ObtainAttributes.getResourceId(i12, -1);
                if (resourceId != -1) {
                    ThreadLocal threadLocal = f83620a;
                    TypedValue typedValue2 = (TypedValue) threadLocal.get();
                    if (typedValue2 == null) {
                        typedValue = new TypedValue();
                        threadLocal.set(typedValue);
                    } else {
                        typedValue = typedValue2;
                    }
                    r02.getValue(resourceId, typedValue, z11);
                    int i14 = typedValue.type;
                    if (i14 < 28 || i14 > 31) {
                        try {
                            color = a(r02, r02.getXml(resourceId), theme2).getDefaultColor();
                        } catch (Exception unused) {
                            color = ObtainAttributes.getColor(i12, -65281);
                        }
                    } else {
                        color = ObtainAttributes.getColor(i12, -65281);
                    }
                    float f14 = ObtainAttributes.hasValue(z11) ? ObtainAttributes.getFloat(z11, 1.0f) : ObtainAttributes.hasValue(3) ? ObtainAttributes.getFloat(3, 1.0f) : 1.0f;
                    char c11 = z11;
                    float f15 = (Build.VERSION.SDK_INT < 31 || !ObtainAttributes.hasValue(2)) ? ObtainAttributes.getFloat(4, -1.0f) : ObtainAttributes.getFloat(2, -1.0f);
                    ObtainAttributes.recycle();
                    int attributeCount = attributeSet2.getAttributeCount();
                    int[] iArr5 = new int[attributeCount];
                    int i15 = i12;
                    int i16 = i15;
                    while (i15 < attributeCount) {
                        int attributeNameResource = attributeSet2.getAttributeNameResource(i15);
                        if (attributeNameResource != 16843173 && attributeNameResource != 16843551 && attributeNameResource != 2130968667 && attributeNameResource != 2130969427) {
                            int i17 = i16 + 1;
                            if (!attributeSet2.getAttributeBooleanValue(i15, false)) {
                                attributeNameResource = -attributeNameResource;
                            }
                            iArr5[i16] = attributeNameResource;
                            i16 = i17;
                        }
                        i15++;
                    }
                    int[] iArrTrimStateSet = StateSet.trimStateSet(iArr5, i16);
                    float f16 = 0.0f;
                    char c12 = (f15 < 0.0f || f15 > 100.0f) ? (char) 0 : c11;
                    if (f14 == 1.0f && c12 == 0) {
                        iArr = iArrTrimStateSet;
                        i5 = depth2;
                    } else {
                        int iF = v4.a.f((int) ((Color.alpha(color) * f14) + 0.5f), 0, 255);
                        if (c12 != 0) {
                            a aVarA = a.a(color);
                            float f17 = aVarA.f83607a;
                            float f18 = aVarA.f83608b;
                            l lVar = l.f83641k;
                            if (f18 < 1.0d || Math.round(f15) <= 0.0d || Math.round(f15) >= 100.0d) {
                                iArr = iArrTrimStateSet;
                                i5 = depth2;
                                iD = b.d(f15);
                            } else {
                                float fMin = f17 < 0.0f ? 0.0f : Math.min(360.0f, f17);
                                float fZ = f18;
                                char c13 = c11;
                                a aVar = null;
                                while (true) {
                                    if (Math.abs(f16 - f18) >= 0.4f) {
                                        float f19 = 1000.0f;
                                        iArr = iArrTrimStateSet;
                                        float f21 = 0.0f;
                                        float f22 = 100.0f;
                                        float f23 = 1000.0f;
                                        a aVar2 = null;
                                        while (true) {
                                            if (Math.abs(f21 - f22) <= 0.01f) {
                                                i5 = depth2;
                                                f11 = f15;
                                                break;
                                            }
                                            float fZ2 = a2.c.z(f22, f21, 2.0f, f21);
                                            float f24 = f22;
                                            int iC = a.b(fZ2, fZ, fMin).c(l.f83641k);
                                            float fE = b.e(Color.red(iC));
                                            float fE2 = b.e(Color.green(iC));
                                            float fE3 = b.e(Color.blue(iC));
                                            float[] fArr = b.f83616d[c11];
                                            float f25 = ((fE3 * fArr[2]) + ((fE2 * fArr[c11]) + (fE * fArr[0]))) / 100.0f;
                                            if (f25 <= 0.008856452f) {
                                                fCbrt = f25 * 903.2963f;
                                                i11 = iC;
                                            } else {
                                                i11 = iC;
                                                fCbrt = (((float) Math.cbrt(f25)) * 116.0f) - 16.0f;
                                            }
                                            float fAbs = Math.abs(f15 - fCbrt);
                                            if (fAbs < 0.2f) {
                                                a aVarA2 = a.a(i11);
                                                f12 = fCbrt;
                                                f13 = fZ2;
                                                a aVarB = a.b(aVarA2.f83609c, aVarA2.f83608b, fMin);
                                                float f26 = aVarA2.f83610d - aVarB.f83610d;
                                                float f27 = aVarA2.f83611e - aVarB.f83611e;
                                                float f28 = aVarA2.f83612f - aVarB.f83612f;
                                                i5 = depth2;
                                                f11 = f15;
                                                float fPow = (float) (Math.pow(Math.sqrt((f28 * f28) + (f27 * f27) + (f26 * f26)), 0.63d) * 1.41d);
                                                if (fPow <= 1.0f) {
                                                    aVar2 = aVarA2;
                                                    f23 = fPow;
                                                    f19 = fAbs;
                                                }
                                            } else {
                                                f12 = fCbrt;
                                                f13 = fZ2;
                                                i5 = depth2;
                                                f11 = f15;
                                            }
                                            if (f19 == 0.0f && f23 == 0.0f) {
                                                break;
                                            }
                                            if (f12 < f11) {
                                                f22 = f24;
                                                f21 = f13;
                                            } else {
                                                f22 = f13;
                                            }
                                            depth2 = i5;
                                            f15 = f11;
                                        }
                                        a aVar3 = aVar2;
                                        if (c13 == 0) {
                                            if (aVar3 == null) {
                                                f18 = fZ;
                                            } else {
                                                aVar = aVar3;
                                                f16 = fZ;
                                            }
                                            fZ = a2.c.z(f18, f16, 2.0f, f16);
                                            iArrTrimStateSet = iArr;
                                            depth2 = i5;
                                            f15 = f11;
                                        } else {
                                            if (aVar3 != null) {
                                                iD = aVar3.c(lVar);
                                                break;
                                            }
                                            fZ = a2.c.z(f18, f16, 2.0f, f16);
                                            iArrTrimStateSet = iArr;
                                            depth2 = i5;
                                            f15 = f11;
                                            c13 = 0;
                                        }
                                    } else {
                                        iArr = iArrTrimStateSet;
                                        i5 = depth2;
                                        iD = aVar == null ? b.d(f15) : aVar.c(lVar);
                                    }
                                }
                            }
                            color = iD;
                        } else {
                            iArr = iArrTrimStateSet;
                            i5 = depth2;
                        }
                        color = (16777215 & color) | (iF << 24);
                    }
                    int i18 = i13 + 1;
                    if (i18 > iArr3.length) {
                        int[] iArr6 = new int[i13 <= 4 ? 8 : i13 * 2];
                        System.arraycopy(iArr3, 0, iArr6, 0, i13);
                        iArr3 = iArr6;
                    }
                    iArr3[i13] = color;
                    if (i18 > iArr2.length) {
                        ?? r12 = (Object[]) Array.newInstance(iArr2.getClass().getComponentType(), i13 > 4 ? i13 * 2 : 8);
                        System.arraycopy(iArr2, 0, r12, 0, i13);
                        iArr2 = r12;
                    }
                    iArr2[i13] = iArr;
                    iArr2 = iArr2;
                    attributeSet2 = attributeSet;
                    theme2 = theme;
                    i13 = i18;
                    z11 = c11;
                    depth2 = i5;
                    i12 = 0;
                    r02 = resources;
                }
            } else {
                r02 = resources;
                attributeSet2 = attributeSet;
                theme2 = theme;
                z11 = z11;
                depth2 = depth2;
                i12 = 0;
            }
        }
        int[] iArr7 = new int[i13];
        int[][] iArr8 = new int[i13][];
        System.arraycopy(iArr3, 0, iArr7, 0, i13);
        System.arraycopy(iArr2, 0, iArr8, 0, i13);
        return new ColorStateList(iArr8, iArr7);
    }

    public static ColorStateList c(Resources resources, int i5, Resources.Theme theme) {
        try {
            return a(resources, resources.getXml(i5), theme);
        } catch (Exception e3) {
            Log.e("CSLCompat", "Failed to inflate ColorStateList.", e3);
            return null;
        }
    }
}
