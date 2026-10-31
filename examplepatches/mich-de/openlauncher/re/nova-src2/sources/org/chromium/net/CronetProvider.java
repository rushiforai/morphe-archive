package org.chromium.net;

import android.content.Context;
import android.util.Log;
import b.c0;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import org.chromium.net.CronetEngine;
import s90.a0;

/* loaded from: classes5.dex */
public abstract class CronetProvider {
    private static final String GMS_CORE_CRONET_PROVIDER_CLASS = "com.google.android.gms.net.GmsCoreCronetProvider";
    private static final String JAVA_CRONET_PROVIDER_CLASS = "org.chromium.net.impl.JavaCronetProvider";
    private static final String NATIVE_CRONET_PROVIDER_CLASS = "org.chromium.net.impl.NativeCronetProvider";
    private static final String PLAY_SERVICES_CRONET_PROVIDER_CLASS = "com.google.android.gms.net.PlayServicesCronetProvider";
    public static final String PROVIDER_NAME_APP_PACKAGED = "App-Packaged-Cronet-Provider";
    public static final String PROVIDER_NAME_FALLBACK = "Fallback-Cronet-Provider";
    private static final String RES_KEY_CRONET_IMPL_CLASS = "CronetProviderClassName";
    private static final String TAG = "CronetProvider";
    protected final Context mContext;

    public CronetProvider(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Context must not be null");
        }
        this.mContext = context;
    }

    private static boolean addCronetProviderFromResourceFile(Context context, a0 a0Var, Set<c> set) {
        int identifier = context.getResources().getIdentifier(RES_KEY_CRONET_IMPL_CLASS, "string", context.getPackageName());
        boolean z11 = false;
        if (identifier == 0) {
            return false;
        }
        String string = context.getString(identifier);
        if (string != null && !string.equals(PLAY_SERVICES_CRONET_PROVIDER_CLASS) && !string.equals(GMS_CORE_CRONET_PROVIDER_CLASS) && !string.equals(JAVA_CRONET_PROVIDER_CLASS) && !string.equals(NATIVE_CRONET_PROVIDER_CLASS)) {
            z11 = true;
            if (!addCronetProviderImplByClassName(context, string, a0Var, set, true)) {
                Log.e(TAG, "Unable to instantiate Cronet implementation class " + string + " that is listed as in the app string resource file under CronetProviderClassName key");
            }
        }
        return z11;
    }

    private static boolean addCronetProviderImplByClassName(Context context, String str, a0 a0Var, Set<c> set, boolean z11) throws NoSuchMethodException, SecurityException {
        try {
            Constructor constructor = context.getClassLoader().loadClass(str).asSubclass(CronetProvider.class).getConstructor(Context.class);
            c cVar = new c();
            cVar.f80626a = (CronetProvider) constructor.newInstance(context);
            cVar.f80627b = a0Var;
            set.add(cVar);
            return true;
        } catch (ClassNotFoundException e3) {
            logReflectiveOperationException(str, z11, e3);
            return false;
        } catch (IllegalAccessException e11) {
            logReflectiveOperationException(str, z11, e11);
            return false;
        } catch (InstantiationException e12) {
            logReflectiveOperationException(str, z11, e12);
            return false;
        } catch (NoSuchMethodException e13) {
            logReflectiveOperationException(str, z11, e13);
            return false;
        } catch (InvocationTargetException e14) {
            logReflectiveOperationException(str, z11, e14);
            return false;
        }
    }

    public static List<c> getAllProviderInfos(Context context) throws NoSuchMethodException, SecurityException {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        addCronetProviderFromResourceFile(context, a0.f86846a, linkedHashSet);
        a0 a0Var = a0.f86848c;
        addCronetProviderImplByClassName(context, PLAY_SERVICES_CRONET_PROVIDER_CLASS, a0Var, linkedHashSet, false);
        addCronetProviderImplByClassName(context, GMS_CORE_CRONET_PROVIDER_CLASS, a0Var, linkedHashSet, false);
        addCronetProviderImplByClassName(context, NATIVE_CRONET_PROVIDER_CLASS, a0.f86847b, linkedHashSet, false);
        addCronetProviderImplByClassName(context, JAVA_CRONET_PROVIDER_CLASS, a0.f86849d, linkedHashSet, false);
        return Collections.unmodifiableList(new ArrayList(linkedHashSet));
    }

    public static List<CronetProvider> getAllProviders(Context context) {
        ArrayList arrayList = new ArrayList();
        Iterator<c> it = getAllProviderInfos(context).iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().f80626a);
        }
        return Collections.unmodifiableList(arrayList);
    }

    private static void logReflectiveOperationException(String str, boolean z11, Exception exc) {
        if (z11) {
            Log.e(TAG, "Unable to load provider class: " + str, exc);
        }
    }

    public abstract CronetEngine.Builder createBuilder();

    public abstract String getName();

    public abstract String getVersion();

    public abstract boolean isEnabled();

    public String toString() {
        String name = getClass().getName();
        String name2 = getName();
        String version = getVersion();
        boolean zIsEnabled = isEnabled();
        StringBuilder sbW = c0.w("[class=", name, ", name=", name2, ", version=");
        sbW.append(version);
        sbW.append(", enabled=");
        sbW.append(zIsEnabled);
        sbW.append("]");
        return sbW.toString();
    }
}
