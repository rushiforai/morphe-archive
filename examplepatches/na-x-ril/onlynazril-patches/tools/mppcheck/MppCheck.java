import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Enumeration;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

/**
 * Loads every class in a .mpp the way PatchLoader does, so a missing runtime dependency shows up
 * here instead of in a failed patch run.
 *
 *   tools/mppcheck/run.sh patches/build/libs/patches-1.0.0.mpp
 *
 * Uses the morphe-desktop jar for the shared runtime (patcher, smali); anything the .mpp needs on
 * top of that must either be bundled or kept out of public signatures.
 */
public class MppCheck {
    public static void main(String[] args) throws Exception {
        File mpp = new File(args[0]);
        URLClassLoader loader = new URLClassLoader(
                new URL[] {mpp.toURI().toURL()}, MppCheck.class.getClassLoader());
        JarFile jar = new JarFile(mpp);
        int classes = 0;
        int failures = 0;
        for (Enumeration<JarEntry> entries = jar.entries(); entries.hasMoreElements(); ) {
            String name = entries.nextElement().getName();
            if (!name.endsWith(".class")) continue;
            String className = name.substring(0, name.length() - ".class".length()).replace('/', '.');
            classes++;
            try {
                Class.forName(className, false, loader).getMethods();
            } catch (Throwable t) {
                failures++;
                System.out.println("FAIL " + className + " -> " + t);
            }
        }
        System.out.println("checked " + classes + " classes, " + failures + " reflection failures");
        if (failures > 0) System.exit(1);
    }
}
