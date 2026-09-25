import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * The component that renders the author line. Tells us whether the post time is written into a
 * view of its own (then the region can share its colour) or into the same view as the name.
 */
public class AuthorAssemProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            assem(bridge, "com.ss.android.ugc.aweme.feed.assem.videoauthorinfo.VideoAuthorInfoRelationAssem");
        }
    }

    private static void assem(DexKitBridge bridge, String className) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        for (ClassData c : classes) {
            System.out.println("\n### " + c.getName()
                    + "  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            System.out.println("  -- fields");
            c.getFields().forEach(f -> System.out.println("     " + f.getTypeName() + " " + f.getName()));
            System.out.println("  -- methods");
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                System.out.println("     " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            }
            System.out.println("  -- invokes that touch text or time");
            Set<String> seen = new LinkedHashSet<>();
            for (MethodData m : c.getMethods()) {
                for (MethodData invoked : m.getInvokes()) {
                    String name = invoked.getName();
                    String owner = invoked.getDeclaredClassName();
                    if (!name.contains("setText")
                            && !name.toLowerCase().contains("time")
                            && !name.toLowerCase().contains("format")) {
                        continue;
                    }
                    seen.add(owner + "#" + name);
                }
            }
            seen.forEach(s -> System.out.println("     " + s));
        }
    }
}
