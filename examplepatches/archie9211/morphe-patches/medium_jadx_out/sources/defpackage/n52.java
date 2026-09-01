package defpackage;

import android.content.Context;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.util.TypedValue;
import android.util.Xml;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n52 {
    public boolean a = false;
    public m52 b;
    public int c;
    public float d;
    public String e;
    public boolean f;
    public int g;

    public n52(n52 n52Var, Object obj) {
        n52Var.getClass();
        this.b = n52Var.b;
        b(obj);
    }

    public static void a(Context context, XmlResourceParser xmlResourceParser, HashMap map) {
        m52 m52Var;
        Object objValueOf;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), xra.d);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        String string = null;
        Object objValueOf2 = null;
        m52 m52Var2 = null;
        boolean z = false;
        for (int i = 0; i < indexCount; i++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i);
            if (index == 0) {
                string = typedArrayObtainStyledAttributes.getString(index);
                if (string != null && string.length() > 0) {
                    string = Character.toUpperCase(string.charAt(0)) + string.substring(1);
                }
            } else if (index == 10) {
                string = typedArrayObtainStyledAttributes.getString(index);
                z = true;
            } else if (index == 1) {
                objValueOf2 = Boolean.valueOf(typedArrayObtainStyledAttributes.getBoolean(index, false));
                m52Var2 = m52.BOOLEAN_TYPE;
            } else {
                if (index == 3) {
                    m52Var = m52.COLOR_TYPE;
                    objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getColor(index, 0));
                } else if (index == 2) {
                    m52Var = m52.COLOR_DRAWABLE_TYPE;
                    objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getColor(index, 0));
                } else if (index == 7) {
                    m52Var = m52.DIMENSION_TYPE;
                    objValueOf = Float.valueOf(TypedValue.applyDimension(1, typedArrayObtainStyledAttributes.getDimension(index, 0.0f), context.getResources().getDisplayMetrics()));
                } else if (index == 4) {
                    m52Var = m52.DIMENSION_TYPE;
                    objValueOf = Float.valueOf(typedArrayObtainStyledAttributes.getDimension(index, 0.0f));
                } else if (index == 5) {
                    m52Var = m52.FLOAT_TYPE;
                    objValueOf = Float.valueOf(typedArrayObtainStyledAttributes.getFloat(index, Float.NaN));
                } else if (index == 6) {
                    m52Var = m52.INT_TYPE;
                    objValueOf = Integer.valueOf(typedArrayObtainStyledAttributes.getInteger(index, -1));
                } else if (index == 9) {
                    m52Var = m52.STRING_TYPE;
                    objValueOf = typedArrayObtainStyledAttributes.getString(index);
                } else if (index == 8) {
                    m52Var = m52.REFERENCE_TYPE;
                    int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                    if (resourceId == -1) {
                        resourceId = typedArrayObtainStyledAttributes.getInt(index, -1);
                    }
                    objValueOf = Integer.valueOf(resourceId);
                }
                Object obj = objValueOf;
                m52Var2 = m52Var;
                objValueOf2 = obj;
            }
        }
        if (string != null && objValueOf2 != null) {
            n52 n52Var = new n52();
            n52Var.b = m52Var2;
            n52Var.a = z;
            n52Var.b(objValueOf2);
            map.put(string, n52Var);
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public final void b(Object obj) {
        switch (this.b.ordinal()) {
            case 0:
            case 7:
                this.c = ((Integer) obj).intValue();
                break;
            case 1:
                this.d = ((Float) obj).floatValue();
                break;
            case 2:
            case 3:
                this.g = ((Integer) obj).intValue();
                break;
            case 4:
                this.e = (String) obj;
                break;
            case 5:
                this.f = ((Boolean) obj).booleanValue();
                break;
            case 6:
                this.d = ((Float) obj).floatValue();
                break;
        }
    }
}
