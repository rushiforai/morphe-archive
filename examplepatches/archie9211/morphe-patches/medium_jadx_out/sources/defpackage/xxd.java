package defpackage;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.fonts.FontVariationAxis;
import android.util.Log;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class xxd extends uxd {
    public final Class n;
    public final Constructor o;
    public final Method p;
    public final Method q;
    public final Method r;
    public final Method s;
    public final Method t;

    public xxd() throws NoSuchMethodException {
        Method methodP;
        Constructor<?> constructor;
        Method methodO;
        Method method;
        Method method2;
        Method method3;
        Class<?> cls = null;
        try {
            Class<?> cls2 = Class.forName("android.graphics.FontFamily");
            constructor = cls2.getConstructor(null);
            methodO = O(cls2);
            Class<?> cls3 = Integer.TYPE;
            method = cls2.getMethod("addFontFromBuffer", ByteBuffer.class, cls3, FontVariationAxis[].class, cls3, cls3);
            method2 = cls2.getMethod("freeze", null);
            method3 = cls2.getMethod("abortCreation", null);
            methodP = P(cls2);
            cls = cls2;
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            Log.e("TypefaceCompatApi26Impl", "Unable to collect necessary methods for class ".concat(e.getClass().getName()), e);
            methodP = null;
            constructor = null;
            methodO = null;
            method = null;
            method2 = null;
            method3 = null;
        }
        this.n = cls;
        this.o = constructor;
        this.p = methodO;
        this.q = method;
        this.r = method2;
        this.s = method3;
        this.t = methodP;
    }

    public static Method O(Class cls) {
        Class<?> cls2 = Integer.TYPE;
        return cls.getMethod("addFontFromAssetManager", AssetManager.class, String.class, cls2, Boolean.TYPE, cls2, cls2, cls2, FontVariationAxis[].class);
    }

    public final boolean L(Context context, Object obj, String str, int i, int i2, int i3, FontVariationAxis[] fontVariationAxisArr) {
        try {
            return ((Boolean) this.p.invoke(obj, context.getAssets(), str, 0, Boolean.FALSE, Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3), fontVariationAxisArr)).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return false;
        }
    }

    public Typeface M(Object obj) {
        try {
            Object objNewInstance = Array.newInstance((Class<?>) this.n, 1);
            Array.set(objNewInstance, 0, obj);
            return (Typeface) this.t.invoke(null, objNewInstance, -1, -1);
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return null;
        }
    }

    public final boolean N(Object obj) {
        try {
            return ((Boolean) this.r.invoke(obj, null)).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return false;
        }
    }

    public Method P(Class cls) throws NoSuchMethodException {
        Class cls2 = Integer.TYPE;
        Method declaredMethod = Typeface.class.getDeclaredMethod("createFromFamiliesWithDefault", Array.newInstance((Class<?>) cls, 1).getClass(), cls2, cls2);
        declaredMethod.setAccessible(true);
        return declaredMethod;
    }

    @Override // defpackage.uxd, defpackage.il7
    public final Typeface q(Context context, tz4 tz4Var, Resources resources, int i) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        Object objNewInstance;
        Method method = this.p;
        if (method == null) {
            Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods. Fallback to legacy implementation.");
        }
        if (method == null) {
            return super.q(context, tz4Var, resources, i);
        }
        try {
            objNewInstance = this.o.newInstance(null);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
            objNewInstance = null;
        }
        if (objNewInstance != null) {
            uz4[] uz4VarArr = tz4Var.a;
            int length = uz4VarArr.length;
            int i2 = 0;
            while (true) {
                if (i2 < length) {
                    uz4 uz4Var = uz4VarArr[i2];
                    String str = uz4Var.a;
                    int i3 = uz4Var.e;
                    int i4 = uz4Var.b;
                    boolean z = uz4Var.c;
                    FontVariationAxis[] fontVariationAxisArrFromFontVariationSettings = FontVariationAxis.fromFontVariationSettings(uz4Var.d);
                    xxd xxdVar = this;
                    Context context2 = context;
                    if (xxdVar.L(context2, objNewInstance, str, i3, i4, z ? 1 : 0, fontVariationAxisArrFromFontVariationSettings)) {
                        i2++;
                        this = xxdVar;
                        context = context2;
                    } else {
                        try {
                            xxdVar.s.invoke(objNewInstance, null);
                            break;
                        } catch (IllegalAccessException | InvocationTargetException unused2) {
                        }
                    }
                } else {
                    xxd xxdVar2 = this;
                    if (xxdVar2.N(objNewInstance)) {
                        return xxdVar2.M(objNewInstance);
                    }
                }
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0028  */
    @Override // defpackage.uxd, defpackage.il7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Typeface r(android.content.Context r17, defpackage.g05[] r18, int r19) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 254
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xxd.r(android.content.Context, g05[], int):android.graphics.Typeface");
    }

    @Override // defpackage.il7
    public final Typeface t(Context context, Resources resources, int i, String str, int i2) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        Object objNewInstance;
        Method method = this.p;
        if (method == null) {
            Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods. Fallback to legacy implementation.");
        }
        if (method == null) {
            return super.t(context, resources, i, str, i2);
        }
        try {
            objNewInstance = this.o.newInstance(null);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
            objNewInstance = null;
        }
        if (objNewInstance != null) {
            if (!L(context, objNewInstance, str, 0, -1, -1, null)) {
                try {
                    this.s.invoke(objNewInstance, null);
                } catch (IllegalAccessException | InvocationTargetException unused2) {
                }
            } else if (N(objNewInstance)) {
                return M(objNewInstance);
            }
        }
        return null;
    }
}
