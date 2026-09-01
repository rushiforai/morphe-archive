package defpackage;

import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c1f {
    public final WeakReference a;
    public final int b;

    public c1f(ClassLoader classLoader) {
        this.a = new WeakReference(classLoader);
        this.b = System.identityHashCode(classLoader);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof c1f) && this.a.get() == ((c1f) obj).a.get();
    }

    public final int hashCode() {
        return this.b;
    }

    public final String toString() {
        String string;
        ClassLoader classLoader = (ClassLoader) this.a.get();
        return (classLoader == null || (string = classLoader.toString()) == null) ? "<null>" : string;
    }
}
