import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.File;
import java.net.URLClassLoader;
import java.util.HashSet;
import java.util.Set;
import java.util.jar.JarFile;

class IdentityApkCheck {
    public static void main(String[] args) throws Exception {
        if (args.length < 2) {
            throw new IllegalArgumentException("usage: IdentityApkCheck.java <bundle.mpp> <patched.apk>...");
        }
        File bundle = new File(args[0]);
        String expected;
        try (URLClassLoader loader = new URLClassLoader(
                new java.net.URL[]{bundle.toURI().toURL()}, IdentityApkCheck.class.getClassLoader());
                JarFile jar = new JarFile(bundle)) {
            Class<?> identity = Class.forName("app.morphe.util.BundleIdentity", true, loader);
            Object reader = identity.getField("INSTANCE").get(null);
            expected = (String) identity.getMethod("fromJar", JarFile.class).invoke(reader, jar);
        }
        if (!expected.startsWith("sha256=")) {
            throw new AssertionError("The defining bundle identity is not verified: " + expected);
        }
        for (int index = 1; index < args.length; index++) {
            checkApk(new File(args[index]), expected);
        }
    }

    private static void checkApk(File apk, String expected) throws Exception {
        String utils = "Lapp/morphe/extension/shared/Utils;";
        String summaryClass = "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;";
        int definitions = 0;
        Set<String> callers = new HashSet<>();
        Set<String> summaryCallers = new HashSet<>();
        boolean summaryReadsIdentity = false;
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef clazz : dex.getEntry(entry).getDexFile().getClasses()) {
                for (Method method : clazz.getMethods()) {
                    if (clazz.getType().equals(utils) && method.getName().equals("getPatchesBuildIdentity")) {
                        definitions++;
                        Object first = method.getImplementation().getInstructions().iterator().next();
                        if (!(first instanceof ReferenceInstruction instruction) ||
                                !(instruction.getReference() instanceof StringReference value) ||
                                !expected.equals(value.getString())) {
                            throw new AssertionError("Final APK getter does not carry the defining bundle identity");
                        }
                    }
                    if (method.getImplementation() == null) {
                        continue;
                    }
                    for (var instruction : method.getImplementation().getInstructions()) {
                        if (instruction instanceof ReferenceInstruction reference &&
                                reference.getReference() instanceof MethodReference call &&
                                call.getDefiningClass().equals(utils) &&
                                call.getName().equals("getPatchesBuildIdentity")) {
                            callers.add(clazz.getType());
                            if (clazz.getType().equals(summaryClass) && method.getName().equals("buildIdentitySummary")) {
                                summaryReadsIdentity = true;
                            }
                        }
                        if (instruction instanceof ReferenceInstruction reference &&
                                reference.getReference() instanceof MethodReference call &&
                                call.getDefiningClass().equals(summaryClass) &&
                                call.getName().equals("buildIdentitySummary") &&
                                call.getParameterTypes().isEmpty() &&
                                call.getReturnType().equals("Ljava/lang/String;")) {
                            summaryCallers.add(clazz.getType());
                        }
                    }
                }
            }
        }
        if (summaryReadsIdentity) {
            callers.addAll(summaryCallers);
        }
        if (definitions != 1) {
            throw new AssertionError("Expected exactly one injected identity getter, got " + definitions);
        }
        for (String caller : new String[]{
                "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;",
                "Lapp/morphe/extension/hushthreads/settings/SettingsNavigation;",
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;"}) {
            if (!callers.contains(caller)) {
                throw new AssertionError("Final APK lost identity consumer " + caller);
            }
        }
        System.out.println(apk.getName() + ": exact verified identity and all three runtime readers preserved");
    }
}
