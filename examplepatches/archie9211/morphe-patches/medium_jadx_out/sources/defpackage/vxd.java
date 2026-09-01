package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.net.Uri;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vxd extends il7 {
    public static final Class i;
    public static final Constructor j;
    public static final Method k;
    public static final Method l;

    static {
        Class<?> cls;
        Method method;
        Method method2;
        Constructor<?> constructor = null;
        try {
            cls = Class.forName("android.graphics.FontFamily");
            Constructor<?> constructor2 = cls.getConstructor(null);
            Class<?> cls2 = Integer.TYPE;
            method2 = cls.getMethod("addFontWeightStyle", ByteBuffer.class, cls2, List.class, cls2, Boolean.TYPE);
            method = Typeface.class.getMethod("createFromFamiliesWithDefault", Array.newInstance(cls, 1).getClass());
            constructor = constructor2;
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            Log.e("TypefaceCompatApi24Impl", e.getClass().getName(), e);
            cls = null;
            method = null;
            method2 = null;
        }
        j = constructor;
        i = cls;
        k = method2;
        l = method;
    }

    public static boolean J(Object obj, ByteBuffer byteBuffer, int i2, int i3, boolean z) {
        try {
            return ((Boolean) k.invoke(obj, byteBuffer, Integer.valueOf(i2), null, Integer.valueOf(i3), Boolean.valueOf(z))).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return false;
        }
    }

    public static Typeface K(Object obj) {
        try {
            Object objNewInstance = Array.newInstance((Class<?>) i, 1);
            Array.set(objNewInstance, 0, obj);
            return (Typeface) l.invoke(null, objNewInstance);
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return null;
        }
    }

    @Override // defpackage.il7
    public final Typeface q(Context context, tz4 tz4Var, Resources resources, int i2) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        Object objNewInstance;
        MappedByteBuffer map;
        FileInputStream fileInputStream;
        try {
            objNewInstance = j.newInstance(null);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
            objNewInstance = null;
        }
        if (objNewInstance != null) {
            for (uz4 uz4Var : tz4Var.a) {
                int i3 = uz4Var.f;
                File fileC = en7.C(context);
                if (fileC != null) {
                    try {
                        if (en7.r(fileC, resources, i3)) {
                            try {
                                fileInputStream = new FileInputStream(fileC);
                            } catch (IOException unused2) {
                                map = null;
                            }
                            try {
                                FileChannel channel = fileInputStream.getChannel();
                                map = channel.map(FileChannel.MapMode.READ_ONLY, 0L, channel.size());
                                fileInputStream.close();
                                if (map != null && J(objNewInstance, map, uz4Var.e, uz4Var.b, uz4Var.c)) {
                                }
                            } finally {
                            }
                        }
                    } finally {
                        fileC.delete();
                    }
                }
                map = null;
                if (map != null) {
                }
            }
            return K(objNewInstance);
        }
        return null;
    }

    @Override // defpackage.il7
    public final Typeface r(Context context, g05[] g05VarArr, int i2) {
        Object objNewInstance;
        try {
            objNewInstance = j.newInstance(null);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
            objNewInstance = null;
        }
        if (objNewInstance != null) {
            int i3 = 0;
            aec aecVar = new aec(0);
            int length = g05VarArr.length;
            while (true) {
                if (i3 < length) {
                    g05 g05Var = g05VarArr[i3];
                    Uri uri = g05Var.a;
                    ByteBuffer byteBufferK = (ByteBuffer) aecVar.get(uri);
                    if (byteBufferK == null) {
                        byteBufferK = en7.K(context, uri);
                        aecVar.put(uri, byteBufferK);
                    }
                    if (byteBufferK == null || !J(objNewInstance, byteBufferK, g05Var.b, g05Var.c, g05Var.d)) {
                        break;
                    }
                    i3++;
                } else {
                    Typeface typefaceK = K(objNewInstance);
                    if (typefaceK != null) {
                        return Typeface.create(typefaceK, i2);
                    }
                }
            }
        }
        return null;
    }
}
