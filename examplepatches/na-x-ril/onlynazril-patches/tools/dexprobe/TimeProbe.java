import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Where the post time of a feed video is rendered.
 *
 * Item 2 (always show the post time) and item 3 (colour the region and its dot like the post
 * time) both depend on finding the view that shows it, and on whether that view is separate from
 * the one holding the author name.
 *
 *   tools/dexprobe/run.sh TimeProbe "<apk>"
 */
public class TimeProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            awemeTimeMembers(bridge);
            callersOfCreateTime(bridge);
            headerAssems(bridge);
        }
    }

    private static void awemeTimeMembers(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create()
                        .className("com.ss.android.ugc.aweme.feed.model.Aweme")));
        System.out.println("\n### Aweme members mentioning time");
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (!m.getName().toLowerCase().contains("time")) continue;
                System.out.println("    method " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName());
            }
        }
    }

    private static void callersOfCreateTime(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create()
                        .className("com.ss.android.ugc.aweme.feed.model.Aweme")));
        Map<String, List<String>> byPackage = new TreeMap<>();
        int total = 0;
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals("getCreateTime")) continue;
                System.out.println("\n### Aweme#getCreateTime " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  callers=" + m.getCallers().size());
                for (MethodData caller : m.getCallers()) {
                    total++;
                    String owner = caller.getDeclaredClassName();
                    byPackage.computeIfAbsent(packageOf(owner, 6), k -> new ArrayList<>())
                            .add(owner + "#" + caller.getName());
                }
            }
        }
        System.out.println("\n### call sites: " + total);
        byPackage.forEach((pkg, sites) -> {
            System.out.println(String.format("%5d  %s", sites.size(), pkg));
            for (String site : sites.subList(0, Math.min(4, sites.size()))) {
                System.out.println("          " + site);
            }
        });
    }

    /** Feed header components: the ones that own the author line and whatever sits beside it. */
    private static void headerAssems(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .searchPackages("com.ss.android.ugc.aweme.feed.assem")
                .matcher(ClassMatcher.create().usingStrings("create_time")));
        System.out.println("\n### feed assems mentioning create_time: " + classes.size());
        for (ClassData c : classes) {
            System.out.println("    " + c.getName());
        }
    }

    private static String packageOf(String className, int depth) {
        String[] parts = className.split("\\.");
        int take = Math.min(depth, Math.max(1, parts.length - 1));
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < take; i++) {
            if (i > 0) builder.append('.');
            builder.append(parts[i]);
        }
        return builder.toString();
    }
}
