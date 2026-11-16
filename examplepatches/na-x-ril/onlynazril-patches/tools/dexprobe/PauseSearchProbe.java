/**
 * Finds the code behind the pause-screen image search entry.
 *
 *   tools/dexprobe/run.sh PauseSearchProbe "<apk>" [needle]
 *
 * The default needle is the log line TikTok writes while it builds the pause items. The probe
 * prints the methods that carry it, their strings, and their callers, so the entry can be found
 * without guessing an obfuscated class or method name.
 */
import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.enums.StringMatchType;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

import java.util.List;

public class PauseSearchProbe {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String DEFAULT =
            "addPauseItemText. text should be invisible. itemId:image_search";

    public static void main(String[] args) {
        String needle = args.length > 1 ? args[1] : DEFAULT;
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            MethodDataList methods = bridge.findMethod(FindMethod.create()
                    .matcher(MethodMatcher.create()
                            .usingStrings(List.of(needle), StringMatchType.Contains)));
            System.out.println("### methods using \"" + needle + "\" : " + methods.size());
            for (MethodData method : methods) {
                System.out.println("\n## " + method.getDeclaredClassName() + "#" + method.getName()
                        + " " + method.getParamTypeNames() + " -> " + method.getReturnTypeName());
                System.out.println("   strings=" + method.getUsingStrings());
                System.out.println("   opcodes=" + method.getOpCodes().size());
                int shown = 0;
                for (MethodData caller : method.getCallers()) {
                    if (shown++ >= 20) break;
                    System.out.println("   <- " + caller.getDeclaredClassName() + "#"
                            + caller.getName() + " " + caller.getParamTypeNames()
                            + " strings=" + caller.getUsingStrings());
                }
            }
        }
    }
}
