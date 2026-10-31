package r4;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.graphics.fonts.FontVariationAxis;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
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
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import p50.i;
import x4.h;

/* loaded from: classes2.dex */
public class d extends i {

    /* renamed from: h, reason: collision with root package name */
    public static Class f85482h = null;

    /* renamed from: i, reason: collision with root package name */
    public static Constructor f85483i = null;

    /* renamed from: j, reason: collision with root package name */
    public static Method f85484j = null;

    /* renamed from: k, reason: collision with root package name */
    public static Method f85485k = null;

    /* renamed from: l, reason: collision with root package name */
    public static boolean f85486l = false;

    /* renamed from: a, reason: collision with root package name */
    public final Class f85487a;

    /* renamed from: b, reason: collision with root package name */
    public final Constructor f85488b;

    /* renamed from: c, reason: collision with root package name */
    public final Method f85489c;

    /* renamed from: d, reason: collision with root package name */
    public final Method f85490d;

    /* renamed from: e, reason: collision with root package name */
    public final Method f85491e;

    /* renamed from: f, reason: collision with root package name */
    public final Method f85492f;

    /* renamed from: g, reason: collision with root package name */
    public final Method f85493g;

    public d() throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        Method methodE;
        Constructor<?> constructor;
        Method methodD;
        Method method;
        Method method2;
        Method method3;
        Class<?> cls = null;
        try {
            Class<?> cls2 = Class.forName("android.graphics.FontFamily");
            constructor = cls2.getConstructor(null);
            methodD = D(cls2);
            Class cls3 = Integer.TYPE;
            method = cls2.getMethod("addFontFromBuffer", ByteBuffer.class, cls3, FontVariationAxis[].class, cls3, cls3);
            method2 = cls2.getMethod("freeze", null);
            method3 = cls2.getMethod("abortCreation", null);
            methodE = E(cls2);
            cls = cls2;
        } catch (ClassNotFoundException | NoSuchMethodException e3) {
            Log.e("TypefaceCompatApi26Impl", "Unable to collect necessary methods for class ".concat(e3.getClass().getName()), e3);
            methodE = null;
            constructor = null;
            methodD = null;
            method = null;
            method2 = null;
            method3 = null;
        }
        this.f85487a = cls;
        this.f85488b = constructor;
        this.f85489c = methodD;
        this.f85490d = method;
        this.f85491e = method2;
        this.f85492f = method3;
        this.f85493g = methodE;
    }

    public static void C() throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        Method method;
        Class<?> cls;
        Method method2;
        if (f85486l) {
            return;
        }
        f85486l = true;
        Constructor<?> constructor = null;
        try {
            cls = Class.forName("android.graphics.FontFamily");
            Constructor<?> constructor2 = cls.getConstructor(null);
            method2 = cls.getMethod("addFontWeightStyle", String.class, Integer.TYPE, Boolean.TYPE);
            method = Typeface.class.getMethod("createFromFamiliesWithDefault", Array.newInstance(cls, 1).getClass());
            constructor = constructor2;
        } catch (ClassNotFoundException | NoSuchMethodException e3) {
            Log.e("TypefaceCompatApi21Impl", e3.getClass().getName(), e3);
            method = null;
            cls = null;
            method2 = null;
        }
        f85483i = constructor;
        f85482h = cls;
        f85484j = method2;
        f85485k = method;
    }

    public static Method D(Class cls) {
        Class cls2 = Boolean.TYPE;
        Class cls3 = Integer.TYPE;
        return cls.getMethod("addFontFromAssetManager", AssetManager.class, String.class, cls3, cls2, cls3, cls3, cls3, FontVariationAxis[].class);
    }

    public static boolean z(boolean z11, String str, int i5, Object obj) throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        C();
        try {
            return ((Boolean) f85484j.invoke(obj, str, Integer.valueOf(i5), Boolean.valueOf(z11))).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException e3) {
            throw new RuntimeException(e3);
        }
    }

    public Typeface A(Object obj) throws ArrayIndexOutOfBoundsException, IllegalArgumentException, NegativeArraySizeException {
        try {
            Object objNewInstance = Array.newInstance((Class<?>) this.f85487a, 1);
            Array.set(objNewInstance, 0, obj);
            return (Typeface) this.f85493g.invoke(null, objNewInstance, -1, -1);
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return null;
        }
    }

    public final boolean B(Object obj) {
        try {
            return ((Boolean) this.f85491e.invoke(obj, null)).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return false;
        }
    }

    public Method E(Class cls) throws NoSuchMethodException, SecurityException {
        Class<?> cls2 = Array.newInstance((Class<?>) cls, 1).getClass();
        Class cls3 = Integer.TYPE;
        Method declaredMethod = Typeface.class.getDeclaredMethod("createFromFamiliesWithDefault", cls2, cls3, cls3);
        declaredMethod.setAccessible(true);
        return declaredMethod;
    }

    @Override // p50.i
    public final Typeface k(Context context, q4.e eVar, Resources resources, int i5) throws IllegalAccessException, NoSuchMethodException, InstantiationException, ClassNotFoundException, SecurityException, ArrayIndexOutOfBoundsException, IllegalArgumentException, InvocationTargetException, NegativeArraySizeException {
        Object objNewInstance;
        Method method = this.f85489c;
        if (method == null) {
            Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods. Fallback to legacy implementation.");
        }
        if (method != null) {
            try {
                objNewInstance = this.f85488b.newInstance(null);
            } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
                objNewInstance = null;
            }
            if (objNewInstance != null) {
                q4.f[] fVarArr = eVar.f83621a;
                int length = fVarArr.length;
                int i11 = 0;
                while (true) {
                    if (i11 < length) {
                        q4.f fVar = fVarArr[i11];
                        Context context2 = context;
                        if (y(context2, objNewInstance, fVar.f83622a, fVar.f83626e, fVar.f83623b, fVar.f83624c ? 1 : 0, FontVariationAxis.fromFontVariationSettings(fVar.f83625d))) {
                            i11++;
                            context = context2;
                        } else {
                            try {
                                this.f85492f.invoke(objNewInstance, null);
                                break;
                            } catch (IllegalAccessException | InvocationTargetException unused2) {
                            }
                        }
                    } else if (B(objNewInstance)) {
                        return A(objNewInstance);
                    }
                }
            }
            return null;
        }
        C();
        try {
            Object objNewInstance2 = f85483i.newInstance(null);
            for (q4.f fVar2 : eVar.f83621a) {
                File fileF = p6.f.F(context);
                if (fileF == null) {
                    return null;
                }
                try {
                    if (p6.f.u(fileF, resources, fVar2.f83627f)) {
                        if (z(fVar2.f83624c, fileF.getPath(), fVar2.f83623b, objNewInstance2)) {
                            fileF.delete();
                        }
                    }
                } catch (RuntimeException unused3) {
                } catch (Throwable th2) {
                    fileF.delete();
                    throw th2;
                }
                fileF.delete();
                return null;
            }
            C();
            try {
                Object objNewInstance3 = Array.newInstance((Class<?>) f85482h, 1);
                Array.set(objNewInstance3, 0, objNewInstance2);
                return (Typeface) f85485k.invoke(null, objNewInstance3);
            } catch (IllegalAccessException | InvocationTargetException e3) {
                throw new RuntimeException(e3);
            }
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException e11) {
            throw new RuntimeException(e11);
        }
    }

    @Override // p50.i
    public final Typeface l(Context context, h[] hVarArr, int i5) throws IllegalAccessException, InstantiationException, IOException, IllegalArgumentException, InvocationTargetException {
        Object objNewInstance;
        Typeface typefaceA;
        boolean zBooleanValue;
        if (hVarArr.length >= 1) {
            Method method = this.f85489c;
            if (method == null) {
                Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods. Fallback to legacy implementation.");
            }
            try {
                if (method != null) {
                    HashMap map = new HashMap();
                    for (h hVar : hVarArr) {
                        if (hVar.f95089e == 0) {
                            Uri uri = hVar.f95085a;
                            if (map.containsKey(uri)) {
                                continue;
                            } else {
                                MappedByteBuffer mappedByteBuffer = null;
                                try {
                                    ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor = context.getContentResolver().openFileDescriptor(uri, "r", null);
                                    if (parcelFileDescriptorOpenFileDescriptor != null) {
                                        try {
                                            FileInputStream fileInputStream = new FileInputStream(parcelFileDescriptorOpenFileDescriptor.getFileDescriptor());
                                            try {
                                                FileChannel channel = fileInputStream.getChannel();
                                                MappedByteBuffer map2 = channel.map(FileChannel.MapMode.READ_ONLY, 0L, channel.size());
                                                fileInputStream.close();
                                                parcelFileDescriptorOpenFileDescriptor.close();
                                                mappedByteBuffer = map2;
                                            } finally {
                                            }
                                        } finally {
                                        }
                                    } else if (parcelFileDescriptorOpenFileDescriptor != null) {
                                        parcelFileDescriptorOpenFileDescriptor.close();
                                    }
                                } catch (IOException unused) {
                                }
                                map.put(uri, mappedByteBuffer);
                            }
                        }
                    }
                    Map mapUnmodifiableMap = Collections.unmodifiableMap(map);
                    try {
                        objNewInstance = this.f85488b.newInstance(null);
                    } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused2) {
                        objNewInstance = null;
                    }
                    if (objNewInstance != null) {
                        int length = hVarArr.length;
                        int i11 = 0;
                        boolean z11 = false;
                        while (true) {
                            Method method2 = this.f85492f;
                            if (i11 < length) {
                                h hVar2 = hVarArr[i11];
                                ByteBuffer byteBuffer = (ByteBuffer) mapUnmodifiableMap.get(hVar2.f95085a);
                                if (byteBuffer != null) {
                                    try {
                                        zBooleanValue = ((Boolean) this.f85490d.invoke(objNewInstance, byteBuffer, Integer.valueOf(hVar2.f95086b), null, Integer.valueOf(hVar2.f95087c), Integer.valueOf(hVar2.f95088d ? 1 : 0))).booleanValue();
                                    } catch (IllegalAccessException | InvocationTargetException unused3) {
                                        zBooleanValue = false;
                                    }
                                    if (!zBooleanValue) {
                                        method2.invoke(objNewInstance, null);
                                        break;
                                    }
                                    z11 = true;
                                }
                                i11++;
                                z11 = z11;
                            } else if (!z11) {
                                method2.invoke(objNewInstance, null);
                            } else if (B(objNewInstance) && (typefaceA = A(objNewInstance)) != null) {
                                return Typeface.create(typefaceA, i5);
                            }
                        }
                    }
                } else {
                    h hVarO = o(hVarArr, i5);
                    ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor2 = context.getContentResolver().openFileDescriptor(hVarO.f95085a, "r", null);
                    if (parcelFileDescriptorOpenFileDescriptor2 != null) {
                        try {
                            Typeface typefaceBuild = new Typeface.Builder(parcelFileDescriptorOpenFileDescriptor2.getFileDescriptor()).setWeight(hVarO.f95087c).setItalic(hVarO.f95088d).build();
                            parcelFileDescriptorOpenFileDescriptor2.close();
                            return typefaceBuild;
                        } finally {
                        }
                    } else if (parcelFileDescriptorOpenFileDescriptor2 != null) {
                        parcelFileDescriptorOpenFileDescriptor2.close();
                        return null;
                    }
                }
            } catch (IOException | IllegalAccessException | InvocationTargetException unused4) {
            }
        }
        return null;
    }

    @Override // p50.i
    public final Typeface n(Context context, Resources resources, int i5, String str, int i11) throws IllegalAccessException, InstantiationException, IllegalArgumentException, InvocationTargetException {
        Object objNewInstance;
        Method method = this.f85489c;
        if (method == null) {
            Log.w("TypefaceCompatApi26Impl", "Unable to collect necessary private methods. Fallback to legacy implementation.");
        }
        if (method == null) {
            return super.n(context, resources, i5, str, i11);
        }
        try {
            objNewInstance = this.f85488b.newInstance(null);
        } catch (IllegalAccessException | InstantiationException | InvocationTargetException unused) {
            objNewInstance = null;
        }
        if (objNewInstance != null) {
            if (!y(context, objNewInstance, str, 0, -1, -1, null)) {
                try {
                    this.f85492f.invoke(objNewInstance, null);
                } catch (IllegalAccessException | InvocationTargetException unused2) {
                }
            } else if (B(objNewInstance)) {
                return A(objNewInstance);
            }
        }
        return null;
    }

    public final boolean y(Context context, Object obj, String str, int i5, int i11, int i12, FontVariationAxis[] fontVariationAxisArr) {
        try {
            return ((Boolean) this.f85489c.invoke(obj, context.getAssets(), str, 0, Boolean.FALSE, Integer.valueOf(i5), Integer.valueOf(i11), Integer.valueOf(i12), fontVariationAxisArr)).booleanValue();
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return false;
        }
    }
}
