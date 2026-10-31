import java.io.File;
import java.util.Collections;
import java.util.Set;

/** Run with Manager's APK on Android's class path, so its actual patcher loads our DEX. */
public final class AndroidBundleSmoke {
    public static void main(String[] args) throws Exception {
        File file = new File(args[0]);
        // Android 14+ refuses writable dynamically loaded DEX containers.
        if (!file.isFile() || file.length() == 0) throw new AssertionError("Missing bundle");
        Class<?> patchKt = Class.forName("app.morphe.patcher.patch.PatchKt");
        Object result = patchKt.getMethod("loadPatchesFromDex", Set.class, File.class)
                .invoke(null, Collections.singleton(file), null);
        Set<?> patches = (Set<?>) result;
        if (patches.size() != 1) throw new AssertionError("Expected 1 Android patch: " + patches.size());
        Object patch = patches.iterator().next();
        Class<?> patchClass = Class.forName("app.morphe.patcher.patch.Patch");
        Object name = patchClass.getMethod("getName").invoke(patch);
        if (!"Unlock lifetime".equals(name)) throw new AssertionError("Wrong patch: " + name);
        System.out.println("ANDROID_LOADER_PASS: Manager patcher discovered Unlock lifetime from DEX");
    }
}
