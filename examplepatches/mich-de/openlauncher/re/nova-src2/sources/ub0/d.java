package ub0;

import b.u4;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: d, reason: collision with root package name */
    public static final d f90783d = new d();

    /* renamed from: e, reason: collision with root package name */
    public static final c f90784e = new c();

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f90785a = new AtomicReference();

    /* renamed from: b, reason: collision with root package name */
    public final AtomicReference f90786b = new AtomicReference();

    /* renamed from: c, reason: collision with root package name */
    public final AtomicReference f90787c;

    public d() {
        new AtomicReference();
        new AtomicReference();
        this.f90787c = new AtomicReference();
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x005d, code lost:
    
        r2 = "rxjava.plugin." + r7.substring(0, r7.length() - 6).substring(14) + ".impl";
        r1 = r10.getProperty(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0084, code lost:
    
        if (r1 == null) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00a5, code lost:
    
        throw new java.lang.IllegalStateException("Implementing class declaration for " + r0 + " missing: " + r2);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(Class cls, Properties properties) {
        Properties properties2 = (Properties) properties.clone();
        String simpleName = cls.getSimpleName();
        String property = properties2.getProperty("rxjava.plugin." + simpleName + ".implementation");
        if (property == null) {
            try {
                Iterator it = properties2.entrySet().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    Map.Entry entry = (Map.Entry) it.next();
                    String string = entry.getKey().toString();
                    if (string.startsWith("rxjava.plugin.") && string.endsWith(".class") && simpleName.equals(entry.getValue().toString())) {
                        break;
                    }
                }
            } catch (SecurityException e3) {
                e3.printStackTrace();
            }
        }
        if (property == null) {
            return null;
        }
        try {
            return Class.forName(property).asSubclass(cls).newInstance();
        } catch (ClassCastException e11) {
            throw new IllegalStateException(simpleName + " implementation is not an instance of " + simpleName + ": " + property, e11);
        } catch (ClassNotFoundException e12) {
            throw new IllegalStateException(u4.m(simpleName, " implementation class not found: ", property), e12);
        } catch (IllegalAccessException e13) {
            throw new IllegalStateException(u4.m(simpleName, " implementation not able to be accessed: ", property), e13);
        } catch (InstantiationException e14) {
            throw new IllegalStateException(u4.m(simpleName, " implementation not able to be instantiated: ", property), e14);
        }
    }

    public final c a() {
        Properties properties;
        AtomicReference atomicReference = this.f90785a;
        if (atomicReference.get() == null) {
            try {
                properties = System.getProperties();
            } catch (SecurityException unused) {
                properties = new Properties();
            }
            Object objC = c(c.class, properties);
            if (objC == null) {
                qm.e.h(atomicReference, f90784e);
            } else {
                qm.e.i(atomicReference, (c) objC);
            }
        }
        return (c) atomicReference.get();
    }

    public final b b() {
        Properties properties;
        AtomicReference atomicReference = this.f90786b;
        if (atomicReference.get() == null) {
            try {
                properties = System.getProperties();
            } catch (SecurityException unused) {
                properties = new Properties();
            }
            Object objC = c(b.class, properties);
            if (objC == null) {
                while (!atomicReference.compareAndSet(null, b.f90782a) && atomicReference.get() == null) {
                }
            } else {
                b bVar = (b) objC;
                while (!atomicReference.compareAndSet(null, bVar) && atomicReference.get() == null) {
                }
            }
        }
        return (b) atomicReference.get();
    }

    public final e d() {
        Properties properties;
        AtomicReference atomicReference = this.f90787c;
        if (atomicReference.get() == null) {
            try {
                properties = System.getProperties();
            } catch (SecurityException unused) {
                properties = new Properties();
            }
            Object objC = c(e.class, properties);
            if (objC == null) {
                qm.e.g(atomicReference);
            } else {
                qm.e.j(atomicReference, (e) objC);
            }
        }
        return (e) atomicReference.get();
    }
}
