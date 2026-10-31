package bi;

import android.content.Context;
import android.util.Log;
import bh.e;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.dynamite.DynamiteModule$LoadingException;
import java.lang.reflect.Method;
import org.chromium.net.ApiVersion;
import pg.c;
import sg.w;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final c f17910a = c.f82562b;

    /* renamed from: b, reason: collision with root package name */
    public static final Object f17911b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static e f17912c = null;

    /* renamed from: d, reason: collision with root package name */
    public static String f17913d = "0";

    public static void a(Context context) {
        e eVar;
        Object obj = f17911b;
        synchronized (obj) {
            try {
                synchronized (obj) {
                    eVar = f17912c;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (eVar != null) {
            return;
        }
        w.i(context, "Context must not be null");
        ClassLoader classLoader = a.class.getClassLoader();
        w.h(classLoader);
        try {
            classLoader.loadClass("org.chromium.net.CronetEngine");
            int apiLevel = ApiVersion.getApiLevel();
            c cVar = f17910a;
            cVar.getClass();
            c.c(context);
            try {
                e eVarC = e.c(context, e.f17892b, "com.google.android.gms.cronet_dynamite");
                try {
                    Class<?> clsLoadClass = eVarC.f17904a.getClassLoader().loadClass("org.chromium.net.impl.ImplVersion");
                    if (clsLoadClass.getClassLoader() == a.class.getClassLoader()) {
                        Log.e("a", "ImplVersion class is missing from Cronet module.");
                        throw new GooglePlayServicesNotAvailableException(8);
                    }
                    Method method = clsLoadClass.getMethod("getApiLevel", null);
                    Method method2 = clsLoadClass.getMethod("getCronetVersion", null);
                    Integer num = (Integer) method.invoke(null, null);
                    w.h(num);
                    int iIntValue = num.intValue();
                    String str = (String) method2.invoke(null, null);
                    w.h(str);
                    f17913d = str;
                    if (apiLevel <= iIntValue) {
                        f17912c = eVarC;
                        return;
                    }
                    if (cVar.a(context, 2, "cr") == null) {
                        Log.e("a", "Unable to fetch error resolution intent");
                        throw new GooglePlayServicesNotAvailableException(2);
                    }
                    String str2 = f17913d;
                    StringBuilder sb2 = new StringBuilder(String.valueOf(str2).length() + 174);
                    sb2.append("Google Play Services update is required. The API Level of the client is ");
                    sb2.append(apiLevel);
                    sb2.append(". The API Level of the implementation is ");
                    sb2.append(iIntValue);
                    sb2.append(". The Cronet implementation version is ");
                    sb2.append(str2);
                    throw new GooglePlayServicesRepairableException(sb2.toString());
                } catch (Exception e3) {
                    Log.e("a", "Unable to read Cronet version from the Cronet module ", e3);
                    throw ((GooglePlayServicesNotAvailableException) new GooglePlayServicesNotAvailableException(8).initCause(e3));
                }
            } catch (DynamiteModule$LoadingException e11) {
                Log.e("a", "Unable to load Cronet module", e11);
                throw ((GooglePlayServicesNotAvailableException) new GooglePlayServicesNotAvailableException(8).initCause(e11));
            }
        } catch (ClassNotFoundException e12) {
            Log.e("a", "Cronet API is not available. Have you included all required dependencies?");
            throw ((GooglePlayServicesNotAvailableException) new GooglePlayServicesNotAvailableException(10).initCause(e12));
        }
    }
}
