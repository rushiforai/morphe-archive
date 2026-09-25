import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * The feed header's author-info views: who owns the line that shows the name and the post time,
 * and whether the time lives in a view of its own (which is what decides if the region can be
 * drawn in the same colour as the time).
 */
public class HeaderProbe {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String AUTHOR_INFO = "com.ss.android.ugc.aweme.feed.assem.videoauthorinfo";

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            classes(bridge);
            textSetters(bridge);
        }
    }

    private static void classes(DexKitBridge bridge) {
        ClassDataList list = bridge.findClass(FindClass.create().searchPackages(AUTHOR_INFO));
        System.out.println("\n### " + AUTHOR_INFO + " (" + list.size() + " classes)");
        for (ClassData c : list) {
            System.out.println("  " + c.getName()
                    + "  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
        }
    }

    /** Anything that sets text and also touches the model's time. */
    private static void textSetters(DexKitBridge bridge) {
        ClassDataList list = bridge.findClass(FindClass.create()
                .searchPackages("com.ss.android.ugc.aweme.feed")
                .matcher(ClassMatcher.create().usingStrings("create_time")));
        System.out.println("\n### feed classes using the literal 'create_time' : " + list.size());
        for (ClassData c : list) {
            System.out.println("  " + c.getName());
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (m.getUsingStrings().contains("create_time")) {
                    System.out.println("     " + m.getName() + " " + m.getParamTypeNames()
                            + " -> " + m.getReturnTypeName());
                }
            }
        }

        ClassDataList all = bridge.findClass(FindClass.create().searchPackages("com.ss.android.ugc.aweme.feed"));
        System.out.println("\n### feed classes referencing TextView.setText: (scanning users of the time setter)");
        int shown = 0;
        for (ClassData c : all) {
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                for (MethodData invoked : m.getInvokes()) {
                    if (!invoked.getName().equals("setText")) continue;
                    if (!invoked.getDeclaredClassName().contains("TextView")) continue;
                    if (!m.getUsingStrings().contains("create_time")) continue;
                    System.out.println("  " + c.getName() + "#" + m.getName()
                            + " -> " + invoked.getDeclaredClassName() + "#setText");
                    if (++shown > 20) return;
                }
            }
        }
        System.out.println("  (none found)");
    }
}
