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
        for (String path : args) try (InputStream input = new BufferedInputStream(new FileInputStream(path))) {
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, input);
            for (ClassDef candidate : dex.getClasses()) {
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
                else if ("Lz49;".equals(candidate.getType())) headerParent = candidate;
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
            String name = RedditContentFilterPatch.FEED_LINK_MAPPER.equals(feedLinkClass.getType()) ? "a" : "D";
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
        System.out.println("PASS: Link, Subreddit and flair network source registration and FeedPostSection emission filter");
    }
}
