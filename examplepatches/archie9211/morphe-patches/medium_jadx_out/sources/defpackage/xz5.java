package defpackage;

import android.content.ContentProviderClient;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.drm.DrmManagerClient;
import android.graphics.Bitmap;
import android.media.MediaDrm;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.text.InputFilter;
import android.text.TextUtils;
import android.util.Pair;
import android.util.Size;
import android.util.SizeF;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.facebook.FacebookException;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.core.models.CatalogName;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.reader.R;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class xz5 {
    public static tjb i;
    public static final mz1 a = new mz1(new e02(23), false, 735544784);
    public static final mz1 b = new mz1(new f02(4), false, -1973744011);
    public static final mz1 c = new mz1(new f02(5), false, -64626843);
    public static final mz1 d = new mz1(new c02(5), false, -415482440);
    public static final mz1 e = new mz1(new f02(6), false, 58725765);
    public static final mz1 f = new mz1(new m02(15), false, -1350007744);
    public static final mz1 g = new mz1(new m02(16), false, 1031110668);
    public static final tz7 h = new tz7(15, false);
    public static final be7 j = new be7(12);
    public static final d1g k = new d1g(15, "StdlibClassFinder", false);
    public static final yqa l = new yqa(0, 0, 5);

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0011, code lost:
    
        if (r5 == false) goto L15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0015, code lost:
    
        return r2 - r3;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0026 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0027  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final int A(int r2, int r3, int r4, boolean r5) {
        /*
            r0 = 0
            if (r3 < r4) goto L8
            if (r5 == 0) goto L6
            return r0
        L6:
            int r4 = r4 - r3
            return r4
        L8:
            if (r5 != 0) goto Ld
            if (r3 > r2) goto L16
            goto L11
        Ld:
            int r1 = r4 - r3
            if (r1 <= r2) goto L16
        L11:
            if (r5 == 0) goto L14
            goto L21
        L14:
            int r2 = r2 - r3
            return r2
        L16:
            if (r5 == 0) goto L1b
            if (r3 > r2) goto L24
            goto L1f
        L1b:
            int r1 = r4 - r3
            if (r1 <= r2) goto L24
        L1f:
            if (r5 != 0) goto L22
        L21:
            return r2
        L22:
            int r2 = r2 - r3
            return r2
        L24:
            if (r5 != 0) goto L27
            return r0
        L27:
            int r4 = r4 - r3
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.A(int, int, int, boolean):int");
    }

    public static final int A0(qga qgaVar) {
        if ((qgaVar instanceof jga) || (qgaVar instanceof kga) || (qgaVar instanceof lga)) {
            return R.string.publication_flow_cta_approve_and_publish;
        }
        if (qgaVar instanceof nga) {
            return R.string.publication_flow_cta_publish;
        }
        if (qgaVar instanceof oga) {
            return R.string.publication_flow_cta_save_and_publish;
        }
        if (qgaVar instanceof pga) {
            return R.string.publication_flow_cta_submit_to_publication;
        }
        if (qgaVar instanceof mga) {
            return R.string.publication_flow_cta_submitted_to_publication;
        }
        ygf.a();
        return 0;
    }

    public static r28 B(r28 r28Var) {
        Map map = qwe.a;
        return r40.z(r28Var).b(new efc(f76.P(0.0f, 400.0f, new s46(4294967297L), 1)));
    }

    public static HttpURLConnection B0(hf5 hf5Var) throws Throwable {
        Iterator<E> it2 = hf5Var.iterator();
        while (it2.hasNext()) {
            ff5 ff5Var = (ff5) it2.next();
            if (dt5.GET == ff5Var.h && epe.J(ff5Var.d.getString("fields"))) {
                z46 z46Var = f87.b;
                i87.DEVELOPER_ERRORS.getClass();
                synchronized (f94.b) {
                }
            }
        }
        try {
            HttpURLConnection httpURLConnectionK = null;
            try {
                httpURLConnectionK = K(hf5Var.c.size() == 1 ? new URL(((ff5) hf5Var.c.get(0)).g()) : new URL(String.format("https://graph.%s", Arrays.copyOf(new Object[]{f94.e()}, 1))));
                x0(hf5Var, httpURLConnectionK);
                return httpURLConnectionK;
            } catch (IOException e2) {
                epe.r(httpURLConnectionK);
                throw new FacebookException("could not construct request body", e2);
            } catch (JSONException e3) {
                epe.r(httpURLConnectionK);
                throw new FacebookException("could not construct request body", e3);
            }
        } catch (MalformedURLException e4) {
            throw new FacebookException("could not construct URL for request", e4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0208  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x020b  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x00c9 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e3 A[Catch: j86 -> 0x01bc, TRY_ENTER, TRY_LEAVE, TryCatch #3 {j86 -> 0x01bc, blocks: (B:35:0x00c5, B:42:0x00e3, B:56:0x010d, B:58:0x0123, B:62:0x0138, B:66:0x0140), top: B:115:0x00c5 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r3v13, types: [fv6] */
    /* JADX WARN: Type inference failed for: r3v17 */
    /* JADX WARN: Type inference failed for: r3v7 */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v17 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v3 */
    /* JADX WARN: Type inference failed for: r6v4, types: [fv6, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v4, types: [boolean] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x0190 -> B:110:0x019b). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object C(defpackage.fv6 r28, int r29, int r30, int r31, defpackage.m73 r32, defpackage.p92 r33) {
        /*
            Method dump skipped, instruction units count: 572
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.C(fv6, int, int, int, m73, p92):java.lang.Object");
    }

    public static void C0(StringBuilder sb, List list) {
        l46 l46VarR = iq7.R(iq7.W(0, list.size()), 2);
        int i2 = l46VarR.a;
        int i3 = l46VarR.b;
        int i4 = l46VarR.c;
        if ((i4 <= 0 || i2 > i3) && (i4 >= 0 || i3 > i2)) {
            return;
        }
        while (true) {
            String str = (String) list.get(i2);
            String str2 = (String) list.get(i2 + 1);
            if (i2 > 0) {
                sb.append('&');
            }
            sb.append(str);
            if (str2 != null) {
                sb.append('=');
                sb.append(str2);
            }
            if (i2 == i3) {
                return;
            } else {
                i2 += i4;
            }
        }
    }

    public static final boolean D(boolean z, fv6 fv6Var, int i2, int i3) {
        if (z) {
            if (fv6Var.c() > i2) {
                return true;
            }
            return fv6Var.c() == i2 && fv6Var.d() > i3;
        }
        if (fv6Var.c() < i2) {
            return true;
        }
        return fv6Var.c() == i2 && fv6Var.d() < i3;
    }

    public static final void D0(int i2, int i3, int i4) {
        boolean z = false;
        if (i2 >= 0 && i2 <= i3) {
            z = true;
        }
        if (z) {
            return;
        }
        StringBuilder sbB = ev6.B(i4, i2, "OffsetMapping.originalToTransformed returned invalid mapping: ", " -> ", " is not in range of transformed text [0, ");
        sbB.append(i3);
        sbB.append(']');
        e26.c(sbB.toString());
    }

    public static final Bundle E(f09... f09VarArr) {
        Bundle bundle = new Bundle(f09VarArr.length);
        for (f09 f09Var : f09VarArr) {
            String str = (String) f09Var.a;
            Object obj = f09Var.b;
            if (obj == null) {
                bundle.putString(str, null);
            } else if (obj instanceof Boolean) {
                bundle.putBoolean(str, ((Boolean) obj).booleanValue());
            } else if (obj instanceof Byte) {
                bundle.putByte(str, ((Number) obj).byteValue());
            } else if (obj instanceof Character) {
                bundle.putChar(str, ((Character) obj).charValue());
            } else if (obj instanceof Double) {
                bundle.putDouble(str, ((Number) obj).doubleValue());
            } else if (obj instanceof Float) {
                bundle.putFloat(str, ((Number) obj).floatValue());
            } else if (obj instanceof Integer) {
                bundle.putInt(str, ((Number) obj).intValue());
            } else if (obj instanceof Long) {
                bundle.putLong(str, ((Number) obj).longValue());
            } else if (obj instanceof Short) {
                bundle.putShort(str, ((Number) obj).shortValue());
            } else if (obj instanceof Bundle) {
                bundle.putBundle(str, (Bundle) obj);
            } else if (obj instanceof CharSequence) {
                bundle.putCharSequence(str, (CharSequence) obj);
            } else if (obj instanceof Parcelable) {
                bundle.putParcelable(str, (Parcelable) obj);
            } else if (obj instanceof boolean[]) {
                bundle.putBooleanArray(str, (boolean[]) obj);
            } else if (obj instanceof byte[]) {
                bundle.putByteArray(str, (byte[]) obj);
            } else if (obj instanceof char[]) {
                bundle.putCharArray(str, (char[]) obj);
            } else if (obj instanceof double[]) {
                bundle.putDoubleArray(str, (double[]) obj);
            } else if (obj instanceof float[]) {
                bundle.putFloatArray(str, (float[]) obj);
            } else if (obj instanceof int[]) {
                bundle.putIntArray(str, (int[]) obj);
            } else if (obj instanceof long[]) {
                bundle.putLongArray(str, (long[]) obj);
            } else if (obj instanceof short[]) {
                bundle.putShortArray(str, (short[]) obj);
            } else if (obj instanceof Object[]) {
                Class<?> componentType = obj.getClass().getComponentType();
                componentType.getClass();
                if (Parcelable.class.isAssignableFrom(componentType)) {
                    bundle.putParcelableArray(str, (Parcelable[]) obj);
                } else if (String.class.isAssignableFrom(componentType)) {
                    bundle.putStringArray(str, (String[]) obj);
                } else if (CharSequence.class.isAssignableFrom(componentType)) {
                    bundle.putCharSequenceArray(str, (CharSequence[]) obj);
                } else {
                    if (!Serializable.class.isAssignableFrom(componentType)) {
                        lg8.h(34, "Illegal value array type ", componentType.getCanonicalName(), " for key \"", str);
                        return null;
                    }
                    bundle.putSerializable(str, (Serializable) obj);
                }
            } else if (obj instanceof Serializable) {
                bundle.putSerializable(str, (Serializable) obj);
            } else if (obj instanceof IBinder) {
                bundle.putBinder(str, (IBinder) obj);
            } else if (obj instanceof Size) {
                bundle.putSize(str, (Size) obj);
            } else {
                if (!(obj instanceof SizeF)) {
                    lg8.h(34, "Illegal value type ", obj.getClass().getCanonicalName(), " for key \"", str);
                    return null;
                }
                bundle.putSizeF(str, (SizeF) obj);
            }
        }
        return bundle;
    }

    public static final void E0(int i2, int i3, int i4) {
        boolean z = false;
        if (i2 >= 0 && i2 <= i3) {
            z = true;
        }
        if (z) {
            return;
        }
        StringBuilder sbB = ev6.B(i4, i2, "OffsetMapping.transformedToOriginal returned invalid mapping: ", " -> ", " is not in range of original text [0, ");
        sbB.append(i3);
        sbB.append(']');
        e26.c(sbB.toString());
    }

    public static final void F(AutoCloseable autoCloseable, Throwable th) {
        if (autoCloseable != null) {
            if (th != null) {
                try {
                    wgd.B(autoCloseable);
                    return;
                } catch (Throwable th2) {
                    kyd.D(th, th2);
                    return;
                }
            }
            if (autoCloseable instanceof AutoCloseable) {
                autoCloseable.close();
                return;
            }
            if (autoCloseable instanceof ExecutorService) {
                cm0.i((ExecutorService) autoCloseable);
                return;
            }
            if (autoCloseable instanceof TypedArray) {
                ((TypedArray) autoCloseable).recycle();
                return;
            }
            if (autoCloseable instanceof MediaMetadataRetriever) {
                ((MediaMetadataRetriever) autoCloseable).release();
                return;
            }
            if (autoCloseable instanceof MediaDrm) {
                ((MediaDrm) autoCloseable).release();
                return;
            }
            if (autoCloseable instanceof DrmManagerClient) {
                ((DrmManagerClient) autoCloseable).release();
            } else if (autoCloseable instanceof ContentProviderClient) {
                ((ContentProviderClient) autoCloseable).release();
            } else {
                lg8.r();
            }
        }
    }

    public static final void F0(String str, String str2) {
        File fileU = U();
        if (fileU == null || str == null || str2 == null) {
            return;
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(fileU, str));
            byte[] bytes = str2.getBytes(wk1.a);
            bytes.getClass();
            fileOutputStream.write(bytes);
            fileOutputStream.close();
        } catch (Exception unused) {
        }
    }

    public static final List G(ArrayList arrayList) {
        int size = arrayList.size();
        if (size == 0) {
            return ey3.a;
        }
        if (size == 1) {
            return d46.Q(bu1.x0(arrayList));
        }
        arrayList.trimToSize();
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00fd  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.v41 H(defpackage.hj6 r7, boolean r8) {
        /*
            Method dump skipped, instruction units count: 522
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.H(hj6, boolean):v41");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:14:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.l51 I(defpackage.hj6 r5, boolean r6, java.lang.reflect.Field r7) {
        /*
            Method dump skipped, instruction units count: 216
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.I(hj6, boolean, java.lang.reflect.Field):l51");
    }

    public static final boolean J(hj6 hj6Var) {
        return !nxd.e(hj6Var.D().y().getType());
    }

    public static final File L(Context context, String str) {
        return new File(context.getApplicationContext().getFilesDir(), "datastore/".concat(str));
    }

    public static final int M(char c2) {
        if ('0' <= c2 && c2 < ':') {
            return c2 - '0';
        }
        if ('a' <= c2 && c2 < 'g') {
            return c2 - 'W';
        }
        if ('A' <= c2 && c2 < 'G') {
            return c2 - '7';
        }
        throw new IllegalArgumentException("Unexpected hex digit: " + c2);
    }

    public static final void N(String str) {
        File fileU = U();
        if (fileU == null || str == null) {
            return;
        }
        new File(fileU, str).delete();
    }

    public static ArrayList O(hf5 hf5Var) {
        Exception exc;
        HttpURLConnection httpURLConnectionB0;
        ArrayList arrayListP;
        hk7.D(hf5Var);
        HttpURLConnection httpURLConnection = null;
        try {
            httpURLConnectionB0 = B0(hf5Var);
            exc = null;
        } catch (Exception e2) {
            exc = e2;
            httpURLConnectionB0 = null;
        } catch (Throwable th) {
            th = th;
            epe.r(httpURLConnection);
            throw th;
        }
        try {
            if (httpURLConnectionB0 != null) {
                arrayListP = P(hf5Var, httpURLConnectionB0);
            } else {
                ArrayList arrayListA = d46.A(hf5Var.c, null, new FacebookException(exc));
                t0(hf5Var, arrayListA);
                arrayListP = arrayListA;
            }
            epe.r(httpURLConnectionB0);
            return arrayListP;
        } catch (Throwable th2) {
            th = th2;
            httpURLConnection = httpURLConnectionB0;
            epe.r(httpURLConnection);
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x002b A[EXC_TOP_SPLITTER, PHI: r0 r4
      0x002b: PHI (r0v4 java.util.ArrayList) = (r0v2 java.util.ArrayList), (r0v3 java.util.ArrayList), (r0v9 java.util.ArrayList) binds: [B:23:0x0052, B:25:0x0062, B:16:0x0029] A[DONT_GENERATE, DONT_INLINE]
      0x002b: PHI (r4v1 java.io.InputStream) = (r4v0 java.io.InputStream), (r4v0 java.io.InputStream), (r4v13 java.io.InputStream) binds: [B:23:0x0052, B:25:0x0062, B:16:0x0029] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.ArrayList P(defpackage.hf5 r8, java.net.HttpURLConnection r9) {
        /*
            Method dump skipped, instruction units count: 259
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.P(hf5, java.net.HttpURLConnection):java.util.ArrayList");
    }

    public static final prd Q(ywb ywbVar, mx mxVar) {
        ywbVar.getClass();
        int length = mxVar.b.length();
        String str = mxVar.b;
        int length2 = str.length();
        int iMin = Math.min(length, 100);
        for (int i2 = 0; i2 < iMin; i2++) {
            D0(i2, length2, i2);
        }
        D0(length, length2, length);
        int iMin2 = Math.min(length2, 100);
        for (int i3 = 0; i3 < iMin2; i3++) {
            E0(i3, length, i3);
        }
        E0(length2, length, length2);
        return new prd(mxVar, new yqa(str.length(), str.length(), 5));
    }

    public static final Class R(String str) {
        if (ec2.a.contains(xz5.class)) {
            return null;
        }
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException unused) {
            return null;
        } catch (Throwable th) {
            ec2.a(xz5.class, th);
            return null;
        }
    }

    public static final Method S(Class cls, String str, Class... clsArr) {
        if (!ec2.a.contains(xz5.class)) {
            try {
                return cls.getDeclaredMethod(str, (Class[]) Arrays.copyOf(clsArr, clsArr.length));
            } catch (NoSuchMethodException unused) {
            } catch (Throwable th) {
                ec2.a(xz5.class, th);
            }
        }
        return null;
    }

    public static final File U() {
        File file = new File(f94.a().getCacheDir(), "instrument");
        if (file.exists() || file.mkdirs()) {
            return file;
        }
        return null;
    }

    public static final Method V(Class cls, String str, Class... clsArr) {
        if (!ec2.a.contains(xz5.class)) {
            try {
                return cls.getMethod(str, (Class[]) Arrays.copyOf(clsArr, clsArr.length));
            } catch (NoSuchMethodException unused) {
            } catch (Throwable th) {
                ec2.a(xz5.class, th);
            }
        }
        return null;
    }

    public static final r28 W(r28 r28Var, x45 x45Var) {
        return r28Var.b(new fs0(x45Var));
    }

    public static r28 X(r28 r28Var, float f2, float f3, float f4, float f5, m3c m3cVar, int i2) {
        float f6 = (i2 & 1) != 0 ? 1.0f : f2;
        float f7 = (i2 & 2) != 0 ? 1.0f : f3;
        float f8 = (i2 & 4) != 0 ? 1.0f : f4;
        float f9 = (i2 & 32) != 0 ? 0.0f : f5;
        long j2 = nrd.b;
        m3c m3cVar2 = (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? rv8.r : m3cVar;
        long j3 = sf5.a;
        return r28Var.b(new pf5(f6, f7, f8, f9, 0.0f, j2, m3cVar2, false, j3, j3, 0));
    }

    public static r28 Y(r28 r28Var, float f2, float f3, float f4, m3c m3cVar, int i2) {
        float f5 = (i2 & 1) != 0 ? 1.0f : f2;
        float f6 = (i2 & 2) != 0 ? 1.0f : f3;
        float f7 = (i2 & 4) != 0 ? 1.0f : f4;
        float f8 = (i2 & 256) != 0 ? 0.0f : 90.0f;
        long j2 = nrd.b;
        m3c m3cVar2 = (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? rv8.r : m3cVar;
        boolean z = (i2 & 4096) == 0;
        long j3 = sf5.a;
        return r28Var.b(new pf5(f5, f6, f7, 0.0f, f8, j2, m3cVar2, z, j3, j3, (i2 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? 0 : 1));
    }

    public static final long Z(long j2) {
        if (j2 < 0) {
            int i2 = in3.d;
            return in3.c;
        }
        int i3 = in3.d;
        return in3.b;
    }

    public static final void a(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-674518197);
        int i3 = 4;
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-901032046);
            for (int i8 = 0; i8 < 10; i8++) {
                yi2.p(0, 0L, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, i3);
        }
    }

    public static final Object a0(Class cls, Object obj, Method method, Object... objArr) {
        if (!ec2.a.contains(xz5.class)) {
            try {
                cls.getClass();
                method.getClass();
                if (obj != null) {
                    obj = cls.cast(obj);
                }
                try {
                    return method.invoke(obj, Arrays.copyOf(objArr, objArr.length));
                } catch (IllegalAccessException | InvocationTargetException unused) {
                }
            } catch (Throwable th) {
                ec2.a(xz5.class, th);
                return null;
            }
        }
        return null;
    }

    public static final void b(og ogVar, ig igVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1255273916);
        int i3 = i2 | (p65Var.f(ogVar) ? 4 : 2) | (p65Var.f(igVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = ogVar.a;
            r28 r28VarA = iy0.a.a(o28Var, ar0Var);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                vf vfVar = new vf(0, igVar, ig.class, "refresh", "refresh()V", 0, 2);
                p65Var.j0(vfVar);
                objM = vfVar;
            }
            iq7.a(b24Var, r28VarA, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 11, ogVar, igVar, r28Var);
        }
    }

    public static final boolean b0(StackTraceElement stackTraceElement) {
        String className = stackTraceElement.getClassName();
        className.getClass();
        if (tuc.N(className, "com.facebook", false)) {
            return true;
        }
        String className2 = stackTraceElement.getClassName();
        className2.getClass();
        return tuc.N(className2, "com.meta", false);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(defpackage.qg r22, defpackage.nhc r23, defpackage.ig r24, defpackage.cs1 r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 261
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.c(qg, nhc, ig, cs1, r28, x12, int, int):void");
    }

    public static final boolean c0(fv6 fv6Var, int i2) {
        return i2 <= fv6Var.e() && fv6Var.c() <= i2;
    }

    public static final void d(String str, int i2, fg fgVar, r28 r28Var, ug ugVar, x12 x12Var, int i3) {
        ug ugVar2;
        int i4;
        ug ugVar3;
        ug ugVar4;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(102401276);
        int i5 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(fgVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            p65Var.U();
            int i6 = i3 & 1;
            int i7 = 3;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ne(str, i2, i7);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ug ugVar5 = (ug) to7.z(n1b.a.b(ug.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i4 = i5 & (-57345);
                    ugVar3 = ugVar5;
                }
            } else {
                p65Var.S();
                i4 = i5 & (-57345);
                ugVar3 = ugVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ugVar3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i8 = i4 & 896;
            boolean zF = (i8 == 256) | p65Var.f(ugVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new hg(fgVar, ugVar3);
                p65Var.j0(objM2);
            }
            hg hgVar = (hg) objM2;
            boolean zF2 = p65Var.f(ugVar3) | (i8 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new ig(fgVar, ugVar3);
                p65Var.j0(objM3);
            }
            c((qg) l78VarZ.getValue(), nhcVarF, (ig) objM3, hgVar, r28Var, p65Var, (i4 << 3) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(ugVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(hgVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ugVar4 = ugVar3;
                ra raVar = new ra(ugVar4, nhcVarF, resources, hgVar, null, 9);
                p65Var.j0(raVar);
                objM4 = raVar;
            } else {
                ugVar4 = ugVar3;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            ugVar2 = ugVar4;
        } else {
            p65Var.S();
            ugVar2 = ugVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(str, i2, fgVar, r28Var, ugVar2, i3, 4);
        }
    }

    public static final boolean d0(Thread thread) {
        StackTraceElement[] stackTrace = thread.getStackTrace();
        if (stackTrace != null) {
            for (StackTraceElement stackTraceElement : stackTrace) {
                stackTraceElement.getClass();
                if (b0(stackTraceElement)) {
                    String className = stackTraceElement.getClassName();
                    className.getClass();
                    if (!tuc.N(className, "com.facebook.appevents.codeless", false)) {
                        String className2 = stackTraceElement.getClassName();
                        className2.getClass();
                        if (!tuc.N(className2, "com.facebook.appevents.suggestedevents", false)) {
                            return true;
                        }
                    }
                    String methodName = stackTraceElement.getMethodName();
                    methodName.getClass();
                    if (tuc.N(methodName, "onClick", false)) {
                        continue;
                    } else {
                        String methodName2 = stackTraceElement.getMethodName();
                        methodName2.getClass();
                        if (tuc.N(methodName2, "onItemClick", false)) {
                            continue;
                        } else {
                            String methodName3 = stackTraceElement.getMethodName();
                            methodName3.getClass();
                            if (!tuc.N(methodName3, "onTouch", false)) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public static final void e(final nf1 nf1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        int i3 = nf1Var.c;
        CatalogName catalogName = nf1Var.e;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1981397467);
        int i4 = (p65Var.f(nf1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String str = nf1Var.g;
            boolean z = nf1Var.a;
            kx kxVarW = ho2.w(p65Var, 1452465909);
            String strA = af1.a(catalogName, p65Var);
            final int i5 = 1;
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            Resources resources = context.getResources();
            resources.getClass();
            String strD = vo7.D(R.plurals.notification_type_catalog_recommended_milestone, i3, new Object[]{af1.b(catalogName, resources), Integer.valueOf(i3)}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strD);
                kxVarW.f(iH);
                int iZ = muc.Z(strD, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                long j2 = nf1Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
                int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i4 & 14;
                boolean z2 = (i6 == 32) | (i7 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: of1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i;
                            c1e c1eVar = c1e.a;
                            nf1 nf1Var2 = nf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i8) {
                                case 0:
                                    ek8Var2.o(nf1Var2.d, nf1Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(nf1Var2.f, nf1Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i8 = (i6 == 32 ? 1 : 0) | (i7 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i8 != 0 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: of1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i5;
                            c1e c1eVar = c1e.a;
                            nf1 nf1Var2 = nf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i82) {
                                case 0:
                                    ek8Var2.o(nf1Var2.d, nf1Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(nf1Var2.f, nf1Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str, numValueOf, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(nf1Var, ek8Var, i2, 25);
        }
    }

    public static boolean e0(Object obj) {
        return (obj instanceof Bitmap) || (obj instanceof byte[]) || (obj instanceof Uri) || (obj instanceof ParcelFileDescriptor) || (obj instanceof df5);
    }

    public static final void f(ng ngVar, cs1 cs1Var, ig igVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        ig igVar2 = igVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1577322424);
        int i3 = i2 | (p65Var.f(ngVar) ? 4 : 2) | (p65Var.f(cs1Var) ? 32 : 16) | (p65Var.f(igVar2) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z = ngVar.b;
            int i4 = i3 & 896;
            boolean z2 = i4 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, igVar2, ig.class, "refresh", "refresh()V", 0, 4);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1616288390, new fd3(kv6VarA, (Object) ngVar, (Object) cs1Var, (Object) igVar, 16), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i4 == 256;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                igVar2 = igVar;
                objM2 = new z8(igVar2, null, 5);
                p65Var.j0(objM2);
            } else {
                igVar2 = igVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 4, ngVar, cs1Var, igVar2, r28Var);
        }
    }

    public static boolean f0(Object obj) {
        return (obj instanceof String) || (obj instanceof Boolean) || (obj instanceof Number) || (obj instanceof Date);
    }

    public static final void g(pf3 pf3Var, nf3 nf3Var, r28 r28Var, x12 x12Var, int i2) {
        pf3 pf3Var2;
        final nf3 nf3Var2 = nf3Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(297303292);
        int i3 = i2 | (p65Var.f(pf3Var) ? 4 : 2) | (p65Var.f(nf3Var2) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "content_state"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String strR = vo7.R(p65Var, R.string.discoverability_section_title);
            sn3 sn3Var = jt7.c;
            final int i7 = 1;
            jjd.b(strR, bgf.N(w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), "discoverability_section_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 48, 0, 131068);
            jjd.b(vo7.R(p65Var, R.string.discoverability_section_description), bgf.N(w2g.G(o28Var, 24.0f, 4.0f, 24.0f, 0.0f, 8), "discoverability_section_description"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            pf3Var2 = pf3Var;
            p65Var = p65Var;
            boolean z = !pf3Var2.a;
            String strR2 = vo7.R(p65Var, R.string.discoverability_option_nobody);
            int i8 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i8 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                nf3Var2 = nf3Var;
                objM = new m45() { // from class: lf3
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i;
                        c1e c1eVar = c1e.a;
                        nf3 nf3Var3 = nf3Var2;
                        switch (i9) {
                            case 0:
                                nf3Var3.a(false);
                                break;
                            default:
                                nf3Var3.a(true);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            } else {
                nf3Var2 = nf3Var;
            }
            aq7.e(z, strR2, (m45) objM, bgf.N(w2g.G(o28Var, 0.0f, 12.0f, 24.0f, 0.0f, 9), "discoverability_by_email_option_nobody"), p65Var, 3072);
            boolean z3 = pf3Var2.a;
            String strR3 = vo7.R(p65Var, R.string.discoverability_option_everyone);
            i = i8 == 32 ? 1 : 0;
            Object objM2 = p65Var.M();
            if (i != 0 || objM2 == uobVar) {
                objM2 = new m45() { // from class: lf3
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i7;
                        c1e c1eVar = c1e.a;
                        nf3 nf3Var3 = nf3Var2;
                        switch (i9) {
                            case 0:
                                nf3Var3.a(false);
                                break;
                            default:
                                nf3Var3.a(true);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            aq7.e(z3, strR3, (m45) objM2, bgf.N(w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11), "discoverability_by_email_option_everyone"), p65Var, 3072);
            b09.H(p65Var, true, true, true);
        } else {
            pf3Var2 = pf3Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 23, pf3Var2, nf3Var2, r28Var);
        }
    }

    public static ff5 g0(w3 w3Var, String str, bf5 bf5Var) {
        return new ff5(w3Var, str, null, null, bf5Var);
    }

    public static final void h(qf3 qf3Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1850686557);
        int i3 = (p65Var.f(qf3Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(qf3Var.a, null, null, null, null, null, null, null, p65Var, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(qf3Var, r28Var, i2, 19);
        }
    }

    public static ff5 h0(w3 w3Var, String str, JSONObject jSONObject, bf5 bf5Var) {
        ff5 ff5Var = new ff5(w3Var, str, null, dt5.POST, bf5Var);
        ff5Var.c = jSONObject;
        return ff5Var;
    }

    public static final void i(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2134333197);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "loading_state"), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            o(w2g.G(iy0.a.a(o28Var, ar0Var), 0.0f, 48.0f, 0.0f, 0.0f, 13), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 18);
        }
    }

    public static final void i0(qga qgaVar, sda sdaVar) {
        if (qgaVar instanceof jga) {
            sdaVar.a.e();
            return;
        }
        if (qgaVar instanceof kga) {
            sdaVar.a.f();
            return;
        }
        if (qgaVar instanceof lga) {
            sdaVar.a();
            return;
        }
        if (qgaVar instanceof nga) {
            sdaVar.a();
            return;
        }
        if (qgaVar instanceof oga) {
            fha fhaVar = sdaVar.a;
            fhaVar.getClass();
            vx0.c0(f76.F(fhaVar), null, null, new wga(fhaVar, null, 1), 3);
            return;
        }
        if (qgaVar instanceof pga) {
            sdaVar.a.k();
        } else {
            if (qgaVar instanceof mga) {
                return;
            }
            ygf.a();
        }
    }

    public static final void j(sf3 sf3Var, nhc nhcVar, nf3 nf3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        sf3Var.getClass();
        nhcVar.getClass();
        nf3Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(414431576);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(sf3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(nf3Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new iz2(9);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "discoverability_screen"), pxf.E(-138868644, new l23(7, nf3Var), p65Var2), null, pxf.E(-1413792290, new u8(nhcVar, 20), p65Var2), null, 0, 0L, 0L, null, pxf.E(1132184423, new ec(sf3Var, 26, nf3Var), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 17, sf3Var, nhcVar, nf3Var, r28Var);
        }
    }

    public static String j0(Object obj) {
        if (obj instanceof String) {
            return (String) obj;
        }
        if ((obj instanceof Boolean) || (obj instanceof Number)) {
            return obj.toString();
        }
        if (!(obj instanceof Date)) {
            ay0.e("Unsupported parameter type.");
            return null;
        }
        String str = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US).format((Date) obj);
        str.getClass();
        return str;
    }

    public static final void k(String str, rz2 rz2Var, r28 r28Var, uf3 uf3Var, x12 x12Var, int i2) {
        uf3 uf3Var2;
        int i3;
        uf3 uf3Var3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(210780869);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(rz2Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 15);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    uf3Var3 = (uf3) to7.z(n1b.a.b(uf3.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                uf3Var3 = uf3Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(uf3Var3.g, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            boolean zF = p65Var.f(uf3Var3) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new nf3(rz2Var, uf3Var3);
                p65Var.j0(objM3);
            }
            j((sf3) l78VarZ.getValue(), nhcVar, (nf3) objM3, r28Var, p65Var, ((i3 << 3) & 7168) | 48);
            boolean zH = p65Var.h(uf3Var3);
            Object objM4 = p65Var.M();
            n92 n92Var = null;
            if (zH || objM4 == uobVar) {
                objM4 = new z8(uf3Var3, n92Var, 18);
                p65Var.j0(objM4);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM4, c1eVar);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH2 = p65Var.h(uf3Var3) | p65Var.h(resources);
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                ku2 ku2Var = new ku2(uf3Var3, nhcVar, resources, n92Var, 8);
                p65Var.j0(ku2Var);
                objM5 = ku2Var;
            }
            kyd.k(p65Var, (b55) objM5, c1eVar);
            uf3Var2 = uf3Var3;
        } else {
            p65Var.S();
            uf3Var2 = uf3Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 0, str, rz2Var, r28Var, uf3Var2);
        }
    }

    public static pu k0(td6 td6Var, bc7 bc7Var) {
        return new pu(xk6.a(td6Var, bc7Var, 1.0f, rz5.d, false), 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r15v7 */
    /* JADX WARN: Type inference failed for: r15v8 */
    public static final void l(aw4 aw4Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var;
        boolean z;
        long j2;
        float f2;
        float f3;
        ?? r15;
        long j3;
        boolean z2 = aw4Var.d;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-527728900);
        int i3 = i2 | (p65Var2.f(aw4Var) ? 4 : 2) | (p65Var2.h(m45Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r40.y(jfc.p(o28Var, 72.0f), bmb.a(4.0f)), false, null, new vkb(0), m45Var, 11), 0.0f, 0.0f, 0.0f, 4.0f, 7), "publication_" + aw4Var.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarL = jfc.l(o28Var, 72.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j5 = p65Var2.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarL);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            amb ambVarA = bmb.a(4.0f);
            r28 r28VarC = w2g.C(jfc.l(o28Var, 72.0f), 3.0f);
            if (z2) {
                p65Var2.Y(-1824202410);
                j2 = ((zo7) p65Var2.j(kt7.b)).y;
                z = false;
                p65Var2.p(false);
            } else {
                z = false;
                p65Var2.Y(-1824201333);
                p65Var2.p(false);
                j2 = uu1.g;
            }
            r28 r28VarY = r40.y(bo.B(w2g.C(bo.B(r28VarC, 1.0f, j2, bmb.a(8.0f)), 5.0f), 1.0f, gsa.b0(p65Var2), ambVarA), ambVarA);
            if (((Boolean) p65Var2.j(l36.a)).booleanValue()) {
                f2 = 1.0f;
                f3 = 3.0f;
                boolean z3 = z;
                p65Var2.Y(-714915126);
                dy0.a(flb.a0(r28VarY, ((zo7) p65Var2.j(kt7.b)).o, rv8.r), p65Var2, z3 ? 1 : 0);
                p65Var2.p(z3);
                r15 = z3;
            } else {
                p65Var2.Y(-715288118);
                sn3 sn3Var = eo.b;
                nx5 nx5Var = new nx5((Context) p65Var2.j(sn3Var));
                String str = aw4Var.c;
                nx5Var.c = str != null ? new ax5(str) : null;
                hlg.X(nx5Var, (Context) p65Var2.j(sn3Var));
                rx5 rx5VarA = nx5Var.a();
                f2 = 1.0f;
                f3 = 3.0f;
                boolean z4 = z;
                ur7.a(rx5VarA, null, r28VarY, null, null, 0.0f, null, 0, p65Var2, 48, 2040);
                p65Var2.p(z4);
                r15 = z4;
            }
            if (!aw4Var.e || z2) {
                p65Var2.Y(-718104158);
            } else {
                p65Var2.Y(-714659624);
                r28 r28VarL2 = jfc.l(w2g.G(iy0.a.a(o28Var, z46.f), 0.0f, 2.0f, 0.0f, 0.0f, 9), 18.0f);
                sn3 sn3Var2 = kt7.b;
                long j6 = ((zo7) p65Var2.j(sn3Var2)).a;
                amb ambVar = bmb.a;
                dy0.a(flb.a0(w2g.C(flb.a0(r28VarL2, j6, ambVar), 6.0f), ((zo7) p65Var2.j(sn3Var2)).r, ambVar), p65Var2, r15);
            }
            p65Var2.p(r15);
            p65Var2.p(true);
            if (z2) {
                p65Var2.Y(-915061704);
                j3 = rz5.A(p65Var2).n;
                p65Var2.p(r15);
            } else {
                p65Var2.Y(-914988234);
                j3 = rz5.A(p65Var2).o;
                p65Var2.p(r15);
            }
            jjd.b(aw4Var.b, jfc.d(w2g.G(o28Var, f3, 4.0f, f3, 0.0f, 8), f2), 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkd.a(rz5.D(p65Var2).o, j3, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 24960, 109564);
            p65 p65Var3 = p65Var2;
            p65Var3.p(true);
            r28Var2 = o28Var;
            p65Var = p65Var3;
        } else {
            p65Var2.S();
            r28Var2 = r28Var;
            p65Var = p65Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 19, aw4Var, m45Var, r28Var2);
        }
    }

    public static qu l0(id6 id6Var, bc7 bc7Var, boolean z) {
        return new qu(xk6.a(id6Var, bc7Var, z ? gpe.c() : 1.0f, h1c.f, false));
    }

    public static final void m(uga ugaVar, wda wdaVar, sda sdaVar, boolean z, r28 r28Var, kv6 kv6Var, x12 x12Var, int i2) {
        final sda sdaVar2;
        p65 p65Var;
        int i3;
        o28 o28Var;
        p65 p65Var2;
        int i4;
        r28 r28Var2;
        boolean z2;
        uga ugaVar2 = ugaVar;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(451984801);
        int i5 = i2 | (p65Var3.f(ugaVar2) ? 4 : 2) | (p65Var3.f(wdaVar) ? 32 : 16) | (p65Var3.f(sdaVar) ? 256 : 128) | (p65Var3.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var3.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var3.f(kv6Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var3.P(i5 & 1, (74899 & i5) != 74898)) {
            p65Var3.U();
            if ((i2 & 1) != 0 && !p65Var3.z()) {
                p65Var3.S();
            }
            p65Var3.q();
            rh4 rh4Var = jfc.c;
            WeakHashMap weakHashMap = f5f.w;
            r28 r28VarP0 = op8.p0(rh4Var, new y0e(tr7.o(p65Var3).e, tr7.o(p65Var3).c));
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var3.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarP0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var3, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var3, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            r28 r28VarC = jfc.c(r28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarC, ((zo7) p65Var3.j(sn3Var)).a, rv8.r);
            int i7 = i5 & 896;
            boolean z3 = ((i5 & 14) == 4) | (i7 == 256) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var3.M();
            uob uobVar = w12.a;
            int i8 = 3;
            if (z3 || objM == uobVar) {
                objM = new pi9(ugaVar2, sdaVar, wdaVar, i8);
                p65Var3.j0(objM);
            }
            final int i9 = 1;
            k40.t(r28VarA0, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var3, (i5 >> 12) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 508);
            Object objM2 = p65Var3.M();
            if (objM2 == uobVar) {
                objM2 = bjc.b(new f91(kv6Var, 10));
                p65Var3.j0(objM2);
            }
            upc upcVar = (upc) objM2;
            Boolean boolValueOf = Boolean.valueOf(z);
            Integer num = (Integer) upcVar.getValue();
            boolean z4 = ((((458752 & i5) ^ 196608) > 131072 && p65Var3.f(kv6Var)) || (i5 & 196608) == 131072) | ((i5 & 7168) == 2048);
            Object objM3 = p65Var3.M();
            if (z4 || objM3 == uobVar) {
                lj1 lj1Var = new lj1(z, kv6Var, upcVar, (n92) null, 7);
                p65Var3.j0(lj1Var);
                objM3 = lj1Var;
            }
            kyd.l(boolValueOf, num, (b55) objM3, p65Var3);
            ar0 ar0Var2 = z46.k;
            iy0 iy0Var = iy0.a;
            o28 o28Var2 = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var3.j(kt7.a), iy0Var.a(o28Var2, ar0Var2), 3, 1.0f);
            final int i10 = 0;
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            long j3 = p65Var3.T;
            int i11 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, r28VarX);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, zk7VarC2);
            tp7.B(p65Var3, cuVar2, i89VarL2);
            ka1.z(i11, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var3.T;
            int i12 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var3.l();
            r28 r28VarR3 = gx1.R(p65Var3, r28VarD);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, zk7VarC3);
            tp7.B(p65Var3, cuVar2, i89VarL3);
            ka1.z(i12, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR3);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j5 = p65Var3.T;
            int i13 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var3.l();
            r28 r28VarR4 = gx1.R(p65Var3, o28Var2);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(ot2Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, wv1VarA);
            tp7.B(p65Var3, cuVar2, i89VarL4);
            ka1.z(i13, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR4);
            r28 r28VarG = w2g.G(jfc.d(o28Var2, 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            ugaVar2 = ugaVar;
            final qga qgaVar = ugaVar2.p;
            mga mgaVar = mga.a;
            if (qgaVar == null) {
                p65Var3.Y(1282410862);
                p65Var3.p(false);
                sdaVar2 = sdaVar;
                o28Var = o28Var2;
                r28Var2 = r28VarG;
                p65Var2 = p65Var3;
                i3 = i7;
                i4 = 256;
            } else {
                p65Var3.Y(1282410863);
                i3 = i7;
                boolean zF = p65Var3.f(qgaVar) | (i3 == 256);
                Object objM4 = p65Var3.M();
                if (zF || objM4 == uobVar) {
                    sdaVar2 = sdaVar;
                    objM4 = new m45() { // from class: rda
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i14 = i10;
                            c1e c1eVar = c1e.a;
                            sda sdaVar3 = sdaVar2;
                            qga qgaVar2 = qgaVar;
                            switch (i14) {
                                case 0:
                                    xz5.i0(qgaVar2, sdaVar3);
                                    break;
                                default:
                                    xz5.i0(qgaVar2, sdaVar3);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var3.j0(objM4);
                } else {
                    sdaVar2 = sdaVar;
                }
                m45 m45Var = (m45) objM4;
                String strR = vo7.R(p65Var3, A0(qgaVar));
                yn7 yn7Var = yn7.M;
                boolean z5 = !qgaVar.equals(mgaVar);
                o28Var = o28Var2;
                p65Var2 = p65Var3;
                i4 = 256;
                mo7.k(m45Var, strR, yn7Var, r28VarG, z5, p65Var2, 3456, 0);
                r28Var2 = r28VarG;
                p65Var2.p(false);
            }
            final qga qgaVar2 = ugaVar2.q;
            if (qgaVar2 == null) {
                p65Var2.Y(1282969048);
                p65Var2.p(false);
                p65Var = p65Var2;
                z2 = true;
            } else {
                p65Var2.Y(1282969049);
                if (ugaVar2.p != null) {
                    km4.F(12.0f, -76858819, p65Var2, p65Var2, o28Var);
                } else {
                    p65Var2.Y(-90547799);
                }
                p65Var2.p(false);
                boolean zF2 = p65Var2.f(qgaVar2) | (i3 == i4);
                Object objM5 = p65Var2.M();
                if (zF2 || objM5 == uobVar) {
                    objM5 = new m45() { // from class: rda
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i14 = i9;
                            c1e c1eVar = c1e.a;
                            sda sdaVar3 = sdaVar2;
                            qga qgaVar22 = qgaVar2;
                            switch (i14) {
                                case 0:
                                    xz5.i0(qgaVar22, sdaVar3);
                                    break;
                                default:
                                    xz5.i0(qgaVar22, sdaVar3);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var2.j0(objM5);
                }
                String strR2 = vo7.R(p65Var2, A0(qgaVar2));
                yn7 yn7Var2 = yn7.M;
                float f2 = i11.a;
                p65 p65Var4 = p65Var2;
                ay2 ay2VarA = i11.a(((zo7) p65Var2.j(sn3Var)).a, ((zo7) p65Var2.j(sn3Var)).n, ((zo7) p65Var2.j(sn3Var)).a, uu1.b(0.5f, ((zo7) p65Var2.j(sn3Var)).n), p65Var4, 0, 0);
                p65Var = p65Var4;
                boolean zEquals = qgaVar2.equals(mgaVar);
                z2 = true;
                mo7.l((m45) objM5, strR2, yn7Var2, r28Var2, ay2VarA, !zEquals, p65Var, 3456, 0);
                p65Var.p(false);
            }
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            p65Var.p(z2);
            p65Var.p(z2);
            p65Var.p(z2);
            p65Var.p(z2);
        } else {
            sdaVar2 = sdaVar;
            p65Var = p65Var3;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ke0(ugaVar2, wdaVar, sdaVar2, z, r28Var, kv6Var, i2, 4);
        }
    }

    public static pu m0(td6 td6Var, bc7 bc7Var, int i2) {
        d87 d87Var = new d87(3, (byte) 0);
        d87Var.b = i2;
        ArrayList arrayListA = xk6.a(td6Var, bc7Var, 1.0f, d87Var, false);
        for (int i3 = 0; i3 < arrayListA.size(); i3++) {
            uk6 uk6Var = (uk6) arrayListA.get(i3);
            re5 re5Var = (re5) uk6Var.b;
            re5 re5Var2 = (re5) uk6Var.c;
            if (re5Var != null && re5Var2 != null) {
                float[] fArr = re5Var.a;
                int length = fArr.length;
                float[] fArr2 = re5Var2.a;
                if (length != fArr2.length) {
                    int length2 = fArr.length + fArr2.length;
                    float[] fArr3 = new float[length2];
                    System.arraycopy(fArr, 0, fArr3, 0, fArr.length);
                    System.arraycopy(fArr2, 0, fArr3, fArr.length, fArr2.length);
                    Arrays.sort(fArr3);
                    float f2 = Float.NaN;
                    int i4 = 0;
                    for (int i5 = 0; i5 < length2; i5++) {
                        float f3 = fArr3[i5];
                        if (f3 != f2) {
                            fArr3[i4] = f3;
                            i4++;
                            f2 = fArr3[i5];
                        }
                    }
                    float[] fArrCopyOfRange = Arrays.copyOfRange(fArr3, 0, i4);
                    uk6Var = new uk6(re5Var.b(fArrCopyOfRange), re5Var2.b(fArrCopyOfRange));
                }
            }
            arrayListA.set(i3, uk6Var);
        }
        return new pu(arrayListA, 1);
    }

    public static final void n(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1930137341);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            br7.a(iy0.a.a(o28Var, ar0Var), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, ((zo7) p65Var.j(kt7.b)).n, p65Var, 0, 4);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 10);
        }
    }

    public static pu n0(id6 id6Var, bc7 bc7Var) {
        return new pu(xk6.a(id6Var, bc7Var, 1.0f, dq1.f, false), 2);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:87:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(defpackage.r28 r21, java.lang.Float r22, float r23, long r24, long r26, int r28, defpackage.x12 r29, final int r30, final int r31) {
        /*
            Method dump skipped, instruction units count: 389
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.o(r28, java.lang.Float, float, long, long, int, x12, int, int):void");
    }

    public static pu o0(td6 td6Var, bc7 bc7Var) {
        return new pu(xk6.a(td6Var, bc7Var, gpe.c(), y3b.i, true), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:100:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01aa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void p(defpackage.r28 r30, java.lang.Float r31, long r32, long r34, int r36, float r37, defpackage.x45 r38, defpackage.x12 r39, final int r40, final int r41) {
        /*
            Method dump skipped, instruction units count: 440
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.p(r28, java.lang.Float, long, long, int, float, x45, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void p0(org.json.JSONObject r6, java.lang.String r7, defpackage.cf5 r8) {
        /*
            java.util.regex.Pattern r0 = defpackage.ff5.k
            java.util.regex.Matcher r0 = r0.matcher(r7)
            boolean r1 = r0.matches()
            r2 = 1
            if (r1 == 0) goto L15
            java.lang.String r0 = r0.group(r2)
            r0.getClass()
            goto L16
        L15:
            r0 = r7
        L16:
            java.lang.String r1 = "me/"
            r3 = 0
            boolean r1 = defpackage.tuc.N(r0, r1, r3)
            if (r1 != 0) goto L2a
            java.lang.String r1 = "/me/"
            boolean r0 = defpackage.tuc.N(r0, r1, r3)
            if (r0 == 0) goto L28
            goto L2a
        L28:
            r7 = r3
            goto L40
        L2a:
            java.lang.String r0 = ":"
            r1 = 6
            int r0 = defpackage.muc.Z(r7, r0, r3, r3, r1)
            java.lang.String r4 = "?"
            int r7 = defpackage.muc.Z(r7, r4, r3, r3, r1)
            r1 = 3
            if (r0 <= r1) goto L28
            r1 = -1
            if (r7 == r1) goto L3f
            if (r0 >= r7) goto L28
        L3f:
            r7 = r2
        L40:
            java.util.Iterator r0 = r6.keys()
        L44:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto L6b
            java.lang.Object r1 = r0.next()
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r4 = r6.opt(r1)
            if (r7 == 0) goto L60
            java.lang.String r5 = "image"
            boolean r5 = defpackage.tuc.G(r1, r5, r2)
            if (r5 == 0) goto L60
            r5 = r2
            goto L61
        L60:
            r5 = r3
        L61:
            r1.getClass()
            r4.getClass()
            q0(r1, r4, r8, r5)
            goto L44
        L6b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.p0(org.json.JSONObject, java.lang.String, cf5):void");
    }

    public static final void q(sga sgaVar, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        x45 x45Var2;
        String strW;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2046087804);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(sgaVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            Integer num = sgaVar.b;
            int iIntValue = num != null ? num.intValue() : 0;
            if (iIntValue > 20) {
                p65Var.Y(826208647);
                strW = vo7.Q(R.string.publication_flow_newsletter_setting_title, new Object[]{Integer.valueOf(iIntValue)}, p65Var);
                p65Var.p(false);
            } else {
                strW = km4.w(p65Var, 826308715, R.string.publication_flow_newsletter_setting_title_no_count, p65Var, false);
            }
            x45Var2 = x45Var;
            x(kng.i, strW, vo7.R(p65Var, R.string.publication_flow_newsletter_setting_description), sgaVar.c, x45Var2, null, p65Var, ((i3 << 9) & 57344) | 6);
        } else {
            x45Var2 = x45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(sgaVar, x45Var2, i2, 27);
        }
    }

    public static void q0(String str, Object obj, cf5 cf5Var, boolean z) {
        Class<?> cls = obj.getClass();
        if (!JSONObject.class.isAssignableFrom(cls)) {
            if (JSONArray.class.isAssignableFrom(cls)) {
                JSONArray jSONArray = (JSONArray) obj;
                int length = jSONArray.length();
                for (int i2 = 0; i2 < length; i2++) {
                    String str2 = String.format(Locale.ROOT, "%s[%d]", Arrays.copyOf(new Object[]{str, Integer.valueOf(i2)}, 2));
                    Object objOpt = jSONArray.opt(i2);
                    objOpt.getClass();
                    q0(str2, objOpt, cf5Var, z);
                }
                return;
            }
            if (String.class.isAssignableFrom(cls) || Number.class.isAssignableFrom(cls) || Boolean.class.isAssignableFrom(cls)) {
                cf5Var.a(str, obj.toString());
                return;
            }
            if (!Date.class.isAssignableFrom(cls)) {
                String str3 = ff5.j;
                f94 f94Var = f94.a;
                return;
            } else {
                String str4 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US).format((Date) obj);
                str4.getClass();
                cf5Var.a(str, str4);
                return;
            }
        }
        JSONObject jSONObject = (JSONObject) obj;
        if (z) {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                String str5 = String.format("%s[%s]", Arrays.copyOf(new Object[]{str, next}, 2));
                Object objOpt2 = jSONObject.opt(next);
                objOpt2.getClass();
                q0(str5, objOpt2, cf5Var, z);
            }
            return;
        }
        if (jSONObject.has("id")) {
            String strOptString = jSONObject.optString("id");
            strOptString.getClass();
            q0(str, strOptString, cf5Var, z);
        } else if (jSONObject.has("url")) {
            String strOptString2 = jSONObject.optString("url");
            strOptString2.getClass();
            q0(str, strOptString2, cf5Var, z);
        } else if (jSONObject.has("fbsdk:create_object")) {
            String string = jSONObject.toString();
            string.getClass();
            q0(str, string, cf5Var, z);
        }
    }

    public static final void r(rga rgaVar, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        x45 x45Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-703396069);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(rgaVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            x45Var2 = x45Var;
            x(kng.h, vo7.R(p65Var, R.string.publication_flow_paywall_setting_title), vo7.R(p65Var, R.string.publication_flow_paywall_setting_description), rgaVar.b, x45Var2, null, p65Var, ((i3 << 9) & 57344) | 6);
        } else {
            x45Var2 = x45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(rgaVar, x45Var2, i2, 28);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r21v1 */
    /* JADX WARN: Type inference failed for: r21v2 */
    /* JADX WARN: Type inference failed for: r21v3 */
    /* JADX WARN: Type inference failed for: r21v4 */
    /* JADX WARN: Type inference failed for: r21v5 */
    /* JADX WARN: Type inference failed for: r2v0 */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r2v21 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r6v3, types: [org.json.JSONArray] */
    public static void r0(hf5 hf5Var, f87 f87Var, int i2, URL url, FilterOutputStream filterOutputStream, boolean z) throws JSONException {
        String strB;
        i42 i42Var = new i42();
        i42Var.c = filterOutputStream;
        i42Var.d = f87Var;
        int i3 = 1;
        i42Var.a = true;
        i42Var.b = z;
        if (i2 == 1) {
            ff5 ff5Var = (ff5) hf5Var.c.get(0);
            HashMap map = new HashMap();
            for (String str : ff5Var.d.keySet()) {
                Object obj = ff5Var.d.get(str);
                if (e0(obj)) {
                    str.getClass();
                    map.put(str, new af5(ff5Var, obj));
                }
            }
            f87Var.b();
            Bundle bundle = ff5Var.d;
            for (String str2 : bundle.keySet()) {
                Object obj2 = bundle.get(str2);
                if (f0(obj2)) {
                    str2.getClass();
                    i42Var.j(str2, obj2, ff5Var);
                }
            }
            f87Var.b();
            w0(map, i42Var);
            JSONObject jSONObject = ff5Var.c;
            if (jSONObject != null) {
                String path = url.getPath();
                path.getClass();
                p0(jSONObject, path, i42Var);
                return;
            }
            return;
        }
        Iterator it2 = hf5Var.iterator();
        while (true) {
            if (!it2.hasNext()) {
                strB = f94.b();
                break;
            }
            w3 w3Var = ((ff5) it2.next()).a;
            if (w3Var != null) {
                strB = w3Var.h;
                break;
            }
        }
        if (strB.length() == 0) {
            throw new FacebookException("App ID was not specified at the request or Settings.");
        }
        i42Var.a("batch_app_id", strB);
        HashMap map2 = new HashMap();
        ?? jSONArray = new JSONArray();
        Iterator it3 = hf5Var.iterator();
        while (it3.hasNext()) {
            ff5 ff5Var2 = (ff5) it3.next();
            ff5Var2.getClass();
            String str3 = ff5.j;
            JSONObject jSONObject2 = new JSONObject();
            Object[] objArr = new Object[i3];
            objArr[0] = f94.e();
            String strH = ff5Var2.h(String.format("https://graph.%s", Arrays.copyOf(objArr, i3)));
            ff5Var2.a();
            Uri uri = Uri.parse(ff5Var2.b(strH, i3));
            String path2 = uri.getPath();
            String query = uri.getQuery();
            Object[] objArr2 = new Object[2];
            objArr2[0] = path2;
            objArr2[i3] = query;
            String str4 = String.format("%s?%s", Arrays.copyOf(objArr2, 2));
            jSONObject2.put("relative_url", str4);
            jSONObject2.put("method", ff5Var2.h);
            w3 w3Var2 = ff5Var2.a;
            if (w3Var2 != null) {
                f87.b.t(w3Var2.e);
            }
            ArrayList arrayList = new ArrayList();
            Iterator<String> it4 = ff5Var2.d.keySet().iterator();
            while (it4.hasNext()) {
                Object obj3 = ff5Var2.d.get(it4.next());
                if (e0(obj3)) {
                    Locale locale = Locale.ROOT;
                    Integer numValueOf = Integer.valueOf(map2.size());
                    ?? r21 = i3 == true ? 1 : 0;
                    Object[] objArr3 = new Object[2];
                    objArr3[0] = "file";
                    objArr3[r21 == true ? 1 : 0] = numValueOf;
                    String str5 = String.format(locale, "%s%d", Arrays.copyOf(objArr3, 2));
                    arrayList.add(str5);
                    map2.put(str5, new af5(ff5Var2, obj3));
                    i3 = r21 == true ? 1 : 0;
                }
            }
            ?? r212 = i3 == true ? 1 : 0;
            if (!arrayList.isEmpty()) {
                jSONObject2.put("attached_files", TextUtils.join(",", arrayList));
            }
            JSONObject jSONObject3 = ff5Var2.c;
            if (jSONObject3 != null) {
                ArrayList arrayList2 = new ArrayList();
                p0(jSONObject3, str4, new ef5(arrayList2));
                jSONObject2.put("body", TextUtils.join("&", arrayList2));
            }
            jSONArray.put(jSONObject2);
            i3 = r212 == true ? 1 : 0;
        }
        String string = jSONArray.toString();
        string.getClass();
        i42Var.a("batch", string);
        f87Var.b();
        w0(map2, i42Var);
    }

    public static final void s(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-670749211);
        if (p65Var.P(i2 & 1, i2 != 0)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            wv1 wv1VarA = uv1.a(new h70(32.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = jt7.c;
            jjd.b("Circular Indefinite Progress Bar", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 6, 0, 131070);
            o(null, null, 0.0f, 0L, 0L, 0, p65Var, 0, 127);
            jjd.b("Circular Definite Progress Bar", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 6, 0, 131070);
            o(null, Float.valueOf(0.5f), 0.0f, 0L, 0L, 0, p65Var, 48, 125);
            jjd.b("Linear Indefinite Progress Bar", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 6, 0, 131070);
            p(null, null, 0L, 0L, 0, 0.0f, null, p65Var, 0, 127);
            jjd.b("Linear Definite Progress Bar", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 6, 0, 131070);
            p(null, Float.valueOf(0.25f), 0L, 0L, 0, 0.0f, null, p65Var, 48, 125);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i2, 15);
        }
    }

    public static final JSONObject s0(String str) {
        File fileU = U();
        if (fileU != null) {
            try {
                return new JSONObject(epe.T(new FileInputStream(new File(fileU, str))));
            } catch (Exception unused) {
                N(str);
            }
        }
        return null;
    }

    public static final void t(PublicationData publicationData, qvc qvcVar, boolean z, wda wdaVar, x12 x12Var, int i2) {
        int i3;
        boolean z2;
        String strW;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-643946795);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(publicationData) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(qvcVar == null ? -1 : qvcVar.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(wdaVar) ? 2048 : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            boolean z3 = ((i3 & 14) == 4) | ((i3 & 7168) == 2048);
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new ui9(wdaVar, 10, publicationData);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(r28VarD, z, null, null, (m45) objM, 14), 0.0f, 32.0f, 0.0f, 32.0f, 5);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarG2 = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, R.string.publication_flow_publication_setting_title);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            kjd.b(strR, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(z46.n(p65Var).i), p65Var, 0, 0, 65532);
            if (z) {
                p65Var.Y(-1979558358);
                rv5.a(vn7.J(R.drawable.ic_chevron_right_24, 0, p65Var), null, null, z46.h(p65Var).n, p65Var, 56, 4);
            } else {
                p65Var.Y(-2002241337);
            }
            p65Var.p(false);
            p65Var.p(true);
            if (publicationData == null) {
                p65Var.Y(1134601912);
                kjd.b(vo7.R(p65Var, R.string.publication_flow_publication_setting_no_submission), w2g.G(o28Var, 24.0f, 8.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(z46.n(p65Var).n, z46.h(p65Var).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var, 48, 0, 65532);
                p65Var = p65Var;
                p65Var.p(false);
                z2 = true;
            } else {
                p65Var.Y(1135088333);
                r28 r28VarG3 = w2g.G(o28Var, 24.0f, 16.0f, 24.0f, 0.0f, 8);
                omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarG3);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                kp7.a(publicationData.m67getAvatarUvEXDLI(), hl0.S, null, null, null, 0.0f, 0, null, p65Var, 48, 2044);
                hp7.t(p65Var, jfc.l(o28Var, 16.0f));
                String name = publicationData.getName();
                if (1.0f <= 0.0d) {
                    z16.a("invalid weight; must be greater than zero");
                }
                kjd.b(name, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, dl7.m(z46.n(p65Var).l), p65Var, 0, 3120, 55292);
                p65Var = p65Var;
                if (qvcVar != null) {
                    km4.F(16.0f, 915142675, p65Var, p65Var, o28Var);
                    dy0.a(jfc.l(flb.a0(o28Var, z46.h(p65Var).o, bmb.a), 6.0f), p65Var, 0);
                    hp7.t(p65Var, jfc.l(o28Var, 8.0f));
                    switch (tda.a[qvcVar.ordinal()]) {
                        case 1:
                            strW = km4.w(p65Var, -386107537, R.string.publication_flow_publication_setting_submission_status_accepted, p65Var, false);
                            break;
                        case 2:
                            strW = km4.w(p65Var, -386102696, R.string.publication_flow_publication_setting_submission_status_changes_requested, p65Var, false);
                            break;
                        case 3:
                            strW = km4.w(p65Var, -386097995, R.string.publication_flow_publication_setting_submission_status_pending_review, p65Var, false);
                            break;
                        case 4:
                        case 5:
                        case 6:
                            strW = km4.w(p65Var, -386088978, R.string.publication_flow_publication_setting_submission_status_pending, p65Var, false);
                            break;
                        default:
                            throw ho2.L(p65Var, -386109385, false);
                    }
                    kjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(z46.n(p65Var).n, z46.h(p65Var).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var, 0, 0, 65534);
                    p65Var = p65Var;
                } else {
                    p65Var.Y(890925227);
                }
                p65Var.p(false);
                z2 = true;
                p65Var.p(true);
                p65Var.p(false);
            }
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(publicationData, qvcVar, z, wdaVar, i2, 3);
        }
    }

    public static void t0(hf5 hf5Var, ArrayList arrayList) {
        ArrayList arrayList2 = hf5Var.c;
        int size = arrayList2.size();
        ArrayList arrayList3 = new ArrayList();
        for (int i2 = 0; i2 < size; i2++) {
            ff5 ff5Var = (ff5) arrayList2.get(i2);
            if (ff5Var.g != null) {
                arrayList3.add(new Pair(ff5Var.g, arrayList.get(i2)));
            }
        }
        if (arrayList3.size() > 0) {
            fi2 fi2Var = new fi2(arrayList3, 9, hf5Var);
            Handler handler = hf5Var.a;
            if (handler != null) {
                handler.post(fi2Var);
            } else {
                fi2Var.run();
            }
        }
    }

    public static final void u(uga ugaVar, wda wdaVar, x45 x45Var, x45 x45Var2, x45 x45Var3, x12 x12Var, int i2) {
        x45 x45Var4;
        boolean z;
        o28 o28Var;
        ar0 ar0Var;
        ar0 ar0Var2;
        int i3;
        ar0 ar0Var3;
        o28 o28Var2;
        boolean z2;
        x45 x45Var5 = x45Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1494369777);
        int i4 = i2 | (p65Var.f(ugaVar) ? 4 : 2) | (p65Var.f(wdaVar) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | (p65Var.h(x45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(x45Var5) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            long j2 = z46.h(p65Var).a;
            nr5 nr5Var = rv8.r;
            o28 o28Var3 = o28.b;
            r28 r28VarC = jfc.c(flb.a0(o28Var3, j2, nr5Var), 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            z46.j(p65Var).getClass();
            r28 r28VarD = jfc.d(jfc.r(o28Var3, 3), 1.0f);
            ar0 ar0Var4 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var4, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var5 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var5, false);
            long j5 = p65Var.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            az5 az5Var = ugaVar.g;
            eea eeaVar = ugaVar.j;
            sga sgaVar = ugaVar.i;
            rga rgaVar = ugaVar.h;
            y(az5Var, wdaVar, p65Var, i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            p65Var.p(true);
            p65Var.p(true);
            z46.j(p65Var).getClass();
            r28 r28VarD3 = jfc.d(jfc.r(o28Var3, 3), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var4, false);
            long j6 = p65Var.T;
            int i8 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD4 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var5, false);
            long j7 = p65Var.T;
            int i9 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD4);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            t(ugaVar.k, ugaVar.l, ugaVar.m, wdaVar, p65Var, (i4 << 6) & 7168);
            p65Var.p(true);
            p65Var.p(true);
            z46.j(p65Var).getClass();
            r28 r28VarD5 = jfc.d(jfc.r(o28Var3, 3), 1.0f);
            zk7 zk7VarC5 = dy0.c(ar0Var4, false);
            long j8 = p65Var.T;
            int i10 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, r28VarD5);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC5);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            r28 r28VarD6 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC6 = dy0.c(ar0Var5, false);
            long j9 = p65Var.T;
            int i11 = (int) (j9 ^ (j9 >>> 32));
            i89 i89VarL7 = p65Var.l();
            r28 r28VarR7 = gx1.R(p65Var, r28VarD6);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC6);
            tp7.B(p65Var, cuVar2, i89VarL7);
            ka1.z(i11, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR7);
            p65Var = p65Var;
            vp7.b(0.0f, 6, 6, 0L, p65Var, w2g.E(o28Var3, 24.0f, 0.0f, 2));
            p65Var.p(true);
            p65Var.p(true);
            if (rgaVar.a) {
                p65Var.Y(638026515);
                z46.j(p65Var).getClass();
                r28 r28VarD7 = jfc.d(jfc.r(o28Var3, 3), 1.0f);
                zk7 zk7VarC7 = dy0.c(ar0Var4, false);
                long j10 = p65Var.T;
                int i12 = (int) (j10 ^ (j10 >>> 32));
                i89 i89VarL8 = p65Var.l();
                r28 r28VarR8 = gx1.R(p65Var, r28VarD7);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC7);
                tp7.B(p65Var, cuVar2, i89VarL8);
                ka1.z(i12, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR8);
                r28 r28VarD8 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                ar0Var2 = ar0Var5;
                zk7 zk7VarC8 = dy0.c(ar0Var2, false);
                long j11 = p65Var.T;
                int i13 = (int) (j11 ^ (j11 >>> 32));
                i89 i89VarL9 = p65Var.l();
                r28 r28VarR9 = gx1.R(p65Var, r28VarD8);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC8);
                tp7.B(p65Var, cuVar2, i89VarL9);
                ka1.z(i13, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR9);
                x45Var4 = x45Var;
                r(rgaVar, x45Var4, p65Var, (i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(true);
                p65Var.p(true);
                z46.j(p65Var).getClass();
                r28 r28VarD9 = jfc.d(jfc.r(o28Var3, 3), 1.0f);
                zk7 zk7VarC9 = dy0.c(ar0Var4, false);
                long j12 = p65Var.T;
                int i14 = (int) (j12 ^ (j12 >>> 32));
                i89 i89VarL10 = p65Var.l();
                r28 r28VarR10 = gx1.R(p65Var, r28VarD9);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC9);
                tp7.B(p65Var, cuVar2, i89VarL10);
                ka1.z(i14, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR10);
                r28 r28VarD10 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC10 = dy0.c(ar0Var2, false);
                long j13 = p65Var.T;
                int i15 = (int) (j13 ^ (j13 >>> 32));
                i89 i89VarL11 = p65Var.l();
                r28 r28VarR11 = gx1.R(p65Var, r28VarD10);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC10);
                tp7.B(p65Var, cuVar2, i89VarL11);
                ka1.z(i15, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR11);
                ar0Var = ar0Var4;
                o28Var = o28Var3;
                i3 = 619951593;
                vp7.b(0.0f, 6, 6, 0L, p65Var, w2g.E(o28Var3, 24.0f, 0.0f, 2));
                z = false;
                b09.H(p65Var, true, true, false);
            } else {
                z = false;
                o28Var = o28Var3;
                ar0Var = ar0Var4;
                ar0Var2 = ar0Var5;
                i3 = 619951593;
                x45Var4 = x45Var;
                p65Var.Y(619951593);
                p65Var.p(false);
            }
            if (sgaVar.a) {
                p65Var.Y(638465692);
                z46.j(p65Var).getClass();
                o28 o28Var4 = o28Var;
                r28 r28VarD11 = jfc.d(jfc.r(o28Var4, 3), 1.0f);
                zk7 zk7VarC11 = dy0.c(ar0Var, z);
                ar0 ar0Var6 = ar0Var;
                long j14 = p65Var.T;
                int i16 = (int) (j14 ^ (j14 >>> 32));
                i89 i89VarL12 = p65Var.l();
                r28 r28VarR12 = gx1.R(p65Var, r28VarD11);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC11);
                tp7.B(p65Var, cuVar2, i89VarL12);
                ka1.z(i16, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR12);
                r28 r28VarD12 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC12 = dy0.c(ar0Var2, false);
                long j15 = p65Var.T;
                int i17 = (int) (j15 ^ (j15 >>> 32));
                i89 i89VarL13 = p65Var.l();
                r28 r28VarR13 = gx1.R(p65Var, r28VarD12);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC12);
                tp7.B(p65Var, cuVar2, i89VarL13);
                ka1.z(i17, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR13);
                q(sgaVar, x45Var2, p65Var, (i4 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(true);
                p65Var.p(true);
                z46.j(p65Var).getClass();
                r28 r28VarD13 = jfc.d(jfc.r(o28Var4, 3), 1.0f);
                zk7 zk7VarC13 = dy0.c(ar0Var6, false);
                long j16 = p65Var.T;
                int i18 = (int) (j16 ^ (j16 >>> 32));
                i89 i89VarL14 = p65Var.l();
                r28 r28VarR14 = gx1.R(p65Var, r28VarD13);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC13);
                tp7.B(p65Var, cuVar2, i89VarL14);
                ka1.z(i18, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR14);
                o28Var2 = o28Var4;
                r28 r28VarD14 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC14 = dy0.c(ar0Var2, false);
                long j17 = p65Var.T;
                int i19 = (int) (j17 ^ (j17 >>> 32));
                i89 i89VarL15 = p65Var.l();
                r28 r28VarR15 = gx1.R(p65Var, r28VarD14);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC14);
                tp7.B(p65Var, cuVar2, i89VarL15);
                ka1.z(i19, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR15);
                ar0Var3 = ar0Var6;
                vp7.b(0.0f, 6, 6, 0L, p65Var, w2g.E(o28Var2, 24.0f, 0.0f, 2));
                z = false;
                b09.H(p65Var, true, true, false);
            } else {
                int i20 = i3;
                ar0Var3 = ar0Var;
                o28Var2 = o28Var;
                p65Var.Y(i20);
                p65Var.p(z);
            }
            if (eeaVar != null) {
                p65Var.Y(638917889);
                z46.j(p65Var).getClass();
                r28 r28VarD15 = jfc.d(jfc.r(o28Var2, 3), 1.0f);
                zk7 zk7VarC15 = dy0.c(ar0Var3, z);
                long j18 = p65Var.T;
                int i21 = (int) (j18 ^ (j18 >>> 32));
                i89 i89VarL16 = p65Var.l();
                r28 r28VarR16 = gx1.R(p65Var, r28VarD15);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC15);
                tp7.B(p65Var, cuVar2, i89VarL16);
                ka1.z(i21, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR16);
                r28 r28VarD16 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC16 = dy0.c(ar0Var2, false);
                long j19 = p65Var.T;
                int i22 = (int) (j19 ^ (j19 >>> 32));
                i89 i89VarL17 = p65Var.l();
                r28 r28VarR17 = gx1.R(p65Var, r28VarD16);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC16);
                tp7.B(p65Var, cuVar2, i89VarL17);
                ka1.z(i22, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR17);
                x45Var5 = x45Var3;
                z(eeaVar, x45Var5, p65Var, (i4 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                z2 = true;
                b09.H(p65Var, true, true, false);
            } else {
                x45Var5 = x45Var3;
                z2 = true;
                p65Var.Y(619951593);
                p65Var.p(z);
            }
            p65Var.p(z2);
        } else {
            x45Var4 = x45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(ugaVar, wdaVar, x45Var4, x45Var2, x45Var5, i2, 13);
        }
    }

    public static final long u0(long j2, long j3, mn3 mn3Var) {
        long j4 = j2 - j3;
        if (((j4 ^ j2) & (~(j4 ^ j3))) >= 0) {
            return hlg.U(j4, mn3Var);
        }
        mn3 mn3Var2 = mn3.MILLISECONDS;
        if (mn3Var.compareTo(mn3Var2) >= 0) {
            return in3.l(Z(j4));
        }
        mn3Var2.getClass();
        long jConvert = mn3Var.getTimeUnit$kotlin_stdlib().convert(1L, mn3Var2.getTimeUnit$kotlin_stdlib());
        long j5 = (j2 / jConvert) - (j3 / jConvert);
        long j6 = (j2 % jConvert) - (j3 % jConvert);
        int i2 = in3.d;
        return in3.h(hlg.U(j5, mn3Var2), hlg.U(j6, mn3Var));
    }

    public static final void v(final vga vgaVar, final wda wdaVar, sda sdaVar, boolean z, x12 x12Var, int i2) {
        int i3;
        final sda sdaVar2;
        final boolean z2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1282656982);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(vgaVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(wdaVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            sdaVar2 = sdaVar;
            i3 |= p65Var2.f(sdaVar2) ? 256 : 128;
        } else {
            sdaVar2 = sdaVar;
        }
        if ((i2 & 3072) == 0) {
            z2 = z;
            i3 |= p65Var2.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            z2 = z;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            final kv6 kv6VarA = pv6.a(p65Var2);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = bjc.b(new f91(kv6VarA, 9));
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            rr7.d(null, false, null, pxf.E(674473199, new sn8(wdaVar, 26, (upc) objM), p65Var2), null, null, null, 0, false, null, 0.0f, 0L, 0L, 0L, ((zo7) p65Var2.j(kt7.b)).b, 0L, pxf.E(-407241578, new c55() { // from class: qda
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    hy8 hy8Var = (hy8) obj;
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    hy8Var.getClass();
                    if ((iIntValue & 6) == 0) {
                        iIntValue |= ((p65) x12Var2).f(hy8Var) ? 4 : 2;
                    }
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                        o28 o28Var = o28.b;
                        r28 r28VarB = w2g.B(o28Var, hy8Var);
                        vga vgaVar2 = vgaVar;
                        if (vgaVar2 instanceof hga) {
                            p65Var3.Y(-517127190);
                            r28 r28VarX = ho2.x((jp7) p65Var3.j(kt7.a), r28VarB, 3, 1.0f);
                            zk7 zk7VarC = dy0.c(z46.h, false);
                            long j2 = p65Var3.T;
                            int i4 = (int) (j2 ^ (j2 >>> 32));
                            i89 i89VarL = p65Var3.l();
                            r28 r28VarR = gx1.R(p65Var3, r28VarX);
                            r12.W.getClass();
                            ot2 ot2Var = q12.b;
                            p65Var3.c0();
                            if (p65Var3.S) {
                                p65Var3.k(ot2Var);
                            } else {
                                p65Var3.m0();
                            }
                            cu cuVar = q12.f;
                            tp7.B(p65Var3, cuVar, zk7VarC);
                            cu cuVar2 = q12.e;
                            tp7.B(p65Var3, cuVar2, i89VarL);
                            Integer numValueOf = Integer.valueOf(i4);
                            cu cuVar3 = q12.g;
                            tp7.B(p65Var3, cuVar3, numValueOf);
                            fn fnVar = q12.h;
                            tp7.y(p65Var3, fnVar);
                            cu cuVar4 = q12.d;
                            tp7.B(p65Var3, cuVar4, r28VarR);
                            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                            zk7 zk7VarC2 = dy0.c(z46.d, false);
                            long j3 = p65Var3.T;
                            int i5 = (int) (j3 ^ (j3 >>> 32));
                            i89 i89VarL2 = p65Var3.l();
                            r28 r28VarR2 = gx1.R(p65Var3, r28VarD);
                            p65Var3.c0();
                            if (p65Var3.S) {
                                p65Var3.k(ot2Var);
                            } else {
                                p65Var3.m0();
                            }
                            tp7.B(p65Var3, cuVar, zk7VarC2);
                            tp7.B(p65Var3, cuVar2, i89VarL2);
                            ka1.z(i5, p65Var3, cuVar3, p65Var3, fnVar);
                            tp7.B(p65Var3, cuVar4, r28VarR2);
                            jq7.a(((hga) vgaVar2).b, null, null, null, null, null, null, null, p65Var3, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
                            b09.H(p65Var3, true, true, false);
                        } else if (vgaVar2 instanceof iga) {
                            p65Var3.Y(-517120623);
                            xz5.n(r28VarB, p65Var3, 0);
                            p65Var3.p(false);
                        } else {
                            if (!(vgaVar2 instanceof uga)) {
                                throw ho2.L(p65Var3, -517128958, false);
                            }
                            p65Var3.Y(1149251269);
                            xz5.m((uga) vgaVar2, wdaVar, sdaVar2, z2, r28VarB, kv6VarA, p65Var3, 0);
                            p65Var3.p(false);
                        }
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var2), p65Var, 3072, 196599);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(vgaVar, wdaVar, sdaVar, z, i2);
        }
    }

    public static final void v0(String str, JSONArray jSONArray, bf5 bf5Var) {
        if (jSONArray.length() == 0) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(str, jSONArray.toString());
            JSONObject jSONObjectX = epe.x();
            if (jSONObjectX != null) {
                Iterator<String> itKeys = jSONObjectX.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    jSONObject.put(next, jSONObjectX.get(next));
                }
            }
            String str2 = ff5.j;
            h0(null, String.format("%s/instruments", Arrays.copyOf(new Object[]{f94.b()}, 1)), jSONObject, bf5Var).d();
        } catch (JSONException unused) {
        }
    }

    public static final void w(fha fhaVar, wda wdaVar, boolean z, x12 x12Var, int i2) {
        wda wdaVar2;
        boolean z2;
        fhaVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1013814256);
        int i3 = (p65Var.h(fhaVar) ? 4 : 2) | i2 | (p65Var.f(wdaVar) ? 32 : 16) | (p65Var.g(z) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            l78 l78VarZ = guc.z(fhaVar.v, p65Var, 0);
            wdaVar2 = wdaVar;
            z2 = z;
            v((vga) l78VarZ.getValue(), wdaVar2, new sda(fhaVar, wdaVar), z2, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 3) & 7168));
        } else {
            wdaVar2 = wdaVar;
            z2 = z;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jc0(fhaVar, wdaVar2, z2, i2);
        }
    }

    public static void w0(HashMap map, i42 i42Var) {
        for (Map.Entry entry : map.entrySet()) {
            String str = ff5.j;
            if (e0(((af5) entry.getValue()).b)) {
                i42Var.j((String) entry.getKey(), ((af5) entry.getValue()).b, ((af5) entry.getValue()).a);
            }
        }
    }

    public static final void x(mz1 mz1Var, String str, String str2, boolean z, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1538299926);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(mz1Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(str2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.g(z) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.h(x45Var) ? 16384 : 8192;
        }
        int i4 = i3 | 196608;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            boolean z2 = ((57344 & i4) == 16384) | ((i4 & 7168) == 2048);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new ic0(x45Var, z, 4);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarR = hlg.r(o28Var, false, null, null, (m45) objM, 15);
            fa4 fa4Var = qb8.a;
            zq0 zq0Var = z46.m;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR2);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 32.0f, 0.0f, 0.0f, 12);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            mz1Var.invoke(p65Var, Integer.valueOf(i4 & 14));
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            sn3 sn3Var = kt7.c;
            kjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(((eu7) p65Var.j(sn3Var)).i), p65Var, (i4 >> 3) & 14, 0, 65534);
            p65Var.p(true);
            kjd.b(str2, w2g.F(o28Var, 24.0f, 8.0f, 24.0f, 32.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(mkd.a(((eu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214)), p65Var, ((i4 >> 6) & 14) | 48, 0, 65532);
            p65Var = p65Var;
            p65Var.p(true);
            int i8 = i4 >> 9;
            kk7.e(z, x45Var, w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), false, null, null, p65Var, (i8 & 14) | 384 | (i8 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 56);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(mz1Var, str, str2, z, x45Var, r28Var2, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void x0(defpackage.hf5 r11, java.net.HttpURLConnection r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 289
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xz5.x0(hf5, java.net.HttpURLConnection):void");
    }

    public static final void y(az5 az5Var, wda wdaVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-704779384);
        int i3 = (p65Var.f(az5Var) ? 4 : 2) | i2 | (p65Var.f(wdaVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new ui9(wdaVar, 11, az5Var);
                p65Var.j0(objM);
            }
            r28 r28VarG = w2g.G(hlg.r(o28.b, false, null, null, (m45) objM, 15), 24.0f, 20.0f, 24.0f, 0.0f, 8);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var = (l78) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var2 = (l78) objM6;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                fr0 fr0Var = new fr0(l78Var2, hl7Var, m62Var, l78Var, 23);
                p65Var.j0(fr0Var);
                objM7 = fr0Var;
            }
            zk7 zk7Var = (zk7) objM7;
            Object objM8 = p65Var.M();
            int i4 = 23;
            if (objM8 == uobVar) {
                objM8 = new gr0(l78Var, m62Var, 23);
                p65Var.j0(objM8);
            }
            m45 m45Var = (m45) objM8;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM9 = p65Var.M();
            if (zH2 || objM9 == uobVar) {
                objM9 = new hr0(hl7Var, i4);
                p65Var.j0(objM9);
            }
            hlg.j(wxb.a(r28VarG, false, (x45) objM9), pxf.E(1200550679, new kj2(l78Var2, z52Var, m45Var, az5Var, 2), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(az5Var, wdaVar, i2, 25);
        }
    }

    public static final void z(eea eeaVar, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        int i4;
        String str;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(958852132);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.d(eeaVar.ordinal()) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(x45Var) ? 32 : 16;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            mz1 mz1Var = kng.j;
            String strR = vo7.R(p65Var, R.string.publication_flow_unlisted_setting_title);
            String strR2 = vo7.R(p65Var, R.string.publication_flow_unlisted_setting_description);
            if (eeaVar == eea.UNLISTED) {
                i4 = 4;
                str = strR;
                z = true;
            } else {
                i4 = 4;
                str = strR;
                z = false;
            }
            boolean z2 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == i4);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new pda(x45Var, i5, eeaVar);
                p65Var.j0(objM);
            }
            x(mz1Var, str, strR2, z, (x45) objM, null, p65Var, 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(eeaVar, x45Var, i2, 26);
        }
    }

    public abstract InputFilter[] T(InputFilter[] inputFilterArr);

    public abstract void y0(boolean z);

    public abstract void z0(boolean z);

    public static HttpURLConnection K(URL url) throws IOException {
        URLConnection uRLConnectionOpenConnection = url.openConnection();
        uRLConnectionOpenConnection.getClass();
        HttpURLConnection httpURLConnection = (HttpURLConnection) uRLConnectionOpenConnection;
        if (ff5.l == null) {
            ff5.l = String.format("%s.%s", Arrays.copyOf(new Object[]{"FBAndroidSDK", "18.2.3"}, 2));
        }
        httpURLConnection.setRequestProperty("User-Agent", ff5.l);
        httpURLConnection.setRequestProperty(peNPu.XlKWTEfiV, Locale.getDefault().toString());
        httpURLConnection.setChunkedStreamingMode(0);
        return httpURLConnection;
    }
}
