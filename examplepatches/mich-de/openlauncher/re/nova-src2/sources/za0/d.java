package za0;

import b.i8;
import bb0.e;
import bh.g;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.ServiceConfigurationError;
import java.util.ServiceLoader;
import java.util.concurrent.LinkedBlockingQueue;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static volatile int f98501a;

    /* renamed from: b, reason: collision with root package name */
    public static final bb0.c f98502b = new bb0.c(1);

    /* renamed from: c, reason: collision with root package name */
    public static final bb0.c f98503c = new bb0.c(0);

    /* renamed from: d, reason: collision with root package name */
    public static volatile bb0.c f98504d;

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f98505e;

    static {
        try {
            System.getProperty("slf4j.detectLoggerNameMismatch");
        } catch (SecurityException unused) {
        }
        f98505e = new String[]{"2.0"};
    }

    public static ArrayList a() {
        ArrayList arrayList = new ArrayList();
        final ClassLoader classLoader = d.class.getClassLoader();
        String property = System.getProperty("slf4j.provider");
        bb0.c cVar = null;
        if (property != null && !property.isEmpty()) {
            try {
                g.i0("Attempting to load provider \"" + property + "\" specified via \"slf4j.provider\" system property");
                cVar = (bb0.c) classLoader.loadClass(property).getConstructor(null).newInstance(null);
            } catch (ClassCastException e3) {
                g.j0("Specified SLF4JServiceProvider (" + property + ") does not implement SLF4JServiceProvider interface", e3);
            } catch (ClassNotFoundException e11) {
                e = e11;
                g.j0("Failed to instantiate the specified SLF4JServiceProvider (" + property + ")", e);
            } catch (IllegalAccessException e12) {
                e = e12;
                g.j0("Failed to instantiate the specified SLF4JServiceProvider (" + property + ")", e);
            } catch (InstantiationException e13) {
                e = e13;
                g.j0("Failed to instantiate the specified SLF4JServiceProvider (" + property + ")", e);
            } catch (NoSuchMethodException e14) {
                e = e14;
                g.j0("Failed to instantiate the specified SLF4JServiceProvider (" + property + ")", e);
            } catch (InvocationTargetException e15) {
                e = e15;
                g.j0("Failed to instantiate the specified SLF4JServiceProvider (" + property + ")", e);
            }
        }
        if (cVar != null) {
            arrayList.add(cVar);
            return arrayList;
        }
        Iterator it = (System.getSecurityManager() == null ? ServiceLoader.load(bb0.c.class, classLoader) : (ServiceLoader) AccessController.doPrivileged(new PrivilegedAction() { // from class: za0.c
            @Override // java.security.PrivilegedAction
            public final Object run() {
                return ServiceLoader.load(bb0.c.class, classLoader);
            }
        })).iterator();
        while (it.hasNext()) {
            try {
                arrayList.add((bb0.c) it.next());
            } catch (ServiceConfigurationError e16) {
                g.i0("A SLF4J service provider failed to instantiate:\n" + e16.getMessage());
            }
        }
        return arrayList;
    }

    public static b b(String str) {
        bb0.c cVar;
        a aVar;
        if (f98501a == 0) {
            synchronized (d.class) {
                try {
                    if (f98501a == 0) {
                        f98501a = 1;
                        c();
                    }
                } finally {
                }
            }
        }
        int i5 = f98501a;
        if (i5 == 1) {
            cVar = f98502b;
        } else {
            if (i5 == 2) {
                throw new IllegalStateException("org.slf4j.LoggerFactory in failed state. Original exception was thrown EARLIER. See also https://www.slf4j.org/codes.html#unsuccessfulInit");
            }
            if (i5 == 3) {
                cVar = f98504d;
            } else {
                if (i5 != 4) {
                    throw new IllegalStateException("Unreachable code");
                }
                cVar = f98503c;
            }
        }
        switch (cVar.f17800a) {
            case 0:
                aVar = (i8) cVar.f17801b;
                break;
            default:
                aVar = (e) cVar.f17801b;
                break;
        }
        return aVar.b(str);
    }

    public static final void c() {
        try {
            ArrayList arrayListA = a();
            f(arrayListA);
            if (arrayListA.isEmpty()) {
                f98501a = 4;
                g.i0("No SLF4J providers were found.");
                g.i0("Defaulting to no-operation (NOP) logger implementation");
                g.i0("See https://www.slf4j.org/codes.html#noProviders for further details.");
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                try {
                    ClassLoader classLoader = d.class.getClassLoader();
                    Enumeration<URL> systemResources = classLoader == null ? ClassLoader.getSystemResources("org/slf4j/impl/StaticLoggerBinder.class") : classLoader.getResources("org/slf4j/impl/StaticLoggerBinder.class");
                    while (systemResources.hasMoreElements()) {
                        linkedHashSet.add(systemResources.nextElement());
                    }
                } catch (IOException e3) {
                    g.j0("Error getting resources from path", e3);
                }
                e(linkedHashSet);
            } else {
                f98504d = (bb0.c) arrayListA.get(0);
                f98504d.getClass();
                f98501a = 3;
                if (!arrayListA.isEmpty() && arrayListA.size() > 1) {
                    g.i0("Actual provider is of type [" + arrayListA.get(0) + "]");
                }
            }
            d();
            if (f98501a == 3) {
                try {
                    switch (f98504d.f17800a) {
                        case 0:
                            boolean z11 = false;
                            for (String str : f98505e) {
                                if ("2.0.99".startsWith(str)) {
                                    z11 = true;
                                }
                            }
                            if (z11) {
                                return;
                            }
                            g.i0("The requested version 2.0.99 by your slf4j provider is not compatible with " + Arrays.asList(f98505e).toString());
                            g.i0("See https://www.slf4j.org/codes.html#version_mismatch for further details.");
                            return;
                        default:
                            throw new UnsupportedOperationException();
                    }
                } catch (NoSuchFieldError unused) {
                } catch (Throwable th2) {
                    g.j0("Unexpected problem occurred during version sanity check", th2);
                }
            }
        } catch (Exception e11) {
            f98501a = 2;
            g.j0("Failed to instantiate SLF4J LoggerFactory", e11);
            throw new IllegalStateException("Unexpected initialization failure", e11);
        }
    }

    public static void d() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        bb0.c cVar = f98502b;
        synchronized (cVar) {
            try {
                ((e) cVar.f17801b).f17809a = true;
                e eVar = (e) cVar.f17801b;
                eVar.getClass();
                Iterator it = new ArrayList(eVar.f17810b.values()).iterator();
                while (it.hasNext()) {
                    bb0.d dVar = (bb0.d) it.next();
                    dVar.p(b(dVar.k()));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        LinkedBlockingQueue linkedBlockingQueue = ((e) f98502b.f17801b).f17811c;
        int size = linkedBlockingQueue.size();
        ArrayList arrayList = new ArrayList(128);
        int i5 = 0;
        while (linkedBlockingQueue.drainTo(arrayList, 128) != 0) {
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                ab0.b bVar = (ab0.b) it2.next();
                if (bVar != null) {
                    bb0.d dVarB = bVar.b();
                    String strK = dVarB.k();
                    if (dVarB.n()) {
                        throw new IllegalStateException("Delegate logger cannot be null at this state.");
                    }
                    if (!dVarB.m()) {
                        if (!dVarB.l()) {
                            g.i0(strK);
                        } else if (dVarB.i(bVar.a())) {
                            dVarB.o(bVar);
                        }
                    }
                }
                int i11 = i5 + 1;
                if (i5 == 0) {
                    if (bVar.b().l()) {
                        g.i0("A number (" + size + ") of logging calls during the initialization phase have been intercepted and are");
                        g.i0("now being replayed. These are subject to the filtering rules of the underlying logging system.");
                        g.i0("See also https://www.slf4j.org/codes.html#replay");
                    } else if (!bVar.b().m()) {
                        g.i0("The following set of substitute loggers may have been accessed");
                        g.i0("during the initialization phase. Logging calls during this");
                        g.i0("phase were not honored. However, subsequent logging calls to these");
                        g.i0("loggers will work as normally expected.");
                        g.i0("See also https://www.slf4j.org/codes.html#substituteLogger");
                    }
                }
                i5 = i11;
            }
            arrayList.clear();
        }
        e eVar2 = (e) f98502b.f17801b;
        eVar2.f17810b.clear();
        eVar2.f17811c.clear();
    }

    public static void e(LinkedHashSet linkedHashSet) {
        if (linkedHashSet.isEmpty()) {
            return;
        }
        g.i0("Class path contains SLF4J bindings targeting slf4j-api versions 1.7.x or earlier.");
        Iterator it = linkedHashSet.iterator();
        while (it.hasNext()) {
            g.i0("Ignoring binding found at [" + ((URL) it.next()) + "]");
        }
        g.i0("See https://www.slf4j.org/codes.html#ignoredBindings for an explanation.");
    }

    public static void f(ArrayList arrayList) {
        if (arrayList.size() > 1) {
            g.i0("Class path contains multiple SLF4J providers.");
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                g.i0("Found provider [" + ((bb0.c) it.next()) + "]");
            }
            g.i0("See https://www.slf4j.org/codes.html#multiple_bindings for an explanation.");
        }
    }
}
