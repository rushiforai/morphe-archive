import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableArrayPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31t;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutablePackedSwitchPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSparseSwitchPayload;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableSwitchElement;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Writes the dex files scripts/test-injected-registers.ps1 holds DexDiff.java to: a clean host,
 * a patched build of it that passes every check, and one build per check that breaks exactly that
 * check and nothing else. javac and d8 can only write valid code, so these are built instruction
 * by instruction.
 *
 * <p>The host stands in for Facebook's feed collection: {@code addNewEdgeToCollection} is where
 * the one feed guard goes, and the bundle's {@code FeedFilter.hideEdge} is the guard, under the
 * same names the contract file holds the real APK to. The bundle's two story-flag stubs are there
 * under their real names too, filled the way the patches fill them: a call to GraphQLStory's
 * accessor before anything returns. And a second host class stands in for the feed's two Stories
 * tray adapter methods, each holding the string the contract picks it by, with the tray patch's
 * call to {@code FeedFilter.hideStoriesTray} first in the patched builds. The reels patch's two
 * changes are there as well: a renamed feed unit class answering ShowcaseFeedUnit, whose accessor
 * the {@code ShowcaseType} stub calls, and a pre-EOF injector holding its adapter's name, with the
 * call to {@code FeedFilter.hidePreEofReels} first. So is a shortcut publisher making each of the
 * five calls the settings patch sends to {@code SettingsEntry}, which makes the real ones, and
 * Facebook's Follow check for a reel's author row, holding its two surface names, with Clean up
 * Reels' call to {@code ReelDeclutter.hideFollowButton} first. And the top bar's method building
 * the Facebook logo, holding its two trace sections, where the settings patch sends the logo's
 * touch listener call to {@code SettingsEntry.setLogoTouchListener} right after the logo gets its
 * tap. And Facebook's emoji typeface provider, holding its end-to-end flag and its log tag, with Use
 * the phone's emoji's call to {@code SystemEmoji.typeface} first. And the Reels viewer's batcher of
 * watched reels, whose flush holds the mutation's name and its input field and hands each batch to
 * an executor, the call Don't send reel watch history sends to {@code ReelWatchHistory.send}.
 * Beside each method a start-call, next-call or sole-call rule picks sit methods holding part of
 * what it's picked by: the tray controller, the refresh controller's onPause, two other methods
 * naming both surfaces and one holding the emoji provider's log tag alone, as Facebook's do, and
 * three top bar and three batcher methods, which Facebook doesn't have, so neither the logo rule
 * nor the watch-history rule passes with its second string or its shape left out.
 *
 *   java -cp &lt;cli jar&gt; BadDexFixture.java &lt;outDir&gt;
 */
public class BadDexFixture {

    private static final String HOST = "Lfixture/Feed;";
    private static final String FILTER = "Lapp/morphe/extension/facebook/feed/FeedFilter;";
    private static final String OBJECT = "Ljava/lang/Object;";

    private static final ImmutableMethodReference HIDE_EDGE =
            method(FILTER, "hideEdge", "Z", OBJECT, OBJECT);
    private static final ImmutableMethodReference INSPECT =
            method(FILTER, "inspect", "V", OBJECT, OBJECT);
    private static final ImmutableMethodReference WIDE = method(FILTER, "wide", "V", "J");
    private static final ImmutableMethodReference RISKY = method(HOST, "risky", "I");

    private static final String GENAI_LABEL = "Lapp/morphe/extension/facebook/feed/GenAiLabel;";
    private static final String RECOMMENDATION_LABEL = "Lapp/morphe/extension/facebook/feed/RecommendationLabel;";
    private static final String STORY = "Lcom/facebook/graphql/model/GraphQLStory;";
    /** What the story's renamed accessor answers, a model class Redex renamed. */
    private static final String MODEL = "Lfixture/Model;";
    private static final ImmutableMethodReference STORY_ACCESSOR = method(STORY, "A0X", MODEL);

    private static final String ADAPTERS = "Lfixture/Adapters;";
    /** Holds the unified tray's start and stop names without "tofu", as Facebook's tray controller does. */
    private static final String TRAY_CONTROLLER = "Lfixture/TrayController;";
    private static final String TRAY_START = "stories_tray_create_adapter_start";
    private static final String TRAY_STOP = "stories_tray_create_adapter_stop";
    private static final ImmutableMethodReference HIDE_STORIES_TRAY = method(FILTER, "hideStoriesTray", "Z", "I");
    /** An extension class of the bundle's own, for an added method that writes past its registers. */
    private static final String PACK = "Lapp/morphe/extension/facebook/feed/Pack;";

    private static final String SHOWCASE_TYPE = "Lapp/morphe/extension/facebook/feed/ShowcaseType;";
    /** The class whose getTypeName() answers ShowcaseFeedUnit, and its story type accessor. */
    private static final String SHOWCASE = "Lfixture/Showcase;";
    private static final String STORY_TYPE = "Lfixture/StoryType;";
    private static final ImmutableMethodReference SHOWCASE_ACCESSOR = method(SHOWCASE, "A01", STORY_TYPE);

    private static final String PRE_EOF = "Lfixture/PreEof;";
    private static final ImmutableMethodReference HIDE_PRE_EOF_REELS = method(FILTER, "hidePreEofReels", "Z");

    private static final String RETURN_CONTROLLER = "Lfixture/ReturnController;";
    private static final String RETURN_REFRESH = "Lapp/morphe/extension/facebook/feed/ReturnRefresh;";
    private static final ImmutableMethodReference SKIP_RETURN_REFRESH = method(RETURN_REFRESH, "skip", "Z");

    private static final String GENAI_REEL_FILTER = "Lapp/morphe/extension/facebook/feed/GenAiReelFilter;";
    /** Facebook's attribution finder: a class and name Redex made up, the reel model and a type name in. */
    private static final String REEL_MODEL = "Lfixture/ReelModel;";
    private static final ImmutableMethodReference ATTRIBUTION_FINDER =
            method("Lfixture/Attributions;", "A02", MODEL, REEL_MODEL, "Ljava/lang/String;");

    private static final String FOLLOW_CHECK = "Lfixture/FollowCheck;";
    private static final String FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;";
    private static final String REEL_DECLUTTER = "Lapp/morphe/extension/facebook/reels/ReelDeclutter;";
    private static final ImmutableMethodReference HIDE_FOLLOW_BUTTON = method(REEL_DECLUTTER, "hideFollowButton", "Z");

    private static final String EMOJI_PROVIDER = "Lfixture/EmojiProvider;";
    private static final String TYPEFACE = "Landroid/graphics/Typeface;";
    private static final String SYSTEM_EMOJI = "Lapp/morphe/extension/facebook/emoji/SystemEmoji;";
    private static final ImmutableMethodReference SYSTEM_EMOJI_TYPEFACE = method(SYSTEM_EMOJI, "typeface", TYPEFACE);

    private static final String SHORTCUT_MANAGER = "Landroid/content/pm/ShortcutManager;";
    private static final String SHORTCUT_INFO = "Landroid/content/pm/ShortcutInfo;";
    private static final String SHORTCUT_LIST = "Ljava/util/List;";
    private static final String SHORTCUTS = "Lfixture/Shortcuts;";
    private static final String SETTINGS_ENTRY = "Lapp/morphe/extension/facebook/settings/SettingsEntry;";

    private static final String TOP_BAR = "Lfixture/TopBar;";
    private static final String CONTEXT = "Landroid/content/Context;";
    /** The home feed's top bar, a name Facebook keeps: its logo builder takes it after a context. */
    private static final String WORDMARK_BAR = "Lcom/facebook/navigation/navbar/legacy/search/WordmarkNavigationBar;";
    /** The logo builder's two trace sections, which the logo rule picks it by. */
    private static final List<String> LOGO_SECTIONS = Arrays.asList(
            "WordmarkNavigationBar#createWordmarkView", "WordmarkNavigationBar.initContents");
    private static final String VIEW = "Landroid/view/View;";
    private static final String ON_CLICK_LISTENER = "Landroid/view/View$OnClickListener;";
    private static final String ON_TOUCH_LISTENER = "Landroid/view/View$OnTouchListener;";
    private static final ImmutableMethodReference SET_ON_CLICK_LISTENER =
            method(VIEW, "setOnClickListener", "V", ON_CLICK_LISTENER);
    private static final ImmutableMethodReference SET_ON_TOUCH_LISTENER =
            method(VIEW, "setOnTouchListener", "V", ON_TOUCH_LISTENER);
    private static final ImmutableMethodReference SET_CONTENT_DESCRIPTION =
            method(VIEW, "setContentDescription", "V", "Ljava/lang/CharSequence;");
    private static final ImmutableMethodReference LOGO_TOUCH_STAND_IN =
            method(SETTINGS_ENTRY, "setLogoTouchListener", "V", VIEW, ON_TOUCH_LISTENER);

    /** The Reels viewer's batcher of watched reels, a class Redex renames. */
    private static final String BATCHER = "Lfixture/SeenStateBatcher;";
    private static final String EXECUTOR = "Ljava/util/concurrent/Executor;";
    private static final String RUNNABLE = "Ljava/lang/Runnable;";
    private static final ImmutableMethodReference EXECUTE = method(EXECUTOR, "execute", "V", RUNNABLE);
    private static final String REEL_WATCH_HISTORY = "Lapp/morphe/extension/facebook/reels/ReelWatchHistory;";
    private static final ImmutableMethodReference WATCH_SEND = method(REEL_WATCH_HISTORY, "send", "V", EXECUTOR, RUNNABLE);
    /** The mutation's name and its input field, which the watch-history rule picks the flush by. */
    private static final List<String> SEEN_STATE = Arrays.asList("FbShortsSeenStateMutation", "video_ids");

    /**
     * One of the ShortcutManager calls the settings patch sends to SettingsEntry: its name, what it
     * takes after the manager and what it answers, the publisher method that makes it and whether
     * that method makes it as a range call. Its bad build is "bad-shortcut-[caseName]-left".
     */
    private static final class ShortcutCall {
        final String name;
        final String takes;
        final String answers;
        final String caller;
        final String caseName;
        final boolean range;

        ShortcutCall(String name, String takes, String answers, String caller, String caseName, boolean range) {
            this.name = name;
            this.takes = takes;
            this.answers = answers;
            this.caller = caller;
            this.caseName = caseName;
            this.range = range;
        }

        /** The manager, then what the call takes. */
        String[] parameters() {
            return takes == null ? new String[]{SHORTCUT_MANAGER} : new String[]{SHORTCUT_MANAGER, takes};
        }

        ImmutableMethodReference framework() {
            return takes == null ? method(SHORTCUT_MANAGER, name, answers) : method(SHORTCUT_MANAGER, name, answers, takes);
        }

        /** The stand-in: static, of the same name, the manager first, the same answer. */
        ImmutableMethodReference standIn() {
            return method(SETTINGS_ENTRY, name, answers, parameters());
        }
    }

    /** All five, as the contract file names them. The update goes as a range call. */
    private static final List<ShortcutCall> SHORTCUT_CALLS = Arrays.asList(
            new ShortcutCall("pushDynamicShortcut", SHORTCUT_INFO, "V", "push", "push", false),
            new ShortcutCall("addDynamicShortcuts", SHORTCUT_LIST, "Z", "add", "add", false),
            new ShortcutCall("setDynamicShortcuts", SHORTCUT_LIST, "Z", "set", "set", false),
            new ShortcutCall("updateShortcuts", SHORTCUT_LIST, "Z", "update", "update", true),
            new ShortcutCall("removeAllDynamicShortcuts", null, "V", "removeAll", "remove-all", false));

