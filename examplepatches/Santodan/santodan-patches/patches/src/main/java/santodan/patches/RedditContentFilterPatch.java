package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x;
import com.android.tools.smali.dexlib2.builder.BuilderInstruction;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import java.io.*;
import java.net.URI;
import java.util.*;
import java.util.logging.Logger;
import java.util.zip.*;
import kotlin.Unit;

/** Add runtime content filters to Morphe's Reddit settings. */
public final class RedditContentFilterPatch {
    public static final String NAME = "Reddit - Content filters (Experimental)";
    static final String PACKAGE = "com.reddit.frontpage";
    static final String VERSION = "2026.37.0";
    static final String LINK = "Lcom/reddit/domain/model/Link;";
    static final String SUBREDDIT = "Lcom/reddit/domain/model/Subreddit;";
    static final String FLAIR_SOURCE = "Lcom/reddit/flair/impl/data/source/remote/a;";
    static final String SUBREDDIT_SOURCE = "Lcom/reddit/data/remote/e;";
    static final String CHANNEL_COMPOSABLE = "Lcom/reddit/screens/channels/composables/f;";
    static final String SUBREDDIT_HEADER_VIEW = "Lcom/reddit/screens/header/SubredditHeaderView;";
    static final String FLAIR_ROW = "Lca1;";
    static final String FLAIR_CHIP = "Lsm7;";
    static final String FILTER_CHIP_LAMBDA = "La71;";
    static final String LISTING = "Lcom/reddit/domain/model/listing/Listing;";
    static final String FEED_POST_SECTION = "Llsi;";
    static final String FEED_SECTION_MAPPER = "Lcex;";
    static final String SETTINGS = "Lapp/morphe/extension/reddit/settings/preference/RedditPreferenceFragment;";
    static final String EXTENSION = "Lsoftware/santodan/extension/redditfilter/RedditContentFilter;";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private RedditContentFilterPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getRedditContentFilterPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds keyword and per-community flair filters under Morphe > Filters.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Reddit", null, ApkFileType.APK,
                    null, null, Collections.singletonList(new AppTarget(VERSION, false, null)), false));
                builder.extendWith(RedditContentFilterPatch::extensionStream);
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    hookLinkRegistration(findLinkConstructor(context.mutableClassDefBy(LINK)));
                    hookSubredditRegistration(findSubredditConstructor(context.mutableClassDefBy(SUBREDDIT)));
                    hookFlairSource(findFlairSourceConstructor(context.mutableClassDefBy(FLAIR_SOURCE)));
                    hookSubredditSource(findSubredditSourceConstructor(context.mutableClassDefBy(SUBREDDIT_SOURCE)));
                    hookSubredditHeader(findSubredditHeader(context.mutableClassDefBy(SUBREDDIT_HEADER_VIEW)));
                    hookFlairRow(findFlairRow(context.mutableClassDefBy(FLAIR_ROW)));
                    hookFlairChip(findFlairChip(context.mutableClassDefBy(FLAIR_CHIP)));
                    hookFilterChipLambda(findFilterChipLambda(context.mutableClassDefBy(FILTER_CHIP_LAMBDA)));
                    hookFeedSectionMapper(findFeedSectionMapper(context.mutableClassDefBy(FEED_SECTION_MAPPER)));
                    MutableClass settings = context.mutableClassDefByOrNull(SETTINGS);
                    if (settings == null) throw unsupported("Morphe's Reddit settings extension is missing; "
                        + "also enable an official Reddit patch that adds the Morphe settings menu");
                    hookSettings(uniqueMethod(settings, "initialize", "V"));
                    LOG.info("SantoDan: content filters added to FeedPostSection emission and Morphe settings.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Reddit bytecode: " + reason
            + ". No fallback patch was applied. Use Reddit 2026.37.0 with Morphe's Reddit settings patch.");
    }

    static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        if (method.getImplementation() != null)
            for (Instruction instruction : method.getImplementation().getInstructions()) result.add(instruction);
        return result;
    }

    static MutableMethod uniqueMethod(MutableClass owner, String name, String result) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if (name.equals(method.getName()) && result.equals(method.getReturnType())
                && method.getParameterTypes().isEmpty()) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one " + owner.getType() + "->" + name
            + "(); found " + matches.size());
        return matches.get(0);
    }

    static MutableMethod findLinkConstructor(MutableClass link) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : link.getMethods()) {
            if (!"<init>".equals(method.getName()) || method.getImplementation() == null) continue;
            int writes = 0;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (instruction.getOpcode() != Opcode.IPUT_BOOLEAN || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof FieldReference && LINK.equals(((FieldReference) reference).getDefiningClass())
                    && "isBlankAd".equals(((FieldReference) reference).getName())
                    && "Z".equals(((FieldReference) reference).getType())) writes++;
            }
            if (writes == 1) matches.add(method);
        }
        if (matches.size() != 1) throw unsupported("Expected one Link constructor assigning isBlankAd; found " + matches.size());
        return matches.get(0);
    }

    static MutableMethod findListingConstructor(MutableClass listing) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : listing.getMethods()) {
            if (!"<init>".equals(method.getName()) || method.getImplementation() == null) continue;
            int writes = 0;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof FieldReference && LISTING.equals(((FieldReference) reference).getDefiningClass())
                    && "children".equals(((FieldReference) reference).getName())
                    && "Ljava/util/List;".equals(((FieldReference) reference).getType())) writes++;
            }
            if (writes == 1) matches.add(method);
        }
        if (matches.size() != 1) throw unsupported("Expected one Listing constructor assigning children; found " + matches.size());
        return matches.get(0);
    }

    static void hookChildrenAssignment(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1, listRegister = -1;
        for (int i = 0; i < all.size(); i++) {
            Instruction instruction = all.get(i);
            if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)
                || !(instruction instanceof TwoRegisterInstruction)) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
            if (LISTING.equals(field.getDefiningClass()) && "children".equals(field.getName())) {
                index = i; listRegister = ((TwoRegisterInstruction) instruction).getRegisterA();
            }
        }
        if (index < 0 || listRegister > 15) throw unsupported("Listing children assignment cannot be safely hooked");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, listRegister, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "filterListing",
                    Collections.singletonList("Ljava/util/List;"), "Ljava/util/List;")));
        method.getImplementation().addInstruction(index + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, listRegister));
    }

    static MutableMethod findChildrenGetter(MutableClass listing) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : listing.getMethods())
            if ("getChildren".equals(method.getName()) && "Ljava/util/List;".equals(method.getReturnType())
                && method.getParameterTypes().isEmpty() && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one Listing.getChildren method; found " + matches.size());
        return matches.get(0);
    }

    static void hookChildrenGetter(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1, register = -1;
        for (int i = 0; i < all.size(); i++) if (all.get(i).getOpcode() == Opcode.RETURN_OBJECT
            && all.get(i) instanceof OneRegisterInstruction) {
            index = i; register = ((OneRegisterInstruction) all.get(i)).getRegisterA();
        }
        if (index < 0 || register > 15) throw unsupported("Listing.getChildren return cannot be safely hooked");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, register, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "filterListing",
                    Collections.singletonList("Ljava/util/List;"), "Ljava/util/List;")));
        method.getImplementation().addInstruction(index + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register));
    }

    static void hookBlankAdAssignment(MutableMethod method) {
        List<Instruction> instructions = instructions(method);
        int index = -1, valueRegister = -1, linkRegister = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (instruction.getOpcode() != Opcode.IPUT_BOOLEAN || !(instruction instanceof ReferenceInstruction)
                || !(instruction instanceof TwoRegisterInstruction)) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
            if (LINK.equals(field.getDefiningClass()) && "isBlankAd".equals(field.getName())
                && "Z".equals(field.getType())) {
                if (index >= 0) throw unsupported("Link constructor assigns isBlankAd more than once");
                index = i;
                valueRegister = ((TwoRegisterInstruction) instruction).getRegisterA();
                linkRegister = ((TwoRegisterInstruction) instruction).getRegisterB();
            }
        }
        if (index < 0 || valueRegister > 15 || linkRegister > 15)
            throw unsupported("Link isBlankAd assignment cannot be safely hooked");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, linkRegister, valueRegister, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "filterAsBlankAd",
                    Arrays.asList("Ljava/lang/Object;", "Z"), "Z")));
        method.getImplementation().addInstruction(index + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT, valueRegister));
    }

    static void hookLinkRegistration(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1;
        for (int i = 0; i < all.size(); i++) if (all.get(i).getOpcode() == Opcode.RETURN_VOID) index = i;
        if (index < 0) throw unsupported("Link constructor return was not found");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rememberLink",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findSubredditConstructor(MutableClass subreddit) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : subreddit.getMethods()) {
            if (!"<init>".equals(method.getName()) || method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof FieldReference && SUBREDDIT.equals(((FieldReference) reference).getDefiningClass())
                    && "flairs".equals(((FieldReference) reference).getName())) {
                    matches.add(method); break;
                }
            }
        }
        if (matches.size() != 1) throw unsupported("Expected one Subreddit constructor assigning flairs; found " + matches.size());
        return matches.get(0);
    }

    static void hookSubredditRegistration(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1;
        for (int i = 0; i < all.size(); i++) if (all.get(i).getOpcode() == Opcode.RETURN_VOID) index = i;
        if (index < 0) throw unsupported("Subreddit constructor return was not found");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rememberSubreddit",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findFlairSourceConstructor(MutableClass source) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : source.getMethods())
            if ("<init>".equals(method.getName()) && method.getImplementation() != null
                && method.getParameterTypes().equals(Arrays.asList("Lcom/squareup/moshi/j;", "Llx90;", "Lpon;")))
                matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one flair network source constructor; found " + matches.size());
        return matches.get(0);
    }

    static void hookFlairSource(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1;
        for (int i = 0; i < all.size(); i++) if (all.get(i).getOpcode() == Opcode.RETURN_VOID) index = i;
        if (index < 0) throw unsupported("Flair source constructor return was not found");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rememberFlairSource",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findSubredditSourceConstructor(MutableClass source) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : source.getMethods()) {
            if (!"<init>".equals(method.getName()) || method.getImplementation() == null) continue;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof FieldReference
                    && SUBREDDIT_SOURCE.equals(((FieldReference) reference).getDefiningClass())
                    && "j".equals(((FieldReference) reference).getName())
                    && "Lzw6;".equals(((FieldReference) reference).getType())) {
                    matches.add(method); break;
                }
            }
        }
        if (matches.size() != 1) throw unsupported("Expected one subreddit network source constructor; found " + matches.size());
        return matches.get(0);
    }

    static void hookSubredditSource(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int index = -1;
        for (int i = 0; i < all.size(); i++) if (all.get(i).getOpcode() == Opcode.RETURN_VOID) index = i;
        if (index < 0) throw unsupported("Subreddit source constructor return was not found");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rememberSubredditSource",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findChannelComposable(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if ("a".equals(method.getName()) && "V".equals(method.getReturnType())
                && method.getParameterTypes().equals(Arrays.asList("Lbog0;", "Ltvw;",
                    "Lkotlin/jvm/functions/Function0;", "Ly5c;", "I"))
                && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one channel chip composable; found " + matches.size());
        return matches.get(0);
    }

    static MutableMethod findSubredditHeader(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if ("l".equals(method.getName()) && "V".equals(method.getReturnType())
                && method.getParameterTypes().equals(Collections.singletonList(
                    "Lcom/reddit/frontpage/presentation/subreddit/header/SubredditHeaderPresentationModel;"))
                && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one subreddit header update; found " + matches.size());
        return matches.get(0);
    }

    static void hookSubredditHeader(MutableMethod method) {
        List<Instruction> all = instructions(method);
        if (all.isEmpty() || all.get(0).getOpcode() != Opcode.IGET_OBJECT)
            throw unsupported("Subreddit header update changed");
        int first = method.getImplementation().getRegisterCount() - 2;
        if (first < 0 || first + 1 > 15) throw unsupported("Subreddit header parameters changed");
        method.getImplementation().addInstruction(0,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, first, first + 1, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "prepareSubredditFlairs",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findFlairRow(MutableClass owner) {
        return findObjectLambda(owner, "subreddit flair row");
    }

    static void hookFlairRow(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int insertion = -1;
        for (int i = 0; i < all.size(); i++)
            if (all.get(i).getOpcode() == Opcode.CONST_STRING && all.get(i) instanceof ReferenceInstruction
                && "feed_options".equals(((ReferenceInstruction) all.get(i)).getReference().toString())) {
                for (int j = i - 1; j >= Math.max(0, i - 40); j--)
                    if (all.get(j).getOpcode() == Opcode.CHECK_CAST
                        && all.get(j) instanceof ReferenceInstruction
                        && "Ljava/util/List;".equals(((ReferenceInstruction) all.get(j)).getReference().toString())
                        && ((OneRegisterInstruction) all.get(j)).getRegisterA() == 6) {
                        insertion = j + 1; break;
                    }
                break;
            }
        if (insertion < 0) throw unsupported("Subreddit flair navigation list was not found");
        method.getImplementation().addInstruction(insertion,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 6, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "augmentFlairChannels",
                    Collections.singletonList("Ljava/util/List;"), "Ljava/util/List;")));
        method.getImplementation().addInstruction(insertion + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6));
    }

    static MutableMethod findFlairChip(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if ("x".equals(method.getName()) && "V".equals(method.getReturnType())
                && method.getParameterTypes().equals(Arrays.asList(
                    "Lbog0;", "I", "Z", "Lx4k;", "Ln9a0;", "Ltvw;", "Ly5c;", "I"))
                && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one subreddit flair chip; found " + matches.size());
        return matches.get(0);
    }

    static void hookFlairChip(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int insertion = -1;
        int palette = -1;
        for (int i = 0; i < all.size(); i++)
            if (all.get(i).getOpcode() == Opcode.SGET_OBJECT && all.get(i) instanceof ReferenceInstruction
                && "La8j;->l:La8j;".equals(((ReferenceInstruction) all.get(i)).getReference().toString())) {
                palette = i + 1; break;
            }
        if (palette < 0) throw unsupported("Subreddit flair chip palette was not found");
        method.getImplementation().addInstruction(palette,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 1, 6, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "styleFlairChip",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(palette + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 6));
        method.getImplementation().addInstruction(palette + 2,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(Opcode.CHECK_CAST, 6,
                new ImmutableTypeReference("Ld8j;")));
        all = instructions(method);
        insertion = -1;
        for (int i = 0; i < all.size(); i++)
            if (all.get(i).getOpcode() == Opcode.NEW_INSTANCE && all.get(i) instanceof ReferenceInstruction
                && "Lqm7;".equals(((ReferenceInstruction) all.get(i)).getReference().toString())) {
                for (int j = i + 1; j < Math.min(all.size(), i + 8); j++)
                    if (all.get(j).getOpcode() == Opcode.CHECK_CAST && all.get(j) instanceof ReferenceInstruction
                        && "Lkotlin/jvm/functions/Function0;".equals(
                            ((ReferenceInstruction) all.get(j)).getReference().toString())
                        && ((OneRegisterInstruction) all.get(j)).getRegisterA() == 8) {
                        insertion = j + 1; break;
                    }
                break;
            }
        if (insertion < 0) throw unsupported("Subreddit flair click callback was not found");
        method.getImplementation().addInstruction(insertion,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 8, 1, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "wrapFlairClick",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(insertion + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8));
        method.getImplementation().addInstruction(insertion + 2,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(Opcode.CHECK_CAST, 8,
                new ImmutableTypeReference("Lkotlin/jvm/functions/Function0;")));
    }

    static MutableMethod findFilterChipLambda(MutableClass owner) {
        return findObjectLambda(owner, "filter chip lambda");
    }

    private static MutableMethod findObjectLambda(MutableClass owner, String label) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if ("invoke".equals(method.getName()) && "Ljava/lang/Object;".equals(method.getReturnType())
                && method.getParameterTypes().equals(Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"))
                && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one " + label + "; found " + matches.size());
        return matches.get(0);
    }

    static void hookFilterChipLambda(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int clickable = -1;
        for (int i = 0; i + 1 < all.size(); i++)
            if (all.get(i).getOpcode() == Opcode.INVOKE_STATIC_RANGE && all.get(i) instanceof ReferenceInstruction
                && ((ReferenceInstruction) all.get(i)).getReference().toString().startsWith("Lcy8;->a(")) {
                clickable = i; break;
            }
        if (clickable < 0 || !(all.get(clickable) instanceof RegisterRangeInstruction)
            || all.get(clickable + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT)
            throw unsupported("Subreddit flair click modifier was not found");
        int start = ((RegisterRangeInstruction) all.get(clickable)).getStartRegister();
        int count = ((RegisterRangeInstruction) all.get(clickable)).getRegisterCount();
        int result = ((OneRegisterInstruction) all.get(clickable + 1)).getRegisterA();
        if (count != 7) throw unsupported("Subreddit flair click modifier signature changed");
        method.getImplementation().replaceInstruction(clickable,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, count,
                new ImmutableMethodReference(EXTENSION, "flairChipModifier",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Z",
                        "Ljava/lang/String;", "Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(clickable + 2,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(Opcode.CHECK_CAST, result,
                new ImmutableTypeReference("Ltvw;")));
    }

    static void hookChannelComposable(MutableMethod method) {
        int parameters = 5;
        int first = method.getImplementation().getRegisterCount() - parameters;
        if (first < 0 || first + 2 > 255) throw unsupported("Channel chip registers changed");
        List<Instruction> all = instructions(method);
        int emphasis = -1;
        for (int i = 0; i < all.size(); i++)
            if (all.get(i).getOpcode() == Opcode.NEW_INSTANCE && all.get(i) instanceof ReferenceInstruction
                && "Lde6;".equals(((ReferenceInstruction) all.get(i)).getReference().toString())) {
                emphasis = i; break;
            }
        if (emphasis < 0) throw unsupported("Channel chip emphasis point was not found");
        method.getImplementation().addInstruction(emphasis,
            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, first));
        method.getImplementation().addInstruction(emphasis + 1,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 2, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "dimFilteredChannel",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(emphasis + 2,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2));
        method.getImplementation().addInstruction(emphasis + 3,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(Opcode.CHECK_CAST, 2,
                new ImmutableTypeReference("Lcom/reddit/screens/channels/composables/Emphasis;")));
        List<Instruction> modified = instructions(method);
        int clickable = -1;
        for (int i = 0; i + 1 < modified.size(); i++) {
            Instruction candidate = modified.get(i);
            if (candidate instanceof ReferenceInstruction
                && candidate.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && ((ReferenceInstruction) candidate).getReference().toString().startsWith("Lcy8;->b(")) {
                clickable = i; break;
            }
        }
        if (clickable < 0 || !(modified.get(clickable) instanceof RegisterRangeInstruction)
            || modified.get(clickable + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT)
            throw unsupported("Channel chip clickable modifier was not found");
        int start = ((RegisterRangeInstruction) modified.get(clickable)).getStartRegister();
        int count = ((RegisterRangeInstruction) modified.get(clickable)).getRegisterCount();
        int result = ((OneRegisterInstruction) modified.get(clickable + 1)).getRegisterA();
        if (count != 8) throw unsupported("Channel chip clickable signature changed");
        method.getImplementation().replaceInstruction(clickable,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, count,
                new ImmutableMethodReference(EXTENSION, "channelModifier",
                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Z",
                        "Ljava/lang/String;", "Ljava/lang/Object;", "Ljava/lang/Object;", "I"),
                    "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(clickable + 2,
            new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c(Opcode.CHECK_CAST,
                result, new ImmutableTypeReference("Ltvw;")));
        method.getImplementation().addInstruction(0,
            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, first));
        method.getImplementation().addInstruction(1,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "rememberChannelModel",
                    Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    static MutableMethod findFeedRenderer(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods())
            if ("a".equals(method.getName()) && "V".equals(method.getReturnType())
                && method.getParameterTypes().equals(Arrays.asList("Llji;", "Ly5c;", "I"))
                && method.getImplementation() != null) matches.add(method);
        if (matches.size() != 1) throw unsupported("Expected one FeedPostSection renderer; found " + matches.size());
        return matches.get(0);
    }

    static void hookFeedRenderer(MutableMethod method) {
        List<Instruction> all = instructions(method);
        if (all.isEmpty() || !(all.get(0) instanceof BuilderInstruction))
            throw unsupported("FeedPostSection renderer entry is not mutable");
        int parameterWords = 0;
        for (CharSequence type : method.getParameterTypes()) parameterWords += ("J".contentEquals(type) || "D".contentEquals(type)) ? 2 : 1;
        int thisRegister = method.getImplementation().getRegisterCount() - parameterWords - 1;
        if (thisRegister > 15) throw unsupported("FeedPostSection instance register cannot be safely hooked");
        com.android.tools.smali.dexlib2.builder.Label show = ((BuilderInstruction) all.get(0)).getLocation().addNewLabel();
        method.getImplementation().addInstruction(0,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, thisRegister, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "hideFeedPost",
                    Collections.singletonList("Ljava/lang/Object;"), "Z")));
        method.getImplementation().addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        method.getImplementation().addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, show));
        method.getImplementation().addInstruction(3, new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.RETURN_VOID));
    }

    static MutableMethod findFeedSectionMapper(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods()) {
            if (method.getImplementation() == null || !"Lm5c;".equals(method.getReturnType())) continue;
            boolean createsSection = false;
            for (Instruction instruction : method.getImplementation().getInstructions())
                if (instruction.getOpcode() == Opcode.NEW_INSTANCE && instruction instanceof ReferenceInstruction
                    && FEED_POST_SECTION.equals(((ReferenceInstruction) instruction).getReference().toString())) createsSection = true;
            if (createsSection) matches.add(method);
        }
        if (matches.size() != 1) throw unsupported("Expected one FeedPostSection mapper; found " + matches.size());
        return matches.get(0);
    }

    static void hookFeedSectionMapper(MutableMethod method) {
        List<Instruction> all = instructions(method);
        int create = -1, returnIndex = -1, sectionRegister = -1;
        for (int i = 0; i < all.size(); i++) {
            Instruction instruction = all.get(i);
            if (instruction.getOpcode() == Opcode.NEW_INSTANCE && instruction instanceof ReferenceInstruction
                && FEED_POST_SECTION.equals(((ReferenceInstruction) instruction).getReference().toString())) {
                create = i; sectionRegister = ((OneRegisterInstruction) instruction).getRegisterA();
            } else if (create >= 0 && instruction.getOpcode() == Opcode.RETURN_OBJECT
                && ((OneRegisterInstruction) instruction).getRegisterA() == sectionRegister) {
                returnIndex = i; break;
            }
        }
        if (returnIndex < 0) throw unsupported("FeedPostSection mapper return was not found");
        method.getImplementation().addInstruction(returnIndex,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, sectionRegister, 1,
                new ImmutableMethodReference(EXTENSION, "filterFeedSection",
                    Collections.singletonList("Ljava/lang/Object;"), "Ljava/lang/Object;")));
        method.getImplementation().addInstruction(returnIndex + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, sectionRegister));
    }

    static void hookSettings(MutableMethod method) {
        List<Instruction> instructions = instructions(method);
        int contextRegister = -1, screenRegister = -1, insertionIndex = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (!(instruction instanceof ReferenceInstruction)
                || !(instruction instanceof FiveRegisterInstruction)) continue;
            Object reference = ((ReferenceInstruction) instruction).getReference();
            if (!(reference instanceof com.android.tools.smali.dexlib2.iface.reference.MethodReference)) continue;
            com.android.tools.smali.dexlib2.iface.reference.MethodReference called =
                (com.android.tools.smali.dexlib2.iface.reference.MethodReference) reference;
            FiveRegisterInstruction invoke = (FiveRegisterInstruction) instruction;
            if (instruction.getOpcode() == Opcode.INVOKE_VIRTUAL
                && "Landroid/preference/PreferenceManager;".equals(called.getDefiningClass())
                && "createPreferenceScreen".equals(called.getName())
                && "Landroid/preference/PreferenceScreen;".equals(called.getReturnType())
                && invoke.getRegisterCount() == 2) {
                contextRegister = invoke.getRegisterD();
            }
            if (instruction.getOpcode() == Opcode.INVOKE_VIRTUAL
                && "Landroid/preference/PreferenceFragment;".equals(called.getDefiningClass())
                && "setPreferenceScreen".equals(called.getName())
                && invoke.getRegisterCount() == 2) {
                screenRegister = invoke.getRegisterD();
                insertionIndex = i + 1;
            }
        }
        if (contextRegister < 0 || screenRegister < 0 || insertionIndex < 0
            || contextRegister > 15 || screenRegister > 15)
            throw unsupported("Could not locate Morphe's initialized preference screen and context registers");
        method.getImplementation().addInstruction(insertionIndex,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, contextRegister, screenRegister, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "addSettings",
                    Arrays.asList("Landroid/content/Context;", "Landroid/preference/PreferenceScreen;"), "V")));
    }

    static InputStream extensionStream() {
        String path = "extensions/reddit-filter.mpe";
        InputStream resource = RedditContentFilterPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = RedditContentFilterPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
            try (ZipFile zip = new ZipFile(new File(source))) {
                ZipEntry entry = zip.getEntry(path);
                if (entry == null) throw new FileNotFoundException(path);
                try (InputStream input = zip.getInputStream(entry)) {
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192];
                    int count;
                    while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                    return new ByteArrayInputStream(output.toByteArray());
                }
            }
        } catch (Exception error) {
            throw new IllegalStateException("Cannot load bundled Reddit filter extension", error);
        }
    }
}
