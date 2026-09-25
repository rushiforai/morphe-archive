import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.MethodData;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Maps the surfaces that render an author's name: every caller of {@code User.getNickname()},
 * grouped by package. That grouping is the list of places the handle stamp can be extended to.
 *
 *   tools/dexprobe/run.sh CallersProbe "<apk>" [package-depth]
 */
public class CallersProbe {
    static {
        System.loadLibrary("dexkit");
    }

    public static void main(String[] args) {
        int depth = args.length > 1 ? Integer.parseInt(args[1]) : 5;
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            ClassDataList users = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create()
                            .className("com.ss.android.ugc.aweme.profile.model.User")));
            if (users.isEmpty()) {
                System.out.println("User model not found");
                return;
            }
            Map<String, List<String>> byPackage = new TreeMap<>();
            int total = 0;
            for (ClassData user : users) {
                for (MethodData m : user.getMethods()) {
                    if (!m.getName().equals("getNickname")) continue;
                    for (MethodData caller : m.getCallers()) {
                        total++;
                        byPackage
                                .computeIfAbsent(packageOf(caller.getDeclaredClassName(), depth), k -> new ArrayList<>())
                                .add(caller.getDeclaredClassName() + "#" + caller.getName());
                    }
                }
            }

            System.out.println("\n### callers of User#getNickname : " + total + " call site(s)\n");
            Map<String, Integer> counts = new LinkedHashMap<>();
            byPackage.forEach((pkg, sites) -> counts.put(pkg, sites.size()));
            counts.entrySet().stream()
                    .sorted((a, b) -> b.getValue() - a.getValue())
                    .forEach(entry -> {
                        System.out.println(String.format("%5d  %s", entry.getValue(), entry.getKey()));
                        for (String site : byPackage.get(entry.getKey()).subList(
                                0, Math.min(3, byPackage.get(entry.getKey()).size()))) {
                            System.out.println("           " + site);
                        }
                    });
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