    private static final ImmutableTypeReference STRING_TYPE = new ImmutableTypeReference("Ljava/lang/String;");
    private static final ImmutableTypeReference INT_ARRAY = new ImmutableTypeReference("[I");
    private static final ImmutableTypeReference OBJECT_ARRAY = new ImmutableTypeReference("[Ljava/lang/Object;");

    private static ImmutableMethodReference method(String owner, String name, String returns, String... parameters) {
        return new ImmutableMethodReference(owner, name, Arrays.asList(parameters), returns);
    }

    private static Instruction op(Opcode opcode) {
        return new ImmutableInstruction10x(opcode);
    }

    private static Instruction op(Opcode opcode, int register) {
        return new ImmutableInstruction11x(opcode, register);
    }

    private static Instruction invoke(ImmutableMethodReference callee, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.INVOKE_STATIC, registers.length, r[0], r[1], r[2], r[3], r[4], callee);
    }

    private static Instruction ifEqz(int register, int offset) {
        return new ImmutableInstruction21t(Opcode.IF_EQZ, register, offset);
    }

    private static Instruction filledNewArray(ImmutableTypeReference type, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.FILLED_NEW_ARRAY, registers.length, r[0], r[1], r[2], r[3], r[4], type);
    }

    /** A fill-array-data payload of one int. */
    private static Instruction oneInt() {
        return new ImmutableArrayPayload(4, Collections.<Number>singletonList(1));
    }

    private static ImmutableMethodImplementation body(int registers, Instruction... instructions) {
        return new ImmutableMethodImplementation(registers, Arrays.asList(instructions), null, null);
    }

    private static ImmutableMethodImplementation body(int registers, List<ImmutableTryBlock> tries, Instruction... instructions) {
        return new ImmutableMethodImplementation(registers, Arrays.asList(instructions), tries, null);
    }

    private static ImmutableTryBlock tryBlock(int start, int units, int handler) {
        return new ImmutableTryBlock(start, units,
                Collections.singletonList(new ImmutableExceptionHandler("Ljava/lang/Exception;", handler)));
    }

    private static Method define(String owner, String name, String returns, boolean isStatic,
            ImmutableMethodImplementation implementation, String... parameters) {
        List<ImmutableMethodParameter> list = new ArrayList<>();
        for (String p : parameters) list.add(new ImmutableMethodParameter(p, null, null));
        int flags = AccessFlags.PUBLIC.getValue() | (isStatic ? AccessFlags.STATIC.getValue() : 0);
        return new ImmutableMethod(owner, name, list, returns, flags, null, null, implementation);
    }

    // The host's methods, clean.

    /** Where the one feed guard goes. Instance method: v0 this, v1 and v2 the arguments. */
    private static Method feedEdge(ImmutableMethodImplementation implementation) {
        return define(HOST, "addNewEdgeToCollection", "V", false, implementation, OBJECT, OBJECT);
    }

    private static final ImmutableMethodImplementation CLEAN_FEED_EDGE = body(3, op(Opcode.RETURN_VOID));

    /** Static, an object then a long: v0 the object, v1 and v2 the long. */
    private static Method staticHost(ImmutableMethodImplementation implementation) {
        return define(HOST, "staticHost", "V", true, implementation, OBJECT, "J");
    }

    private static final ImmutableMethodImplementation CLEAN_STATIC_HOST = body(3, op(Opcode.RETURN_VOID));

    /** A packed switch over the argument, v1. Case 0 lands at 5 and case 1 at 7. */
    private static Method switchHost(int caseOneOffset) {
        return switchHost(caseOneOffset, op(Opcode.RETURN, 0));
    }

    /** The same, with [atFour] as the one-unit instruction that ends the no-case path at 4. */
    private static Method switchHost(int caseOneOffset, Instruction atFour) {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 10), // 0
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),        // 3
                atFour,                                                    // 4
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 5
                op(Opcode.RETURN, 0),                                      // 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 2),        // 7
                op(Opcode.RETURN, 0),                                      // 8
                op(Opcode.NOP),                                            // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Arrays.asList(            // 10
                        new ImmutableSwitchElement(0, 5),
                        new ImmutableSwitchElement(1, caseOneOffset)))), "I");
    }

    /** risky() inside a try whose handler is a move-exception at 5. */
    private static Method tryHost(ImmutableTryBlock block) {
        return tryHost(block, op(Opcode.RETURN_VOID));
    }

    /** The same, with [beforeHandler] as the one-unit instruction that ends the try path at 4. */
    private static Method tryHost(ImmutableTryBlock block, Instruction beforeHandler) {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(block),
                invoke(RISKY),                      // 0
                op(Opcode.MOVE_RESULT, 0),          // 3
                beforeHandler,                      // 4
                op(Opcode.MOVE_EXCEPTION, 0),       // 5
                op(Opcode.RETURN_VOID)));           // 6
    }

    private static final ImmutableTryBlock CLEAN_TRY = tryBlock(0, 3, 5);

    /** switchHost with case 1 sent to the move-result of an invoke on the no-case path. */
    private static Method switchToResult() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 10), // 0
                invoke(RISKY),                                             // 3
                op(Opcode.MOVE_RESULT, 0),                                 // 6
                op(Opcode.RETURN, 0),                                      // 7
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 8
                op(Opcode.RETURN, 0),                                      // 9
                new ImmutablePackedSwitchPayload(Arrays.asList(            // 10
                        new ImmutableSwitchElement(0, 8),
                        new ImmutableSwitchElement(1, 6)))), "I");
    }

    /** tryHost whose handler is the packed-switch payload at 10 instead of a move-exception. */
    private static Method tryHandlerAtPayload() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(0, 3, 10)),
                invoke(RISKY),                                             // 0
                op(Opcode.MOVE_RESULT, 0),                                 // 3
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 6),  // 4 -> 10
                op(Opcode.RETURN_VOID),                                    // 7
                op(Opcode.RETURN_VOID),                                    // 8, case 0
                op(Opcode.NOP),                                            // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Collections.singletonList( // 10
                        new ImmutableSwitchElement(0, 4)))));
    }

    /**
     * switchHost filling an int array, whose fill-array-data payload sits at 10, with case 0 sent
     * to that payload instead of an instruction.
     */
    private static Method switchToArrayPayload() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 1, 16),         // 0 -> 16
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 1, INT_ARRAY),    // 3
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),         // 5 -> 10
                op(Opcode.RETURN, 1),                                              // 8
                op(Opcode.NOP),                                                    // 9, aligns the payloads
                oneInt(),                                                          // 10
                new ImmutablePackedSwitchPayload(Collections.singletonList(        // 16
                        new ImmutableSwitchElement(0, 10)))), "I");
    }

    /** switchHost as a sparse switch, its one case sent to its own payload at 4. */
    private static Method sparseSwitchToOwnPayload() {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(Opcode.SPARSE_SWITCH, 1, 4),           // 0 -> 4
                op(Opcode.RETURN, 1),                                              // 3
                new ImmutableSparseSwitchPayload(Collections.singletonList(        // 4
                        new ImmutableSwitchElement(7, 4)))), "I");
    }

    /**
     * switchHost with [switchOpcode] pointed at [payload], a table of the other kind whose cases
     * both land where switchHost's do.
     */
    private static Method switchWithTable(Opcode switchOpcode, Instruction payload) {
        return define(HOST, "switchHost", "I", true, body(2,
                new ImmutableInstruction31t(switchOpcode, 1, 10),         // 0 -> 10
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),        // 3
                op(Opcode.RETURN, 0),                                      // 4
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),        // 5
                op(Opcode.RETURN, 0),                                      // 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 2),        // 7
                op(Opcode.RETURN, 0),                                      // 8
                op(Opcode.NOP),                                            // 9, aligns the payload
                payload), "I");                                            // 10
    }

    private static List<ImmutableSwitchElement> twoCases() {
        return Arrays.asList(new ImmutableSwitchElement(0, 5), new ImmutableSwitchElement(1, 7));
    }

    /** tryHost filling an int array, with the handler at its fill-array-data payload at 10. */
    private static Method tryHandlerAtArrayPayload() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(0, 3, 10)),
                invoke(RISKY),                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                         // 3
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 0, INT_ARRAY),    // 4
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 4),         // 6 -> 10
                op(Opcode.RETURN_VOID),                                            // 9
                oneInt()));                                                        // 10
    }

    /** tryHost with its handler moved to the top: the move-exception is the method's first instruction. */
    private static Method moveExceptionAtEntry() {
        return define(HOST, "tryHost", "V", true, body(1, Collections.singletonList(tryBlock(1, 3, 0)),
                op(Opcode.MOVE_EXCEPTION, 0),                              // 0
                invoke(RISKY),                                             // 1
                op(Opcode.MOVE_RESULT, 0),                                 // 4
                op(Opcode.RETURN_VOID)));                                  // 5
    }

    private static Method risky() {
        return define(HOST, "risky", "I", true, body(1,
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)));
    }

    private static Method removable() {
        return define(HOST, "removable", "V", true, body(0, op(Opcode.RETURN_VOID)));
    }

    // The patched shapes.

    /** The guard as the bundle writes it: v0 free, v1 this, v2 and v3 the arguments. */
    private static final ImmutableMethodImplementation GUARDED_FEED_EDGE = body(4,
            invoke(HIDE_EDGE, 2, 3),   // 0
            op(Opcode.MOVE_RESULT, 0), // 3
            ifEqz(0, 3),               // 4 -> 7
            op(Opcode.RETURN_VOID),    // 6
            op(Opcode.RETURN_VOID));   // 7

    /** The object twice, then the long as a pair: every register the kind the callee takes. */
    private static final ImmutableMethodImplementation GOOD_STATIC_HOST = body(3,
            invoke(INSPECT, 0, 0),
            invoke(WIDE, 1, 2),
            op(Opcode.RETURN_VOID));

    /** A static long, where Compose-style code keeps a packed colour. */
    private static List<ImmutableField> packedField(String owner) {
        return Collections.singletonList(new ImmutableField(owner, "packed", "J",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null, null));
    }

    /**
     * A colour packed as Compose packs one: the int widened to a long, shifted up 32, stored.
     * On 580 the colour came in as a const-wide/32 and the AMOLED sweep left a narrow const.
     */
    private static Instruction[] packColor(Opcode constant, String owner) {
        return new Instruction[]{
                new ImmutableInstruction31i(constant, 0, BLACK),
                new ImmutableInstruction21s(Opcode.CONST_16, 2, 32),
                new ImmutableInstruction12x(Opcode.SHL_LONG_2ADDR, 0, 2),
                new ImmutableInstruction21c(Opcode.SPUT_WIDE, 0, new ImmutableFieldReference(owner, "packed", "J")),
                op(Opcode.RETURN_VOID)};
    }

    private static ClassDef host(Method feedEdge, Method staticHost, Method switchHost, Method tryHost, boolean keepRemovable) {
        List<Method> methods = new ArrayList<>(Arrays.asList(feedEdge, staticHost, switchHost, tryHost, risky()));
        if (keepRemovable) methods.add(removable());
        return new ImmutableClassDef(HOST, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, packedField(HOST), methods);
    }

    /**
     * One of the feed's two Stories tray adapter methods, static: v0 free, v1 the argument. [prefix]
     * comes first, then the names it holds, then the null it answers when Facebook leaves the tray out.
     */
    private static Method trayAdapter(String owner, String name, List<Instruction> prefix, String... names) {
        List<Instruction> instructions = new ArrayList<>(prefix);
        for (String held : names) {
            instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(held)));
        }
        instructions.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        instructions.add(op(Opcode.RETURN_OBJECT, 0));
        return define(owner, name, OBJECT, true, new ImmutableMethodImplementation(2, instructions, null, null), OBJECT);
    }

    /** What the tray patch puts first: ask, and return null when told to. The keep path lands at 9. */
    private static List<Instruction> trayHook(int adapter) {
        return Arrays.asList(
                new ImmutableInstruction11n(Opcode.CONST_4, 0, adapter),   // 0
                invoke(HIDE_STORIES_TRAY, 0),                              // 1
                op(Opcode.MOVE_RESULT, 0),                                 // 4
                ifEqz(0, 4),                                               // 5 -> 9
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),        // 7
                op(Opcode.RETURN_OBJECT, 0));                              // 8
    }

    private static ClassDef adapters(List<Instruction> legacyPrefix, List<Instruction> unifiedPrefix) {
        return new ImmutableClassDef(ADAPTERS, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Arrays.asList(
                        trayAdapter(ADAPTERS, "addStoriesAdapter", legacyPrefix, "NewsFeedAdapterConfiguration.addStoriesAdapter"),
                        trayAdapter(ADAPTERS, "addUnifiedTray", unifiedPrefix, TRAY_START, TRAY_STOP, "tofu")));
    }

    private static ClassDef cleanAdapters() {
        return adapters(Collections.<Instruction>emptyList(), Collections.<Instruction>emptyList());
    }

    /**
     * The tray controller: a method holding the unified tray's start and stop names but not "tofu",
     * the way Facebook's tray controller constructor does, with [prefix] first. The unified tray's
     * rule has to tell the adapter from it.
     */
    private static ClassDef trayController(List<Instruction> prefix) {
        return new ImmutableClassDef(TRAY_CONTROLLER, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Collections.singletonList(trayAdapter(TRAY_CONTROLLER, "create", prefix, TRAY_START, TRAY_STOP)));
    }

    /**
     * A feed unit class Redex renamed: its getTypeName() answers [typeName] as a literal, and its
     * story type accessor answers the enum. Instance methods: v0 free, v1 this.
     */
    private static ClassDef showcaseUnit(String type, String typeName) {
        return new ImmutableClassDef(type, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT,
                null, null, null, null, Arrays.asList(
                        define(type, "getTypeName", "Ljava/lang/String;", false, body(2,
                                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(typeName)),
                                op(Opcode.RETURN_OBJECT, 0))),
                        define(type, "A01", STORY_TYPE, false, body(2,
                                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)))));
    }

    private static ClassDef showcaseUnit() {
        return showcaseUnit(SHOWCASE, "ShowcaseFeedUnit");
    }

    /**
     * The pre-EOF injector, an instance method: v0 free, v1 this. [prefix] comes first, then the
     * adapter name it holds, then its own work, which the fixture leaves as a return.
     */
    private static ClassDef preEof(List<Instruction> prefix) {
        List<Instruction> instructions = new ArrayList<>(prefix);
        instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("PreEofIfuSectionAdapter")));
        instructions.add(op(Opcode.RETURN_VOID));
        return new ImmutableClassDef(PRE_EOF, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Collections.singletonList(define(PRE_EOF, "injectPreEofIfuEdge$fixture", "V", false,
                        new ImmutableMethodImplementation(2, instructions, null, null))));
    }

    /** What the reels patch puts first in the injector: ask, and return when told to. The keep path lands at 7. */
    private static List<Instruction> preEofHook() {
        return Arrays.asList(
                invoke(HIDE_PRE_EOF_REELS),        // 0
                op(Opcode.MOVE_RESULT, 0),         // 3
                ifEqz(0, 3),                       // 4 -> 7
                op(Opcode.RETURN_VOID));           // 6
    }

    private static ClassDef returnController(List<Instruction> prefix) {
        return returnController(prefix, Collections.<Instruction>emptyList(), false);
    }

    /**
     * The feed refresh controller: the resume callback, holding its name and "onRefresh", with
     * [prefix] first; onPause, holding its name alone as four of Facebook's five holders of it do,
     * with [pausePrefix] first; and with [twoCallbacks] a second method holding both, which leaves
     * the return-refresh rule nothing to tell the two apart by.
     */
    private static ClassDef returnController(List<Instruction> prefix, List<Instruction> pausePrefix, boolean twoCallbacks) {
        List<Method> methods = new ArrayList<>();
        methods.add(resumeCallback("resumeAfterBackground", prefix));
        if (twoCallbacks) methods.add(resumeCallback("resumeAgain", Collections.<Instruction>emptyList()));
        List<Instruction> pause = new ArrayList<>(pausePrefix);
        pause.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("FeedRefreshTriggerController")));
        pause.add(op(Opcode.RETURN_VOID));
        methods.add(define(RETURN_CONTROLLER, "onPause", "V", false, new ImmutableMethodImplementation(2, pause, null, null)));
        return new ImmutableClassDef(RETURN_CONTROLLER, AccessFlags.PUBLIC.getValue(), OBJECT,
                null, null, null, null, methods);
    }

    /** A resume callback of the controller, an instance method: v0 free, v1 this, v2 the argument. */
    private static Method resumeCallback(String name, List<Instruction> prefix) {
        List<Instruction> instructions = new ArrayList<>(prefix);
        instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0,
                new ImmutableStringReference("FeedRefreshTriggerController")));
        instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0,
                new ImmutableStringReference("onRefresh")));
        instructions.add(op(Opcode.RETURN_VOID));
        return define(RETURN_CONTROLLER, name, "V", false, new ImmutableMethodImplementation(3, instructions, null, null), OBJECT);
    }

    private static List<Instruction> returnHook() {
        return Arrays.asList(invoke(SKIP_RETURN_REFRESH), op(Opcode.MOVE_RESULT, 0),
                ifEqz(0, 3), op(Opcode.RETURN_VOID));
    }

    private static ClassDef returnRefresh() {
        return new ImmutableClassDef(RETURN_REFRESH, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, Collections.singletonList(define(RETURN_REFRESH,
                        "skip", "Z", true, body(1,
                                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)))));
    }

    private static ClassDef hookedAdapters() {
        return adapters(trayHook(0), trayHook(1));
    }

    private static ClassDef followCheck(List<Instruction> prefix) {
        return followCheck(prefix, Collections.<Instruction>emptyList());
    }

    /**
     * Facebook's Follow check for a reel's author row, static: v0 free, v1 the session. [prefix]
     * comes first, then the two surface names it holds, then Facebook's own yes. Beside it, two of
     * the other methods naming both surfaces, as nineteen do on 580: an instance method taking the
     * session and answering a boolean, with [instancePrefix] first, and a static one taking a
     * string. Only the check's shape tells it from them.
     */
    private static ClassDef followCheck(List<Instruction> prefix, List<Instruction> instancePrefix) {
        return new ImmutableClassDef(FOLLOW_CHECK, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Arrays.asList(
                        define(FOLLOW_CHECK, "offersFollow", "Z", true, surfaceCheck(2, prefix), FB_USER_SESSION),
                        define(FOLLOW_CHECK, "offersFollowHere", "Z", false, surfaceCheck(3, instancePrefix), FB_USER_SESSION),
                        define(FOLLOW_CHECK, "surfaceAllows", "Z", true, surfaceCheck(2, Collections.<Instruction>emptyList()),
                                "Ljava/lang/String;")));
    }

    /** [prefix], then both surface names and a yes, in [registers] with v0 free. */
    private static ImmutableMethodImplementation surfaceCheck(int registers, List<Instruction> prefix) {
        List<Instruction> instructions = new ArrayList<>(prefix);
        instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("friendly_feed")));
        instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("friends_tab_ifu")));
        instructions.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1));
        instructions.add(op(Opcode.RETURN, 0));
        return new ImmutableMethodImplementation(registers, instructions, null, null);
    }

    /** What Clean up Reels puts first in the check: ask, and answer no when told to. The check's own path lands at 8. */
    private static List<Instruction> followHook() {
        return Arrays.asList(
                invoke(HIDE_FOLLOW_BUTTON),                            // 0
                op(Opcode.MOVE_RESULT, 0),                             // 3
                ifEqz(0, 4),                                           // 4 -> 8
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),    // 6
                op(Opcode.RETURN, 0));                                 // 7
    }

    private static ClassDef reelDeclutter() {
        return new ImmutableClassDef(REEL_DECLUTTER, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, Collections.singletonList(define(REEL_DECLUTTER,
                        "hideFollowButton", "Z", true, body(1,
                                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)))));
    }

    /** [classes] with the Follow check replaced by one whose prefix is [prefix]. */
    private static List<ClassDef> withFollowCheck(List<ClassDef> classes, List<Instruction> prefix) {
        return replaced(classes, followCheck(prefix));
    }

    /**
     * Facebook's emoji typeface provider, an instance method taking nothing: v0 free, v1 this.
     * [prefix] comes first, then the end-to-end flag and the log tag it holds, then no typeface,
     * which is what it answers before Meta's font is on the phone. Beside it, a method holding the
     * log tag without the flag, as the string table naming the provider does on 580, with
     * [tagPrefix] first. Only the flag tells them apart.
     */
    private static ClassDef emojiProvider(List<Instruction> prefix, List<Instruction> tagPrefix) {
        return new ImmutableClassDef(EMOJI_PROVIDER, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Arrays.asList(
                        define(EMOJI_PROVIDER, "emojiTypeface", TYPEFACE, false,
                                emojiBody(prefix, "fb.e2e.force_system_emoji_font", "FacebookEmojiTypefaceProviderImpl")),
                        define(EMOJI_PROVIDER, "loggedTypeface", TYPEFACE, false,
                                emojiBody(tagPrefix, "FacebookEmojiTypefaceProviderImpl"))));
    }

    /** [prefix], then each of [strings] in v0 and no typeface, in two registers with v0 free. */
    private static ImmutableMethodImplementation emojiBody(List<Instruction> prefix, String... strings) {
        List<Instruction> instructions = new ArrayList<>(prefix);
        for (String s : strings) {
            instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(s)));
        }
        instructions.add(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0));
        instructions.add(op(Opcode.RETURN_OBJECT, 0));
        return new ImmutableMethodImplementation(2, instructions, null, null);
    }

    /** What Use the phone's emoji puts first in the provider: ask, and return the answer when there is one. Facebook's own code lands at 7. */
    private static List<Instruction> emojiHook() {
        return Arrays.asList(
                invoke(SYSTEM_EMOJI_TYPEFACE),                         // 0
                op(Opcode.MOVE_RESULT_OBJECT, 0),                      // 3
                ifEqz(0, 3),                                           // 4 -> 7
                op(Opcode.RETURN_OBJECT, 0));                          // 6
    }

    private static ClassDef systemEmoji() {
        return new ImmutableClassDef(SYSTEM_EMOJI, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, Collections.singletonList(define(SYSTEM_EMOJI,
                        "typeface", TYPEFACE, true, body(1,
                                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0)))));
    }

    /** [classes] with each of [replacements] in place of the class of its type. */
    private static List<ClassDef> replaced(List<ClassDef> classes, ClassDef... replacements) {
        List<ClassDef> out = new ArrayList<>(classes);
        for (ClassDef replacement : replacements) {
            out.removeIf(cd -> cd.getType().equals(replacement.getType()));
            out.add(replacement);
        }
        return out;
    }

    /** [classes] with [extra] added to the host's class, the way a patch adds a helper to one of Facebook's. */
    private static List<ClassDef> withHostMethod(List<ClassDef> classes, Method extra) {
        List<ClassDef> out = new ArrayList<>();
        for (ClassDef cd : classes) {
            if (!cd.getType().equals(HOST)) {
                out.add(cd);
                continue;
            }
            List<Method> methods = new ArrayList<>();
            for (Method m : cd.getMethods()) methods.add(m);
            methods.add(extra);
            out.add(new ImmutableClassDef(HOST, cd.getAccessFlags(), cd.getSuperclass(), null, null, null, packedField(HOST), methods));
        }
        return out;
    }

    /**
     * [call] made on a method's parameters, the manager first: the framework's virtual call, or,
     * when [sent], the stand-in's static one, as the settings patch writes it. A method that
     * answers keeps its answer in v0, so its parameters start at v1.
     */
    private static Instruction shortcutInvoke(ShortcutCall call, boolean sent) {
        int first = call.answers.equals("V") ? 0 : 1;
        int count = call.parameters().length;
        ImmutableMethodReference callee = sent ? call.standIn() : call.framework();
        if (call.range) {
            return new ImmutableInstruction3rc(sent ? Opcode.INVOKE_STATIC_RANGE : Opcode.INVOKE_VIRTUAL_RANGE,
                    first, count, callee);
        }
        int[] r = new int[5];
        for (int i = 0; i < count; i++) r[i] = first + i;
        return new ImmutableInstruction35c(sent ? Opcode.INVOKE_STATIC : Opcode.INVOKE_VIRTUAL, count,
                r[0], r[1], r[2], r[3], r[4], callee);
    }

    /** A static method of [owner] taking what [call] takes, the manager first: [invoke], then its answer returned. */
    private static Method shortcutMethod(String owner, String name, ShortcutCall call, Instruction invoke) {
        boolean answers = !call.answers.equals("V");
        List<Instruction> instructions = new ArrayList<>();
        instructions.add(invoke);
        if (answers) {
            instructions.add(op(Opcode.MOVE_RESULT, 0));
            instructions.add(op(Opcode.RETURN, 0));
        } else {
            instructions.add(op(Opcode.RETURN_VOID));
        }
        int registers = call.parameters().length + (answers ? 1 : 0);
        return define(owner, name, call.answers, true,
                new ImmutableMethodImplementation(registers, instructions, null, null), call.parameters());
    }

    /**
     * Facebook's shortcut publisher, a static method for each call the settings patch sends to the
     * extension's stand-in. The calls named in [left] are made as Facebook makes them, the rest go
     * to the stand-ins.
     */
    private static ClassDef shortcuts(Set<String> left) {
        List<Method> methods = new ArrayList<>();
        for (ShortcutCall call : SHORTCUT_CALLS) {
            methods.add(shortcutMethod(SHORTCUTS, call.caller, call, shortcutInvoke(call, !left.contains(call.name))));
        }
        return new ImmutableClassDef(SHORTCUTS, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null, methods);
    }

    /** Every call of [SHORTCUT_CALLS] by name, which the clean build makes as Facebook does. */
    private static Set<String> allShortcutCalls() {
        Set<String> names = new LinkedHashSet<>();
        for (ShortcutCall call : SHORTCUT_CALLS) names.add(call.name);
        return names;
    }

    /**
     * The extension's stand-ins, each making the real call. The no-call rule lets its package make
     * them. The logo's stand-in, static: v0 the logo, v1 the listener it gives it.
     */
    private static ClassDef settingsEntry() {
        List<Method> methods = new ArrayList<>();
        for (ShortcutCall call : SHORTCUT_CALLS) {
            methods.add(shortcutMethod(SETTINGS_ENTRY, call.name, call, shortcutInvoke(call, false)));
        }
        methods.add(define(SETTINGS_ENTRY, "setLogoTouchListener", "V", true, body(2,
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0, SET_ON_TOUCH_LISTENER),
                op(Opcode.RETURN_VOID)), VIEW, ON_TOUCH_LISTENER));
        return new ImmutableClassDef(SETTINGS_ENTRY, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, methods);
    }

    /** A framework View call on [registers], the view first. */
    private static Instruction onView(ImmutableMethodReference call, int... registers) {
        int[] r = Arrays.copyOf(registers, 5);
        return new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, registers.length, r[0], r[1], r[2], r[3], r[4], call);
    }

    /** A touch listener call on the view in [view] with the listener in v4, Facebook's or, when [sent], the stand-in. */
    private static Instruction touchListener(boolean sent, int view) {
        return sent ? invoke(LOGO_TOUCH_STAND_IN, view, 4) : onView(SET_ON_TOUCH_LISTENER, view, 4);
    }

    /** One of the views and listeners the top bar keeps in fields. */
    private static Instruction barField(int register, String name, String type) {
        return new ImmutableInstruction22c(Opcode.IGET_OBJECT, register, 6, new ImmutableFieldReference(WORDMARK_BAR, name, type));
    }

    /**
     * A static method of Facebook's top bar giving the logo its listeners, taking a context (v5)
     * and the bar (v6) as the logo builder does: v0 takes each of [names] in turn, then v1 the
     * logo, v2 a container around it, v3 the logo's tap and v4 a touch listener, from the bar's
     * fields. It gives the container a touch listener of its own, then gives the logo its tap, its
     * touch listener and its content description, in that order, the way 573, 577 and 580 do.
     * [containerSent] and [logoSent] say which of the two touch listener calls went to the settings
     * patch's stand-in, and [logoView] the register the logo's goes to.
     */
    private static Method logoMethod(String name, List<String> names, boolean containerSent, boolean logoSent,
            int logoView) {
        List<Instruction> instructions = new ArrayList<>();
        for (String held : names) {
            instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(held)));
        }
        instructions.add(barField(1, "logo", VIEW));
        instructions.add(barField(2, "container", VIEW));
        instructions.add(barField(3, "tap", ON_CLICK_LISTENER));
        instructions.add(barField(4, "touch", ON_TOUCH_LISTENER));
        instructions.add(touchListener(containerSent, 2));
        instructions.add(onView(SET_ON_CLICK_LISTENER, 1, 3));
        instructions.add(touchListener(logoSent, logoView));
        instructions.add(onView(SET_CONTENT_DESCRIPTION, 1, 0));
        instructions.add(op(Opcode.RETURN_VOID));
        return define(TOP_BAR, name, "V", true, new ImmutableMethodImplementation(7, instructions, null, null),
                CONTEXT, WORDMARK_BAR);
    }

    /** A method of [owner] that loads [names] into v0 and returns, and takes [parameters], none wide. */
    private static Method holding(String owner, String name, boolean isStatic, List<String> names, String... parameters) {
        List<Instruction> instructions = new ArrayList<>();
        for (String held : names) {
            instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(held)));
        }
        instructions.add(op(Opcode.RETURN_VOID));
        int registers = 1 + (isStatic ? 0 : 1) + parameters.length;
        return define(owner, name, "V", isStatic, new ImmutableMethodImplementation(registers, instructions, null, null),
                parameters);
    }

    private static ClassDef topBar(boolean containerSent, boolean logoSent, int logoView) {
        return topBar(containerSent, logoSent, logoView, false, false);
    }

    /**
     * Facebook's top bar. Its logo builder is static, takes a context and the bar, and holds the
     * logo's two trace sections, with [containerSent], [logoSent] and [logoView] as logoMethod has
     * them. Facebook's bar has nothing else holding either section, but beside the builder here
     * sit three methods holding part of what the logo rule picks it by, so a rule naming less would
     * pass a hook in one of them: one of the builder's shape holding the first section alone,
     * which gives a view its tap and its touch listener as the builder does ([searchSent] sends
     * that touch listener to the stand-in), one holding both that isn't static, and one holding
     * both that takes the context alone. With [secondBuilder] a second method answers the rule.
     */
    private static ClassDef topBar(boolean containerSent, boolean logoSent, int logoView, boolean searchSent,
            boolean secondBuilder) {
        List<Method> methods = new ArrayList<>();
        methods.add(logoMethod("buildLogo", LOGO_SECTIONS, containerSent, logoSent, logoView));
        methods.add(logoMethod("buildSearch", LOGO_SECTIONS.subList(0, 1), false, searchSent, 1));
        methods.add(holding(TOP_BAR, "refreshLogo", false, LOGO_SECTIONS, CONTEXT, WORDMARK_BAR));
        methods.add(holding(TOP_BAR, "buildLogoFor", true, LOGO_SECTIONS, CONTEXT));
        if (secondBuilder) methods.add(logoMethod("buildLogoAgain", LOGO_SECTIONS, false, false, 1));
        return new ImmutableClassDef(TOP_BAR, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null, methods);
    }

    /** The batcher's flush handing the send in [runnable] to the executor in [executor], as Facebook makes the call. */
    private static Instruction execute(int executor, int runnable) {
        return new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, executor, runnable, 0, 0, 0, EXECUTE);
    }

    /** Don't send reel watch history's stand-in for that call: static, the executor first. */
    private static Instruction watchSend(int executor, int runnable) {
        return invoke(WATCH_SEND, executor, runnable);
    }

    /**
     * An instance method of the batcher taking nothing, this in v3: it loads [names] into v0, reads
     * the send it built into v1 and its executor into v2, then makes [handOver], the calls handing
     * the send over.
     */
    private static Method batcherMethod(String name, List<String> names, List<Instruction> handOver) {
        List<Instruction> instructions = new ArrayList<>();
        for (String held : names) {
            instructions.add(new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference(held)));
        }
        instructions.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 1, 3, new ImmutableFieldReference(BATCHER, "send", RUNNABLE)));
        instructions.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 2, 3, new ImmutableFieldReference(BATCHER, "executor", EXECUTOR)));
        instructions.addAll(handOver);
        instructions.add(op(Opcode.RETURN_VOID));
        return define(BATCHER, name, "V", false, new ImmutableMethodImplementation(4, instructions, null, null));
    }

    /** Facebook's call handing the batch over, as the clean build makes it. */
    private static List<Instruction> handedOver() {
        return Collections.singletonList(execute(2, 1));
    }

    /** The call as Don't send reel watch history leaves it: the stand-in, on the same registers. */
    private static List<Instruction> heldBack() {
        return Collections.singletonList(watchSend(2, 1));
    }

    /**
     * Facebook's batcher of watched reels. Its flush, an instance method taking nothing, holds the
     * mutation's name and its input field and hands the send over with [handOver]. Facebook's
     * batcher has nothing else holding either, but beside the flush here sit three methods holding
     * part of what the watch-history rule picks it by, so a rule naming less would pass a hook in
     * one of them: one taking nothing that holds the mutation's name alone and, with [describeSent],
     * hands the send to the stand-in too, one holding both that is static, and one holding both
     * that takes an int. With [secondFlush] a second method answers the rule, making Facebook's call.
     */
    private static ClassDef batcher(List<Instruction> handOver, boolean describeSent, boolean secondFlush) {
        List<Method> methods = new ArrayList<>();
        methods.add(batcherMethod("flush", SEEN_STATE, handOver));
        methods.add(batcherMethod("describe", SEEN_STATE.subList(0, 1),
                describeSent ? heldBack() : Collections.<Instruction>emptyList()));
        methods.add(holding(BATCHER, "flushAll", true, SEEN_STATE));
        methods.add(holding(BATCHER, "flushSome", false, SEEN_STATE, "I"));
        if (secondFlush) methods.add(batcherMethod("flushAgain", SEEN_STATE, handedOver()));
        return new ImmutableClassDef(BATCHER, AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null, methods);
    }

    /** The extension's stand-in, static, v0 the executor and v1 the send: it makes the real call. */
    private static ClassDef reelWatchHistory() {
        return new ImmutableClassDef(REEL_WATCH_HISTORY, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, Collections.singletonList(define(REEL_WATCH_HISTORY, "send", "V", true,
                        body(2, execute(0, 1), op(Opcode.RETURN_VOID)), EXECUTOR, RUNNABLE)));
    }

    /** [classes] with the top bar replaced by [topBar]. */
    private static List<ClassDef> withTopBar(List<ClassDef> classes, ClassDef topBar) {
        List<ClassDef> replaced = new ArrayList<>(classes);
        replaced.removeIf(cd -> cd.getType().equals(TOP_BAR));
        replaced.add(topBar);
        return replaced;
    }

    private static ClassDef cleanHost() {
        return host(feedEdge(CLEAN_FEED_EDGE), staticHost(CLEAN_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY), true);
    }

    /** Opaque black as a colour int, the value the AMOLED sweep writes. */
    private static final int BLACK = -0x1000000;

    private static final ImmutableMethodReference REUSE = method(FILTER, "reuse", "V", "I");

    /**
     * The bundle's side. reuse(I) passes its int argument's register as an object only after a
     * path through a const-string wrote an object into it, and that write sits after the use in
     * the file: a check that walked the body top to bottom instead of along its branches would
     * call a valid method wrong. nulls, longs and ints are the valid widths: a zero constant
     * passed as an object, a const-wide/32 passed as a long, a const passed as an int. joins and
     * caught are where paths meet the way ART allows: a zero that is an object on one arm and a
     * zero that is an int on the other, a conflict that is only copied, and a handler that reads
     * what its register held before the instruction that threw. reads gives each instruction the
     * conflict builds fail a value of the kind ART takes there, so a read made stricter fails too,
     * and zeros tests a zero for equality with an object and with an int, which ART allows.
     */
    private static ClassDef filter() {
        List<Method> methods = Arrays.asList(
                define(FILTER, "hideEdge", "Z", true, body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), OBJECT, OBJECT),
                define(FILTER, "inspect", "V", true, body(2, op(Opcode.RETURN_VOID)), OBJECT, OBJECT),
                define(FILTER, "hideStoriesTray", "Z", true, body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0)), "I"),
                define(FILTER, "hidePreEofReels", "Z", true, body(1,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN, 0))),
                define(FILTER, "wide", "V", true, body(2, op(Opcode.RETURN_VOID)), "J"),
                define(FILTER, "reuse", "V", true, body(1,
                        new ImmutableInstruction10t(Opcode.GOTO, 5),                            // 0 -> 5
                        invoke(INSPECT, 0, 0),                                                   // 1
                        op(Opcode.RETURN_VOID),                                                  // 4
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("edge")), // 5
                        new ImmutableInstruction10t(Opcode.GOTO, -6)), "I"),                    // 7 -> 1
                define(FILTER, "nulls", "V", true, body(1,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), invoke(INSPECT, 0, 0), op(Opcode.RETURN_VOID))),
                // The pair is broken after its last read, which is valid: only a read of it isn't.
                define(FILTER, "longs", "V", true, body(2,
                        new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), invoke(WIDE, 0, 1),
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), invoke(REUSE, 1),
                        op(Opcode.RETURN_VOID))),
                define(FILTER, "ints", "V", true, body(1,
                        new ImmutableInstruction31i(Opcode.CONST, 0, BLACK), invoke(REUSE, 0), op(Opcode.RETURN_VOID))),
                define(FILTER, "packs", "V", true, body(3, packColor(Opcode.CONST_WIDE_32, FILTER))),
                // v0 is null on one arm and the object on the other, v1 zero or one: each is still
                // its kind where the arms meet. v2 is an object on one arm and an int on the
                // other, which only a use of it would fail. A move-object and a plain move only
                // copy it, and v3 is written again before anything reads the copy.
                define(FILTER, "joins", "V", true, body(5,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                      // 0
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),                      // 1
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 2, new ImmutableStringReference("edge")), // 2
                        ifEqz(4, 5),                                                             // 4 -> 9
                        new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 4),                  // 6
                        new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                      // 7
                        new ImmutableInstruction11n(Opcode.CONST_4, 2, 1),                      // 8
                        invoke(INSPECT, 0, 0),                                                   // 9
                        invoke(REUSE, 1),                                                        // 12
                        new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 3, 2),                  // 15
                        new ImmutableInstruction12x(Opcode.MOVE, 3, 2),                         // 16
                        new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),                      // 17
                        op(Opcode.RETURN_VOID)), OBJECT),                                        // 18
                // The const-string can throw, and its handler reads v0 as the int it held before
                // the const-string wrote an object there, which is all ART's handler sees.
                define(FILTER, "caught", "V", true, body(2, Collections.singletonList(tryBlock(1, 2, 7)),
                        new ImmutableInstruction12x(Opcode.MOVE, 0, 1),                         // 0
                        new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("edge")), // 1
                        invoke(INSPECT, 0, 0),                                                   // 3
                        op(Opcode.RETURN_VOID),                                                  // 6
                        op(Opcode.MOVE_EXCEPTION, 1),                                            // 7
                        invoke(REUSE, 0),                                                        // 8
                        op(Opcode.RETURN_VOID)), "I"),                                           // 11
                // v4 the object, v5 the int: objects and ints tested for equality, an int ordered,
                // tested against zero and switched on, an object locked, cast and tested, an int
                // as a new array's size, the array measured and filled, ints and an object as a
                // new array's elements, and a null thrown.
                define(FILTER, "reads", "V", true, body(6,
                        new ImmutableInstruction22t(Opcode.IF_EQ, 4, 4, 3),                      // 0 -> 3
                        op(Opcode.NOP),                                                          // 2
                        new ImmutableInstruction22t(Opcode.IF_NE, 5, 5, 3),                      // 3 -> 6
                        op(Opcode.NOP),                                                          // 5
                        new ImmutableInstruction22t(Opcode.IF_LT, 5, 5, 3),                      // 6 -> 9
                        op(Opcode.NOP),                                                          // 8
                        new ImmutableInstruction21t(Opcode.IF_NEZ, 5, 3),                        // 9 -> 12
                        op(Opcode.NOP),                                                          // 11
                        new ImmutableInstruction21t(Opcode.IF_GEZ, 5, 3),                        // 12 -> 15
                        op(Opcode.NOP),                                                          // 14
                        op(Opcode.MONITOR_ENTER, 4),                                             // 15
                        op(Opcode.MONITOR_EXIT, 4),                                              // 16
                        new ImmutableInstruction21c(Opcode.CHECK_CAST, 4, STRING_TYPE),          // 17
                        new ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 4, STRING_TYPE),      // 19
                        new ImmutableInstruction22c(Opcode.NEW_ARRAY, 1, 5, INT_ARRAY),          // 21
                        new ImmutableInstruction12x(Opcode.ARRAY_LENGTH, 2, 1),                  // 23
                        new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 1, 14),              // 24 -> 38
                        filledNewArray(INT_ARRAY, 5, 0),                                         // 27
                        filledNewArray(OBJECT_ARRAY, 4),                                         // 30
                        new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 5, 11),                // 33 -> 44
                        new ImmutableInstruction11n(Opcode.CONST_4, 3, 0),                       // 36
                        op(Opcode.THROW, 3),                                                     // 37
                        oneInt(),                                                                // 38
                        new ImmutablePackedSwitchPayload(Collections.singletonList(              // 44
                                new ImmutableSwitchElement(0, 3)))), OBJECT, "I"),
                // A zero tested for equality with the object v1 and with the int v2, each from
                // either side. A zero stands for either, so none of these pairs is the mismatch
                // an int and an object are.
                define(FILTER, "zeros", "V", true, body(3,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                       // 0
                        new ImmutableInstruction22t(Opcode.IF_EQ, 0, 1, 3),                      // 1 -> 4
                        op(Opcode.NOP),                                                          // 3
                        new ImmutableInstruction22t(Opcode.IF_NE, 1, 0, 3),                      // 4 -> 7
                        op(Opcode.NOP),                                                          // 6
                        new ImmutableInstruction22t(Opcode.IF_EQ, 0, 2, 3),                      // 7 -> 10
                        op(Opcode.NOP),                                                          // 9
                        new ImmutableInstruction22t(Opcode.IF_NE, 2, 0, 3),                      // 10 -> 13
                        op(Opcode.NOP),                                                          // 12
                        op(Opcode.RETURN_VOID)), OBJECT, "I"));                                  // 13
        return new ImmutableClassDef(FILTER, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, packedField(FILTER), methods);
    }

    private static ClassDef secondary() {
        return new ImmutableClassDef("Lfixture/Secondary;", AccessFlags.PUBLIC.getValue(), OBJECT, null, null, null, null,
                Collections.singletonList(define("Lfixture/Secondary;", "kept", "V", true, body(0, op(Opcode.RETURN_VOID)))));
    }

    private static List<ClassDef> patched(Method feedEdge, Method staticHost, Method switchHost, Method tryHost) {
        return bundle(host(feedEdge, staticHost, switchHost, tryHost, true));
    }

    /** A patched build: [host] and the bundle's own classes, both stubs filled. */
    private static List<ClassDef> bundle(ClassDef host) {
        return bundle(host, stub(GENAI_LABEL, "detectedInfo", FILLED_STUB),
                stub(RECOMMENDATION_LABEL, "recommendationContext", FILLED_STUB));
    }

    private static List<ClassDef> bundle(ClassDef host, ClassDef genAiLabel, ClassDef recommendationLabel) {
        return bundle(host, genAiLabel, recommendationLabel, hookedAdapters());
    }

    private static List<ClassDef> bundle(ClassDef host, ClassDef genAiLabel, ClassDef recommendationLabel,
            ClassDef adapters) {
        return bundle(host, genAiLabel, recommendationLabel, adapters,
                stub(SHOWCASE_TYPE, "storyType", FILLED_SHOWCASE_STUB), preEof(preEofHook()));
    }

    /** A patched build with the reels patch's two changes passed in too, and the showcase unit. */
    private static List<ClassDef> bundle(ClassDef host, ClassDef genAiLabel, ClassDef recommendationLabel,
            ClassDef adapters, ClassDef showcaseType, ClassDef preEof) {
        return Arrays.asList(host, adapters, trayController(Collections.<Instruction>emptyList()), filter(), genAiLabel,
                recommendationLabel, showcaseUnit(), showcaseType, preEof, returnController(returnHook()), returnRefresh(),
                shortcuts(Collections.<String>emptySet()), settingsEntry(), followCheck(followHook()), reelDeclutter(),
                topBar(false, true, 1), finderStub(FILLED_FINDER_STUB),
                emojiProvider(emojiHook(), Collections.<Instruction>emptyList()), systemEmoji(),
                batcher(heldBack(), false, false), reelWatchHistory());
    }

    /** The clean host, Facebook's classes as they ship, with the batcher's flush making [handOver]. */
    private static List<ClassDef> clean(List<Instruction> handOver) {
        return Arrays.asList(cleanHost(), cleanAdapters(), trayController(Collections.<Instruction>emptyList()),
                showcaseUnit(), preEof(Collections.<Instruction>emptyList()), returnController(Collections.<Instruction>emptyList()),
                shortcuts(allShortcutCalls()), followCheck(Collections.<Instruction>emptyList()),
                topBar(false, false, 1),
                emojiProvider(Collections.<Instruction>emptyList(), Collections.<Instruction>emptyList()),
                batcher(handOver, false, false));
    }

    /**
     * The GenAI reel stub, {@code static Object transparencyAttribution(Object, String)}: the model
     * and the type name, and no local, as R8 compiles it.
     */
    private static ClassDef finderStub(ImmutableMethodImplementation implementation) {
        return new ImmutableClassDef(GENAI_REEL_FILTER, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(),
                OBJECT, null, null, null, null, Collections.singletonList(define(GENAI_REEL_FILTER,
                        "transparencyAttribution", OBJECT, true, implementation, OBJECT, "Ljava/lang/String;")));
    }

    /** What the GenAI patch writes: the model cast, both parameters handed to Facebook's finder as a range. */
    private static final ImmutableMethodImplementation FILLED_FINDER_STUB = body(2,
            new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, new ImmutableTypeReference(REEL_MODEL)),
            new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2, ATTRIBUTION_FINDER),
            op(Opcode.MOVE_RESULT_OBJECT, 0),
            op(Opcode.RETURN_OBJECT, 0));

    /** The stub as the extension ships it, given a local for its marker: no call at all. */
    private static final ImmutableMethodImplementation UNFILLED_FINDER_STUB = body(3,
            new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0));

    /** [classes] with the GenAI reel stub replaced by one of [implementation]. */
    private static List<ClassDef> withFinderStub(List<ClassDef> classes, ImmutableMethodImplementation implementation) {
        List<ClassDef> replaced = new ArrayList<>(classes);
        replaced.removeIf(cd -> cd.getType().equals(GENAI_REEL_FILTER));
        replaced.add(finderStub(implementation));
        return replaced;
    }

    /** A patched build that breaks only the reels patch's changes, as [showcaseType] and [preEof]. */
    private static List<ClassDef> reelsBundle(ClassDef showcaseType, ClassDef preEof) {
        return bundle(host(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST), switchHost(7),
                tryHost(CLEAN_TRY), true), stub(GENAI_LABEL, "detectedInfo", FILLED_STUB),
                stub(RECOMMENDATION_LABEL, "recommendationContext", FILLED_STUB), hookedAdapters(), showcaseType, preEof);
    }

    /**
     * An extension stub, {@code static Object name(Object)}: v0 free, v1 the story. The patch fills
     * it by putting a call to the story's accessor first.
     */
    private static ClassDef stub(String owner, String name, ImmutableMethodImplementation implementation) {
        return new ImmutableClassDef(owner, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT,
                null, null, null, null,
                Collections.singletonList(define(owner, name, OBJECT, true, implementation, OBJECT)));
    }

    /** What the patches write: the story cast, its accessor called, its answer returned. */
    private static final ImmutableMethodImplementation FILLED_STUB = body(2,
            new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(STORY)),
            new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0, STORY_ACCESSOR),
            op(Opcode.MOVE_RESULT_OBJECT, 1),
            op(Opcode.RETURN_OBJECT, 1));

    /** What the reels patch writes: the unit cast to the showcase class, its accessor called. */
    private static final ImmutableMethodImplementation FILLED_SHOWCASE_STUB = body(2,
            new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(SHOWCASE)),
            new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0, SHOWCASE_ACCESSOR),
            op(Opcode.MOVE_RESULT_OBJECT, 1),
            op(Opcode.RETURN_OBJECT, 1));

    /** The stub as the extension ships it: a marker answered, no call. */
    private static final ImmutableMethodImplementation UNFILLED_STUB = body(2,
            new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), op(Opcode.RETURN_OBJECT, 0));

    private static List<ClassDef> good() {
        return patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withStaticHost(ImmutableMethodImplementation implementation) {
        return patched(feedEdge(GUARDED_FEED_EDGE), staticHost(implementation), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withFeedEdge(ImmutableMethodImplementation implementation) {
        return patched(feedEdge(implementation), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost(CLEAN_TRY));
    }

    private static List<ClassDef> withTry(ImmutableTryBlock block) {
        return withTryHost(tryHost(block));
    }

    private static List<ClassDef> withTryHost(Method tryHost) {
        return patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST), switchHost(7), tryHost);
    }

    /**
     * staticHost with v0 an object on one arm of a branch and an int on the other, which ART merges
     * into a conflict where the arms meet at 5, and [then] from there. v1 and v2 are free, v3 is
     * the object argument, and the long sits in v4 and v5.
     */
    private static List<ClassDef> conflictThen(Instruction... then) {
        List<Instruction> instructions = new ArrayList<>(Arrays.asList(
                new ImmutableInstruction21c(Opcode.CONST_STRING, 0, new ImmutableStringReference("edge")), // 0
                ifEqz(3, 3),                                                                              // 2 -> 5
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1)));                                      // 4
        instructions.addAll(Arrays.asList(then));
        return withStaticHost(new ImmutableMethodImplementation(6, instructions, null, null));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("usage: BadDexFixture <outDir>");
            System.exit(2);
        }
        File out = new File(args[0]);
        if (!out.isDirectory() && !out.mkdirs()) throw new IllegalStateException("Cannot create " + out);

        Map<String, List<ClassDef>> dexes = new LinkedHashMap<>();
        dexes.put("clean", clean(handedOver()));
        // A clean build whose flush hands nothing over, so there is no call for the watch-history
        // hook to have taken the place of.
        dexes.put("clean-no-hand-over", clean(Collections.<Instruction>emptyList()));
        dexes.put("secondary", Collections.singletonList(secondary()));
        dexes.put("good", good());
        List<ClassDef> goodWithSecondary = new ArrayList<>(good());
        goodWithSecondary.add(secondary());
        dexes.put("good-with-secondary", goodWithSecondary);
        dexes.put("removed-method", bundle(host(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(7), tryHost(CLEAN_TRY), false)));

        // branch: the guard's if-eqz jumps back into the middle of its own invoke.
        dexes.put("bad-branch", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, -3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard's if-eqz jumps to itself.
        dexes.put("bad-branch-self", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 0),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard's if-eqz jumps back onto its own move-result.
        dexes.put("bad-branch-to-result", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, -1),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // branch: the guard with its last return-void nopped, so the kept path runs off the end.
        dexes.put("bad-walk-off-end", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3),
                op(Opcode.RETURN_VOID), op(Opcode.NOP))));
        // branch: the try path jumps onto the handler's move-exception.
        dexes.put("bad-goto-to-handler", withTryHost(tryHost(CLEAN_TRY, new ImmutableInstruction10t(Opcode.GOTO, 1))));
        // try: the try path falls straight into the handler's move-exception.
        dexes.put("bad-fallthrough-handler", withTryHost(tryHost(CLEAN_TRY, op(Opcode.NOP))));
        // width: a patch borrows v2 as a free local, but it is the upper half of the long argument.
        dexes.put("bad-wide-high-clobber", withStaticHost(body(3,
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0), invoke(INSPECT, 0, 0), invoke(WIDE, 1, 2),
                op(Opcode.RETURN_VOID))));
        // width: the same borrow on one arm of a branch only, and the long read where the arms
        // meet. ART merges the upper half with the zero into a conflict there.
        dexes.put("bad-wide-high-clobber-branch", withStaticHost(body(3,
                ifEqz(0, 3),                                        // 0 -> 3
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),  // 2
                invoke(INSPECT, 0, 0),                              // 3
                invoke(WIDE, 1, 2),                                 // 6
                op(Opcode.RETURN_VOID))));                          // 9
        // width: the long read at a loop's head, and the borrow on the edge back to it.
        dexes.put("bad-wide-high-clobber-loop", withStaticHost(body(3,
                invoke(WIDE, 1, 2),                                 // 0
                ifEqz(0, 4),                                        // 3 -> 7
                new ImmutableInstruction11n(Opcode.CONST_4, 2, 0),  // 5
                new ImmutableInstruction10t(Opcode.GOTO, -6),       // 6 -> 0
                op(Opcode.RETURN_VOID))));                          // 7
        // width: a patch borrows v1, the lower half of the long argument, and passes the upper
        // half on as an int.
        dexes.put("bad-wide-low-clobber", withStaticHost(body(3,
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), invoke(REUSE, 2), op(Opcode.RETURN_VOID))));
        // width: a const-wide lands one register below the long argument, on v1 and v2, which
        // leaves v3 the upper half of a pair that no longer has a lower half. v1 is the object
        // argument here, and the long sits in v2 and v3.
        dexes.put("bad-wide-below-pair", withStaticHost(body(4,
                new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, 0), invoke(REUSE, 3), op(Opcode.RETURN_VOID))));
        // branch: case 1 lands inside the packed-switch instruction itself.
        dexes.put("bad-switch-case", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(2), tryHost(CLEAN_TRY)));
        // branch: case 1 lands on the switch's own payload, which ART reaches as data.
        dexes.put("bad-switch-to-payload", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(10), tryHost(CLEAN_TRY)));
        // branch: case 1 lands on a move-result, cut off from the invoke it takes its result from.
        dexes.put("bad-switch-to-result", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchToResult(), tryHost(CLEAN_TRY)));
        // branch: the no-case path jumps into the switch's payload.
        dexes.put("bad-goto-to-payload", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(7, new ImmutableInstruction10t(Opcode.GOTO, 6)), tryHost(CLEAN_TRY)));
        // branch: a goto sent to a fill-array-data payload instead of the return before it.
        dexes.put("bad-goto-to-array-payload", withStaticHost(body(5,
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                                 // 0
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 0, 1, INT_ARRAY),                    // 1
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),                         // 3 -> 8
                new ImmutableInstruction10t(Opcode.GOTO, 2),                                       // 6 -> 8
                op(Opcode.RETURN_VOID),                                                            // 7
                oneInt())));                                                                       // 8
        // branch: a switch case sent to a fill-array-data payload.
        dexes.put("bad-switch-to-array-payload", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchToArrayPayload(), tryHost(CLEAN_TRY)));
        // branch: a sparse switch's case sent to its own payload.
        dexes.put("bad-sparse-case-to-payload", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                sparseSwitchToOwnPayload(), tryHost(CLEAN_TRY)));
        // branch: a packed-switch pointed at a sparse-switch table, and a sparse-switch at a
        // packed-switch table, with every case landing on an instruction.
        dexes.put("bad-packed-switch-sparse-table", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchWithTable(Opcode.PACKED_SWITCH, new ImmutableSparseSwitchPayload(twoCases())), tryHost(CLEAN_TRY)));
        dexes.put("bad-sparse-switch-packed-table", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchWithTable(Opcode.SPARSE_SWITCH, new ImmutablePackedSwitchPayload(twoCases())), tryHost(CLEAN_TRY)));
        // branch: case 1 sent to the nop that aligns the payload, which falls into the table.
        dexes.put("bad-fallthrough-into-payload", patched(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(9), tryHost(CLEAN_TRY)));
        // branch: a method that starts at a payload, which its entry runs into.
        dexes.put("bad-payload-at-entry", withStaticHost(body(3, oneInt())));
        // invoke: one register for a callee that takes two.
        dexes.put("bad-invoke-count", withStaticHost(body(3,
                invoke(INSPECT, 0), invoke(WIDE, 1, 2), op(Opcode.RETURN_VOID))));
        // invoke: the long's halves passed as v1 and v0, not a pair.
        dexes.put("bad-wide-split", withStaticHost(body(3,
                invoke(INSPECT, 0, 0), invoke(WIDE, 1, 0), op(Opcode.RETURN_VOID))));
        // parameter: written as if the method had a this, so p1 is taken for the object; in a
        // static method it is the low half of the long.
        dexes.put("bad-static-parameter", withStaticHost(body(3,
                invoke(INSPECT, 0, 1), invoke(WIDE, 1, 2), op(Opcode.RETURN_VOID))));
        // parameter: the upper half of the long read as an object.
        dexes.put("bad-wide-parameter", withStaticHost(body(4,
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 0, 3),
                invoke(INSPECT, 1, 0), invoke(WIDE, 2, 3), op(Opcode.RETURN_VOID))));
        // width: the AMOLED sweep's shape on 580, a narrow const where a const-wide/32 was,
        // then read as a long. v0 and v1 are locals here, so this is the body's width, not the
        // parameter layout.
        dexes.put("bad-narrow-for-wide", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST, 0, BLACK), invoke(WIDE, 0, 1), op(Opcode.RETURN_VOID))));
        // width: the same narrow const on one arm of a branch only. Where the arms meet, v0 is a
        // long on one path and an int on the other, which ART merges into a conflict.
        dexes.put("bad-narrow-for-wide-branch", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), // 0
                ifEqz(2, 5),                                                 // 3 -> 8
                new ImmutableInstruction31i(Opcode.CONST, 0, BLACK),         // 5
                invoke(WIDE, 0, 1),                                          // 8
                op(Opcode.RETURN_VOID))));                                   // 11
        // width: 580's own static initializer, a narrow const shifted as a long and stored.
        // v0 to v2 are locals, the arguments sit in v3 to v5.
        dexes.put("bad-narrow-shift", withStaticHost(body(6, packColor(Opcode.CONST, HOST))));
        // width: the reverse, a const-wide/32 passed where an int goes.
        dexes.put("bad-wide-for-narrow", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK), invoke(REUSE, 0), op(Opcode.RETURN_VOID))));
        // width: a conflict read by each instruction that takes a value, one build each: tested
        // against zero, tested for equality, ordered, switched on, locked, thrown, cast, tested for
        // a type, measured, used as a new array's size and as its element, and filled. ART's
        // verifier fails every one of these reads of a conflict.
        dexes.put("bad-conflict-if-eqz", conflictThen(
                ifEqz(0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));                    // 5 -> 8
        dexes.put("bad-conflict-if-ne", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_NE, 0, 3, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-lt", conflictThen(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction22t(Opcode.IF_LT, 0, 1, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-switch", conflictThen(
                new ImmutableInstruction31t(Opcode.PACKED_SWITCH, 0, 5),                           // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                new ImmutablePackedSwitchPayload(Collections.singletonList(                        // 10
                        new ImmutableSwitchElement(0, 3)))));
        dexes.put("bad-conflict-monitor-enter", conflictThen(op(Opcode.MONITOR_ENTER, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-throw", conflictThen(op(Opcode.THROW, 0)));
        dexes.put("bad-conflict-check-cast", conflictThen(
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 0, STRING_TYPE), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-instance-of", conflictThen(
                new ImmutableInstruction22c(Opcode.INSTANCE_OF, 1, 0, STRING_TYPE), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-array-length", conflictThen(
                new ImmutableInstruction12x(Opcode.ARRAY_LENGTH, 1, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-new-array", conflictThen(
                new ImmutableInstruction22c(Opcode.NEW_ARRAY, 1, 0, INT_ARRAY), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-filled-new-array", conflictThen(filledNewArray(INT_ARRAY, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-fill-array-data", conflictThen(
                new ImmutableInstruction31t(Opcode.FILL_ARRAY_DATA, 0, 5),                         // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                oneInt()));                                                                        // 10
        // The same conflict where each of the other readers takes it: the other test against
        // zero, an equality test in either register, an ordering against zero, the second
        // register of an ordering, a sparse switch, the unlock, and a range-built array.
        dexes.put("bad-conflict-if-nez", conflictThen(
                new ImmutableInstruction21t(Opcode.IF_NEZ, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-eq", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_EQ, 0, 3, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-eq-second", conflictThen(
                new ImmutableInstruction22t(Opcode.IF_EQ, 3, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-gez", conflictThen(
                new ImmutableInstruction21t(Opcode.IF_GEZ, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-if-lt-second", conflictThen(new ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                new ImmutableInstruction22t(Opcode.IF_LT, 1, 0, 3), op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-sparse-switch", conflictThen(
                new ImmutableInstruction31t(Opcode.SPARSE_SWITCH, 0, 5),                           // 5 -> 10
                op(Opcode.RETURN_VOID),                                                            // 8
                op(Opcode.NOP),                                                                    // 9, aligns the payload
                new ImmutableSparseSwitchPayload(Collections.singletonList(                        // 10
                        new ImmutableSwitchElement(0, 3)))));
        dexes.put("bad-conflict-monitor-exit", conflictThen(op(Opcode.MONITOR_EXIT, 0), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-filled-new-array-range", conflictThen(
                new ImmutableInstruction3rc(Opcode.FILLED_NEW_ARRAY_RANGE, 0, 1, INT_ARRAY), op(Opcode.RETURN_VOID)));
        // width: the upper half of a long whose lower half was overwritten, tested against zero.
        dexes.put("bad-broken-high-if-eqz", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 3, v1 is left a lone upper half
                ifEqz(1, 3),                                                                       // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: an int, risky()'s result, tested for equality with the object argument, and the
        // same pair the other way round. Each register is something an equality test takes, but
        // ART wants two objects or two narrow values.
        dexes.put("bad-if-eq-int-object", withStaticHost(body(5,
                invoke(RISKY),                                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                                         // 3
                new ImmutableInstruction22t(Opcode.IF_EQ, 0, 2, 3),                                // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        dexes.put("bad-if-ne-object-int", withStaticHost(body(5,
                invoke(RISKY),                                                                     // 0
                op(Opcode.MOVE_RESULT, 0),                                                         // 3
                new ImmutableInstruction22t(Opcode.IF_NE, 2, 0, 3),                                // 4 -> 7
                op(Opcode.RETURN_VOID),                                                            // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: a long tested against zero, which takes a narrow value or an object.
        dexes.put("bad-wide-if-eqz", withStaticHost(body(5,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(0, 3),                                                                       // 3 -> 6
                op(Opcode.RETURN_VOID),                                                            // 5
                op(Opcode.RETURN_VOID))));                                                         // 6
        // width: a long whose upper half was overwritten on one arm, and its lower half moved
        // where the arms meet. A pair broken on one path stays broken: ART still holds a low half
        // there, which a move may not copy, where a conflict would be copied without complaint.
        dexes.put("bad-broken-low-move", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 1, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE, 2, 0),                                    // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: the same with the lower half overwritten, and the upper half moved.
        dexes.put("bad-broken-high-move", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE, 2, 1),                                    // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // width: a conflict copied by move-object, which ART allows, and the copy passed on as an
        // object, which it doesn't. Then a plain move's copy passed on as an int.
        dexes.put("bad-conflict-object-copy", conflictThen(
                new ImmutableInstruction12x(Opcode.MOVE_OBJECT, 1, 0), invoke(INSPECT, 1, 3), op(Opcode.RETURN_VOID)));
        dexes.put("bad-conflict-plain-copy", conflictThen(
                new ImmutableInstruction12x(Opcode.MOVE, 1, 0), invoke(REUSE, 1), op(Opcode.RETURN_VOID)));
        // width: a zero on one arm where the other has a long, read as a long. A zero joins an
        // object or a narrow value, and ART merges it with a low half into a conflict.
        dexes.put("bad-zero-for-wide-branch", withStaticHost(body(6,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(3, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),                                 // 5
                invoke(WIDE, 0, 1),                                                                // 6
                op(Opcode.RETURN_VOID))));                                                         // 9
        // width: move-wide of a conflict. A narrow or object move may copy one, and a wide move
        // may not, since ART checks the pair it copies.
        dexes.put("bad-move-wide-conflict", withStaticHost(body(7,
                new ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, BLACK),                       // 0
                ifEqz(4, 3),                                                                       // 3 -> 6
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),                                 // 5
                new ImmutableInstruction12x(Opcode.MOVE_WIDE, 2, 0),                               // 6
                op(Opcode.RETURN_VOID))));                                                         // 7
        // result: a nop injected between the guard's invoke and its move-result.
        dexes.put("bad-move-result", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.NOP), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));
        // try: the range starts inside the invoke it means to cover.
        dexes.put("bad-try-range", withTry(tryBlock(1, 2, 5)));
        // try: the handler starts inside the invoke.
        dexes.put("bad-try-handler", withTry(tryBlock(0, 3, 2)));
        // try: the handler starts at the invoke's move-result.
        dexes.put("bad-try-handler-result", withTry(tryBlock(0, 3, 3)));
        // try: the handler starts at a switch payload.
        dexes.put("bad-try-handler-payload", withTryHost(tryHandlerAtPayload()));
        // try: the handler starts at a fill-array-data payload.
        dexes.put("bad-try-handler-array-payload", withTryHost(tryHandlerAtArrayPayload()));
        // try: the handler's move-exception is the method's first instruction, which the entry reaches.
        dexes.put("bad-move-exception-entry", withTryHost(moveExceptionAtEntry()));
        // contract: two guards stacked on the feed method.
        dexes.put("bad-double-guard", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3), op(Opcode.RETURN_VOID),
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 0), ifEqz(0, 3), op(Opcode.RETURN_VOID),
                op(Opcode.RETURN_VOID))));
        // contract: the guard on another method, and the feed method left alone.
        dexes.put("bad-guard-elsewhere", patched(feedEdge(CLEAN_FEED_EDGE), staticHost(body(3,
                invoke(HIDE_EDGE, 0, 0), op(Opcode.MOVE_RESULT, 0), invoke(WIDE, 1, 2), op(Opcode.RETURN_VOID))),
                switchHost(7), tryHost(CLEAN_TRY)));
        // contract: no guard at all.
        dexes.put("bad-no-guard", patched(feedEdge(CLEAN_FEED_EDGE), staticHost(GOOD_STATIC_HOST),
                switchHost(7), tryHost(CLEAN_TRY)));
        ClassDef goodHost = host(feedEdge(GUARDED_FEED_EDGE), staticHost(GOOD_STATIC_HOST), switchHost(7),
                tryHost(CLEAN_TRY), true);
        ClassDef filledRecommendation = stub(RECOMMENDATION_LABEL, "recommendationContext", FILLED_STUB);
        // contract: the GenAI stub left as the extension ships it, answering its marker.
        dexes.put("bad-stub-not-filled", bundle(goodHost, stub(GENAI_LABEL, "detectedInfo", UNFILLED_STUB),
                filledRecommendation));
        // contract: the recommendation stub calling a no-argument method, but not the story's.
        dexes.put("bad-stub-other-class", bundle(goodHost, stub(GENAI_LABEL, "detectedInfo", FILLED_STUB),
                stub(RECOMMENDATION_LABEL, "recommendationContext", body(2,
                        new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, method(MODEL, "A0X", MODEL)),
                        op(Opcode.MOVE_RESULT_OBJECT, 1),
                        op(Opcode.RETURN_OBJECT, 1)))));
        // contract: the unified tray adapter left without the tray patch's call.
        ClassDef filledGenAi = stub(GENAI_LABEL, "detectedInfo", FILLED_STUB);
        dexes.put("bad-tray-hook-missing", bundle(goodHost, filledGenAi, filledRecommendation,
                adapters(trayHook(0), Collections.<Instruction>emptyList())));
        // contract: the classic tray adapter's call after a branch, not first.
        List<Instruction> late = new ArrayList<>();
        late.add(ifEqz(1, 3));                                            // 0 -> 3
        late.add(op(Opcode.NOP));                                         // 2
        late.addAll(trayHook(0));                                         // 3
        dexes.put("bad-tray-hook-late", bundle(goodHost, filledGenAi, filledRecommendation,
                adapters(late, trayHook(1))));
        // contract: the story's accessor called only after the stub has already returned.
        dexes.put("bad-stub-call-after-return", bundle(goodHost, stub(GENAI_LABEL, "detectedInfo", body(2,
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                        op(Opcode.RETURN_OBJECT, 0),
                        new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(STORY)),
                        new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0, STORY_ACCESSOR),
                        op(Opcode.MOVE_RESULT_OBJECT, 1),
                        op(Opcode.RETURN_OBJECT, 1))),
                filledRecommendation));

        ClassDef filledShowcase = stub(SHOWCASE_TYPE, "storyType", FILLED_SHOWCASE_STUB);
        // contract: the pre-EOF injector left without the reels patch's call, the hook deleted.
        dexes.put("bad-preeof-hook-missing", reelsBundle(filledShowcase, preEof(Collections.<Instruction>emptyList())));
        // contract: the injector's call after a branch, not first.
        List<Instruction> lateHook = new ArrayList<>();
        lateHook.add(ifEqz(1, 3));                                        // 0 -> 3
        lateHook.add(op(Opcode.NOP));                                     // 2
        lateHook.addAll(preEofHook());                                    // 3
        dexes.put("bad-preeof-hook-late", reelsBundle(filledShowcase, preEof(lateHook)));
        // contract: the showcase stub left as the extension ships it, answering its marker.
        dexes.put("bad-showcase-stub-not-filled", reelsBundle(stub(SHOWCASE_TYPE, "storyType", UNFILLED_STUB),
                preEof(preEofHook())));
        // contract: the showcase stub calling a no-argument method of a class that isn't the showcase one.
        dexes.put("bad-showcase-stub-other-class", reelsBundle(stub(SHOWCASE_TYPE, "storyType", FILLED_STUB),
                preEof(preEofHook())));
        // contract: a second class answering the showcase type name, so the stub's class isn't the only one.
        List<ClassDef> twoShowcases = new ArrayList<>(reelsBundle(filledShowcase, preEof(preEofHook())));
        twoShowcases.add(showcaseUnit("Lfixture/OtherShowcase;", "ShowcaseFeedUnit"));
        dexes.put("bad-showcase-two-classes", twoShowcases);

        List<ClassDef> missingReturnHook = new ArrayList<>(good());
        missingReturnHook.removeIf(cd -> cd.getType().equals(RETURN_CONTROLLER));
        missingReturnHook.add(returnController(Collections.<Instruction>emptyList()));
        dexes.put("bad-return-refresh-hook-missing", missingReturnHook);

        List<Instruction> lateReturnHook = new ArrayList<>();
        lateReturnHook.add(ifEqz(2, 3));
        lateReturnHook.add(op(Opcode.NOP));
        lateReturnHook.addAll(returnHook());
        List<ClassDef> lateReturn = new ArrayList<>(good());
        lateReturn.removeIf(cd -> cd.getType().equals(RETURN_CONTROLLER));
        lateReturn.add(returnController(lateReturnHook));
        dexes.put("bad-return-refresh-hook-late", lateReturn);

        // contract: the Follow check left without Clean up Reels' call, the hook deleted.
        dexes.put("bad-follow-hook-missing", withFollowCheck(good(), Collections.<Instruction>emptyList()));
        // contract: the check's call after a branch on the session, not first.
        List<Instruction> lateFollowHook = new ArrayList<>();
        lateFollowHook.add(ifEqz(1, 3));                                  // 0 -> 3
        lateFollowHook.add(op(Opcode.NOP));                               // 2
        lateFollowHook.addAll(followHook());                              // 3
        dexes.put("bad-follow-hook-late", withFollowCheck(good(), lateFollowHook));

        // contract: the emoji provider left without Use the phone's emoji's call, the hook deleted.
        dexes.put("bad-emoji-hook-missing", replaced(good(),
                emojiProvider(Collections.<Instruction>emptyList(), Collections.<Instruction>emptyList())));
        // contract: the provider's call after a branch on this, not first.
        List<Instruction> lateEmojiHook = new ArrayList<>();
        lateEmojiHook.add(ifEqz(1, 3));                                   // 0 -> 3
        lateEmojiHook.add(op(Opcode.NOP));                                // 2
        lateEmojiHook.addAll(emojiHook());                                // 3
        dexes.put("bad-emoji-hook-late", replaced(good(),
                emojiProvider(lateEmojiHook, Collections.<Instruction>emptyList())));

        // contract: the GenAI reel stub left as the extension ships it, answering its marker.
        dexes.put("bad-finder-stub-not-filled", withFinderStub(good(), UNFILLED_FINDER_STUB));
        // contract: the stub filled with a call that never leaves the extension, not Facebook's finder.
        dexes.put("bad-finder-stub-extension-call", withFinderStub(good(), body(3,
                invoke(method(GENAI_LABEL, "detectedInfo", OBJECT, OBJECT), 1),
                op(Opcode.MOVE_RESULT_OBJECT, 0),
                op(Opcode.RETURN_OBJECT, 0))));
        // contract: Facebook's finder called only after the stub has already returned.
        dexes.put("bad-finder-stub-call-after-return", withFinderStub(good(), body(3,
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                op(Opcode.RETURN_OBJECT, 0),
                new ImmutableInstruction21c(Opcode.CHECK_CAST, 1, new ImmutableTypeReference(REEL_MODEL)),
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 2, ATTRIBUTION_FINDER),
                op(Opcode.MOVE_RESULT_OBJECT, 1),
                op(Opcode.RETURN_OBJECT, 1))));

        // contract: one of Facebook's shortcut calls left as it was, not sent to the extension's
        // stand-in, one build for each call. The other four go to theirs.
        for (ShortcutCall call : SHORTCUT_CALLS) {
            List<ClassDef> shortcutLeft = new ArrayList<>(good());
            shortcutLeft.removeIf(cd -> cd.getType().equals(SHORTCUTS));
            shortcutLeft.add(shortcuts(Collections.singleton(call.name)));
            dexes.put("bad-shortcut-" + call.caseName + "-left", shortcutLeft);
        }

        // contract: the logo's touch listener call left as Facebook makes it, so the long press
        // does nothing.
        dexes.put("bad-logo-hook-missing", withTopBar(good(), topBar(false, false, 1)));
        // contract: the stand-in sent in place of the container's touch listener call instead, and
        // the logo's left alone. It isn't right after the logo's tap.
        dexes.put("bad-logo-hook-other-call", withTopBar(good(), topBar(true, false, 1)));
        // contract: the stand-in right after the logo's tap, but made on the container's register,
        // so the container takes the long press and the logo loses its touch listener.
        dexes.put("bad-logo-hook-other-view", withTopBar(good(), topBar(false, true, 2)));
        // contract: both touch listener calls sent, so the container takes a long press too.
        dexes.put("bad-logo-hook-twice", withTopBar(good(), topBar(true, true, 1)));
        // contract: the stand-in right after a tap, on the same view, but in a method holding the
        // logo's first trace section alone, and the builder left as Facebook has it. The rule
        // named that one section and counted calls in any method holding it, so this passed.
        dexes.put("bad-logo-hook-decoy", withTopBar(good(), topBar(false, false, 1, true, false)));
        // contract: the stand-in in the builder and in that other method too.
        dexes.put("bad-logo-hook-also-elsewhere", withTopBar(good(), topBar(false, true, 1, true, false)));
        // contract: a second method answering the logo rule, so it can't say which one the hook
        // belongs in, although the hook is where it was.
        dexes.put("bad-logo-two-builders", withTopBar(good(), topBar(false, true, 1, false, true)));

        // contract: the batcher's flush left as Facebook makes it, handing each batch of watched
        // reels to its executor.
        dexes.put("bad-watch-hook-missing", replaced(good(), batcher(handedOver(), false, false)));
        // contract: the stand-in in the method holding the mutation's name alone, and the flush
        // left as Facebook makes it.
        dexes.put("bad-watch-hook-decoy", replaced(good(), batcher(handedOver(), true, false)));
        // contract: the stand-in in the flush and in that other method too.
        dexes.put("bad-watch-hook-also-elsewhere", replaced(good(), batcher(heldBack(), true, false)));
        // contract: the stand-in twice in the flush.
        dexes.put("bad-watch-hook-twice", replaced(good(), batcher(Arrays.asList(watchSend(2, 1), watchSend(2, 1)), false, false)));
        // contract: the stand-in in the flush with Facebook's call left after it, so the batch goes
        // out anyway.
        dexes.put("bad-watch-execute-left", replaced(good(), batcher(Arrays.asList(watchSend(2, 1), execute(2, 1)), false, false)));
        // contract: the stand-in handed the send as its executor and the executor as its send.
        dexes.put("bad-watch-hook-other-registers", replaced(good(), batcher(Collections.singletonList(watchSend(1, 2)), false, false)));
        // contract: a second method answering the watch-history rule, so it can't say which one
        // the hook belongs in, although the hook is where it was.
        dexes.put("bad-watch-two-flushes", replaced(good(), batcher(heldBack(), false, true)));

        // contract: each start-call hook put first in a method that holds the rule's first string
        // but isn't the one the patch hooks. A rule naming only that string counted any method
        // holding it, so each of these passed: the unified tray hook in the tray controller, which
        // holds the adapter's start and stop names but not "tofu"; the return-refresh hook in
        // onPause, which holds the controller's name without "onRefresh"; the Follow hook in an
        // instance method naming both surfaces, which isn't the static check; and the emoji hook in
        // a method holding the provider's log tag without its end-to-end flag.
        List<Instruction> none = Collections.<Instruction>emptyList();
        dexes.put("bad-tray-hook-wrong-method", replaced(good(), adapters(trayHook(0), none), trayController(trayHook(1))));
        dexes.put("bad-return-refresh-hook-wrong-method", replaced(good(), returnController(none, returnHook(), false)));
        dexes.put("bad-follow-hook-wrong-method", replaced(good(), followCheck(none, followHook())));
        dexes.put("bad-emoji-hook-wrong-method", replaced(good(), emojiProvider(none, emojiHook())));
        // contract: a second method answering the return-refresh rule, so it can't say which one
        // the hook belongs in, although the hook is where it was.
        dexes.put("bad-return-refresh-two-callbacks", replaced(good(), returnController(returnHook(), none, true)));
        // contract: the Follow hook first in Facebook's check and first in the instance method
        // naming both surfaces as well.
        dexes.put("bad-follow-hook-also-elsewhere", replaced(good(), followCheck(followHook(), followHook())));

        // register: a helper the patch adds to one of the host's own classes, naming a register its
        // one-register body doesn't have. Only the extension's added methods were held to their
        // count, and the kind checks stepped over a register out of range, so this passed.
        dexes.put("bad-register-added-helper", withHostMethod(good(), define(HOST, "helper", "V", true,
                body(1, new ImmutableInstruction11n(Opcode.CONST_4, 1, 0), op(Opcode.RETURN_VOID)))));
        // register: a long read from a helper's last register, whose upper half is past the count.
        // Nothing named that half, so nothing noticed it.
        dexes.put("bad-register-wide-source", withHostMethod(good(), define(HOST, "copyWide", "V", true,
                body(2, new ImmutableInstruction12x(Opcode.MOVE_WIDE, 0, 1), op(Opcode.RETURN_VOID)))));
        // register: an extension method writing a long into its last register.
        List<ClassDef> ownWide = new ArrayList<>(good());
        ownWide.add(new ImmutableClassDef(PACK, AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), OBJECT,
                null, null, null, null, Collections.singletonList(define(PACK, "pack", "V", true,
                        body(2, new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, 0), op(Opcode.RETURN_VOID))))));
        dexes.put("bad-register-own-wide", ownWide);
        // register: the feed guard's answer moved into v4 of its four registers and tested there.
        dexes.put("bad-register-changed", withFeedEdge(body(4,
                invoke(HIDE_EDGE, 2, 3), op(Opcode.MOVE_RESULT, 4), ifEqz(4, 3),
                op(Opcode.RETURN_VOID), op(Opcode.RETURN_VOID))));

        for (Map.Entry<String, List<ClassDef>> e : dexes.entrySet()) {
            File dex = new File(out, e.getKey() + ".dex");
            DexPool.writeTo(dex.getPath(), new ImmutableDexFile(Opcodes.forApi(30), e.getValue()));
        }
        System.out.println("[fixture] wrote " + dexes.size() + " dex files to " + out.getPath());
    }
}
