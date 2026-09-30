import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.FindField;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.enums.StringMatchType;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.query.matchers.FieldMatcher;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.ClassDataList;
import org.luckypray.dexkit.result.FieldData;
import org.luckypray.dexkit.result.FieldDataList;
import org.luckypray.dexkit.result.MethodData;
import org.luckypray.dexkit.result.MethodDataList;

import java.util.Locale;

/**
 * The feed-filter anchors on one APK: where the feed page payload is built, how the page list is
 * held, and whether the item predicates the ReVanced feed filter reads are still real-named.
 *
 * The ReVanced patch hooks the return of a `FeedApiService#fetchFeedList`-shaped method and the
 * follow-feed builder. Neither is guaranteed on a newer build, so this prints every producer of the
 * two payload types instead of assuming the names.
 *
 *   tools/dexprobe/run.sh FeedApiProbe "<apk>"
 */
public class FeedApiProbe {
    static {
        System.loadLibrary("dexkit");
    }

    private static final String FEED_ITEM_LIST = "com.ss.android.ugc.aweme.feed.model.FeedItemList";
    private static final String FOLLOW_FEED_LIST =
            "com.ss.android.ugc.aweme.follow.presenter.FollowFeedList";
    private static final String FOLLOW_FEED = "com.ss.android.ugc.aweme.follow.presenter.FollowFeed";
    private static final String AWEME = "com.ss.android.ugc.aweme.feed.model.Aweme";
    private static final String AWEME_STATISTICS = "com.ss.android.ugc.aweme.feed.model.AwemeStatistics";

    /** ReVanced's feed-filter predicates, read off the item through the extension. */
    private static final String[][] AWEME_PREDICATES = {
            {"isAd", "boolean"},
            {"isWithPromotionalMusic", "boolean"},
            {"isLive", "boolean"},
            {"isLiveReplay", "boolean"},
            {"getIsTikTokStory", "boolean"},
            {"isImage", "boolean"},
            {"isPhotoMode", "boolean"},
            {"getStatistics", AWEME_STATISTICS},
            {"getShareUrl", "java.lang.String"},
    };

    public static void main(String[] args) {
        try (DexKitBridge bridge = DexKitBridge.create(args[0])) {
            System.out.println("# feed payload types");
            shape(bridge, FEED_ITEM_LIST);
            shape(bridge, FOLLOW_FEED_LIST);
            shape(bridge, FOLLOW_FEED);

            System.out.println("\n# producers: methods returning the page payload");
            producers(bridge, FEED_ITEM_LIST);
            producers(bridge, FOLLOW_FEED_LIST);

            System.out.println("\n# static holders of a page payload (the SPUT_OBJECT note)");
            holders(bridge, FEED_ITEM_LIST);

            System.out.println("\n# the ad-and-items path: who writes the list, who asks 'isAd'");
            adsAndItemsPath(bridge);

            System.out.println("\n# feed api classes by name");
            nameMatches(bridge, "FeedApiService", StringMatchType.Contains);
            nameMatches(bridge, "FeedApi", StringMatchType.Contains);

            System.out.println("\n# the fetch entry points: inheritance and real call sites");
            feedApiShape(bridge);

            System.out.println("\n# the fetch chain: does the ad handler run before the return?");
            fetchChain(bridge);

            System.out.println("\n# every implementer of IFeedApi (the hook has to be unique)");
            implementersOf(bridge, "com.ss.android.ugc.aweme.feed.cache.IFeedApi");

            System.out.println("\n# Aweme predicates the ReVanced feed filter reads");
            predicates(bridge);

            System.out.println("\n# every ad marker the item carries");
            adMembers(bridge);

            System.out.println("\n# who consumes the page's items — the path a filter must reach");
            consumers(bridge);
            invokesOf(bridge, "X.0kz7", "LJIJJLI");

            System.out.println("\n# the follow-feed builder (ReVanced's other anchor)");
            followFeedPath(bridge);

            System.out.println("\n# item shape for the predicates that went missing");
            membersMatching(bridge, AWEME, "live");
            membersMatching(bridge, AWEME, "image");
            membersMatching(bridge, AWEME, "photo");
            membersMatching(bridge, AWEME, "moment");
            shape(bridge, AWEME_STATISTICS);
        }
    }

