import dalvik.system.DexClassLoader;

/** Loads target classes in an isolated Android process; does not install or launch Boost. */
public final class ArtVerify {
    public static void main(String[] args) throws Exception {
        ClassLoader loader = new DexClassLoader(args[0], args[1], null,
                ClassLoader.getSystemClassLoader());
        int failures = 0;
        for (int i = 2; i < args.length; i++) {
            try {
                Class<?> type = Class.forName(args[i], true, loader);
                type.getDeclaredMethods();
                type.getDeclaredConstructors();
                System.out.println("ART PASS: " + args[i]);
            } catch (Throwable error) {
                failures++;
                System.out.println("ART FAIL: " + args[i]);
                error.printStackTrace(System.out);
            }
        }
        if (failures > 0) System.exit(1);
    }
}
