import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.FindField;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.query.matchers.FieldMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.FieldDataList;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

/**
 * Checks every anchor the patches depend on against one APK, so a new TikTok version can be
 * triaged in seconds instead of by patching and installing.
 *
 *   tools/dexprobe/run.sh VerifyAnchors "<apk>"
 *
 * Exit code is non-zero when any anchor is missing, so it can gate a release.
 */
public class VerifyAnchors {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String OPEN_DEBUG_CELL_VM =
            "com.ss.android.ugc.aweme.setting.ui.rvmpcompose.group.support.cells.OpenDebugCellVM";
    private static final String SUPPORT_GROUP_VM =
            "com.ss.android.ugc.aweme.setting.ui.rvmpcompose.group.support.SupportGroupVM";
    private static final String SETTINGS_COMPOSE_FRAGMENT =
            "com.ss.android.ugc.aweme.setting.ui.rvmpcompose.SettingsComposeRvmpFragment";
    private static final String AD_PERSONALIZATION =
            "com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity";
    private static final String ASSEM =
            "com.ss.android.ugc.aweme.feed.assem.videoauthorinfo.VideoAuthorInfoRelationAssem";
    private static final String COMMENT_CELL_V2 =
            "com.ss.android.ugc.aweme.commentv2.commentlist.powercell.BaseCommentCell";

    private static int failures;

    /** The apps this probe knows: one per entry in `shared/Constants.kt`. */
    private static final String TIKTOK = "tiktok";

