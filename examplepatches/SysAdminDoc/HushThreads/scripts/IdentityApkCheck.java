import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.File;
import java.net.URLClassLoader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.jar.JarFile;

class IdentityApkCheck {
    public static void main(String[] args) throws Exception {
        if (args.length < 2) {
            throw new IllegalArgumentException("usage: IdentityApkCheck.java <bundle.mpp> <patched.apk>...");
        }
        String expected;
        int firstApk;
        if (args[0].equals("--expected")) {
            if (args.length < 3) {
                throw new IllegalArgumentException("usage: IdentityApkCheck.java --expected <verified identity> <patched.apk>...");
            }
            expected = args[1];
            firstApk = 2;
        } else {
            File bundle = new File(args[0]);
            try (URLClassLoader loader = new URLClassLoader(
                new java.net.URL[]{bundle.toURI().toURL()}, IdentityApkCheck.class.getClassLoader());
                JarFile jar = new JarFile(bundle)) {
                Class<?> identity = Class.forName("app.morphe.util.BundleIdentity", true, loader);
                Object reader = identity.getField("INSTANCE").get(null);
                expected = (String) identity.getMethod("fromJar", JarFile.class).invoke(reader, jar);
            }
            firstApk = 1;
        }
        if (!expected.startsWith("sha256=")) {
            throw new AssertionError("The defining bundle identity is not verified: " + expected);
        }
        for (int index = firstApk; index < args.length; index++) {
            checkApk(new File(args[index]), expected);
        }
    }

    private static void checkApk(File apk, String expected) throws Exception {
        String utils = "Lapp/morphe/extension/shared/Utils;";
        String summaryClass = "Lapp/morphe/extension/hushthreads/settings/HushThreadsPreferenceFragment;";
        int definitions = 0;
        Map<String, Set<String>> callers = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef clazz : dex.getEntry(entry).getDexFile().getClasses()) {
                for (Method method : clazz.getMethods()) {
                    if (clazz.getType().equals(utils) && method.getName().equals("getPatchesBuildIdentity")) {
                        definitions++;
                        var body = method.getImplementation().getInstructions().iterator();
                        Object first = body.next();
                        Object second = body.hasNext() ? body.next() : null;
                        if (!method.getReturnType().equals("Ljava/lang/String;") || !method.getParameterTypes().isEmpty() ||
                                !(first instanceof ReferenceInstruction instruction) ||
                                !(first instanceof OneRegisterInstruction loaded) ||
                                !(instruction.getReference() instanceof StringReference value) ||
                                !expected.equals(value.getString()) ||
                                !(second instanceof OneRegisterInstruction returned) || returned.getOpcode() != Opcode.RETURN_OBJECT ||
                                returned.getRegisterA() != loaded.getRegisterA()) {
                            throw new AssertionError("Final APK getter does not return the defining bundle identity");
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
                            callers.computeIfAbsent(clazz.getType(), ignored -> new HashSet<>()).add(method.getName());
                        }
                    }
                }
            }
        }
        if (definitions != 1) {
            throw new AssertionError("Expected exactly one injected identity getter, got " + definitions);
        }
        for (String caller : new String[]{
                summaryClass,
                "Lapp/morphe/extension/shared/settings/preference/LogBufferManager;"}) {
            if (!callers.containsKey(caller)) {
                throw new AssertionError("Final APK lost identity consumer " + caller);
            }
        }
        Set<String> settingsMethods = callers.get(summaryClass);
        if (!settingsMethods.contains("initialize") || !settingsMethods.contains("buildIdentitySummary")) {
            throw new AssertionError("Final APK lost the About or recovery identity reader");
        }
        System.out.println(apk.getName() + ": exact verified identity preserved in About, recovery and reports");
    }
}
