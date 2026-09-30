import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.enums.StringMatchType;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * Reads a *patched* APK back: every extension class it carries, and every place that calls into it,
 * so the hook sites that were actually installed can be named instead of assumed.
 *
 *   tools/dexprobe/run.sh DiagHookProbe "<patched apk>" [class-needle]
 *
 * The needle defaults to the extension's package. A caller listed here is a site the patch
 * instrumented; if the site you expected is absent, nothing was hooked there.
 */
public class DiagHookProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        String needle = args.length > 1 ? args[1] : "onlynazril";
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(needle, StringMatchType.Contains)));
            System.out.println("### classes containing \"" + needle + "\" : " + classes.size());
            for (ClassData c : classes) {
                System.out.println("\n## " + c.getName());
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    System.out.println("   " + m.getName() + " " + m.getParamTypeNames()
                            + " -> " + m.getReturnTypeName() + "  callers=" + m.getCallers().size());
                    int shown = 0;
                    for (MethodData caller : m.getCallers()) {
                        if (shown++ >= 10) break;
                        System.out.println("        called by " + caller.getDeclaredClassName() + "#"
                                + caller.getName() + " " + caller.getParamTypeNames()
                                + "  opCount=" + caller.getOpCodes().size());
                    }
                }
            }
        }
    }
}
