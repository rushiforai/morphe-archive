import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.enums.StringMatchType;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

/**
 * Every class that holds the feed header component and writes text, i.e. the family the header's
 * text is filled from.
 *
 * The component's own text setter is the *name* one, so the post time is written by a sibling,
 * a lambda or observer holding the component. This lists them so the one that writes the time can
 * be named, instead of inferred from a screen.
 *
 *   tools/dexprobe/run.sh HeaderWritersProbe "<apk>" [assem-class]
 */
public class HeaderWritersProbe {
    static { System.loadLibrary("dexkit"); }

    public static void main(String[] args) {
        String assem = args.length > 1
                ? args[1]
                : "com.ss.android.ugc.aweme.feed.assem.videoauthorinfo.VideoAuthorInfoRelationAssem";
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            ClassDataList holders = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().addFieldForType(assem)));
            System.out.println("### classes holding " + assem + " : " + holders.size());
            for (ClassData c : holders) {
                StringBuilder out = new StringBuilder("\n  " + c.getName()
                        + "  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    for (MethodData invoked : m.getInvokes()) {
                        if (!"setText".equals(invoked.getName())) continue;
                        String owner = invoked.getDeclaredClassName();
                        if (!owner.contains("TextView")) continue;
                        out.append("\n      ").append(m.getName()).append(' ')
                                .append(m.getParamTypeNames()).append(" -> ")
                                .append(m.getReturnTypeName())
                                .append("   writes via ").append(owner).append("#setText");
                        break;
                    }
                }
                System.out.println(out);
            }
        }
    }
}
