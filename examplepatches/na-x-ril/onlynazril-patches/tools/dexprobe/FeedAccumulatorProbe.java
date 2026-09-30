import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.UsingFieldData;

/**
 * Reads a class and one of its methods: its fields, what the method calls, which fields it touches,
 * and who calls it. Enough to name the source a list is copied from, which a stack frame alone
 * cannot say.
 *
 *   tools/dexprobe/run.sh FeedAccumulatorProbe "<apk>" "X.1MJf#LIZIZ" "X.07zq#getData"
 */
public class FeedAccumulatorProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            for (int i = 1; i < args.length; i++) {
                String[] parts = args[i].split("#");
                shape(bridge, parts[0], parts.length > 1 ? parts[1] : null);
            }
        }
    }

    private static void shape(DexKitBridge bridge, String className, String methodName) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        System.out.println("\n### " + className + " (matched " + classes.size() + ")");
        for (ClassData c : classes) {
            System.out.println("  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            for (FieldData f : c.getFields()) {
                System.out.println("  field " + f.getTypeName() + " " + f.getName()
                        + "  static=" + ((f.getModifiers() & 0x8) != 0)
                        + "  readers=" + f.getReaders().size() + " writers=" + f.getWriters().size());
            }
            System.out.println("  -- methods (" + c.getMethodCount() + ")");
            int shown = 0;
            for (MethodData m : c.getMethods()) {
                if (shown++ >= 40) {
                    System.out.println("     ... (capped)");
                    break;
                }
                System.out.println("     " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            }
            if (methodName == null) continue;
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals(methodName)) continue;
                System.out.println("\n  ## " + className + "#" + methodName + " "
                        + m.getParamTypeNames() + " -> " + m.getReturnTypeName()
                        + "  static=" + ((m.getModifiers() & 0x8) != 0));
                System.out.println("     invokes:");
                int invokes = 0;
                for (MethodData invoked : m.getInvokes()) {
                    if (invokes++ >= 30) break;
                    System.out.println("        " + invoked.getDeclaredClassName() + "#"
                            + invoked.getName() + " " + invoked.getParamTypeNames()
                            + " -> " + invoked.getReturnTypeName());
                }
                System.out.println("     fields touched:");
                for (UsingFieldData used : m.getUsingFields()) {
                    System.out.println("        " + used.getUsingType() + " "
                            + used.getField().getDeclaredClassName() + "."
                            + used.getField().getName() + " : " + used.getField().getTypeName());
                }
                System.out.println("     callers (" + m.getCallers().size() + "):");
                int callers = 0;
                for (MethodData caller : m.getCallers()) {
                    if (callers++ >= 15) break;
                    System.out.println("        " + caller.getDeclaredClassName() + "#"
                            + caller.getName() + " " + caller.getParamTypeNames()
                            + "  opCount=" + caller.getOpCodes().size());
                }
            }
        }
    }
}
