package com.google.android.gms.internal.gtm;

import defpackage.ay0;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.ServiceConfigurationError;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zzaby {
    public static zzabq zzb(Class cls) {
        String str;
        ClassLoader classLoader = zzaby.class.getClassLoader();
        if (cls.equals(zzabq.class)) {
            str = "com.google.android.gms.internal.gtm.zzyn";
        } else {
            if (!cls.getPackage().equals(zzaby.class.getPackage())) {
                ay0.e(cls.getName());
                return null;
            }
            str = cls.getPackage().getName() + ".BlazeGenerated" + cls.getSimpleName() + "Loader";
        }
        try {
            try {
                try {
                    return (zzabq) cls.cast(((zzaby) Class.forName(str, true, classLoader).getConstructor(null).newInstance(null)).zza());
                } catch (InstantiationException e) {
                    throw new IllegalStateException(e);
                } catch (InvocationTargetException e2) {
                    throw new IllegalStateException(e2);
                }
            } catch (IllegalAccessException e3) {
                throw new IllegalStateException(e3);
            } catch (NoSuchMethodException e4) {
                throw new IllegalStateException(e4);
            }
        } catch (ClassNotFoundException unused) {
            Iterator it2 = Collections.singletonList(zzafb.class.getDeclaredConstructor(null).newInstance(null)).iterator();
            ArrayList arrayList = new ArrayList();
            while (it2.hasNext()) {
                try {
                    arrayList.add((zzabq) cls.cast(((zzaby) it2.next()).zza()));
                } catch (ServiceConfigurationError e5) {
                    Logger.getLogger(zzzi.class.getName()).logp(Level.SEVERE, "com.google.protobuf.GeneratedExtensionRegistryLoader", "load", "Unable to load ".concat(cls.getSimpleName()), (Throwable) e5);
                }
            }
            if (arrayList.size() == 1) {
                return (zzabq) arrayList.get(0);
            }
            if (arrayList.size() == 0) {
                return null;
            }
            try {
                return (zzabq) cls.getMethod("combine", Collection.class).invoke(null, arrayList);
            } catch (IllegalAccessException e6) {
                throw new IllegalStateException(e6);
            } catch (NoSuchMethodException e7) {
                throw new IllegalStateException(e7);
            } catch (InvocationTargetException e8) {
                throw new IllegalStateException(e8);
            }
        }
    }

    public abstract zzabq zza();
}
