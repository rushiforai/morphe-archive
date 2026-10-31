package j4;

import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.TypedValue;
import android.util.Xml;
import b.c0;
import java.util.HashMap;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public boolean f68898a = false;

    /* renamed from: b, reason: collision with root package name */
    public int f68899b;

    /* renamed from: c, reason: collision with root package name */
    public int f68900c;

    /* renamed from: d, reason: collision with root package name */
    public float f68901d;

    /* renamed from: e, reason: collision with root package name */
    public String f68902e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f68903f;

    /* renamed from: g, reason: collision with root package name */
    public int f68904g;

    public b(b bVar, Object obj) {
        bVar.getClass();
        this.f68899b = bVar.f68899b;
        b(obj);
    }

    public static void a(Context context, XmlResourceParser xmlResourceParser, HashMap map) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), p.f69052d);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        String string = null;
        int i5 = 0;
        boolean z11 = false;
        Object objValueOf = null;
        for (int i11 = 0; i11 < indexCount; i11++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i11);
            int i12 = 1;
            if (index == 0) {
                string = typedArrayObtainStyledAttributes.getString(index);
                if (string != null && string.length() > 0) {
                    string = Character.toUpperCase(string.charAt(0)) + string.substring(1);
                }
            } else if (index == 10) {
                string = typedArrayObtainStyledAttributes.getString(index);
                z11 = true;
            } else if (index == 1) {
                objValueOf = Boolean.valueOf(typedArrayObtainStyledAttributes.getBoolean(index, false));
                i5 = 6;
            } else {
                int i13 = 3;
                if (index == 3) {
                    objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getColor(index, 0));
                } else {
                    i13 = 4;
                    if (index == 2) {
                        objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getColor(index, 0));
                    } else {
                        if (index == 7) {
                            objValueOf = Float.valueOf(TypedValue.applyDimension(1, typedArrayObtainStyledAttributes.getDimension(index, 0.0f), context.getResources().getDisplayMetrics()));
                        } else if (index == 4) {
                            objValueOf = Float.valueOf(typedArrayObtainStyledAttributes.getDimension(index, 0.0f));
                        } else {
                            i13 = 5;
                            if (index == 5) {
                                objValueOf = Float.valueOf(typedArrayObtainStyledAttributes.getFloat(index, Float.NaN));
                                i5 = 2;
                            } else {
                                if (index == 6) {
                                    objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getInteger(index, -1));
                                } else if (index == 9) {
                                    objValueOf = typedArrayObtainStyledAttributes.getString(index);
                                } else {
                                    i12 = 8;
                                    if (index == 8) {
                                        int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                                        if (resourceId == -1) {
                                            resourceId = typedArrayObtainStyledAttributes.getInt(index, -1);
                                        }
                                        objValueOf = Integer.valueOf(resourceId);
                                    }
                                }
                                i5 = i12;
                            }
                        }
                        i5 = 7;
                    }
                }
                i5 = i13;
            }
        }
        if (string != null && objValueOf != null) {
            b bVar = new b();
            bVar.f68899b = i5;
            bVar.f68898a = z11;
            bVar.b(objValueOf);
            map.put(string, bVar);
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public final void b(Object obj) {
        switch (c0.F(this.f68899b)) {
            case 0:
            case 7:
                this.f68900c = ((Integer) obj).intValue();
                break;
            case 1:
                this.f68901d = ((Float) obj).floatValue();
                break;
            case 2:
            case 3:
                this.f68904g = ((Integer) obj).intValue();
                break;
            case 4:
                this.f68902e = (String) obj;
                break;
            case 5:
                this.f68903f = ((Boolean) obj).booleanValue();
                break;
            case 6:
                this.f68901d = ((Float) obj).floatValue();
                break;
        }
    }
}
