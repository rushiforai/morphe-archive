import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.enums.StringMatchType;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

import java.util.List;

/**
 * Finds the wording TikTok itself uses for the post time, by locating the string constants behind
 * it. Needed because the extension has to invent the text only when TikTok leaves the view empty,
 * and it should read the way the header's own text does.
 *
 *   tools/dexprobe/run.sh TimeFormatProbe "<apk>"
 */
public class TimeFormatProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            for (String needle : new String[] {"ago", "mins ago", "hours ago", "days ago"}) {
                usingStrings(bridge, needle);
            }
            formatHelpers(bridge);
        }
    }

    private static void usingStrings(DexKitBridge bridge, String needle) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create()
                        .usingStrings(List.of(needle), StringMatchType.Contains)));
        System.out.println("\n### classes whose methods use a string containing \"" + needle
                + "\" : " + classes.size());
        for (ClassData c : classes) {
            System.out.println("  " + c.getName());
        }
    }

    /** Common time-formatting helpers, whose names survive obfuscation. */
    private static void formatHelpers(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create());
        System.out.println("\n### formatting helpers worth reading");
        int shown = 0;
        for (ClassData c : classes) {
            String name = c.getName();
            if (!(name.contains("TimeFormat") || name.contains("DateUtils")
                    || name.contains("TimeUtil") || name.contains("TimeUtils"))) {
                continue;
            }
            System.out.println("  " + name);
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                System.out.println("     " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName());
                if (++shown > 40) return;
            }
        }
    }
}
