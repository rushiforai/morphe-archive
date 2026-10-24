import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.ZipFile;

/** Verify the native Fragment-aware close routes, not obfuscated ViewPager getter guesses. */
public final class VerifyNativeToolTabClose {
    static final String ACTIVITY = "Ljp/syoboi/a2chMate/activity/TabletHomeActivity;";
    static final String FRAGMENT = "Landroidx/fragment/app/Fragment;";
    static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static Method method(ClassDef owner, String name, String result, String... parameters) {
        check(owner != null, "Missing native class"); Method found = null;
        for (var m : owner.getMethods()) if (m.getName().equals(name) && m.getReturnType().equals(result) &&
                m.getParameterTypes().equals(List.of(parameters))) {
            check(found == null && (m.getAccessFlags() & 9) == 1, "Expected unique public instance API " + name);
            found = m;
        }
        check(found != null, "Missing native method " + owner.getType() + "->" + name); return found;
    }
    static void removesVia(Method close, String type, String name) {
        boolean found = false;
        for (var ins : close.getImplementation().getInstructions()) if (ins instanceof ReferenceInstruction r &&
            r.getReference() instanceof MethodReference m && m.getDefiningClass().equals(type) &&
            m.getName().equals(name) && m.getParameterTypes().equals(List.of("I")) && m.getReturnType().equals("V")) found = true;
        check(found, "Close route no longer calls native pane removal");
    }
    public static void main(String[] args) throws Exception {
        check(args.length > 0 && args.length % 2 == 0, "Usage: VerifyNativeToolTabClose 191 apk 226 apk 242 apk");
        for (int arg = 0; arg < args.length; arg += 2) try (var zip = new ZipFile(args[arg + 1])) {
            Map<String, ClassDef> classes = new HashMap<>();
            for (var entry : Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                byte[] bytes; try (var input = zip.getInputStream(entry)) { bytes = input.readAllBytes(); }
                for (var cls : new DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes)).getClasses())
                    classes.put(cls.getType(), cls);
            }
            ClassDef activity = classes.get(ACTIVITY);
            check(activity != null, "Tablet activity missing");
            if (args[arg].equals("191")) {
                Method close = method(activity, "e", "V", FRAGMENT, "Z");
                boolean delegates = false;
                for (var ins : close.getImplementation().getInstructions()) if (ins instanceof ReferenceInstruction r &&
                    r.getReference() instanceof MethodReference m &&
                    m.getDefiningClass().equals(ACTIVITY.substring(0, ACTIVITY.length() - 1) + "$read;") &&
                    m.getParameterTypes().equals(List.of(FRAGMENT, "Z")) && m.getReturnType().equals("Z")) delegates = true;
                check(delegates, "191 close does not delegate to owning pane");
            } else {
                boolean modern = args[arg].equals("242");
                check(modern || args[arg].equals("226"), "Unsupported test profile");
                String lazyType = modern ? "Lo/zzbvt;" : "Lo/trN;";
                boolean hasLazy = false;
                for (var field : activity.getFields()) if (field.getName().equals("g") && field.getType().equals(lazyType)) hasLazy = true;
                check(hasLazy, "Native tablet ViewModel lazy field changed");
                method(classes.get(lazyType), modern ? "getValue" : "e", "Ljava/lang/Object;");
                ClassDef model = classes.get(modern ? "Ljp/syoboi/a2chMate/feature/tabletmode/TabletHomeViewModel;" : "Lo/mc;");
                if (modern) {
                    method(model, "b", "Lo/zzeq;", FRAGMENT);
                    removesVia(method(model, "d", "Z", "Lo/zzeq;", "Z"), "Lo/zzev;", "c");
                } else removesVia(method(model, "a", "Z", FRAGMENT, "Z"), "Lo/GNk;", "d");
            }
            System.out.println("PASS " + args[arg] + ": native Fragment-aware close route (not a UI test)");
        }
    }
}
