import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.MethodData;

/**
 * The region feature reads app objects by name at runtime (reflection lives in the extension, so
 * the patch cannot check these for it). Prints the real member names the extension must use.
 */
public class FeedShapeProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            members(bridge, "com.ss.android.ugc.aweme.feed.model.VideoItemParams", "weme");
            members(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme", "author");
            members(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme", "region");
            members(bridge, "com.ss.android.ugc.aweme.profile.model.User", "uniqueId");
            members(bridge, "com.ss.android.ugc.aweme.profile.model.User", "nickname");
            members(bridge, "com.ss.android.ugc.aweme.profile.model.User", "region");
        }
    }

    private static void members(DexKitBridge bridge, String className, String needle) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        System.out.println("\n### " + className + "  (matched " + classes.size() + ")  filter='" + needle + "'");
        for (ClassData c : classes) {
            System.out.println("  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            for (FieldData f : c.getFields()) {
                if (!f.getName().toLowerCase().contains(needle.toLowerCase())) continue;
                System.out.println("    field " + f.getTypeName() + " " + f.getName());
            }
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (!m.getName().toLowerCase().contains(needle.toLowerCase())) continue;
                System.out.println("    method " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName());
            }
        }
    }
}
