package de.robv.android.xposed;

/**
 * Compile-only stub mirroring the legacy Xposed API shipped by LSPosed 1.9.x.
 * Only the members used by this module are declared; signatures must match the
 * runtime classes exactly (bytecode-level linkage). Never bundle these classes
 * into the module APK.
 */
public final class XposedHelpers {

    private XposedHelpers() {
    }

    /**
     * Returns a class from the given class loader.
     */
    public static Class<?> findClass(String className, ClassLoader classLoader) {
        try {
            if (classLoader == null) {
                return Class.forName(className, false, ClassLoader.getSystemClassLoader());
            }
            return Class.forName(className, false, classLoader);
        } catch (ClassNotFoundException e) {
            throw new ClassNotFoundError(e);
        }
    }

    /**
     * Look up a method and hook it. The last argument must be the callback.
     */
    public static XC_MethodHook.Unhook findAndHookMethod(Class<?> clazz, String methodName,
                                                         Object... parameterTypesAndCallback) {
        throw new UnsupportedOperationException("stub");
    }
}