    /**
     * The classes implementing an interface, with any payload-returning member — the anchor has to
     * be unique, so a second implementation is a build the patch could not choose between.
     */
    private static void implementersOf(DexKitBridge bridge, String iface) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().addInterface(iface)));
        System.out.println("\n## classes implementing " + iface + " : " + classes.size());
        for (ClassData c : classes) {
            System.out.println("  " + c.getName()
                    + "  abstract=" + ((c.getModifiers() & 0x400) != 0));
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (!m.getReturnTypeName().equals(FEED_ITEM_LIST)) continue;
                System.out.println("      " + m.getName() + " " + m.getParamTypeNames()
                        + "  opCount=" + m.getOpCodes().size());
            }
        }
    }

    /**
     * The fetch chain: everything the `fetchFeedList` implementation calls (so we see whether the
     * ad handler is inside it) and who calls the static `FeedApi` entry points.
     */
    private static void fetchChain(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className("com.ss.android.ugc.aweme.feed.FeedApiService")));
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals("fetchFeedList")) continue;
                System.out.println("\n## FeedApiService#fetchFeedList invokes (all "
                        + m.getInvokes().size() + "):");
                for (MethodData invoked : m.getInvokes()) {
                    System.out.println("      " + invoked.getDeclaredClassName() + "#" + invoked.getName()
                            + " " + invoked.getParamTypeNames() + " -> " + invoked.getReturnTypeName());
                }
            }
        }

        ClassDataList api = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className("com.ss.android.ugc.aweme.feed.api.FeedApi")));
        for (ClassData c : api) {
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals("LIZ") && !m.getName().equals("LIZIZ")) continue;
                System.out.println("\n## callers of FeedApi#" + m.getName() + " : " + m.getCallers().size());
                int shown = 0;
                for (MethodData caller : m.getCallers()) {
                    if (shown++ >= 10) break;
                    System.out.println("      " + caller.getDeclaredClassName() + "#" + caller.getName()
                            + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
                }
            }
        }
    }

    /**
     * The ad blocker's two questions: is an ad item ever *written into* the fetched list (so a
     * return hook sees it), or is it injected by the client afterwards; and where the list is read.
     */
    private static void adsAndItemsPath(DexKitBridge bridge) {
        ClassDataList lists = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(FEED_ITEM_LIST)));
        for (ClassData c : lists) {
            for (FieldData f : c.getFields()) {
                if (!f.getName().equals("items") && !f.getName().equals("preloadAds")
                        && !f.getName().equals("hasAd")) {
                    continue;
                }
                System.out.println("\n## " + c.getName() + "." + f.getName() + " : " + f.getTypeName()
                        + "  readers=" + f.getReaders().size() + " writers=" + f.getWriters().size());
                int shown = 0;
                for (MethodData w : f.getWriters()) {
                    if (shown++ >= 12) break;
                    System.out.println("      write " + w.getDeclaredClassName() + "#" + w.getName()
                            + " " + w.getParamTypeNames() + "  opCount=" + w.getOpCodes().size());
                }
                shown = 0;
                for (MethodData r : f.getReaders()) {
                    if (shown++ >= 12) break;
                    System.out.println("      read  " + r.getDeclaredClassName() + "#" + r.getName()
                            + " " + r.getParamTypeNames() + "  opCount=" + r.getOpCodes().size());
                }
            }
        }

        ClassDataList item = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(AWEME)));
        if (item.isEmpty()) return;
        for (MethodData m : item.get(0).getMethods()) {
            if (!m.getName().equals("isAd")) continue;
            System.out.println("\n## callers of Aweme#isAd : " + m.getCallers().size());
            int shown = 0;
            for (MethodData caller : m.getCallers()) {
                if (shown++ >= 20) break;
                System.out.println("      " + caller.getDeclaredClassName() + "#" + caller.getName()
                        + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
            }
        }

        for (ClassData c : lists) {
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals("setItems")) continue;
                System.out.println("\n## callers of FeedItemList#setItems : " + m.getCallers().size());
                int shown = 0;
                for (MethodData caller : m.getCallers()) {
                    if (shown++ >= 20) break;
                    System.out.println("      " + caller.getDeclaredClassName() + "#" + caller.getName()
                            + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
                }
            }
        }
    }

    /** The fetch entry points: what implements what, and who actually calls `fetchFeedList`. */
    private static void feedApiShape(DexKitBridge bridge) {
        String[] names = {
                "com.ss.android.ugc.aweme.feed.FeedApiService",
                "com.ss.android.ugc.aweme.feed.cache.IFeedApi",
                "com.ss.android.ugc.aweme.feed.api.FeedApi$RetrofitApi",
        };
        for (String name : names) {
            ClassDataList classes = bridge.findClass(FindClass.create()
                    .matcher(ClassMatcher.create().className(name)));
            System.out.println("\n## " + name + " (matched " + classes.size() + ")");
            for (ClassData c : classes) {
                System.out.println("  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
                for (ClassData i : c.getInterfaces()) {
                    System.out.println("  interface " + i.getName());
                }
                for (MethodData m : c.getMethods()) {
                    if (m.getName().startsWith("<")) continue;
                    System.out.println("    " + m.getName() + " " + m.getParamTypeNames()
                            + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size()
                            + "  callers=" + m.getCallers().size());
                    if (!m.getName().contains("fetchFeedList")) continue;
                    int shown = 0;
                    for (MethodData caller : m.getCallers()) {
                        if (shown++ >= 10) break;
                        System.out.println("        caller " + caller.getDeclaredClassName() + "#"
                                + caller.getName() + " " + caller.getParamTypeNames());
                    }
                }
            }
        }
    }

    /**
     * Who actually reads the page's list: the consumers a filter has to reach. A consumer reached
     * through a copy the filter never touched is why removing items can look like it did nothing.
     */
    private static void consumers(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(FEED_ITEM_LIST)));
        if (classes.isEmpty()) return;
        String[] wanted = {"getItems", "getAwemeList", "size", "clone", "setItems"};
        for (String name : wanted) {
            for (MethodData m : classes.get(0).getMethods()) {
                if (!m.getName().equals(name)) continue;
                System.out.println("\n## callers of FeedItemList#" + name + " "
                        + m.getParamTypeNames() + " : " + m.getCallers().size());
                int shown = 0;
                for (MethodData caller : m.getCallers()) {
                    if (shown++ >= 25) break;
                    System.out.println("      " + caller.getDeclaredClassName() + "#" + caller.getName()
                            + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
                }
            }
        }
    }

    /** What a single method calls — how a page is assembled, when it is not the fetch. */
    private static void invokesOf(DexKitBridge bridge, String className, String methodName) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (!m.getName().equals(methodName)) continue;
                System.out.println("\n## " + className + "#" + methodName + " -> "
                        + m.getReturnTypeName() + "  invokes=" + m.getInvokes().size());
                int shown = 0;
                for (MethodData invoked : m.getInvokes()) {
                    if (shown++ >= 40) break;
                    System.out.println("      " + invoked.getDeclaredClassName() + "#"
                            + invoked.getName() + " " + invoked.getParamTypeNames()
                            + " -> " + invoked.getReturnTypeName());
                }
            }
        }
    }

    /** Every member of the item that reads as an ad marker, once the obvious words are gone. */
    private static void adMembers(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(AWEME)));
        System.out.println("\n## " + AWEME + " members that look like ad markers");
        if (classes.isEmpty()) return;
        for (FieldData f : classes.get(0).getFields()) {
            if (looksLikeAd(f.getName())) {
                System.out.println("  field " + f.getTypeName() + " " + f.getName());
            }
        }
        for (MethodData m : classes.get(0).getMethods()) {
            if (m.getName().startsWith("<")) continue;
            if (!looksLikeAd(m.getName())) continue;
            System.out.println("  method " + m.getName() + " " + m.getParamTypeNames()
                    + " -> " + m.getReturnTypeName());
        }
    }

    /** Words that merely contain "ad" — download, header — never make a member an ad marker. */
    private static final String[] NOT_AN_AD = {
            "download", "load", "header", "shadow", "read", "grade", "radar",
    };

    private static boolean looksLikeAd(String name) {
        String lower = name.toLowerCase(Locale.ROOT);
        if (!lower.contains("ad") && !lower.contains("commerce") && !lower.contains("sponsor")) {
            return false;
        }
        for (String word : NOT_AN_AD) {
            if (lower.contains(word)) return false;
        }
        return true;
    }

    /** Where a FollowFeedList is built: the named method and the constructor's callers. */
    private static void followFeedPath(DexKitBridge bridge) {
        MethodDataList named = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create().name("getFollowFeedList", StringMatchType.Contains)));
        System.out.println("\n## methods named *getFollowFeedList* : " + named.size());
        for (MethodData m : named) {
            System.out.println("  " + m.getDeclaredClassName() + "#" + m.getName() + " "
                    + m.getParamTypeNames() + "  callers=" + m.getCallers().size());
            int shown = 0;
            for (MethodData caller : m.getCallers()) {
                if (shown++ >= 15) break;
                System.out.println("      caller " + caller.getDeclaredClassName() + "#" + caller.getName()
                        + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
            }
        }

        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(FOLLOW_FEED_LIST)));
        for (ClassData c : classes) {
            for (MethodData m : c.getMethods()) {
                if (!m.isConstructor()) continue;
                System.out.println("\n## builders of " + c.getName() + "#<init> " + m.getParamTypeNames()
                        + "  callers=" + m.getCallers().size());
                int shown = 0;
                for (MethodData caller : m.getCallers()) {
                    if (shown++ >= 15) break;
                    System.out.println("      " + caller.getDeclaredClassName() + "#" + caller.getName()
                            + " " + caller.getParamTypeNames() + "  opCount=" + caller.getOpCodes().size());
                }
            }
        }
    }

    /** Fields and methods of a class whose name carries the needle. */
    private static void membersMatching(DexKitBridge bridge, String className, String needle) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        System.out.println("\n## " + className + " members containing \"" + needle + "\"");
        if (classes.isEmpty()) {
            System.out.println("  (class not found)");
            return;
        }
        for (FieldData f : classes.get(0).getFields()) {
            if (!f.getName().toLowerCase().contains(needle)) continue;
            System.out.println("  field " + f.getTypeName() + " " + f.getName());
        }
        for (MethodData m : classes.get(0).getMethods()) {
            if (m.getName().startsWith("<")) continue;
            if (!m.getName().toLowerCase().contains(needle)) continue;
            System.out.println("  method " + m.getName() + " " + m.getParamTypeNames()
                    + " -> " + m.getReturnTypeName());
        }
    }

    /** A payload type: its fields, and the members the container hands out. */
    private static void shape(DexKitBridge bridge, String className) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(className)));
        System.out.println("\n## " + className + " (matched " + classes.size() + ")");
        for (ClassData c : classes) {
            System.out.println("  super=" + (c.getSuperClass() == null ? "-" : c.getSuperClass().getName()));
            for (FieldData f : c.getFields()) {
                System.out.println("  field " + f.getTypeName() + " " + f.getName()
                        + "  static=" + ((f.getModifiers() & 0x8) != 0)
                        + "  readers=" + f.getReaders().size()
                        + " writers=" + f.getWriters().size());
            }
            int shown = 0;
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (shown++ >= 30) {
                    System.out.println("  ... (methods capped)");
                    break;
                }
                System.out.println("  method " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName() + "  opCount=" + m.getOpCodes().size());
            }
        }
    }

    /** Every method that returns the type — the candidate hook points at its `return`. */
    private static void producers(DexKitBridge bridge, String type) {
        MethodDataList methods = bridge.findMethod(FindMethod.create()
                .matcher(MethodMatcher.create().returnType(type)));
        System.out.println("\n## methods -> " + type + " : " + methods.size());
        for (MethodData m : methods) {
            System.out.println("  " + m.getDeclaredClassName() + "#" + m.getName() + " "
                    + m.getParamTypeNames() + "  static=" + ((m.getModifiers() & 0x8) != 0)
                    + "  opCount=" + m.getOpCodes().size()
                    + "  callers=" + m.getCallers().size());
            int shown = 0;
            for (MethodData invoked : m.getInvokes()) {
                if (shown++ >= 3) break;
                System.out.println("      invoke " + invoked.getDeclaredClassName() + "#"
                        + invoked.getName() + " -> " + invoked.getReturnTypeName());
            }
        }
    }

    /** Fields holding the payload, and the methods that write them — the cold-cache trail. */
    private static void holders(DexKitBridge bridge, String type) {
        FieldDataList fields = bridge.findField(FindField.create()
                .matcher(FieldMatcher.create().type(type)));
        System.out.println("\n## fields of type " + type + " : " + fields.size());
        for (FieldData f : fields) {
            System.out.println("  " + f.getDeclaredClassName() + "." + f.getName()
                    + "  static=" + ((f.getModifiers() & 0x8) != 0)
                    + "  readers=" + f.getReaders().size() + " writers=" + f.getWriters().size());
            for (MethodData w : f.getWriters()) {
                System.out.println("      write " + w.getDeclaredClassName() + "#" + w.getName()
                        + " " + w.getParamTypeNames() + "  opCount=" + w.getOpCodes().size());
            }
        }
    }

    /** Classes whose name carries the needle, plus any member returning the page payload. */
    private static void nameMatches(DexKitBridge bridge, String needle, StringMatchType kind) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(needle, kind)));
        System.out.println("\n## classes matching \"" + needle + "\" (" + kind + ") : " + classes.size());
        int shown = 0;
        for (ClassData c : classes) {
            if (shown++ >= 40) {
                System.out.println("  ... (capped)");
                break;
            }
            System.out.println("  " + c.getName() + "  methods=" + c.getMethodCount());
            for (MethodData m : c.getMethods()) {
                if (m.getName().startsWith("<")) continue;
                if (!m.getReturnTypeName().equals(FEED_ITEM_LIST)) continue;
                System.out.println("      -> " + m.getName() + " " + m.getParamTypeNames()
                        + "  opCount=" + m.getOpCodes().size());
            }
        }
    }

    /** Which of the ReVanced predicates survived as real names, and what else the item exposes. */
    private static void predicates(DexKitBridge bridge) {
        ClassDataList classes = bridge.findClass(FindClass.create()
                .matcher(ClassMatcher.create().className(AWEME)));
        System.out.println("\n## " + AWEME + " (matched " + classes.size() + ")");
        if (classes.isEmpty()) return;
        for (String[] expected : AWEME_PREDICATES) {
            boolean found = false;
            for (MethodData m : classes.get(0).getMethods()) {
                if (!m.getName().equals(expected[0])) continue;
                found = true;
                System.out.println("  PRESENT " + m.getName() + " " + m.getParamTypeNames()
                        + " -> " + m.getReturnTypeName());
            }
            if (!found) {
                System.out.println("  ABSENT  " + expected[0] + "  (expected -> " + expected[1] + ")");
            }
        }
        System.out.println("  -- every no-arg boolean member on the item:");
        for (MethodData m : classes.get(0).getMethods()) {
            if (m.getName().startsWith("<")) continue;
            if (!"boolean".equals(m.getReturnTypeName())) continue;
            if (!m.getParamTypeNames().isEmpty()) continue;
            System.out.println("     " + m.getName());
        }
    }
}