    public static void main(String[] args) {
        String app = args.length > 1 ? args[1] : TIKTOK;
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            System.out.println("anchors for " + app + " against " + args[0]);
            switch (app) {
                case TIKTOK -> tiktok(bridge);
                default -> {
                    System.out.println("  unknown app \"" + app + "\" (known: " + TIKTOK + ")");
                    System.exit(2);
                }
            }

            System.out.println();
            if (failures == 0) {
                System.out.println("ALL ANCHORS OK");
                return;
            }
            System.out.println(failures + " ANCHOR(S) MISSING — check docs/anchor-stability.md");
            System.exit(1);
        }
    }

    /**
     * Every anchor the TikTok patches depend on, kept in step with `docs/anchor-stability.md`.
     * A second app gets its own method here, and the summary in `main` covers all of them.
     */
    private static void tiktok(DexKitBridge bridge) {

            requireMethod(bridge, "com.ss.android.ugc.aweme.profile.model.User",
                    "getNickname", "java.lang.String", 0);
            requireMethod(bridge, "com.ss.android.ugc.aweme.profile.model.User",
                    "getUniqueId", "java.lang.String", 0);
            requireMethod(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme",
                    "getRegion", "java.lang.String", 0);
            requireMethod(bridge, "com.ss.android.ugc.aweme.feed.assem.base.FeedBaseViewModel",
                    "paramSync2StateAccept", null, 2);

            // Read by name from the extension at runtime, so the patch cannot check them itself.
            requireMethod(bridge, "com.ss.android.ugc.aweme.feed.model.VideoItemParams",
                    "getAweme", "com.ss.android.ugc.aweme.feed.model.Aweme", 0);
            requireMethod(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme",
                    "getAuthor", "com.ss.android.ugc.aweme.profile.model.User", 0);
            requireMethod(bridge, "com.ss.android.ugc.aweme.profile.model.User",
                    "getRegion", "java.lang.String", 0);
            requireField(bridge, "com.ss.android.ugc.aweme.feed.model.VideoItemParams", "mAweme");
            requireField(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme", "author");
            requireField(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme", "region");
            requireField(bridge, "com.ss.android.ugc.aweme.profile.model.User", "uniqueId");
            requireField(bridge, "com.ss.android.ugc.aweme.profile.model.User", "nickname");

            // Surfaces past the feed are recognised from the class on the stack while a name is
            // rendered, so the class has to exist by exactly this name.
            requireClass(bridge, "com.ss.android.ugc.now.interaction.assem.CommentCell");

            // Earliest reliable Context for the extension: the process's Application.
            requireMethod(bridge, "com.ss.android.ugc.aweme.app.host.AwemeHostApplication",
                    "onCreate", "void", 0);

            // Post time source and the header component the time view is taken from.
            requireMethod(bridge, "com.ss.android.ugc.aweme.feed.model.Aweme",
                    "getCreateTime", "long", 0);
            requireMethod(bridge, ASSEM, "onViewCreated", "void", 1);
            requireItemRenderer(bridge, ASSEM);

            // The comment list's time write, which the region is moved onto.
            requireCommentV2TimeWrite(bridge);

            // Settings carrier: the OpenDebug cell and the group that renders it
            requireMethod(bridge, OPEN_DEBUG_CELL_VM, "defaultState", null, 0);
            requireMethod(bridge, SUPPORT_GROUP_VM, "defaultState", null, 0);
            requireSettingsRowsMethod(bridge);
            requireSingletonPair(bridge);

            // Host activity
            requireMethod(bridge, AD_PERSONALIZATION, "onCreate", "void", 1);
            requireMethod(bridge, AD_PERSONALIZATION, "onBackPressed", "void", 0);

    }

    private static void requireMethod(
            DexKitBridge bridge, String className, String methodName, String returnType, int paramCount) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        if (classes.size() != 1) {
            fail(className + " (matched " + classes.size() + " classes)");
            return;
        }
        MethodDataList methods = classes.get(0).getMethods();
        for (MethodData m : methods) {
            if (methodName != null && !m.getName().equals(methodName)) continue;
            if (returnType != null && !returnType.equals(m.getReturnTypeName())) continue;
            if (paramCount >= 0 && m.getParamTypeNames().size() != paramCount) continue;
            pass(className + "#" + m.getName() + " " + m.getParamTypeNames());
            return;
        }
        fail(className + (methodName == null ? "" : "#" + methodName)
                + " return=" + returnType + " params=" + paramCount);
    }

    /**
     * The two singletons the Settings patch reads out of the same class: SECTION_HEADER is the
     * position anchor, OPEN_DEBUG is the row we repurpose. They must still live together.
     */
    private static void requireSingletonPair(DexKitBridge bridge) {
        FieldDataList openDebug = bridge.findField(FindField.create()
                .matcher(FieldMatcher.create().name("OPEN_DEBUG")));
        FieldDataList sectionHeader = bridge.findField(FindField.create()
                .matcher(FieldMatcher.create().name("SECTION_HEADER")));
        if (openDebug.size() != 1) {
            fail("OPEN_DEBUG singleton (matched " + openDebug.size() + " fields)");
            return;
        }
        String carrier = openDebug.get(0).getDeclaredClassName();
        for (FieldData f : sectionHeader) {
            if (f.getDeclaredClassName().equals(carrier)) {
                pass("singleton pair " + carrier + " {SECTION_HEADER, OPEN_DEBUG}");
                return;
            }
        }
        fail("SECTION_HEADER on " + carrier + " (only found on "
                + sectionHeader.size() + " other class(es))");
    }

    /**
     * The header's per-item renderer, matched exactly as the fingerprint does: the `(Aweme) -> V`
     * method that calls another `(Aweme) -> V` method on itself. It must be unique, or the patch
     * would have to pick between candidates.
     */
    private static void requireItemRenderer(DexKitBridge bridge, String className) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        if (classes.size() != 1) {
            fail(className + " (matched " + classes.size() + " classes)");
            return;
        }
        int matches = 0;
        String found = null;
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"void".equals(m.getReturnTypeName())) continue;
            if (m.getParamTypeNames().size() != 1) continue;
            if (!"com.ss.android.ugc.aweme.feed.model.Aweme".equals(m.getParamTypeNames().get(0))) continue;
            for (MethodData invoked : m.getInvokes()) {
                if (!className.equals(invoked.getDeclaredClassName())) continue;
                if (!"void".equals(invoked.getReturnTypeName())) continue;
                if (!invoked.getParamTypeNames().equals(m.getParamTypeNames())) continue;
                matches++;
                found = m.getName();
                break;
            }
        }
        if (matches == 1) {
            pass(className + "#" + found + " (item renderer)");
        } else {
            fail(className + " item renderer (matched " + matches + " methods)");
        }
    }

    /**
     * The comment list's time write, which the region is moved onto: the method on the list's cell
     * that reads the comment's create time and writes text.
     *
     * Its name is obfuscated and it writes in two branches, so the pair of calls is the anchor, and
     * it has to be one method of the class — a build that splits it, or adds a second, is seen here
     * rather than on a device.
     */
    private static void requireCommentV2TimeWrite(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(COMMENT_CELL_V2)));
        if (classes.size() != 1) {
            fail(COMMENT_CELL_V2 + " (matched " + classes.size() + " classes)");
            return;
        }
        int candidates = 0;
        String found = null;
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"void".equals(m.getReturnTypeName())) continue;
            boolean readsTime = false;
            boolean writesText = false;
            for (MethodData invoked : m.getInvokes()) {
                if ("com.ss.android.ugc.aweme.comment.model.Comment"
                        .equals(invoked.getDeclaredClassName())
                        && "getCreateTime".equals(invoked.getName())) {
                    readsTime = true;
                }
                if ("android.widget.TextView".equals(invoked.getDeclaredClassName())
                        && "setText".equals(invoked.getName())) {
                    writesText = true;
                }
            }
            if (readsTime && writesText) {
                candidates++;
                found = m.getName();
            }
        }
        if (candidates == 1) {
            pass(COMMENT_CELL_V2 + "#" + found + " (comment list time write)");
        } else {
            fail(COMMENT_CELL_V2 + " time write (matched " + candidates + " methods)");
        }
    }

    private static void requireClass(DexKitBridge bridge, String className) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        if (classes.size() == 1) {
            pass("class " + className);
        } else {
            fail(className + " (matched " + classes.size() + " classes)");
        }
    }

    /** Reflect reads fields when a getter is missing, so the names have to exist too. */
    private static void requireField(DexKitBridge bridge, String className, String fieldName) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        if (classes.size() != 1) {
            fail(className + " (matched " + classes.size() + " classes)");
            return;
        }
        for (FieldData f : classes.get(0).getFields()) {
            if (!f.getName().equals(fieldName)) continue;
            pass(className + "." + fieldName + " : " + f.getTypeName());
            return;
        }
        fail(className + "#" + fieldName + " field");
    }

    /**
     * The rows-sort anchor is structural: a void method on SettingsComposeRvmpFragment that calls
     * a static {@code (Comparator, Iterable) -> List} helper. Its name is obfuscated, so the
     * invoked signature is the anchor — exactly what the patch matches on.
     */
    private static void requireSettingsRowsMethod(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(SETTINGS_COMPOSE_FRAGMENT)));
        if (classes.size() != 1) {
            fail(SETTINGS_COMPOSE_FRAGMENT + " (matched " + classes.size() + " classes)");
            return;
        }
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"void".equals(m.getReturnTypeName())) continue;
            for (MethodData invoked : m.getInvokes()) {
                if (!"java.util.List".equals(invoked.getReturnTypeName())) continue;
                if (invoked.getParamTypeNames().size() != 2) continue;
                if (!invoked.getParamTypeNames().get(0).equals("java.util.Comparator")) continue;
                if (!invoked.getParamTypeNames().get(1).equals("java.lang.Iterable")) continue;
                pass(SETTINGS_COMPOSE_FRAGMENT + "#" + m.getName() + " sorts via "
                        + invoked.getName() + "(Comparator, Iterable)");
                return;
            }
        }
        fail(SETTINGS_COMPOSE_FRAGMENT + " rows-sort method (no void method calling the sort helper)");
    }

    private static void pass(String what) {
        System.out.println("  PASS  " + what);
    }

    private static void fail(String what) {
        failures++;
        System.out.println("  FAIL  " + what);
    }
}
