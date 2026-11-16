/**
 * Finds the methods that use an integer literal, such as a resource id.
 *
 *   tools/dexprobe/run.sh NumberUseProbe "<apk>" 2131400340
 *
 * Resource ids are compiled into `const` instructions, so the code that inflates or labels a
 * view can be found from the id alone when the string itself lives in the resource table.
 */
import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

public class NumberUseProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        long value = args[1].startsWith("0x")
                ? Long.parseLong(args[1].substring(2), 16)
                : Long.parseLong(args[1]);
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            MethodDataList methods = bridge.findMethod(FindMethod.create()
                    .matcher(MethodMatcher.create().usingNumbers(value)));
            System.out.println("### methods using number " + value + " : " + methods.size());
            for (MethodData method : methods) {
                System.out.println("\n## " + method.getDeclaredClassName() + "#" + method.getName()
                        + " " + method.getParamTypeNames() + " -> " + method.getReturnTypeName());
                System.out.println("   strings=" + method.getUsingStrings());
                for (MethodData caller : method.getCallers()) {
                    System.out.println("   <- " + caller.getDeclaredClassName() + "#"
                            + caller.getName() + " " + caller.getParamTypeNames());
                }
            }
        }
    }
}
