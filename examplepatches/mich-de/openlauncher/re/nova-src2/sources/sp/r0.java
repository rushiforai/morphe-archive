package sp;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import b.u4;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.android.billingclient.api.Purchase;
import com.google.android.gms.appset.AppSet;
import com.google.android.gms.appset.AppSetIdInfo;
import com.google.android.gms.tasks.Task;
import com.tiktok.util.UrlConst;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.UUID;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public abstract class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static double f87654a;

    /* renamed from: b, reason: collision with root package name */
    public static int f87655b;

    /* renamed from: c, reason: collision with root package name */
    public static String f87656c;

    /* renamed from: d, reason: collision with root package name */
    public static final t5.d0 f87657d;

    static {
        new b50.d(r0.class.getSimpleName());
        f87657d = new t5.d0(new vp.a(), 17);
    }

    public static String a(Uri uri) {
        if (uri == null) {
            return null;
        }
        if (k(uri) || j(uri) || n(uri)) {
            String queryParameter = uri.getQueryParameter("_android_dl");
            return queryParameter != null ? queryParameter : uri.getQueryParameter("_dl");
        }
        uri.toString();
        return null;
    }

    public static String b(String str) {
        return (l(str) || l("_sl") || str.length() < 3 || !str.endsWith("_sl")) ? str : u4.f(3, 0, str);
    }

    public static String c(Throwable th2) {
        StringBuilder sb2 = new StringBuilder("Exception: \n");
        sb2.append(th2.getMessage());
        sb2.append("\nStack trace: \n");
        StringWriter stringWriter = new StringWriter();
        th2.printStackTrace(new PrintWriter(stringWriter));
        sb2.append(stringWriter.toString());
        return sb2.toString();
    }

    public static String d(Context context) {
        try {
            Task<AppSetIdInfo> appSetIdInfo = AppSet.getClient(context).getAppSetIdInfo();
            LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue();
            appSetIdInfo.f(new ai.k0(linkedBlockingQueue, f87657d.o(), 11));
            appSetIdInfo.d(new q.c(linkedBlockingQueue, 27));
            String str = (String) linkedBlockingQueue.poll(1L, TimeUnit.SECONDS);
            if (l(str)) {
                return null;
            }
            return str;
        } catch (Throwable th2) {
            c(th2);
            f87654a = -2.0d;
            return null;
        }
    }

    public static Method e(Purchase purchase, String str, Class... clsArr) {
        try {
            return purchase.getClass().getDeclaredMethod(str, clsArr);
        } catch (NoSuchMethodException unused) {
            m0.a("e96");
            return null;
        } catch (SecurityException unused2) {
            m0.a("e94");
            return null;
        }
    }

    public static long f(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("pref-event-index", 0);
        long j11 = sharedPreferences.getLong("event-index", -1L) + 1;
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putLong("event-index", j11);
        editorEdit.commit();
        return j11;
    }

    public static HashSet g() {
        HashSet hashSet = new HashSet();
        hashSet.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        hashSet.add("9774d56d682e549c");
        hashSet.add("unknown");
        hashSet.add("000000000000000");
        hashSet.add(AndroidContextPlugin.PLATFORM);
        hashSet.add("DEFACE");
        hashSet.add("00000000-0000-0000-0000-000000000000");
        hashSet.add("0000-0000");
        return hashSet;
    }

    public static UUID h(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences("pref-singular-id", 0);
        String string = sharedPreferences.getString("singular-id", null);
        if (string != null) {
            return UUID.fromString(string);
        }
        UUID uuidRandomUUID = UUID.randomUUID();
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putString("singular-id", uuidRandomUUID.toString());
        editorEdit.commit();
        return uuidRandomUUID;
    }

    public static void i(Uri uri) {
        String strA = a(uri);
        if (strA != null) {
            uri.getQueryParameter("_p");
            if (!l(strA) && !l(uri.toString())) {
                Uri uri2 = Uri.parse(strA);
                Uri.Builder builderBuildUpon = uri2.buildUpon();
                String queryParameter = uri.getQueryParameter("_forward_params");
                if (!l(queryParameter) && queryParameter.equals("2")) {
                    HashSet hashSet = new HashSet(uri2.getQueryParameterNames());
                    for (String str : uri.getQueryParameterNames()) {
                        if (!r.f87653d.contains(str) && !hashSet.contains(str)) {
                            builderBuildUpon.appendQueryParameter(str, uri.getQueryParameter(str));
                        }
                    }
                    builderBuildUpon.build().toString();
                }
            }
            if (e0.a().f87577b.booleanValue()) {
                return;
            }
            m0.f87615q.f87619d.getClass();
        }
    }

    public static boolean j(Uri uri) {
        m0 m0Var;
        rp.c cVar;
        ArrayList arrayList;
        if (uri == null || (m0Var = m0.f87615q) == null || (cVar = m0Var.f87619d) == null || (arrayList = cVar.f86140i) == null || arrayList.size() == 0) {
            return false;
        }
        if (uri.getScheme() == null) {
            uri = Uri.parse(UrlConst.HTTPS + uri.toString());
        }
        return o(uri, m0.f87615q.f87619d.f86140i);
    }

    public static boolean k(Uri uri) {
        rp.c cVar;
        ArrayList arrayList;
        m0 m0Var = m0.f87615q;
        if (uri == null || m0Var == null || (cVar = m0Var.f87619d) == null || (arrayList = cVar.f86139h) == null || arrayList.size() == 0) {
            return false;
        }
        if (uri.getScheme() == null) {
            uri = Uri.parse(UrlConst.HTTPS + uri.toString());
        }
        return o(uri, m0Var.f87619d.f86139h);
    }

    public static boolean l(String str) {
        return str == null || str.trim().length() == 0;
    }

    public static boolean m(String str) {
        if (l(str)) {
            return false;
        }
        return g().contains(str) || Pattern.compile("^[0-]+$").matcher(str).matches();
    }

    public static boolean n(Uri uri) {
        return (uri == null || uri.getHost() == null || !uri.getHost().endsWith("sng.link")) ? false : true;
    }

    public static boolean o(Uri uri, ArrayList arrayList) {
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            if (uri.getHost() != null && uri.getHost().equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static double p(long j11) {
        return (f87657d.o() - j11) * 0.001d;
    }

    public static String q(String str, String str2) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(str2.getBytes("UTF-8"));
            messageDigest.update(str.getBytes("UTF-8"));
            byte[] bArrDigest = messageDigest.digest();
            char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
            char[] cArr2 = new char[bArrDigest.length * 2];
            for (int i5 = 0; i5 < bArrDigest.length; i5++) {
                byte b11 = bArrDigest[i5];
                int i11 = i5 * 2;
                cArr2[i11] = cArr[(b11 & 255) >>> 4];
                cArr2[i11 + 1] = cArr[b11 & 15];
            }
            return new String(cArr2);
        } catch (Throwable unused) {
            return null;
        }
    }

    public static String r(String str) {
        byte[] bArr;
        try {
            try {
                int length = str.length();
                bArr = new byte[length / 2];
                for (int i5 = 0; i5 < length; i5 += 2) {
                    bArr[i5 / 2] = (byte) ((Character.digit(str.charAt(i5), 16) << 4) + Character.digit(str.charAt(i5 + 1), 16));
                }
            } catch (Throwable th2) {
                c(th2);
                bArr = null;
            }
            byte[] bArr2 = new byte[4];
            int length2 = bArr.length - 4;
            byte[] bArr3 = new byte[length2];
            System.arraycopy(bArr, 0, bArr2, 0, 4);
            System.arraycopy(bArr, 4, bArr3, 0, length2);
            byte[] bArr4 = new byte[length2];
            for (int i11 = 0; i11 < length2; i11++) {
                bArr4[i11] = (byte) (bArr3[i11] ^ bArr2[i11 % 4]);
            }
            return new String(bArr4);
        } catch (Throwable th3) {
            c(th3);
            return null;
        }
    }
}
