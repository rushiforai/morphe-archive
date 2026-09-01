package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.ParcelFileDescriptor;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class uxd extends il7 {
    public static Class i = null;
    public static Constructor j = null;
    public static Method k = null;
    public static Method l = null;
    public static boolean m = false;

    public static boolean J(String str, boolean z, int i2, Object obj) throws NoSuchMethodException {
        K();
        try {
            return ((Boolean) k.invoke(obj, str, Integer.valueOf(i2), Boolean.valueOf(z))).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException e) {
            ik4.j(e);
            return false;
        }
    }

    public static void K() throws NoSuchMethodException {
        Method method;
        Class<?> cls;
        Method method2;
        if (m) {
            return;
        }
        m = true;
        Constructor<?> constructor = null;
        try {
            cls = Class.forName("android.graphics.FontFamily");
            Constructor<?> constructor2 = cls.getConstructor(null);
            method2 = cls.getMethod("addFontWeightStyle", String.class, Integer.TYPE, Boolean.TYPE);
            method = Typeface.class.getMethod("createFromFamiliesWithDefault", Array.newInstance(cls, 1).getClass());
            constructor = constructor2;
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            Log.e("TypefaceCompatApi21Impl", e.getClass().getName(), e);
            method = null;
            cls = null;
            method2 = null;
        }
        j = constructor;
        i = cls;
        k = method2;
        l = method;
    }

    @Override // defpackage.il7
    public Typeface q(Context context, tz4 tz4Var, Resources resources, int i2) throws NoSuchMethodException {
        K();
        try {
            Object objNewInstance = j.newInstance(null);
            for (uz4 uz4Var : tz4Var.a) {
                File fileC = en7.C(context);
                if (fileC == null) {
                    return null;
                }
                try {
                    if (!en7.r(fileC, resources, uz4Var.f)) {
                        return null;
                    }
                    if (!J(fileC.getPath(), uz4Var.c, uz4Var.b, objNewInstance)) {
                        return null;
                    }
                    fileC.delete();
                } catch (RuntimeException unused) {
                    return null;
                } finally {
                    fileC.delete();
                }
            }
            K();
            try {
                Object objNewInstance2 = Array.newInstance((Class<?>) i, 1);
                Array.set(objNewInstance2, 0, objNewInstance);
                return (Typeface) l.invoke(null, objNewInstance2);
            } catch (IllegalAccessException | InvocationTargetException e) {
                ik4.j(e);
                return null;
            }
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException e2) {
            ik4.j(e2);
            return null;
        }
    }

    @Override // defpackage.il7
    public Typeface r(Context context, g05[] g05VarArr, int i2) {
        Typeface typefaceCreateFromFile;
        String str;
        if (g05VarArr.length >= 1) {
            try {
                ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor = context.getContentResolver().openFileDescriptor(il7.u(g05VarArr, i2).a, "r", null);
                if (parcelFileDescriptorOpenFileDescriptor != null) {
                    try {
                        try {
                            str = Os.readlink("/proc/self/fd/" + parcelFileDescriptorOpenFileDescriptor.getFd());
                        } finally {
                        }
                    } catch (ErrnoException unused) {
                    }
                    File file = OsConstants.S_ISREG(Os.stat(str).st_mode) ? new File(str) : null;
                    if (file != null && file.canRead()) {
                        Typeface typefaceCreateFromFile2 = Typeface.createFromFile(file);
                        parcelFileDescriptorOpenFileDescriptor.close();
                        return typefaceCreateFromFile2;
                    }
                    FileInputStream fileInputStream = new FileInputStream(parcelFileDescriptorOpenFileDescriptor.getFileDescriptor());
                    try {
                        File fileC = en7.C(context);
                        if (fileC == null) {
                            typefaceCreateFromFile = null;
                        } else {
                            try {
                                if (en7.s(fileC, fileInputStream)) {
                                    typefaceCreateFromFile = Typeface.createFromFile(fileC.getPath());
                                    fileC.delete();
                                }
                            } catch (RuntimeException unused2) {
                            } catch (Throwable th) {
                                fileC.delete();
                                throw th;
                            }
                            fileC.delete();
                            typefaceCreateFromFile = null;
                        }
                        fileInputStream.close();
                        parcelFileDescriptorOpenFileDescriptor.close();
                        return typefaceCreateFromFile;
                    } finally {
                    }
                }
                if (parcelFileDescriptorOpenFileDescriptor != null) {
                    parcelFileDescriptorOpenFileDescriptor.close();
                    return null;
                }
            } catch (IOException unused3) {
            }
        }
        return null;
    }
}
