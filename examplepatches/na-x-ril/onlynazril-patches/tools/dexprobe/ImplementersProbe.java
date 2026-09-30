import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * The classes implementing an interface, with the methods that write a list — the storage a read
 * keeps copying from, which has to be found behind the contract before it can be filtered.
 *
 *   tools/dexprobe/run.sh ImplementersProbe "<apk>" X.07sw X.07qm
 */
public class ImplementersProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            for (int i = 1; i < args.length; i++) {
                ClassDataList classes = bridge.findClass(FindClass.create()
                        .matcher(ClassMatcher.create().addInterface(args[i])));
                System.out.println("\n### implementers of " + args[i] + " : " + classes.size());
                for (ClassData c : classes) {
                    System.out.println("  " + c.getName()
                            + "  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName())
                            + "  methods=" + c.getMethodCount());
                    for (MethodData m : c.getMethods()) {
                        if (m.getName().startsWith("<")) continue;
                        if (m.getParamTypeNames().contains("java.util.List")
                                || "java.util.List".equals(m.getReturnTypeName())) {
                            System.out.println("      " + m.getName() + " " + m.getParamTypeNames()
                                    + " -> " + m.getReturnTypeName()
                                    + "  opCount=" + m.getOpCodes().size());
                        }
                    }
                }
            }
        }
    }
}
