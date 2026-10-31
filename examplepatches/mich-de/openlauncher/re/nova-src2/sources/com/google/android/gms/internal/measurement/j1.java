package com.google.android.gms.internal.measurement;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.ServiceConfigurationError;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public abstract class j1 implements xe {

    /* renamed from: a, reason: collision with root package name */
    public static final ab.c0 f32674a = new ab.c0("Phenotype.API", new ci.b(2), new o2.f(4));

    public static boolean b(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static e1 c() {
        ClassLoader classLoader = j1.class.getClassLoader();
        if (e1.class.equals(e1.class)) {
            try {
                try {
                    if (Class.forName("com.google.protobuf.BlazeGeneratedExtensionRegistryLiteLoader", true, classLoader).getConstructor(null).newInstance(null) == null) {
                        throw null;
                    }
                    throw new ClassCastException();
                } catch (ReflectiveOperationException e3) {
                    throw new IllegalStateException(e3);
                }
            } catch (ClassNotFoundException unused) {
            }
        }
        try {
            Iterator it = Arrays.asList(new j1[0]).iterator();
            ArrayList arrayList = new ArrayList();
            while (it.hasNext()) {
                try {
                    if (it.next() == null) {
                        throw null;
                    }
                    throw new ClassCastException();
                } catch (ServiceConfigurationError e11) {
                    Logger.getLogger(c1.class.getName()).logp(Level.SEVERE, "com.google.protobuf.GeneratedExtensionRegistryLoader", "load", "Unable to load ".concat(e1.class.getSimpleName()), (Throwable) e11);
                }
            }
            if (arrayList.size() == 1) {
                return (e1) arrayList.get(0);
            }
            if (arrayList.size() == 0) {
                return null;
            }
            try {
                return (e1) e1.class.getMethod("combine", Collection.class).invoke(null, arrayList);
            } catch (ReflectiveOperationException e12) {
                throw new IllegalStateException(e12);
            }
        } catch (Throwable th2) {
            throw new ServiceConfigurationError(th2.getMessage(), th2);
        }
    }

    public static final InputStream d(we weVar) {
        ff ffVarA = weVar.f33193a.a(weVar.f33196d);
        ArrayList arrayList = new ArrayList();
        arrayList.add(ffVarA);
        ArrayList arrayList2 = weVar.f33195c;
        if (!arrayList2.isEmpty()) {
            int i5 = ue.f33108b;
            ArrayList arrayList3 = new ArrayList();
            Iterator it = arrayList2.iterator();
            if (it.hasNext()) {
                throw b.u4.e(it);
            }
            ue ueVar = !arrayList3.isEmpty() ? new ue(ffVarA, arrayList3) : null;
            if (ueVar != null) {
                arrayList.add(ueVar);
            }
        }
        Iterator it2 = weVar.f33194b.iterator();
        if (!it2.hasNext()) {
            Collections.reverse(arrayList);
            return (InputStream) arrayList.get(0);
        }
        if (it2.next() != null) {
            throw new ClassCastException();
        }
        throw null;
    }

    public static boolean e(byte b11) {
        return b11 > -65;
    }
}
