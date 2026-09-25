import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * Who calls a class's methods. The counterpart of a stack trace read off a device: a frame names
 * the immediate caller of a hooked method, and when that caller turns out to be a helper, this is
 * how the chain is followed the rest of the way without another trip to the phone.
 *
 *   tools/dexprobe/run.sh CallersOfProbe "<apk>" <class> [method]
 */
public class CallersOfProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        String className = args[1];
        String only = args.length > 2 ? args[2] : null;
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(className)));
            System.out.println("\n### callers of " + className + "  (matched " + classes.size() + " classes)");
            if (classes.isEmpty()) return;
            for (ClassData c : classes) {
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    if (only != null && !m.getName().equals(only)) continue;
                    System.out.println("\n  --> " + m.getName() + " " + m.getParamTypeNames()
                            + " -> " + m.getReturnTypeName()
                            + "   callers=" + m.getCallers().size());
                    for (MethodData caller : m.getCallers()) {
                        System.out.println("      " + caller.getDeclaredClassName()
                                + "#" + caller.getName() + " " + caller.getParamTypeNames()
                                + " -> " + caller.getReturnTypeName());
                    }
                }
            }
        }
    }
}
