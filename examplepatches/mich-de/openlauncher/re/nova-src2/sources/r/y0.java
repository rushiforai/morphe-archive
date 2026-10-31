package r;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public abstract class y0 {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f84911a;

    /* renamed from: b, reason: collision with root package name */
    public static final Method f84912b;

    /* renamed from: c, reason: collision with root package name */
    public static final Field f84913c;

    /* renamed from: d, reason: collision with root package name */
    public static final Field f84914d;

    /* renamed from: e, reason: collision with root package name */
    public static final Field f84915e;

    /* renamed from: f, reason: collision with root package name */
    public static final Field f84916f;

    /* JADX WARN: Removed duplicated region for block: B:25:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0057  */
    static {
        Method method;
        Field field;
        Field field2;
        Field field3;
        Field field4;
        boolean z11;
        Class<?> cls;
        try {
            cls = Class.forName("android.graphics.Insets");
            method = Drawable.class.getMethod("getOpticalInsets", null);
        } catch (ClassNotFoundException unused) {
            method = null;
            field = null;
        } catch (NoSuchFieldException unused2) {
            method = null;
            field = null;
        } catch (NoSuchMethodException unused3) {
            method = null;
            field = null;
        }
        try {
            field = cls.getField("left");
            try {
                field2 = cls.getField("top");
                try {
                    field3 = cls.getField("right");
                    try {
                        field4 = cls.getField("bottom");
                        z11 = true;
                    } catch (ClassNotFoundException | NoSuchFieldException | NoSuchMethodException unused4) {
                        field4 = null;
                        z11 = false;
                        if (z11) {
                        }
                    }
                } catch (ClassNotFoundException | NoSuchFieldException | NoSuchMethodException unused5) {
                    field3 = null;
                }
            } catch (ClassNotFoundException unused6) {
                field2 = null;
                field3 = field2;
                field4 = null;
                z11 = false;
                if (z11) {
                }
            } catch (NoSuchFieldException unused7) {
                field2 = null;
                field3 = field2;
                field4 = null;
                z11 = false;
                if (z11) {
                }
            } catch (NoSuchMethodException unused8) {
                field2 = null;
                field3 = field2;
                field4 = null;
                z11 = false;
                if (z11) {
                }
            }
        } catch (ClassNotFoundException unused9) {
            field = null;
            field2 = field;
            field3 = field2;
            field4 = null;
            z11 = false;
            if (z11) {
            }
        } catch (NoSuchFieldException unused10) {
            field = null;
            field2 = field;
            field3 = field2;
            field4 = null;
            z11 = false;
            if (z11) {
            }
        } catch (NoSuchMethodException unused11) {
            field = null;
            field2 = field;
            field3 = field2;
            field4 = null;
            z11 = false;
            if (z11) {
            }
        }
        if (z11) {
            f84912b = null;
            f84913c = null;
            f84914d = null;
            f84915e = null;
            f84916f = null;
            f84911a = false;
            return;
        }
        f84912b = method;
        f84913c = field;
        f84914d = field2;
        f84915e = field3;
        f84916f = field4;
        f84911a = true;
    }

    public static Rect a(Drawable drawable) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (Build.VERSION.SDK_INT < 29 && f84911a) {
            try {
                Object objInvoke = f84912b.invoke(drawable, null);
                if (objInvoke != null) {
                    return new Rect(f84913c.getInt(objInvoke), f84914d.getInt(objInvoke), f84915e.getInt(objInvoke), f84916f.getInt(objInvoke));
                }
            } catch (IllegalAccessException | InvocationTargetException unused) {
            }
        }
        return a1.f84668c;
    }
}
