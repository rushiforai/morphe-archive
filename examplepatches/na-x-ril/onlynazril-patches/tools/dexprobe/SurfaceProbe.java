import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * Candidate hook points for extending the handle stamp past the feed. Prints the signature of the
 * binders that render an author name, so each surface can be judged before it is wired.
 */
public class SurfaceProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            methods(bridge, "com.ss.android.ugc.now.interaction.assem.CommentCell");
            methods(bridge, "com.ss.android.ugc.now.interaction.assem.CommentListAssem");
            methods(bridge, "com.ss.android.ugc.profile.business.common.ProfilePageFragment", "nT");
            methods(bridge, "com.ss.android.ugc.aweme.comment.model.Comment", "getUser");
            methods(bridge, "com.ss.android.ugc.aweme.profile.model.UserResponse");
        }
    }

    private static void methods(DexKitBridge bridge, String className) {
        methods(bridge, className, null);
    }

    private static void methods(DexKitBridge bridge, String className, String only) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        System.out.println("\n### " + className + "  (matched " + classes.size() + ")");
        if (classes.isEmpty()) {
            System.out.println("    NOT FOUND");
            return;
        }
        for (ClassData c : classes) {
            System.out.println("  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (only != null && !m.getName().equals(only)) continue;
                System.out.println("    " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            }
        }
    }
}
