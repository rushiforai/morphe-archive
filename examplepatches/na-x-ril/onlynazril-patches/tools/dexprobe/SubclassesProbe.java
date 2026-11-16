/**
 * The classes extending a superclass, with their methods and strings.
 *
 *   tools/dexprobe/run.sh SubclassesProbe "<apk>" X.14MJ
 *
 * Needed when a pause-panel item is an abstract base: the interface has one implementer, and the
 * concrete items are the subclasses that name the id and build the view.
 */
import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

public class SubclassesProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            for (int i = 1; i < args.length; i++) {
                ClassDataList classes = bridge.findClass(FindClass.create()
                        .matcher(ClassMatcher.create().superClass(args[i])));
                System.out.println("\n### subclasses of " + args[i] + " : " + classes.size());
                for (ClassData c : classes) {
                    System.out.println("\n## " + c.getName()
                            + "  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName())
                            + "  methods=" + c.getMethodCount());
                    for (MethodData m : c.getMethods()) {
                        if (m.getName().startsWith("<")) continue;
                        System.out.println("   " + m.getName() + " " + m.getParamTypeNames()
                                + " -> " + m.getReturnTypeName()
                                + "  strings=" + m.getUsingStrings());
                    }
                }
            }
        }
    }
}
