package bh;

import dalvik.system.PathClassLoader;

/* loaded from: classes3.dex */
public final class h extends PathClassLoader {
    public h(ClassLoader classLoader, String str) {
        super(str, classLoader);
    }

    @Override // java.lang.ClassLoader
    public final Class loadClass(String str, boolean z11) {
        if (!str.startsWith("java.") && !str.startsWith("android.")) {
            try {
                return findClass(str);
            } catch (ClassNotFoundException unused) {
            }
        }
        return super.loadClass(str, z11);
    }
}
