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
        ClassDef original = null, mapperClass = null, subredditClass = null, flairSourceClass = null,
            subredditSourceClass = null, headerClass = null, flairRowClass = null, flairChipClass = null,
            filterChipLambdaClass = null;
        for (String path : args) try (InputStream input = new BufferedInputStream(new FileInputStream(path))) {
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(null, input);
            for (ClassDef candidate : dex.getClasses())
                if (RedditContentFilterPatch.LINK.equals(candidate.getType())) original = candidate;
                else if (RedditContentFilterPatch.FEED_SECTION_MAPPER.equals(candidate.getType())) mapperClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT.equals(candidate.getType())) subredditClass = candidate;
                else if (RedditContentFilterPatch.FLAIR_SOURCE.equals(candidate.getType())) flairSourceClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT_SOURCE.equals(candidate.getType())) subredditSourceClass = candidate;
                else if (RedditContentFilterPatch.SUBREDDIT_HEADER_VIEW.equals(candidate.getType())) headerClass = candidate;
                else if (RedditContentFilterPatch.FLAIR_ROW.equals(candidate.getType())) flairRowClass = candidate;
                else if (RedditContentFilterPatch.FLAIR_CHIP.equals(candidate.getType())) flairChipClass = candidate;
                else if (RedditContentFilterPatch.FILTER_CHIP_LAMBDA.equals(candidate.getType())) filterChipLambdaClass = candidate;
        }
        if (original == null) throw new AssertionError("Reddit Link model not found");
        MutableClass link = new MutableClass(original);
        MutableMethod constructor = RedditContentFilterPatch.findLinkConstructor(link);
        List<Instruction> before = RedditContentFilterPatch.instructions(constructor);
        RedditContentFilterPatch.hookLinkRegistration(constructor);
        List<Instruction> after = RedditContentFilterPatch.instructions(constructor);
        require(after.size() == before.size() + 1, "Expected one Link registration instruction");

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
        require(mapperAfter.size() == mapperBefore + 2, "Expected two feed-section emission instructions");
        int calls = 0;
        for (Instruction instruction : mapperAfter) if (instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
            && instruction instanceof ReferenceInstruction) {
            MethodReference ref = (MethodReference) ((ReferenceInstruction) instruction).getReference();
            if (RedditContentFilterPatch.EXTENSION.equals(ref.getDefiningClass())
                && "filterFeedSection".equals(ref.getName())) calls++;
        }
        require(calls == 1, "Expected exactly one FeedPostSection emission filter");
        System.out.println("PASS: Link, Subreddit and flair network source registration and FeedPostSection emission filter");
    }
}
