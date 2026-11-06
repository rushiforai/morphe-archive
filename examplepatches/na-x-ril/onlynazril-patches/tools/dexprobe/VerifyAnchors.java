/**
 * Checks every anchor the patches depend on against one APK, so a new TikTok version can be
 * triaged in seconds instead of by patching and installing.
 *
 *   tools/dexprobe/run.sh VerifyAnchors "<apk>" [app]
 *
 * Exit code is non-zero when any anchor is missing, so it can gate a release.
 */
import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.FindField;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.query.matchers.FieldMatcher;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.FieldDataList;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;
import org.luckypray.dexkit.result.UsingFieldData;

import java.util.List;

public class VerifyAnchors {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String AD_PERSONALIZATION =
            "com.bytedance.ies.ugc.aweme.commercialize.compliance.personalization.AdPersonalizationActivity";
    private static final String ASSEM =
            "com.ss.android.ugc.aweme.feed.assem.videoauthorinfo.VideoAuthorInfoRelationAssem";
    private static final String COMMENT_CELL_V2 =
            "com.ss.android.ugc.aweme.commentv2.commentlist.powercell.BaseCommentCell";
    private static final String FEED_API = "com.ss.android.ugc.aweme.feed.cache.IFeedApi";
    private static final String FEED_ITEM_LIST =
            "com.ss.android.ugc.aweme.feed.model.FeedItemList";
    private static final String AWEME = "com.ss.android.ugc.aweme.feed.model.Aweme";
    private static final String AWEME_STATISTICS =
            "com.ss.android.ugc.aweme.feed.model.AwemeStatistics";
    private static final String DOWNLOAD_ACL =
            "com.ss.android.ugc.aweme.feed.model.ACLCommonShare";
    private static final String COMMENT_MODEL =
            "com.ss.android.ugc.aweme.comment.model.Comment";
    private static final String CLIP_DATA = "android.content.ClipData";
    private static final String SEC_API_IMPL = "com.ss.android.ugc.aweme.sec.SecApiImpl";
    private static final String LIVE_HOST_USER =
            "com.ss.android.ugc.aweme.live.livehostimpl.LiveHostUser";

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

            // Feed filter: the one implementation of IFeedApi#fetchFeedList, hooked at its return.
            requireFeedFetch(bridge);
            // …and the setter, the only other way a page's list is replaced.
            requireItemsSetter(bridge);
            requireMethod(bridge, FEED_ITEM_LIST, "clone", FEED_ITEM_LIST, 0);
            // What the filter reads off an item, by name at runtime.
            requireMethod(bridge, AWEME, "isAd", "boolean", 0);
            requireMethod(bridge, AWEME, "isSoftAd", "boolean", 0);
            requireMethod(bridge, AWEME, "isWithPromotionalMusic", "boolean", 0);
            requireMethod(bridge, AWEME, "getAwemeRawAd",
                    "com.ss.android.ugc.aweme.feed.model.AwemeRawAd", 0);
            requireMethod(bridge, AWEME, "getStatistics", AWEME_STATISTICS, 0);
            requireMethod(bridge, AWEME_STATISTICS, "getPlayCount", "long", 0);
            requireMethod(bridge, AWEME_STATISTICS, "getDiggCount", "long", 0);

            // Host activity
            requireMethod(bridge, AD_PERSONALIZATION, "onCreate", "void", 1);
            requireMethod(bridge, AD_PERSONALIZATION, "onBackPressed", "void", 0);

            // Download: the photo-download handler's three shapes, and the watermarked address.
            requireDownload(bridge);

            // Profile background: the obfuscated AB gate, matched by the
            // shape the patch discovers it by.
            requireProfileBgGate(bridge);

            // Custom font: the factory every face flows through, matched
            // by the shape the patch discovers it by.
            requireCustomFontFactory(bridge);

            // Custom font: the loader Jetpack Compose asks instead of the
            // factory, matched by the shape the patch discovers it by.
            requireComposeFontLoader(bridge);

            // Custom font: the asset loader Lynx reads a bundled face
            // through, and the WebView interceptor hybrid pages are served
            // font bytes through, matched by the shapes the patch uses.
            requireAssetFontLoader(bridge);
            requireWebFontInterceptor(bridge);

            // Custom font: the activity result the picker's file
            // arrives through, matched by the name and signature
            // the patch hooks it by.
            requireBaseActivityOnActivityResult(bridge);

