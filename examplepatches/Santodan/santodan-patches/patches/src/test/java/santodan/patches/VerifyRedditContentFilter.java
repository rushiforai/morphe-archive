package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.*;
import java.util.*;

/** Structural regression check against Reddit's real Link model DEX. */
public final class VerifyRedditContentFilter {
    private static void require(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    public static void main(String[] args) throws Exception {
        ClassDef original = null, listingClass = null, mapperClass = null, classicPostMapperClass = null, feedLinkMapperClass = null,
            feedLinkAlternateMapperClass = null, headerParent = null, subredditFeedLambda = null,
            subredditClass = null, feedPostCellClass = null, homePostMapperClass = null, flairSourceClass = null,
            subredditSourceClass = null, headerClass = null, flairRowClass = null, flairChipClass = null,
            filterChipLambdaClass = null, classicPostComposableClass = null, feedElementProcessorClass = null;
        Map<String, ClassDef> all = new HashMap<>();
        for (String path : args) try (InputStream input = new BufferedInputStream(new FileInputStream(path))) {
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, input);
            for (ClassDef candidate : dex.getClasses()) {
                all.put(candidate.getType(), candidate);
                if (RedditContentFilterPatch.LINK.equals(candidate.getType())) original = candidate;
                else if (RedditContentFilterPatch.LISTING.equals(candidate.getType())) listingClass = candidate;
                else if (RedditContentFilterPatch.CLASSIC_POST_MAPPER.equals(candidate.getType())) classicPostMapperClass = candidate;
                else if (RedditContentFilterPatch.CLASSIC_POST_COMPOSABLE.equals(candidate.getType())) classicPostComposableClass = candidate;
                else if (RedditContentFilterPatch.FEED_ELEMENT_PROCESSOR.equals(candidate.getType())) feedElementProcessorClass = candidate;
                else if (RedditContentFilterPatch.FEED_LINK_MAPPER.equals(candidate.getType())) feedLinkMapperClass = candidate;
                else if (RedditContentFilterPatch.FEED_LINK_ALTERNATE_MAPPER.equals(candidate.getType())) feedLinkAlternateMapperClass = candidate;
                else if (RedditContentFilterPatch.FEED_SECTION_MAPPER.equals(candidate.getType())) mapperClass = candidate;
                else if (RedditContentFilterPatch.FEED_POST_CELL.equals(candidate.getType())) feedPostCellClass = candidate;
                else if (RedditContentFilterPatch.HOME_POST_MAPPER.equals(candidate.getType())) homePostMapperClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT.equals(candidate.getType())) subredditClass = candidate;
                else if (RedditContentFilterPatch.FLAIR_SOURCE.equals(candidate.getType())) flairSourceClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT_SOURCE.equals(candidate.getType())) subredditSourceClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT_HEADER_VIEW.equals(candidate.getType())) headerClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT_FEED_LAMBDA.equals(candidate.getType())) subredditFeedLambda = candidate;
                else if ("Lvg9;".equals(candidate.getType())) headerParent = candidate;
                else if (RedditContentFilterPatch.FLAIR_ROW.equals(candidate.getType())) flairRowClass = candidate;
                else if (RedditContentFilterPatch.FLAIR_CHIP.equals(candidate.getType())) flairChipClass = candidate;
                else if (RedditContentFilterPatch.FILTER_CHIP_LAMBDA.equals(candidate.getType())) filterChipLambdaClass = candidate;
            }
        }
        if (original == null) throw new AssertionError("Reddit Link model not found");
        require(listingClass != null, "Reddit Listing model not found");
        MutableMethod childrenGetter = RedditContentFilterPatch.findChildrenGetter(new MutableClass(listingClass));
        int childrenBefore = RedditContentFilterPatch.instructions(childrenGetter).size();
        RedditContentFilterPatch.hookChildrenGetter(childrenGetter);
        require(RedditContentFilterPatch.instructions(childrenGetter).size() == childrenBefore + 2,
            "Listing.getChildren must pass through filterListing");
        require(feedLinkMapperClass != null && feedLinkAlternateMapperClass != null,
            "Both feed Link mappers must exist");
        require(classicPostMapperClass != null, "GraphQL classic post mapper must exist");
        require(classicPostComposableClass != null, "Classic post composables must exist");
        require(feedElementProcessorClass != null, "Common feed-element processor must exist");
        MutableMethod feedElementProcessor = RedditContentFilterPatch.findFeedElementProcessor(
            new MutableClass(feedElementProcessorClass));
        int feedElementProcessorBefore = RedditContentFilterPatch.instructions(feedElementProcessor).size();
        RedditContentFilterPatch.hookFeedElementProcessor(feedElementProcessor);
        List<Instruction> feedElementProcessorAfter = RedditContentFilterPatch.instructions(feedElementProcessor);
        require(feedElementProcessorAfter.size() == feedElementProcessorBefore + 2
            && feedElementProcessorAfter.get(0) instanceof ReferenceInstruction
            && ((ReferenceInstruction) feedElementProcessorAfter.get(0)).getReference().toString()
                .contains("->filterFeedElements("),
            "Common feed-element list must pass through filterFeedElements");
        List<MutableMethod> classicRenderers = RedditContentFilterPatch.findClassicPostComposables(
            new MutableClass(classicPostComposableClass));
        for (MutableMethod renderer : classicRenderers) {
            RedditContentFilterPatch.hookClassicPostComposable(renderer);
            require(RedditContentFilterPatch.instructions(renderer).stream().anyMatch(instruction ->
                instruction instanceof ReferenceInstruction
                    && ((ReferenceInstruction) instruction).getReference().toString()
                        .contains("->hideClassicPost(")),
                "Classic post renderer must call hideClassicPost");
        }
        require(feedPostCellClass != null, "Feed post cell must exist");
        require(homePostMapperClass != null, "Home post mapper must exist");
        MutableMethod homePostMapper = RedditContentFilterPatch.findHomePostMapper(new MutableClass(homePostMapperClass));
        RedditContentFilterPatch.hookHomePostMapper(homePostMapper);
        require(RedditContentFilterPatch.instructions(homePostMapper).get(0) instanceof ReferenceInstruction
            && ((ReferenceInstruction) RedditContentFilterPatch.instructions(homePostMapper).get(0))
                .getReference().toString().contains("->inspectHomePostModel("),
            "Home post mapper must expose its input model");
        MutableMethod feedPostCellConstructor = RedditContentFilterPatch.findFeedPostCellConstructor(
            new MutableClass(feedPostCellClass));
        RedditContentFilterPatch.hookFeedPostCell(feedPostCellConstructor);
        require(RedditContentFilterPatch.instructions(feedPostCellConstructor).stream().anyMatch(instruction ->
            instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && instruction instanceof ReferenceInstruction
                && ((ReferenceInstruction) instruction).getReference().toString().contains("->traceFeedPostCell(")),
            "Feed post cell constructor must be traced before rendering");
        MutableClass link = new MutableClass(original);
        MutableMethod constructor = RedditContentFilterPatch.findLinkConstructor(link);
        List<Instruction> before = RedditContentFilterPatch.instructions(constructor);
        RedditContentFilterPatch.hookLinkRegistration(constructor);
        List<Instruction> after = RedditContentFilterPatch.instructions(constructor);
        require(after.size() == before.size() + 1, "Expected one Link registration instruction");

        int linkInstanceRegister = -1;
        for (Instruction instruction : before) if (instruction.getOpcode() == Opcode.IPUT_BOOLEAN
            && instruction instanceof ReferenceInstruction && instruction instanceof TwoRegisterInstruction
            && ((ReferenceInstruction) instruction).getReference().toString().contains("->isBlankAd:Z"))
            linkInstanceRegister = ((TwoRegisterInstruction) instruction).getRegisterB();
        require(linkInstanceRegister >= 0, "Link instance register not found");
        int helperCalls = 0;
        for (int i = 0; i + 1 < after.size(); i++) {
            Instruction instruction = after.get(i);
            if (instruction.getOpcode() != Opcode.INVOKE_STATIC || !(instruction instanceof ReferenceInstruction)) continue;
            Object reference = ((ReferenceInstruction) instruction).getReference();
            if (!(reference instanceof MethodReference)) continue;
            MethodReference method = (MethodReference) reference;
            if (RedditContentFilterPatch.EXTENSION.equals(method.getDefiningClass())
                && "rememberLink".equals(method.getName())) {
                helperCalls++;
                require(instruction instanceof FiveRegisterInstruction
                    && ((FiveRegisterInstruction) instruction).getRegisterC() == linkInstanceRegister,
                    "Link registration must pass the instance register");
            }
        }
        require(helperCalls == 1, "Expected exactly one Link registration call");
        require(subredditClass != null, "Subreddit model not found");
        MutableMethod subredditConstructor = RedditContentFilterPatch.findSubredditConstructor(new MutableClass(subredditClass));
        int subredditBefore = RedditContentFilterPatch.instructions(subredditConstructor).size();
        RedditContentFilterPatch.hookSubredditRegistration(subredditConstructor);
        List<Instruction> subredditAfter = RedditContentFilterPatch.instructions(subredditConstructor);
        require(subredditAfter.size() == subredditBefore + 1, "Expected one Subreddit registration instruction");
        require(subredditAfter.stream().anyMatch(instruction -> instruction.getOpcode() == Opcode.INVOKE_STATIC
            && instruction instanceof ReferenceInstruction
            && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference
            && "rememberSubreddit".equals(((MethodReference) ((ReferenceInstruction) instruction).getReference()).getName())),
            "Expected Subreddit flair-template registration call");
        require(flairSourceClass != null, "Flair network source not found");
        MutableMethod flairConstructor = RedditContentFilterPatch.findFlairSourceConstructor(new MutableClass(flairSourceClass));
        int flairBefore = RedditContentFilterPatch.instructions(flairConstructor).size();
        RedditContentFilterPatch.hookFlairSource(flairConstructor);
        require(RedditContentFilterPatch.instructions(flairConstructor).size() == flairBefore + 1,
            "Expected one flair network-source registration instruction");
        require(subredditSourceClass != null, "Subreddit network source not found");
        MutableMethod subredditSourceConstructor = RedditContentFilterPatch.findSubredditSourceConstructor(
            new MutableClass(subredditSourceClass));
        int sourceBefore = RedditContentFilterPatch.instructions(subredditSourceConstructor).size();
        RedditContentFilterPatch.hookSubredditSource(subredditSourceConstructor);
        require(RedditContentFilterPatch.instructions(subredditSourceConstructor).size() == sourceBefore + 1,
            "Expected one subreddit network-source registration instruction");
        require(headerClass != null, "Subreddit header view not found");
        require(headerParent != null && "Landroid/widget/FrameLayout;".equals(headerParent.getSuperclass()),
            "Subreddit header must remain a FrameLayout for the flair row");
        require(subredditFeedLambda != null, "Subreddit feed composable not found");
        MutableMethod feedLambda = RedditContentFilterPatch.findObjectLambda(
            new MutableClass(subredditFeedLambda), "subreddit feed composable");
        int feedLambdaBefore = RedditContentFilterPatch.instructions(feedLambda).size();
        RedditContentFilterPatch.hookSubredditFeedLambda(feedLambda);
        require(RedditContentFilterPatch.instructions(feedLambda).size() == feedLambdaBefore + 2,
            "Expected an early subreddit name hook");
        MutableMethod header = RedditContentFilterPatch.findSubredditHeader(new MutableClass(headerClass));
        int headerBefore = RedditContentFilterPatch.instructions(header).size();
        RedditContentFilterPatch.hookSubredditHeader(header);
        require(RedditContentFilterPatch.instructions(header).size() == headerBefore + 1,
            "Expected one subreddit flair row instruction");
        Instruction headerHook = RedditContentFilterPatch.instructions(header).get(0);
        require(headerHook.getOpcode() == Opcode.INVOKE_STATIC && headerHook instanceof FiveRegisterInstruction
            && ((FiveRegisterInstruction) headerHook).getRegisterC() == header.getImplementation().getRegisterCount() - 2
            && ((FiveRegisterInstruction) headerHook).getRegisterD() == header.getImplementation().getRegisterCount() - 1,
            "Subreddit flair row must receive the untouched header and model parameters");
        require(flairRowClass != null && flairChipClass != null && filterChipLambdaClass != null,
            "Subreddit flair navigation renderer not found");
        MutableMethod flairRow = RedditContentFilterPatch.findFlairRow(new MutableClass(flairRowClass));
        int flairRowBefore = RedditContentFilterPatch.instructions(flairRow).size();
        RedditContentFilterPatch.hookFlairRow(flairRow);
        require(RedditContentFilterPatch.instructions(flairRow).size() == flairRowBefore + 2,
            "Expected flair-template list augmentation");
        MutableMethod flairChip = RedditContentFilterPatch.findFlairChip(new MutableClass(flairChipClass));
        int flairChipBefore = RedditContentFilterPatch.instructions(flairChip).size();
        RedditContentFilterPatch.hookFlairChip(flairChip);
        require(RedditContentFilterPatch.instructions(flairChip).size() == flairChipBefore + 6,
            "Expected flair click wrapping and palette styling");
        MutableMethod filterChip = RedditContentFilterPatch.findFilterChipLambda(new MutableClass(filterChipLambdaClass));
        int filterChipBefore = RedditContentFilterPatch.instructions(filterChip).size();
        RedditContentFilterPatch.hookFilterChipLambda(filterChip);
        require(RedditContentFilterPatch.instructions(filterChip).size() == filterChipBefore + 1,
            "Expected a long-press modifier on the real subreddit flair chips");
        require(mapperClass != null, "Feed section mapper not found");
        MutableMethod mapper = RedditContentFilterPatch.findFeedSectionMapper(new MutableClass(mapperClass));
        int mapperBefore = RedditContentFilterPatch.instructions(mapper).size();
        RedditContentFilterPatch.hookFeedSectionMapper(mapper);
        List<Instruction> mapperAfter = RedditContentFilterPatch.instructions(mapper);
        require(mapperAfter.size() >= mapperBefore + 2, "Expected source inspection and feed-section emission instructions");
        int calls = 0, sourceCalls = 0;
        for (Instruction instruction : mapperAfter) if (instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
            && instruction instanceof ReferenceInstruction) {
            MethodReference ref = (MethodReference) ((ReferenceInstruction) instruction).getReference();
            if (RedditContentFilterPatch.EXTENSION.equals(ref.getDefiningClass())
                && "filterFeedSection".equals(ref.getName())) calls++;
            if (RedditContentFilterPatch.EXTENSION.equals(ref.getDefiningClass())
                && "inspectFeedSource".equals(ref.getName())) sourceCalls++;
        }
        require(calls == 1, "Expected exactly one FeedPostSection emission filter");
        require(sourceCalls == 1, "Expected exactly one feed-source diagnostic hook");
        for (ClassDef feedLinkClass : Arrays.asList(feedLinkMapperClass, feedLinkAlternateMapperClass)) {
            String name = RedditContentFilterPatch.FEED_LINK_MAPPER.equals(feedLinkClass.getType())
                ? "a" : RedditContentFilterPatch.FEED_LINK_ALTERNATE_MAPPER_METHOD;
            MutableMethod linkMapper = RedditContentFilterPatch.findFeedLinkMapper(new MutableClass(feedLinkClass), name);
            int parameterWords = 0;
            for (CharSequence type : linkMapper.getParameterTypes())
                parameterWords += ("J".contentEquals(type) || "D".contentEquals(type)) ? 2 : 1;
            int expectedRegister = linkMapper.getImplementation().getRegisterCount() - parameterWords;
            int linkMapperBefore = RedditContentFilterPatch.instructions(linkMapper).size();
            RedditContentFilterPatch.hookFeedLinkMapper(linkMapper);
            List<Instruction> linkMapperAfter = RedditContentFilterPatch.instructions(linkMapper);
            require(linkMapperAfter.size() >= linkMapperBefore,
                "Expected pre-render Link capture in " + feedLinkClass.getType());
            Instruction capture = linkMapperAfter.get(0);
            require(capture.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && capture instanceof RegisterRangeInstruction
                && ((RegisterRangeInstruction) capture).getStartRegister() == expectedRegister
                && capture instanceof ReferenceInstruction
                && ((ReferenceInstruction) capture).getReference().toString().contains("->rememberFeedLink("),
                "Feed mapper must capture its Link parameter before mapping");
        }
        MutableMethod classicMapper = RedditContentFilterPatch.findClassicPostMapper(new MutableClass(classicPostMapperClass));
        RedditContentFilterPatch.hookClassicPostMapper(classicMapper);
        require(RedditContentFilterPatch.instructions(classicMapper).stream().anyMatch(instruction ->
            instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                && instruction instanceof ReferenceInstruction
                && ((ReferenceInstruction) instruction).getReference().toString().contains("->rememberClassicPost(")),
            "GraphQL classic post mapper must capture flairs before feed rendering");
        require(classicRenderers.size() == 3, "Expected three classic post renderers");

        // Post-detail sources used by the runtime's batched hydration.
        for (String type : Arrays.asList(RedditContentFilterPatch.POST_BY_ID_SOURCE,
                RedditContentFilterPatch.LINK_SOURCE, RedditContentFilterPatch.LINK_REPOSITORY)) {
            ClassDef source = all.get(type);
            require(source != null, "Missing post source " + type);
            MutableClass mutable = new MutableClass(source);
            if (RedditContentFilterPatch.POST_BY_ID_SOURCE.equals(type)) RedditContentFilterPatch.hookPostByIdSource(mutable);
            else if (RedditContentFilterPatch.LINK_SOURCE.equals(type)) RedditContentFilterPatch.hookLinkSource(mutable);
            else RedditContentFilterPatch.hookLinkRepository(mutable);
            boolean hooked = false;
            for (MutableMethod method : mutable.getMethods())
                if ("<init>".equals(method.getName())) for (Instruction instruction : RedditContentFilterPatch.instructions(method))
                    if (instruction instanceof RegisterRangeInstruction && instruction instanceof ReferenceInstruction
                        && ((ReferenceInstruction) instruction).getReference().toString().startsWith(
                            RedditContentFilterPatch.EXTENSION + "->remember")) {
                        int parameters = method.getParameterTypes().size();
                        require(((RegisterRangeInstruction) instruction).getStartRegister()
                            == method.getImplementation().getRegisterCount() - parameters - 1,
                            type + " registration must pass this");
                        hooked = true;
                    }
            require(hooked, "Expected source registration in " + type);
        }

        // Native classes, fields and methods the runtime reaches by reflection.
        requireField(all, "Lcom/reddit/flair/impl/data/source/remote/a;", "c", "Lj8p;");
        requireField(all, RedditContentFilterPatch.SUBREDDIT_SOURCE, "j", "Lh87;");
        require(all.get("Lh87;") != null && all.get("Lh87;").getInterfaces().contains("Lj8p;"),
            "Subreddit GraphQL client must implement the GraphQL client interface");
        requireMethod(all, "Lj8p;", "e", "(Lj8p;Lxz10;Ljava/util/Map;Lcom/reddit/network/common/RetryAlgo;"
            + "Ljava/util/Set;Lcom/reddit/graphql/FetchPolicy;Latz;Lt900;"
            + "Lcom/reddit/network/orchestrator/RequestSchedulerPriority;"
            + "Lcom/reddit/network/orchestrator/DeferPolicy;Lo7d;I)Ljava/lang/Object;");
        requireMethod(all, "Lzrm;", "<init>", "(Ljava/lang/String;)V");
        requireField(all, "Lvrm;", "a", "Lyrm;");
        requireField(all, "Lyrm;", "b", "Lwrm;");
        requireField(all, "Lwrm;", "a", "Ljava/util/List;");
        requireField(all, "Lxrm;", "c", "Ljava/lang/String;");
        requireField(all, "Lxrm;", "d", "Lcom/reddit/type/FlairTextColor;");
        requireField(all, "Lxrm;", "f", "Ljava/lang/String;");
        requireMethod(all, "Lo7d;", "resumeWith", "(Ljava/lang/Object;)V");
        requireMethod(all, RedditContentFilterPatch.LINK_REPOSITORY, "G", "()Lcom/reddit/data/remote/h;");
        requireMethod(all, RedditContentFilterPatch.LINK_SOURCE, "b",
            "(Ljava/util/ArrayList;ZZZZZLkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;");
        requireMethod(all, RedditContentFilterPatch.POST_BY_ID_SOURCE, "d",
            "(Ljava/util/ArrayList;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;");
        requireMethod(all, "Lcom/reddit/data/remote/RemoteGqlLinkDataSource$getHomeFeedPostsByIds$1;", "<init>",
            "(Lcom/reddit/data/remote/h;Lo7d;)V");
        requireMethod(all, "Lcom/reddit/data/remote/RemoteGqlHistoryDataSourceImpl$getPostsByIds$1;", "<init>",
            "(Lcom/reddit/data/remote/g;Lo7d;)V");
        requireMethod(all, "Lfzj0;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl0o0;"
            + "ILjava/lang/String;Ljava/util/List;)V");
        requireField(all, "Lfzj0;", "a", "Ljava/lang/String;");
        requireField(all, "Lfzj0;", "b", "Ljava/lang/String;");
        requireField(all, "Lfzj0;", "c", "Ljava/lang/String;");
        require(all.get("Lhzj0;") != null, "Native flair Feed channel is missing");
        requireField(all, "Lb3q;", "l0", "Lb3q;");
        require(all.get("Lb3q;") != null && all.get("Lb3q;").getInterfaces().contains("Ll0o0;"),
            "Default channel status must be a channel status");
        requireField(all, "Lrjk;", "a", "Lkotlin/jvm/functions/Function1;");
        requireMethod(all, "Lqjk;", "<init>", "(JLkotlin/jvm/functions/Function1;)V");
        requireField(all, RedditContentFilterPatch.CHIP_CLICK, "e", "Ljava/lang/Object;");
        requireMethod(all, RedditContentFilterPatch.CLICKABLE, "a", "(Lgwy;Lrqz;Lzdr;ZLjava/lang/String;Lujd0;"
            + "Lkotlin/jvm/functions/Function0;)Lgwy;");
        requireMethod(all, RedditContentFilterPatch.CLICKABLE, "d", "(Lgwy;Lrqz;Lzdr;ZLjava/lang/String;Lujd0;"
            + "Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;I)Lgwy;");
        requireMethod(all, "Lmu40;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
            + "Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;"
            + "Ljava/lang/String;)V");
        requireMethod(all, "Lvcf;", "y0", "([Ljava/lang/Object;)Lxv20;");
        requireMethod(all, "Lvcf;", "N0", "(Ljava/lang/Iterable;)Lkpq;");
        require(all.get("Lxv20;") != null && all.get("Lxv20;").getInterfaces().contains("Lkpq;"),
            "Persistent list factory must produce the feed content list type");
        requireMethod(all, "Lpw40;", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZLsy40;Lkpq;)V");
        requireField(all, "Lpw40;", "i", "Lkpq;");
        requireMethod(all, "Lqw40;", "<init>", "(Lpw40;)V");
        requireField(all, RedditContentFilterPatch.FEED_POST_SECTION, "a", "Ljava/lang/String;");
        requireField(all, RedditContentFilterPatch.FEED_POST_SECTION, "b", "Lkpq;");
        requireField(all, RedditContentFilterPatch.FEED_POST_SECTION, "c", "Ljava/lang/String;");
        requireField(all, RedditContentFilterPatch.FEED_POST_SECTION, "d", "Lsy40;");
        require(all.get("Lf2k;") != null, "Native feed title section is missing");
        requireField(all, "Lmtj;", "b", "Ljava/lang/String;");
        requireField(all, "Lkk50;", "h", "Lsy40;");
        requireField(all, "Lkk50;", "q", "Lpw40;");
        requireField(all, "Lkk50;", "G", "Lkpq;");
        for (String child : Arrays.asList("k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"))
            require(field(all, "Lkk50;", child) != null, "PostPreviewFeedElement child " + child + " is missing");
        requireField(all, RedditContentFilterPatch.CLASSIC_POST, "e", "Ljava/lang/String;");
        requireField(all, RedditContentFilterPatch.CLASSIC_POST, "k", "Ljava/lang/String;");
        requireField(all, RedditContentFilterPatch.CLASSIC_POST, "q", "Ljava/lang/String;");
        requireField(all, RedditContentFilterPatch.CLASSIC_POST, "t", "Lpw40;");
        requireField(all, "Lcom/reddit/frontpage/presentation/subreddit/header/SubredditHeaderPresentationModel;",
            "b", "Ljava/lang/String;");
        requireMethod(all, "Lcom/reddit/screens/listing/compose/SubredditFeedScreen;", "r5", "()Ljava/lang/String;");
        System.out.println("PASS: Reddit " + RedditContentFilterPatch.VERSION
            + " source registration, flair UI, feed filtering and runtime reflection contracts");
    }

    private static com.android.tools.smali.dexlib2.iface.Field field(Map<String, ClassDef> all, String owner, String name) {
        ClassDef type = all.get(owner);
        if (type == null) return null;
        for (com.android.tools.smali.dexlib2.iface.Field field : type.getFields())
            if (name.equals(field.getName())) return field;
        return null;
    }

    private static void requireField(Map<String, ClassDef> all, String owner, String name, String type) {
        com.android.tools.smali.dexlib2.iface.Field field = field(all, owner, name);
        require(field != null && type.equals(field.getType()), "Missing field " + owner + "->" + name + ":" + type);
    }

    private static void requireMethod(Map<String, ClassDef> all, String owner, String name, String descriptor) {
        ClassDef type = all.get(owner);
        if (type != null) for (com.android.tools.smali.dexlib2.iface.Method method : type.getMethods())
            if (name.equals(method.getName())
                && descriptor.equals("(" + String.join("", method.getParameterTypes()) + ")" + method.getReturnType()))
                return;
        throw new AssertionError("Missing method " + owner + "->" + name + descriptor);
    }
}
