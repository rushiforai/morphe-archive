package defpackage;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorSpace;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.display.DisplayManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcel;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.StaticLayout;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.Display;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.autofill.AutofillId;
import android.view.autofill.AutofillManager;
import android.view.autofill.AutofillValue;
import android.webkit.CookieManager;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.facebook.FacebookException;
import com.medium.android.admin.stagebranch.uG.peNPu;
import j$.util.function.DoubleUnaryOperator$CC;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.function.DoubleUnaryOperator;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class epe {
    public static volatile int a = 0;
    public static volatile long b = -1;
    public static volatile long c = -1;
    public static volatile long d = -1;
    public static volatile String e = "";
    public static volatile String f = "";
    public static volatile String g = "NoCarrier";
    public static volatile String h = "";
    public static volatile Locale i;

    public static final Method A(String str, String str2, Class... clsArr) {
        try {
            return z(Class.forName(str), str2, (Class[]) Arrays.copyOf(clsArr, clsArr.length));
        } catch (ClassNotFoundException unused) {
            return null;
        }
    }

    public static float B(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledHorizontalScrollFactor();
    }

    public static float C(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledVerticalScrollFactor();
    }

    public static final Object D(JSONObject jSONObject, String str, String str2) {
        Object objOpt = jSONObject.opt(str);
        if (objOpt != null && (objOpt instanceof String)) {
            objOpt = new JSONTokener((String) objOpt).nextValue();
        }
        if (objOpt == null || (objOpt instanceof JSONObject) || (objOpt instanceof JSONArray)) {
            return objOpt;
        }
        if (str2 == null) {
            throw new FacebookException("Got an unexpected non-JSON object.");
        }
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.putOpt(str2, objOpt);
        return jSONObject2;
    }

    public static final Object E(Object obj, Method method, Object... objArr) {
        try {
            return method.invoke(obj, Arrays.copyOf(objArr, objArr.length));
        } catch (IllegalAccessException | InvocationTargetException unused) {
            return null;
        }
    }

    public static final boolean F() {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(String.format("fb%s://applinks", Arrays.copyOf(new Object[]{f94.b()}, 1))));
            Context contextA = f94.a();
            PackageManager packageManager = contextA.getPackageManager();
            String packageName = contextA.getPackageName();
            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
            listQueryIntentActivities.getClass();
            Iterator<ResolveInfo> it2 = listQueryIntentActivities.iterator();
            while (it2.hasNext()) {
                if (g76.L(packageName, it2.next().activityInfo.packageName)) {
                    return true;
                }
            }
        } catch (Exception unused) {
        }
        return false;
    }

    public static final boolean G(Context context) {
        context.getClass();
        if (Build.VERSION.SDK_INT >= 27) {
            return context.getPackageManager().hasSystemFeature("android.hardware.type.pc");
        }
        String str = Build.DEVICE;
        if (str == null) {
            return false;
        }
        str.getClass();
        Pattern patternCompile = Pattern.compile(".+_cheets|cheets_.+");
        patternCompile.getClass();
        return patternCompile.matcher(str).matches();
    }

    public static final boolean H() {
        if (!ec2.a.contains(epe.class)) {
            try {
                JSONObject jSONObjectX = x();
                if (jSONObjectX != null) {
                    try {
                        JSONArray jSONArray = jSONObjectX.getJSONArray("data_processing_options");
                        int length = jSONArray.length();
                        for (int i2 = 0; i2 < length; i2++) {
                            String string = jSONArray.getString(i2);
                            string.getClass();
                            String lowerCase = string.toLowerCase();
                            lowerCase.getClass();
                            if (lowerCase.equals("ldu")) {
                                return true;
                            }
                        }
                    } catch (Exception unused) {
                        f94 f94Var = f94.a;
                    }
                }
            } catch (Throwable th) {
                ec2.a(epe.class, th);
                return false;
            }
        }
        return false;
    }

    public static boolean I(Context context) {
        Method methodA = A("com.google.android.gms.common.GooglePlayServicesUtil", "isGooglePlayServicesAvailable", Context.class);
        if (methodA != null) {
            Object objE = E(null, methodA, context);
            if ((objE instanceof Integer) && objE.equals(0)) {
                return true;
            }
        }
        return false;
    }

    public static final boolean J(String str) {
        return str == null || str.length() == 0;
    }

    public static final boolean K(Uri uri) {
        if (uri != null) {
            return "http".equalsIgnoreCase(uri.getScheme()) || "https".equalsIgnoreCase(uri.getScheme()) || "fbstaging".equalsIgnoreCase(uri.getScheme());
        }
        return false;
    }

    public static final ArrayList L(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            arrayList.add(jSONArray.getString(i2));
        }
        return arrayList;
    }

    public static final HashMap M(String str) {
        if (str.length() == 0) {
            return new HashMap();
        }
        try {
            HashMap map = new HashMap();
            JSONObject jSONObject = new JSONObject(str);
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                next.getClass();
                String string = jSONObject.getString(next);
                string.getClass();
                map.put(next, string);
            }
            return map;
        } catch (JSONException unused) {
            return new HashMap();
        }
    }

    public static final String N(Map map) {
        map.getClass();
        String string = "";
        if (map.isEmpty()) {
            return "";
        }
        try {
            JSONObject jSONObject = new JSONObject();
            for (Map.Entry entry : map.entrySet()) {
                jSONObject.put((String) entry.getKey(), (String) entry.getValue());
            }
            string = jSONObject.toString();
        } catch (JSONException unused) {
        }
        string.getClass();
        return string;
    }

    public static final boolean O(Context context) {
        AutofillManager autofillManagerE;
        return Build.VERSION.SDK_INT >= 26 && (autofillManagerE = mm.e(context.getSystemService(mm.f()))) != null && autofillManagerE.isAutofillSupported() && autofillManagerE.isEnabled();
    }

    public static final void Q(hm hmVar, SparseArray sparseArray) {
        if (hmVar.b.a.isEmpty()) {
            return;
        }
        int size = sparseArray.size();
        for (int i2 = 0; i2 < size; i2++) {
            int iKeyAt = sparseArray.keyAt(i2);
            AutofillValue autofillValueA = j34.a(sparseArray.get(iKeyAt));
            if (autofillValueA.isText()) {
                uk0 uk0Var = hmVar.b;
                autofillValueA.getTextValue().toString();
                if (uk0Var.a.get(Integer.valueOf(iKeyAt)) != null) {
                    rd6.m();
                    return;
                }
            } else {
                if (autofillValueA.isDate()) {
                    throw new ei8("An operation is not implemented: b/138604541: Add onFill() callback for date");
                }
                if (autofillValueA.isList()) {
                    throw new ei8("An operation is not implemented: b/138604541: Add onFill() callback for list");
                }
                if (autofillValueA.isToggle()) {
                    throw new ei8("An operation is not implemented: b/138604541:  Add onFill() callback for toggle");
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void R(Bundle bundle, JSONArray jSONArray) {
        if (jSONArray instanceof boolean[]) {
            bundle.putBooleanArray("media", (boolean[]) jSONArray);
            return;
        }
        if (jSONArray instanceof double[]) {
            bundle.putDoubleArray("media", (double[]) jSONArray);
            return;
        }
        if (jSONArray instanceof int[]) {
            bundle.putIntArray("media", (int[]) jSONArray);
        } else if (jSONArray instanceof long[]) {
            bundle.putLongArray("media", (long[]) jSONArray);
        } else {
            bundle.putString("media", jSONArray.toString());
        }
    }

    public static final HashMap S(Parcel parcel) {
        int i2 = parcel.readInt();
        if (i2 < 0) {
            return null;
        }
        HashMap map = new HashMap();
        for (int i3 = 0; i3 < i2; i3++) {
            String string = parcel.readString();
            String string2 = parcel.readString();
            if (string != null && string2 != null) {
                map.put(string, string2);
            }
        }
        return map;
    }

    public static final String T(InputStream inputStream) {
        InputStreamReader inputStreamReader = new InputStreamReader(new BufferedInputStream(inputStream));
        try {
            StringBuilder sb = new StringBuilder();
            char[] cArr = new char[RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH];
            while (true) {
                int i2 = inputStreamReader.read(cArr);
                if (i2 == -1) {
                    String string = sb.toString();
                    inputStreamReader.close();
                    return string;
                }
                sb.append(cArr, 0, i2);
            }
        } finally {
        }
    }

    public static Intent U(Context context, BroadcastReceiver broadcastReceiver, IntentFilter intentFilter, String str, int i2) {
        return context.registerReceiver(broadcastReceiver, intentFilter, str, null, i2);
    }

    public static void V(MenuItem menuItem, char c2, int i2) {
        menuItem.setAlphabeticShortcut(c2, i2);
    }

    public static final void W(JSONObject jSONObject, Context context) throws JSONException {
        Locale locale;
        int i2;
        int i3;
        Display display;
        JSONArray jSONArray = new JSONArray();
        jSONArray.put("a2");
        int i4 = 0;
        if (b == -1 || System.currentTimeMillis() - b >= 1800000) {
            b = System.currentTimeMillis();
            try {
                TimeZone timeZone = TimeZone.getDefault();
                String displayName = timeZone.getDisplayName(timeZone.inDaylightTime(new Date()), 0);
                displayName.getClass();
                e = displayName;
                String id = timeZone.getID();
                id.getClass();
                f = id;
            } catch (AssertionError unused) {
            } catch (Exception unused2) {
                f94 f94Var = f94.a;
            }
            if (g.equals("NoCarrier")) {
                try {
                    Object systemService = context.getSystemService("phone");
                    systemService.getClass();
                    String networkOperatorName = ((TelephonyManager) systemService).getNetworkOperatorName();
                    networkOperatorName.getClass();
                    g = networkOperatorName;
                } catch (Exception unused3) {
                    f94 f94Var2 = f94.a;
                }
            }
            try {
                if ("mounted".equals(Environment.getExternalStorageState())) {
                    StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
                    c = ((long) statFs.getBlockCount()) * ((long) statFs.getBlockSize());
                }
                c = Math.round(c / 1.073741824E9d);
            } catch (Exception unused4) {
            }
            try {
                if ("mounted".equals(Environment.getExternalStorageState())) {
                    StatFs statFs2 = new StatFs(Environment.getExternalStorageDirectory().getPath());
                    d = ((long) statFs2.getAvailableBlocks()) * ((long) statFs2.getBlockSize());
                }
                d = Math.round(d / 1.073741824E9d);
            } catch (Exception unused5) {
            }
        }
        String packageName = context.getPackageName();
        int i5 = -1;
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
            if (packageInfo == null) {
                return;
            }
            i5 = packageInfo.versionCode;
            h = packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException unused6) {
        }
        jSONArray.put(packageName);
        jSONArray.put(i5);
        jSONArray.put(h);
        jSONArray.put(Build.VERSION.RELEASE);
        jSONArray.put(Build.MODEL);
        try {
            Configuration configuration = context.getResources().getConfiguration();
            locale = Build.VERSION.SDK_INT >= 24 ? configuration.getLocales().get(0) : configuration.locale;
        } catch (Exception unused7) {
            locale = Locale.getDefault();
        }
        i = locale;
        Locale locale2 = i;
        String language = locale2 != null ? locale2.getLanguage() : null;
        if (language == null) {
            language = "";
        }
        StringBuilder sb = new StringBuilder(language);
        sb.append('_');
        Locale locale3 = i;
        String country = locale3 != null ? locale3.getCountry() : null;
        sb.append(country != null ? country : "");
        jSONArray.put(sb.toString());
        jSONArray.put(e);
        jSONArray.put(g);
        double d2 = 0.0d;
        try {
            Object systemService2 = context.getSystemService("display");
            DisplayManager displayManager = systemService2 instanceof DisplayManager ? (DisplayManager) systemService2 : null;
            display = displayManager != null ? displayManager.getDisplay(0) : null;
        } catch (Exception unused8) {
        }
        if (display != null) {
            DisplayMetrics displayMetrics = new DisplayMetrics();
            display.getMetrics(displayMetrics);
            int i6 = displayMetrics.widthPixels;
            try {
                i4 = displayMetrics.heightPixels;
                d2 = displayMetrics.density;
            } catch (Exception unused9) {
            }
            i2 = i4;
            i4 = i6;
        } else {
            i2 = 0;
        }
        jSONArray.put(i4);
        jSONArray.put(i2);
        jSONArray.put(new DecimalFormat("#.##").format(d2));
        if (a > 0) {
            i3 = a;
        } else {
            try {
                File[] fileArrListFiles = new File("/sys/devices/system/cpu/").listFiles(new fc2(8));
                if (fileArrListFiles != null) {
                    a = fileArrListFiles.length;
                }
            } catch (Exception unused10) {
                f94 f94Var3 = f94.a;
            }
            if (a <= 0) {
                a = Math.max(Runtime.getRuntime().availableProcessors(), 1);
            }
            i3 = a;
        }
        jSONArray.put(i3);
        jSONArray.put(c);
        jSONArray.put(d);
        jSONArray.put(f);
        jSONObject.put("extinfo", jSONArray.toString());
    }

    public static void X(MenuItem menuItem, CharSequence charSequence) {
        menuItem.setContentDescription(charSequence);
    }

    public static void Y(MenuItem menuItem, ColorStateList colorStateList) {
        menuItem.setIconTintList(colorStateList);
    }

    public static void Z(MenuItem menuItem, PorterDuff.Mode mode) {
        menuItem.setIconTintMode(mode);
    }

    public static final Uri a(String str, String str2, Bundle bundle) {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme("https");
        builder.authority(str);
        builder.path(str2);
        for (String str3 : bundle.keySet()) {
            Object obj = bundle.get(str3);
            if (obj instanceof String) {
                builder.appendQueryParameter(str3, (String) obj);
            }
        }
        Uri uriBuild = builder.build();
        uriBuild.getClass();
        return uriBuild;
    }

    public static final void a0(StaticLayout.Builder builder, int i2) {
        builder.setJustificationMode(i2);
    }

    public static void b(String str) {
        CookieManager cookieManager = CookieManager.getInstance();
        String cookie = cookieManager.getCookie(str);
        if (cookie == null) {
            return;
        }
        for (String str2 : (String[]) muc.p0(cookie, new String[]{";"}, 0, 6).toArray(new String[0])) {
            String[] strArr = (String[]) muc.p0(str2, new String[]{"="}, 0, 6).toArray(new String[0]);
            if (strArr.length > 0) {
                StringBuilder sb = new StringBuilder();
                String str3 = strArr[0];
                int length = str3.length() - 1;
                int i2 = 0;
                boolean z = false;
                while (i2 <= length) {
                    boolean z2 = g76.Q(str3.charAt(!z ? i2 : length), 32) <= 0;
                    if (z) {
                        if (!z2) {
                            break;
                        } else {
                            length--;
                        }
                    } else if (z2) {
                        i2++;
                    } else {
                        z = true;
                    }
                }
                sb.append(str3.subSequence(i2, length + 1).toString());
                sb.append("=;expires=Sat, 1 Jan 2000 00:00:01 UTC;");
                cookieManager.setCookie(str, sb.toString());
            }
        }
        cookieManager.flush();
    }

    public static void b0(MenuItem menuItem, char c2, int i2) {
        menuItem.setNumericShortcut(c2, i2);
    }

    public static final void c(Context context) {
        try {
            b("facebook.com");
            b(".facebook.com");
            b("https://facebook.com");
            b("https://.facebook.com");
        } catch (Exception unused) {
        }
    }

    public static void c0(MenuItem menuItem, CharSequence charSequence) {
        menuItem.setTooltipText(charSequence);
    }

    public static boolean d(Canvas canvas, Path path) {
        return canvas.clipOutPath(path);
    }

    public static final String d0(String str) {
        if (str == null) {
            return null;
        }
        byte[] bytes = str.getBytes(wk1.a);
        bytes.getClass();
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.getClass();
            messageDigest.update(bytes);
            byte[] bArrDigest = messageDigest.digest();
            StringBuilder sb = new StringBuilder();
            bArrDigest.getClass();
            for (byte b2 : bArrDigest) {
                sb.append(Integer.toHexString((b2 >> 4) & 15));
                sb.append(Integer.toHexString(b2 & 15));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException unused) {
            return null;
        }
    }

    public static boolean e(Canvas canvas, float f2, float f3, float f4, float f5) {
        return canvas.clipOutRect(f2, f3, f4, f5);
    }

    public static final void e0(Parcel parcel, Map map) {
        if (map == null) {
            parcel.writeInt(-1);
            return;
        }
        parcel.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            parcel.writeString(str);
            parcel.writeString(str2);
        }
    }

    public static boolean f(Canvas canvas, int i2, int i3, int i4, int i5) {
        return canvas.clipOutRect(i2, i3, i4, i5);
    }

    public static boolean g(Canvas canvas, Rect rect) {
        return canvas.clipOutRect(rect);
    }

    public static boolean h(Canvas canvas, RectF rectF) {
        return canvas.clipOutRect(rectF);
    }

    public static final String i(String str) {
        return J(str) ? "" : str;
    }

    public static final HashSet j(JSONArray jSONArray) throws JSONException {
        if (jSONArray == null || jSONArray.length() == 0) {
            return null;
        }
        HashSet hashSet = new HashSet();
        int length = jSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            String string = jSONArray.getString(i2);
            string.getClass();
            hashSet.add(string);
        }
        return hashSet;
    }

    public static final ArrayList k(JSONArray jSONArray) {
        try {
            ArrayList arrayList = new ArrayList();
            int length = jSONArray.length();
            for (int i2 = 0; i2 < length; i2++) {
                String string = jSONArray.getString(i2);
                string.getClass();
                arrayList.add(string);
            }
            return arrayList;
        } catch (JSONException unused) {
            return new ArrayList();
        }
    }

    public static final HashMap l(JSONObject jSONObject) {
        jSONObject.getClass();
        HashMap map = new HashMap();
        JSONArray jSONArrayNames = jSONObject.names();
        if (jSONArrayNames != null) {
            int length = jSONArrayNames.length();
            for (int i2 = 0; i2 < length; i2++) {
                try {
                    String string = jSONArrayNames.getString(i2);
                    string.getClass();
                    Object objL = jSONObject.get(string);
                    if (objL instanceof JSONObject) {
                        objL = l((JSONObject) objL);
                    }
                    objL.getClass();
                    map.put(string, objL);
                } catch (JSONException unused) {
                    f94 f94Var = f94.a;
                }
            }
        }
        return map;
    }

    public static final HashMap m(JSONObject jSONObject) {
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strOptString = jSONObject.optString(next);
            if (strOptString != null) {
                next.getClass();
                map.put(next, strOptString);
            }
        }
        return map;
    }

    public static final int n(InputStream inputStream, FilterOutputStream filterOutputStream) throws IOException {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        try {
            byte[] bArr = new byte[8192];
            int i2 = 0;
            while (true) {
                int i3 = bufferedInputStream.read(bArr);
                if (i3 == -1) {
                    bufferedInputStream.close();
                    return i2;
                }
                filterOutputStream.write(bArr, 0, i3);
                i2 += i3;
            }
        } finally {
        }
    }

    public static final Bitmap o(int i2, int i3, int i4, jv1 jv1Var) {
        Bitmap.Config config;
        ColorSpace rgb;
        ColorSpace rgb2;
        ColorSpace.Rgb.TransferParameters transferParameters;
        ColorSpace colorSpaceY;
        ColorSpace colorSpace;
        Bitmap.Config configZ = u36.z(i4);
        if (g76.L(jv1Var, lv1.e)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.SRGB);
        } else if (g76.L(jv1Var, lv1.q)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.ACES);
        } else if (g76.L(jv1Var, lv1.r)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.ACESCG);
        } else if (g76.L(jv1Var, lv1.o)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.ADOBE_RGB);
        } else if (g76.L(jv1Var, lv1.j)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.BT2020);
        } else if (g76.L(jv1Var, lv1.i)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.BT709);
        } else if (g76.L(jv1Var, lv1.t)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.CIE_LAB);
        } else if (g76.L(jv1Var, lv1.s)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.CIE_XYZ);
        } else if (g76.L(jv1Var, lv1.k)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.DCI_P3);
        } else if (g76.L(jv1Var, lv1.l)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.DISPLAY_P3);
        } else if (g76.L(jv1Var, lv1.g)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.EXTENDED_SRGB);
        } else if (g76.L(jv1Var, lv1.h)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.LINEAR_EXTENDED_SRGB);
        } else if (g76.L(jv1Var, lv1.f)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.LINEAR_SRGB);
        } else if (g76.L(jv1Var, lv1.m)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.NTSC_1953);
        } else if (g76.L(jv1Var, lv1.p)) {
            colorSpace = ColorSpace.get(ColorSpace.Named.PRO_PHOTO_RGB);
        } else {
            if (!g76.L(jv1Var, lv1.n)) {
                if (Build.VERSION.SDK_INT >= 34 && (colorSpaceY = m4.y(jv1Var)) != null) {
                    rgb2 = colorSpaceY;
                    config = configZ;
                    return Bitmap.createBitmap((DisplayMetrics) null, i2, i3, config, true, rgb2);
                }
                if (jv1Var instanceof dkb) {
                    String str = jv1Var.a;
                    dkb dkbVar = (dkb) jv1Var;
                    float[] fArrA = dkbVar.d.a();
                    krd krdVar = dkbVar.g;
                    if (krdVar != null) {
                        config = configZ;
                        transferParameters = new ColorSpace.Rgb.TransferParameters(krdVar.b, krdVar.c, krdVar.d, krdVar.e, krdVar.f, krdVar.g, krdVar.a);
                    } else {
                        config = configZ;
                        transferParameters = null;
                    }
                    float[] fArr = dkbVar.i;
                    final int i5 = 0;
                    if (transferParameters != null) {
                        ok0.b();
                        ColorSpace.Rgb rgb3 = new ColorSpace.Rgb(str, dkbVar.h, fArrA, transferParameters);
                        if (Float.isNaN(fArr[0]) || Arrays.equals(rgb3.getTransform(), fArr)) {
                            rgb2 = rgb3;
                        } else {
                            ok0.b();
                            rgb = new ColorSpace.Rgb(str, fArr, transferParameters);
                        }
                    } else {
                        ok0.b();
                        float[] fArr2 = dkbVar.h;
                        final ckb ckbVar = dkbVar.l;
                        DoubleUnaryOperator doubleUnaryOperator = new DoubleUnaryOperator() { // from class: kv1
                            public /* synthetic */ DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator2) {
                                int i6 = i5;
                                return DoubleUnaryOperator$CC.$default$andThen(this, doubleUnaryOperator2);
                            }

                            @Override // java.util.function.DoubleUnaryOperator
                            public final double applyAsDouble(double d2) {
                                int i6 = i5;
                                x45 x45Var = ckbVar;
                                switch (i6) {
                                }
                                return ((Number) x45Var.invoke(Double.valueOf(d2))).doubleValue();
                            }

                            public /* synthetic */ DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator2) {
                                int i6 = i5;
                                return DoubleUnaryOperator$CC.$default$compose(this, doubleUnaryOperator2);
                            }
                        };
                        final ckb ckbVar2 = dkbVar.o;
                        final int i6 = 1;
                        rgb2 = new ColorSpace.Rgb(str, fArr2, fArrA, doubleUnaryOperator, new DoubleUnaryOperator() { // from class: kv1
                            public /* synthetic */ DoubleUnaryOperator andThen(DoubleUnaryOperator doubleUnaryOperator2) {
                                int i62 = i6;
                                return DoubleUnaryOperator$CC.$default$andThen(this, doubleUnaryOperator2);
                            }

                            @Override // java.util.function.DoubleUnaryOperator
                            public final double applyAsDouble(double d2) {
                                int i62 = i6;
                                x45 x45Var = ckbVar2;
                                switch (i62) {
                                }
                                return ((Number) x45Var.invoke(Double.valueOf(d2))).doubleValue();
                            }

                            public /* synthetic */ DoubleUnaryOperator compose(DoubleUnaryOperator doubleUnaryOperator2) {
                                int i62 = i6;
                                return DoubleUnaryOperator$CC.$default$compose(this, doubleUnaryOperator2);
                            }
                        }, dkbVar.e, dkbVar.f);
                    }
                    return Bitmap.createBitmap((DisplayMetrics) null, i2, i3, config, true, rgb2);
                }
                config = configZ;
                rgb = ColorSpace.get(ColorSpace.Named.SRGB);
                rgb2 = rgb;
                return Bitmap.createBitmap((DisplayMetrics) null, i2, i3, config, true, rgb2);
            }
            colorSpace = ColorSpace.get(ColorSpace.Named.SMPTE_C);
        }
        rgb2 = colorSpace;
        config = configZ;
        return Bitmap.createBitmap((DisplayMetrics) null, i2, i3, config, true, rgb2);
    }

    public static final jp p(boolean z) {
        if (Build.VERSION.SDK_INT >= 26) {
            return new jp(AutofillValue.forToggle(z));
        }
        return null;
    }

    public static final jp q(CharSequence charSequence) {
        if (Build.VERSION.SDK_INT >= 26) {
            return new jp(AutofillValue.forText(charSequence));
        }
        return null;
    }

    public static final void r(URLConnection uRLConnection) {
        if (uRLConnection == null || !(uRLConnection instanceof HttpURLConnection)) {
            return;
        }
        ((HttpURLConnection) uRLConnection).disconnect();
    }

    public static void s(Configuration configuration, Configuration configuration2, Configuration configuration3) {
        int i2 = configuration.colorMode & 3;
        int i3 = configuration2.colorMode & 3;
        if (i2 != i3) {
            configuration3.colorMode |= i3;
        }
        int i4 = configuration.colorMode & 12;
        int i5 = configuration2.colorMode & 12;
        if (i4 != i5) {
            configuration3.colorMode |= i5;
        }
    }

    public static final String t(Context context) {
        return context == null ? "null" : context == context.getApplicationContext() ? "unknown" : context.getClass().getSimpleName();
    }

    public static final String u(Context context) {
        try {
            f94 f94Var = f94.a;
            hk7.G();
            String str = f94.e;
            if (str != null) {
                return str;
            }
            ApplicationInfo applicationInfo = context.getApplicationInfo();
            int i2 = applicationInfo.labelRes;
            if (i2 == 0) {
                return applicationInfo.nonLocalizedLabel.toString();
            }
            String string = context.getString(i2);
            string.getClass();
            return string;
        } catch (Exception unused) {
            return "";
        }
    }

    public static AutofillId v(View view) {
        return view.getAutofillId();
    }

    public static final Date w(Bundle bundle, String str, Date date) {
        long jLongValue;
        if (bundle == null) {
            return null;
        }
        Object obj = bundle.get(str);
        if (obj instanceof Long) {
            jLongValue = ((Number) obj).longValue();
        } else {
            if (!(obj instanceof String)) {
                return null;
            }
            try {
                jLongValue = Long.parseLong((String) obj);
            } catch (NumberFormatException unused) {
                return null;
            }
        }
        if (jLongValue == 0) {
            return new Date(Long.MAX_VALUE);
        }
        return new Date((jLongValue * 1000) + date.getTime());
    }

    public static final JSONObject x() {
        if (ec2.a.contains(epe.class)) {
            return null;
        }
        try {
            String string = f94.a().getSharedPreferences("com.facebook.sdk.DataProcessingOptions", 0).getString("data_processing_options", null);
            if (string != null) {
                try {
                    return new JSONObject(string);
                } catch (JSONException unused) {
                    f94 f94Var = f94.a;
                }
            }
            return null;
        } catch (Throwable th) {
            ec2.a(epe.class, th);
            return null;
        }
    }

    public static final void y(final dpe dpeVar, final String str) {
        String str2;
        str.getClass();
        JSONObject jSONObject = (JSONObject) t2a.a.get(str);
        if (jSONObject != null) {
            dpeVar.m(jSONObject);
            return;
        }
        bf5 bf5Var = new bf5() { // from class: cpe
            @Override // defpackage.bf5
            public final void a(if5 if5Var) {
                String str3 = str;
                str3.getClass();
                JSONObject jSONObject2 = if5Var.d;
                b94 b94Var = if5Var.c;
                dpe dpeVar2 = dpeVar;
                if (b94Var != null) {
                    dpeVar2.B(b94Var.i);
                } else if (jSONObject2 == null) {
                    ygf.f("Required value was null.");
                } else {
                    t2a.a.put(str3, jSONObject2);
                    dpeVar2.m(jSONObject2);
                }
            }
        };
        Bundle bundle = new Bundle();
        Date date = w3.l;
        w3 w3VarR = wgf.r();
        if (w3VarR == null || (str2 = w3VarR.k) == null) {
            str2 = "facebook";
        }
        bundle.putString("fields", str2.equals("instagram") ? "id,name,profile_picture" : "id,name,first_name,middle_name,last_name");
        bundle.putString("access_token", str);
        ff5 ff5Var = new ff5(null, "me", null, null, new a4(3, null));
        ff5Var.d = bundle;
        ff5Var.k(dt5.GET);
        ff5Var.j(bf5Var);
        ff5Var.d();
    }

    public static final Method z(Class cls, String str, Class... clsArr) {
        try {
            return cls.getMethod(str, (Class[]) Arrays.copyOf(clsArr, clsArr.length));
        } catch (NoSuchMethodException unused) {
            return null;
        }
    }

    public static final Bundle P(String str) {
        Bundle bundle = new Bundle();
        if (!J(str)) {
            if (str == null) {
                ygf.f(peNPu.byKtXWNjoub);
                return null;
            }
            for (String str2 : (String[]) muc.p0(str, new String[]{"&"}, 0, 6).toArray(new String[0])) {
                String[] strArr = (String[]) muc.p0(str2, new String[]{"="}, 0, 6).toArray(new String[0]);
                try {
                    if (strArr.length == 2) {
                        bundle.putString(URLDecoder.decode(strArr[0], "UTF-8"), URLDecoder.decode(strArr[1], "UTF-8"));
                    } else if (strArr.length == 1) {
                        bundle.putString(URLDecoder.decode(strArr[0], "UTF-8"), "");
                    }
                } catch (UnsupportedEncodingException unused) {
                    f94 f94Var = f94.a;
                }
            }
        }
        return bundle;
    }
}
