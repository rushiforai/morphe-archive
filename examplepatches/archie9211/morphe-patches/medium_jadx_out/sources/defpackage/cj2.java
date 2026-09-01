package defpackage;

import android.content.Context;
import android.util.Log;
import com.google.android.material.internal.It.KLTXZbnQvj;
import j$.util.DesugarCollections;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class cj2 {
    public final Context a;

    public static boolean a(Context context, String str, ti2 ti2Var, LinkedHashSet linkedHashSet, boolean z) {
        try {
            Constructor constructor = context.getClassLoader().loadClass(str).asSubclass(cj2.class).getConstructor(Context.class);
            bj2 bj2Var = new bj2();
            bj2Var.a = (cj2) constructor.newInstance(context);
            bj2Var.b = ti2Var;
            linkedHashSet.add(bj2Var);
            return true;
        } catch (ClassNotFoundException e) {
            g(str, z, e);
            return false;
        } catch (IllegalAccessException e2) {
            g(str, z, e2);
            return false;
        } catch (InstantiationException e3) {
            g(str, z, e3);
            return false;
        } catch (NoSuchMethodException e4) {
            g(str, z, e4);
            return false;
        } catch (InvocationTargetException e5) {
            g(str, z, e5);
            return false;
        }
    }

    public static void g(String str, boolean z, ReflectiveOperationException reflectiveOperationException) {
        if (z) {
            Log.e("cj2", "Unable to load provider class: ".concat(str), reflectiveOperationException);
        } else if (Log.isLoggable("cj2", 3)) {
            Log.d("cj2", "Tried to load " + str + " provider class but it wasn't included in the app classpath");
        }
    }

    public abstract w54 b();

    public abstract String d();

    public abstract String e();

    public abstract boolean f();

    public final String toString() {
        String name = getClass().getName();
        String strD = d();
        String strE = e();
        boolean zF = f();
        StringBuilder sbU = y30.u("[class=", name, ", name=", strD, ", version=");
        sbU.append(strE);
        sbU.append(", enabled=");
        sbU.append(zF);
        sbU.append("]");
        return sbU.toString();
    }

    public static List c(Context context) {
        String string;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        ti2 ti2Var = ti2.CRONET_SOURCE_UNSPECIFIED;
        int identifier = context.getResources().getIdentifier("CronetProviderClassName", "string", context.getPackageName());
        if (identifier != 0 && (string = context.getString(identifier)) != null && !string.equals("com.google.android.gms.net.PlayServicesCronetProvider") && !string.equals("com.google.android.gms.net.GmsCoreCronetProvider") && !string.equals("org.chromium.net.impl.JavaCronetProvider") && !string.equals("org.chromium.net.impl.NativeCronetProvider") && !a(context, string, ti2Var, linkedHashSet, true)) {
            Log.e(dpBiLjNeNsiASg.BfdPmFwvVLA, "Unable to instantiate Cronet implementation class " + string + " that is listed as in the app string resource file under CronetProviderClassName key");
        }
        ti2 ti2Var2 = ti2.CRONET_SOURCE_PLAY_SERVICES;
        a(context, "com.google.android.gms.net.PlayServicesCronetProvider", ti2Var2, linkedHashSet, false);
        a(context, "com.google.android.gms.net.GmsCoreCronetProvider", ti2Var2, linkedHashSet, false);
        a(context, "org.chromium.net.impl.NativeCronetProvider", ti2.CRONET_SOURCE_STATICALLY_LINKED, linkedHashSet, false);
        a(context, "org.chromium.net.impl.JavaCronetProvider", ti2.CRONET_SOURCE_FALLBACK, linkedHashSet, false);
        return DesugarCollections.unmodifiableList(new ArrayList(linkedHashSet));
    }

    public cj2(Context context) {
        if (context != null) {
            this.a = context;
        } else {
            ay0.e(KLTXZbnQvj.IGvAJTDfnKZsAFh);
            throw null;
        }
    }
}
