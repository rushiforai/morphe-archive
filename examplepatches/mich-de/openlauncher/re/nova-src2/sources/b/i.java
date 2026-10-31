package b;

import ads_mobile_sdk.a63;
import ads_mobile_sdk.da3;
import ads_mobile_sdk.fm0;
import ads_mobile_sdk.rp1;
import ads_mobile_sdk.ub3;
import ads_mobile_sdk.v73;
import ads_mobile_sdk.w53;
import ads_mobile_sdk.wi0;
import ads_mobile_sdk.y93;
import ads_mobile_sdk.yk0;
import ads_mobile_sdk.z93;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import dalvik.system.DexClassLoader;
import io.sentry.android.core.SentryAndroidOptions;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.Callable;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class i implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15886a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f15887b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f15888c;

    public /* synthetic */ i(int i5, Object obj, Object obj2) {
        this.f15886a = i5;
        this.f15887b = obj;
        this.f15888c = obj2;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() throws IOException {
        String strA;
        ByteArrayOutputStream byteArrayOutputStream;
        BufferedWriter bufferedWriter;
        String str;
        ServiceInfo serviceInfo;
        String str2;
        int i5;
        switch (this.f15886a) {
            case 0:
                a63 a63Var = (a63) this.f15887b;
                Context context = (Context) this.f15888c;
                HashMap map = new HashMap();
                a63Var.f870h.a(yk0.EVENT_ID_ORCAS_ENGINE_COMPOSE_STATE, new androidx.fragment.app.d(2, a63Var, map, context));
                String strA2 = a63Var.a(map);
                map.clear();
                return strA2;
            case 1:
                da3 da3Var = (da3) this.f15887b;
                ads_mobile_sdk.c8 c8Var = (ads_mobile_sdk.c8) this.f15888c;
                da3Var.getClass();
                int iOrdinal = c8Var.ordinal();
                if (iOrdinal == 1) {
                    return (n) da3Var.f2241a.get();
                }
                if (iOrdinal == 2) {
                    return (n) da3Var.f2242b.get();
                }
                if (iOrdinal == 3) {
                    return (n) da3Var.f2243c.get();
                }
                if (iOrdinal == 4) {
                    return (n) da3Var.f2244d.get();
                }
                throw new IllegalArgumentException();
            case 2:
                fm0 fm0Var = (fm0) this.f15887b;
                Object obj = this.f15888c;
                synchronized (fm0Var) {
                    p10.y1.y(fm0Var.f3427a);
                    File file = new File(fm0Var.f3427a.getParent(), fm0Var.f3427a.getName() + ".temp");
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        try {
                            fm0Var.f3429c.a(obj, fileOutputStream);
                            fileOutputStream.close();
                            if (!file.renameTo(fm0Var.f3427a)) {
                                throw new IOException("Failed to rename file.");
                            }
                        } catch (Throwable th2) {
                            try {
                                fileOutputStream.close();
                            } catch (Throwable th3) {
                                th2.addSuppressed(th3);
                            }
                            throw th2;
                        }
                    } catch (IOException e3) {
                        file.delete();
                        throw e3;
                    }
                }
                return null;
            case 3:
                rp1 rp1Var = (rp1) this.f15887b;
                v73 v73Var = (v73) this.f15888c;
                DexClassLoader dexClassLoader = rp1Var.f9272l;
                z93 z93Var = rp1Var.f9264d;
                byte[] bArr = rp1Var.f9271k;
                String str3 = v73Var.f10631a;
                String str4 = v73Var.f10632b;
                Class<?>[] clsArr = v73Var.f10633c;
                try {
                    z93Var.getClass();
                    return dexClassLoader.loadClass(z93.b(str3, bArr)).getMethod(z93.b(str4, bArr), clsArr);
                } catch (y93 | ClassNotFoundException | NoSuchMethodException | NullPointerException e11) {
                    throw new IllegalStateException(e11);
                }
            case 4:
                w53 w53Var = (w53) this.f15887b;
                Context context2 = (Context) this.f15888c;
                ai.y0 y0VarA = w53Var.f11048a.a();
                if (y0VarA == null) {
                    w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_HANDLE);
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                synchronized (y0VarA) {
                    try {
                        wi0 wi0Var = (wi0) y0VarA.f13476d;
                        ub3 ub3Var = wi0Var.f11289b;
                        ub3Var.getClass();
                        HashMap map2 = new HashMap();
                        Iterator it = ub3Var.f10287a.iterator();
                        while (it.hasNext()) {
                            ((j1) it.next()).a(map2);
                        }
                        wi0Var.a(map2);
                        map2.put(InneractiveMediationDefs.GENDER_FEMALE, "q");
                        map2.put("ctx", context2);
                        map2.put("aid", null);
                        byte[] bArrA = y0VarA.a(map2);
                        if (y0VarA.f13474b) {
                            map2.clear();
                        }
                        strA = ai.y0.a(bArrA);
                    } catch (Throwable th4) {
                        throw th4;
                    }
                }
                if (strA != null) {
                    return strA;
                }
                w53Var.f11051d.b(yk0.EVENT_ID_DG_ENGINE_NULL_QUERY_SIGNALS);
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            case 5:
                return com.vungle.ads.internal.executor.g.a((Callable) this.f15887b, (Function0) this.f15888c);
            case 6:
                io.sentry.p0 p0Var = (io.sentry.p0) this.f15887b;
                io.sentry.h4 h4Var = (io.sentry.h4) this.f15888c;
                ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                try {
                    BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(byteArrayOutputStream2, io.sentry.z2.f67944d));
                    try {
                        p0Var.e(h4Var, bufferedWriter2);
                        byte[] byteArray = byteArrayOutputStream2.toByteArray();
                        bufferedWriter2.close();
                        byteArrayOutputStream2.close();
                        return byteArray;
                    } finally {
                        try {
                            bufferedWriter2.close();
                        } catch (Throwable th5) {
                            th.addSuppressed(th5);
                        }
                    }
                } finally {
                    try {
                        byteArrayOutputStream2.close();
                    } catch (Throwable th6) {
                        th.addSuppressed(th6);
                    }
                }
            case 7:
                io.sentry.p0 p0Var2 = (io.sentry.p0) this.f15887b;
                io.sentry.r2 r2Var = (io.sentry.r2) this.f15888c;
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    bufferedWriter = new BufferedWriter(new OutputStreamWriter(byteArrayOutputStream, io.sentry.z2.f67944d));
                    try {
                        p0Var2.e(r2Var, bufferedWriter);
                        byte[] byteArray2 = byteArrayOutputStream.toByteArray();
                        bufferedWriter.close();
                        byteArrayOutputStream.close();
                        return byteArray2;
                    } finally {
                        try {
                            bufferedWriter.close();
                        } catch (Throwable th7) {
                            th.addSuppressed(th7);
                        }
                    }
                } finally {
                }
            case 8:
                io.sentry.p0 p0Var3 = (io.sentry.p0) this.f15887b;
                io.sentry.clientreport.b bVar = (io.sentry.clientreport.b) this.f15888c;
                byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    bufferedWriter = new BufferedWriter(new OutputStreamWriter(byteArrayOutputStream, io.sentry.z2.f67944d));
                    try {
                        p0Var3.e(bVar, bufferedWriter);
                        byte[] byteArray3 = byteArrayOutputStream.toByteArray();
                        bufferedWriter.close();
                        byteArrayOutputStream.close();
                        return byteArray3;
                    } finally {
                    }
                } finally {
                }
            case 9:
                io.sentry.android.core.e0 e0Var = (io.sentry.android.core.e0) this.f15887b;
                SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) this.f15888c;
                Context context3 = e0Var.f66866a;
                if (io.sentry.android.core.g0.f66884h == null) {
                    synchronized (io.sentry.android.core.g0.class) {
                        try {
                            if (io.sentry.android.core.g0.f66884h == null) {
                                Context applicationContext = context3.getApplicationContext();
                                if (applicationContext != null) {
                                    context3 = applicationContext;
                                }
                                io.sentry.android.core.g0.f66884h = new io.sentry.android.core.g0(context3, sentryAndroidOptions);
                            }
                        } finally {
                        }
                    }
                }
                return io.sentry.android.core.g0.f66884h;
            default:
                Context context4 = (Context) this.f15888c;
                Intent intent = (Intent) this.f15887b;
                tm.o oVarG0 = tm.o.g0();
                ((ArrayDeque) oVarG0.f89496e).offer(intent);
                Intent intent2 = new Intent("com.google.firebase.MESSAGING_EVENT");
                intent2.setPackage(context4.getPackageName());
                synchronized (oVarG0) {
                    try {
                        str = (String) oVarG0.f89493b;
                        if (str == null) {
                            ResolveInfo resolveInfoResolveService = context4.getPackageManager().resolveService(intent2, 0);
                            if (resolveInfoResolveService == null || (serviceInfo = resolveInfoResolveService.serviceInfo) == null) {
                                Log.e("FirebaseMessaging", "Failed to resolve target intent service, skipping classname enforcement");
                            } else {
                                if (context4.getPackageName().equals(serviceInfo.packageName) && (str2 = serviceInfo.name) != null) {
                                    if (str2.startsWith(".")) {
                                        oVarG0.f89493b = context4.getPackageName() + serviceInfo.name;
                                    } else {
                                        oVarG0.f89493b = serviceInfo.name;
                                    }
                                    str = (String) oVarG0.f89493b;
                                }
                                Log.e("FirebaseMessaging", "Error resolving target intent service, skipping classname enforcement. Resolved service was: " + serviceInfo.packageName + "/" + serviceInfo.name);
                            }
                            str = null;
                        }
                    } finally {
                    }
                }
                if (str != null) {
                    intent2.setClassName(context4.getPackageName(), str);
                }
                try {
                    if ((oVarG0.n0(context4) ? tm.x.c(context4, intent2) : context4.startService(intent2)) == null) {
                        Log.e("FirebaseMessaging", "Error while delivering the message: ServiceIntent not found.");
                        i5 = TTAdConstant.DEEPLINK_FALLBACK_CODE;
                    } else {
                        i5 = -1;
                    }
                } catch (IllegalStateException e12) {
                    Log.e("FirebaseMessaging", "Failed to start service while in background: " + e12);
                    i5 = TTAdConstant.AD_ID_IS_NULL_CODE;
                } catch (SecurityException e13) {
                    Log.e("FirebaseMessaging", "Error while delivering the message to the serviceIntent", e13);
                    i5 = TTAdConstant.MATE_IS_NULL_CODE;
                }
                return Integer.valueOf(i5);
        }
    }

    public /* synthetic */ i(Context context, Intent intent) {
        this.f15886a = 10;
        this.f15888c = context;
        this.f15887b = intent;
    }
}