            // Comment copy: the builder the sheet's Copy flows
            // through, the plain helper every other route calls, and
            // a menu that hands the helper a comment's own text.
            requireCommentCopy(bridge);

            // Captcha: the real-named entry points that ask TikTok
            // to show a risk-control puzzle, each guarded at its top.
            requireCaptcha(bridge);

    }

    /**
     * The download patch's anchors: the three ACL getters the app decides download and watermark
     * with, and the video's own download address, which is the one redirected.
     */
    private static void requireDownload(DexKitBridge bridge) {
        requireMethod(bridge, DOWNLOAD_ACL, "getCode", "int", 0);
        requireMethod(bridge, DOWNLOAD_ACL, "getShowType", "int", 0);
        requireMethod(bridge, DOWNLOAD_ACL, "getTranscode", "int", 0);
        requireMethod(bridge, "com.ss.android.ugc.aweme.feed.model.Video",
                "getDownloadAddr", "com.ss.android.ugc.aweme.base.model.UrlModel", 0);
    }

    /**
     * The profile-background gate, matched as the patch discovers it: the one
     * class that reads the AB keys and carries a (boolean) -> boolean method
     * next to a (boolean) -> void setter. The class is obfuscated and renames
     * every build (`X.0iZu` on 46.2.3, `X.0kzw` on 47.0.3, `X.0OSK` on
     * 47.1.4), so the shape is the anchor, not the name.
     */
    private static void requireProfileBgGate(DexKitBridge bridge) {
        java.util.Set<String> candidates = new java.util.LinkedHashSet<>();
        for (String key : new String[]{"profile_bg_in_allow_list",
                "profile_bg_enable_consumption_group"}) {
            MethodDataList methods = bridge.findMethod(FindMethod.create()
                    .matcher(MethodMatcher.create().usingStrings(key)));
            for (MethodData m : methods) {
                candidates.add(m.getDeclaredClassName());
            }
        }
        int matches = 0;
        String found = null;
        int snapshots = 0;
        for (String className : candidates) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(className)));
            for (ClassData c : classes) {
                boolean gate = false;
                boolean setter = false;
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    if ("boolean".equals(m.getReturnTypeName())
                            && m.getParamTypeNames().equals(java.util.List.of("boolean"))) {
                        gate = true;
                    }
                    if ("void".equals(m.getReturnTypeName())
                            && m.getParamTypeNames().equals(java.util.List.of("boolean"))) {
                        setter = true;
                    }
                }
                if (gate && setter) {
                    matches++;
                    found = c.getName();
                    // The allow-list snapshot the patch also hooks: the one no-arg method
                    // returning a non-primitive. Without it the self-profile request keeps
                    // sending the server's own value and the background never arrives on
                    // the user's own page, so the shape is checked with the gate.
                    for (MethodData m : c.getMethods()) {
                        if (m.getName().startsWith("<")) continue;
                        if (!m.getParamTypeNames().isEmpty()) continue;
                        String returns = m.getReturnTypeName();
                        if ("void".equals(returns) || "boolean".equals(returns)
                                || "int".equals(returns) || "long".equals(returns)
                                || "double".equals(returns) || "float".equals(returns)) {
                            continue;
                        }
                        snapshots++;
                    }
                }
            }
        }
        if (matches != 1) {
            fail("profile background gate (matched " + matches + " classes)");
        } else if (snapshots != 1) {
            fail("profile background snapshot in " + found
                    + " (found " + snapshots + " no-arg holders)");
        } else {
            pass("profile background gate " + found);
            pass("profile background snapshot (1 no-arg holder)");
        }
    }

    /**
     * The custom-font factory, matched as the patch discovers it: the one
     * class that reads a bundled TikTok font file and carries a static
     * (F,I,F,F,Float,F,I,Map,I) -> Typeface method. The class is obfuscated
     * and renames every build (`X.05oe` on 46.5.3, `X.0lNd` on 47.0.3,
     * `X.05o5` on 47.1.4), so the shape is the anchor, not the name.
     */
    private static void requireCustomFontFactory(DexKitBridge bridge) {
        java.util.Set<String> candidates = new java.util.LinkedHashSet<>();
        for (String font : new String[]{"font/TikTok-Display-Regular.otf",
                "font/TikTok-Text-Regular.otf"}) {
            MethodDataList methods = bridge.findMethod(FindMethod.create()
                    .matcher(MethodMatcher.create().usingStrings(font)));
            for (MethodData m : methods) {
                candidates.add(m.getDeclaredClassName());
            }
        }
        int matches = 0;
        String found = null;
        for (String className : candidates) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(className)));
            for (ClassData c : classes) {
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    if (!"android.graphics.Typeface".equals(m.getReturnTypeName())) continue;
                    if (!java.util.List.of("float", "int", "float", "float",
                            "java.lang.Float", "float", "int", "java.util.Map", "int")
                            .equals(m.getParamTypeNames())) continue;
                    matches++;
                    found = c.getName() + "#" + m.getName() + " " + m.getParamTypeNames();
                }
            }
        }
        if (matches == 1) {
            pass("custom font factory " + found);
        } else {
            fail("custom font factory: expected one, matched " + matches);
        }
    }

    /**
     * The Compose loader, matched as the patch discovers it: the class that
     * reads a bundled TikTok font file and carries an instance
     * (Context, request) -> Typeface method. Jetpack Compose reaches the
     * faces here (AndroidComposeView builds its own FontFamily resolver),
     * not at the native factory, so this second shape is what keeps the
     * Settings and privacy screen on the imported font. The class is
     * obfuscated and renames every build (`X.0lNf` on 47.0.3, `X.05vZ` on
     * 47.1.4), so the shape is the anchor, not the name.
     */
    private static void requireComposeFontLoader(DexKitBridge bridge) {
        java.util.Set<String> candidates = new java.util.LinkedHashSet<>();
        for (String font : new String[]{"font/TikTok-Display-Regular.otf",
                "font/TikTok-Text-Regular.otf"}) {
            MethodDataList methods = bridge.findMethod(FindMethod.create()
                    .matcher(MethodMatcher.create().usingStrings(font)));
            for (MethodData m : methods) {
                candidates.add(m.getDeclaredClassName());
            }
        }
        int matches = 0;
        String found = null;
        for (String className : candidates) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(className)));
            for (ClassData c : classes) {
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    if (!"android.graphics.Typeface".equals(m.getReturnTypeName())) continue;
                    java.util.List<String> params = m.getParamTypeNames();
                    if (params.size() != 2) continue;
                    if (!"android.content.Context".equals(params.get(0))) continue;
                    matches++;
                    found = c.getName() + "#" + m.getName() + " " + params;
                }
            }
        }
        if (matches == 1) {
            pass("custom font compose loader " + found);
        } else {
            fail("custom font compose loader: expected one, matched " + matches);
        }
    }

    /**
     * The app's asset loader, matched as the patch discovers it: the one
     * (AssetManager, String) -> Typeface method, whose body creates the face from
     * the asset. The class and method rename every build (`X.0VKh#t4` on 47.0.3,
     * `X.00kn#s4` on 47.1.4), and Lynx's own TypefaceCache reads the bundled
     * faces through it, so this is the point that carries the font to Lynx pages.
     */
    private static void requireAssetFontLoader(DexKitBridge bridge) {
        MethodDataList methods = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create()
                        .paramTypes("android.content.res.AssetManager", "java.lang.String")));
        int matches = 0;
        String found = null;
        for (MethodData m : methods) {
            if (!"android.graphics.Typeface".equals(m.getReturnTypeName())) continue;
            matches++;
            found = m.getDeclaredClassName() + "#" + m.getName();
        }
        if (matches == 1) {
            pass("custom font asset loader " + found);
        } else {
            fail("custom font asset loader: expected one, matched " + matches);
        }
    }

    /**
     * The WebView font interceptor, matched as the patch discovers it: a class
     * that reads a bundled face and answers a WebView with a
     * WebResourceResponse. Hybrid (H5) pages - Activity Center, Manage posts -
     * are fed their font bytes here, so this is the point that carries the font
     * to them. The class keeps its name across builds
     * (`FontLoadManager$init$1#shouldInterceptRequest`), and both overloads sit
     * on it: the deprecated `(WebView, String)` and the current
     * `(WebView, WebResourceRequest)`.
     */
    private static void requireWebFontInterceptor(DexKitBridge bridge) {
        MethodDataList fonts = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create().usingStrings("font/TikTokSans-VF.otf")));
        java.util.Set<String> candidates = new java.util.LinkedHashSet<>();
        for (MethodData m : fonts) {
            candidates.add(m.getDeclaredClassName());
        }
        int matches = 0;
        String found = null;
        for (String className : candidates) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(className)));
            for (ClassData c : classes) {
                int hooks = 0;
                for (MethodData m : c.getMethods()) {
                    if (!"android.webkit.WebResourceResponse".equals(m.getReturnTypeName())) continue;
                    java.util.List<String> params = m.getParamTypeNames();
                    if (params.size() != 2) continue;
                    if (!"android.webkit.WebView".equals(params.get(0))) continue;
                    hooks++;
                }
                if (hooks > 0) {
                    matches++;
                    found = c.getName() + " (" + hooks + " method(s))";
                }
            }
        }
        if (matches == 1) {
            pass("custom font webview interceptor " + found);
        } else {
            fail("custom font webview interceptor: expected one class, matched " + matches);
        }
    }

    /**
     * The custom-font picker's answer: the foundation activity's own
     * onActivityResult, which the activities the Tweaks screen lives in
     * inherit. The class is a ByteDance foundation class, which keeps its
     * name across builds, and the signature is the framework's own.
     */
    private static void requireBaseActivityOnActivityResult(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create()
                        .className("com.bytedance.ies.foundation.activity.BaseActivity")));
        if (classes.size() != 1) {
            fail("custom font activity result: BaseActivity (matched "
                    + classes.size() + " classes)");
            return;
        }
        int matches = 0;
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"onActivityResult".equals(m.getName())) continue;
            if (!"void".equals(m.getReturnTypeName())) continue;
            if (!java.util.List.of("int", "int", "android.content.Intent")
                    .equals(m.getParamTypeNames())) continue;
            matches++;
        }
        if (matches == 1) {
            pass("custom font activity result BaseActivity#onActivityResult");
        } else {
            fail("custom font activity result: expected one, matched " + matches);
        }
    }

    /**
     * The copy-comment anchors, matched exactly as the patch's fingerprints are: the one static
     * builder the comment sheet's Copy flows through (`(String, String, List) -> ClipData`,
     * `"copy_label"`, built with `ClipData.newPlainText`), the one plain clipboard helper every
     * other route calls (`void (String, String, Context, Cert)`), and at least one menu that hands
     * that helper a comment's own text (it reads `Comment#getText` and `Comment#getUser`).
     */
    private static void requireCommentCopy(DexKitBridge bridge) {
        MethodDataList builders = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create()
                        .usingStrings("copy_label")
                        .returnType(CLIP_DATA)
                        .paramTypes("java.lang.String", "java.lang.String", "java.util.List")));
        java.util.Set<String> builderMatches = new java.util.LinkedHashSet<>();
        for (MethodData m : builders) {
            if ((m.getModifiers() & 0x8) == 0) continue;
            if (!invokesNewPlainText(m)) continue;
            builderMatches.add(m.getDeclaredClassName() + "#" + m.getName());
        }
        if (builderMatches.size() == 1) {
            pass("comment copy builder " + builderMatches.iterator().next());
        } else {
            fail("comment copy builder: expected one, matched " + builderMatches.size());
        }

        MethodDataList helpers = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create()
                        .returnType("void")
                        .paramTypes("java.lang.String", "java.lang.String", "android.content.Context",
                                "com.bytedance.bpea.basics.Cert")));
        java.util.Set<MethodData> plainHelpers = new java.util.LinkedHashSet<>();
        for (MethodData m : helpers) {
            if (invokesNewPlainText(m)) plainHelpers.add(m);
        }
        if (plainHelpers.size() != 1) {
            fail("comment copy plain helper: expected one, matched " + plainHelpers.size());
            return;
        }
        pass("comment copy plain helper "
                + plainHelpers.iterator().next().getDeclaredClassName() + "#"
                + plainHelpers.iterator().next().getName());

        int menus = 0;
        String found = null;
        for (MethodData helper : plainHelpers) {
            for (MethodData caller : helper.getCallers()) {
                boolean text = false;
                boolean user = false;
                for (MethodData invoked : caller.getInvokes()) {
                    if (!COMMENT_MODEL.equals(invoked.getDeclaredClassName())) continue;
                    if ("getText".equals(invoked.getName())) text = true;
                    if ("getUser".equals(invoked.getName())) user = true;
                }
                if (text && user) {
                    menus++;
                    if (found == null) found = caller.getDeclaredClassName() + "#" + caller.getName();
                }
            }
        }
        if (menus >= 1) {
            pass("comment copy menu(s) through the helper: " + menus + ", first " + found);
        } else {
            fail("comment copy menu: no caller of the helper reads Comment#getText + getUser");
        }
    }

    /** Whether this method builds its answer with `ClipData.newPlainText`. */
    private static boolean invokesNewPlainText(MethodData m) {
        for (MethodData invoked : m.getInvokes()) {
            if (invoked.getDeclaredClassName().equals(CLIP_DATA)
                    && invoked.getName().equals("newPlainText")) {
                return true;
            }
        }
        return false;
    }

    /**
     * The captcha patch's entry points. All three are real-named ByteDance methods whose names have
     * not moved; the patch reads the callback type off each match and checks the class declares the
     * dismiss method before it assembles anything. The Turing dialog is the fourth, a second
     * surface the sec entry points do not carry.
     */
    private static void requireCaptcha(DexKitBridge bridge) {
        requireMethod(bridge, SEC_API_IMPL, "popCaptchaV2", "void", 5);
        requireMethod(bridge, SEC_API_IMPL, "popCaptcha", "void", 3);
        requireMethod(bridge, LIVE_HOST_USER, "popCaptchaV2", "void", 4);
        requireBdTuringDialog(bridge);
    }

    /**
     * The Turing (oecverify) dialog, matched as the patch discovers it: the real-named BdTuring
     * class and its two showVerifyDialog shapes, each taking an Activity first and the real-named
     * callback last. A captcha that appears while the sec entry points stay silent comes from here.
     */
    private static void requireBdTuringDialog(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className("com.tts.oecverify.BdTuring")));
        if (classes.size() != 1) {
            fail("captcha turing dialog: BdTuring (matched " + classes.size() + " classes)");
            return;
        }
        int matches = 0;
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"showVerifyDialog".equals(m.getName())) continue;
            if (!"void".equals(m.getReturnTypeName())) continue;
            java.util.List<String> params = m.getParamTypeNames();
            if (params.size() != 3) continue;
            if (!"android.app.Activity".equals(params.get(0))) continue;
            if (!"com.tts.oecverify.BdTuringCallback".equals(params.get(2))) continue;
            matches++;
        }
        if (matches == 2) {
            pass("captcha turing dialog BdTuring#showVerifyDialog (2 shapes)");
        } else {
            fail("captcha turing dialog: expected two shapes, matched " + matches);
        }
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

    /**
     * The feed page fetch, matched exactly as the patch's fingerprint does: the one class that
     * implements {@code IFeedApi} and has a single-parameter method returning the page with a body.
     * It has to be unique — a second implementation is a build the patch cannot choose between, and
     * the patch refuses rather than filtering one of them.
     */
    private static void requireFeedFetch(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().addInterface(FEED_API)));
        int matches = 0;
        String found = null;
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (!FEED_ITEM_LIST.equals(m.getReturnTypeName())) continue;
                if (m.getParamTypeNames().size() != 1) continue;
                if (m.getOpCodes().isEmpty()) continue;
                matches++;
                found = c.getName() + "#" + m.getName() + " " + m.getParamTypeNames();
            }
        }
        if (matches == 1) {
            pass("feed filter fetch " + found);
        } else {
            fail("feed filter fetch: expected one IFeedApi return, matched " + matches);
        }
    }

    /**
     * The page's item setter, matched as the patch's second fingerprint does: a void method on the
     * page taking a List that writes the `items` field. The write is the anchor, not the name — the
     * name only says which of the page's methods to look at.
     */
    private static void requireItemsSetter(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(FEED_ITEM_LIST)));
        if (classes.size() != 1) {
            fail(FEED_ITEM_LIST + " (matched " + classes.size() + " classes)");
            return;
        }
        for (MethodData m : classes.get(0).getMethods()) {
            if (!"setItems".equals(m.getName())) continue;
            if (!"void".equals(m.getReturnTypeName())) continue;
            if (!m.getParamTypeNames().equals(java.util.List.of("java.util.List"))) continue;
            for (UsingFieldData used : m.getUsingFields()) {
                if (used.getField().getDeclaredClassName().equals(FEED_ITEM_LIST)
                        && used.getField().getName().equals("items")) {
                    pass(FEED_ITEM_LIST + "#" + m.getName() + " " + m.getParamTypeNames());
                    return;
                }
            }
        }
        fail(FEED_ITEM_LIST + "#setItems (no void (List) method writing `items`)");
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

    private static void pass(String what) {
        System.out.println("  PASS  " + what);
    }

    private static void fail(String what) {
        failures++;
        System.out.println("  FAIL  " + what);
    }
}
