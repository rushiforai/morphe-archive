package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlin.Unit;

/** Separately selectable home-feed flair rendering patch. */
public final class RedditShowHomeFlairsPatch {
    public static final String NAME = "Reddit - Show flairs in home feed (Experimental)";
    private static final String LAYOUT =
        "Lapp/morphe/extension/reddit/settings/preference/categories/LayoutPreferenceCategory;";
    private static BytecodePatch patch;

    private RedditShowHomeFlairsPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static synchronized BytecodePatch getRedditShowHomeFlairsPatch() {
        if (patch == null) patch = PatchKt.bytecodePatch(NAME,
            "Shows native post flair badges below titles in the home feed, including cached and joined-community posts. Controlled by Morphe > Layout.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(RedditContentFilterPatch.PACKAGE, "Reddit", null,
                    ApkFileType.APK, null, null,
                    Collections.singletonList(new AppTarget(RedditContentFilterPatch.VERSION, false, null)), false));
                // This patch owns the extension and post-data hooks required to render
                // home-feed flairs. The content-filter patch depends on this patch and
                // adds only its filtering-specific hooks.
                builder.extendWith(RedditContentFilterPatch::extensionStream);
                builder.execute(context -> {
                    if (!RedditContentFilterPatch.PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !RedditContentFilterPatch.VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw RedditContentFilterPatch.unsupported("Expected "
                            + RedditContentFilterPatch.PACKAGE + " " + RedditContentFilterPatch.VERSION);

                    RedditContentFilterPatch.hookLinkRegistration(RedditContentFilterPatch.findLinkConstructor(
                        context.mutableClassDefBy(RedditContentFilterPatch.LINK)));
                    RedditContentFilterPatch.hookPostByIdSource(
                        context.mutableClassDefBy(RedditContentFilterPatch.POST_BY_ID_SOURCE));
                    RedditContentFilterPatch.hookLinkSource(
                        context.mutableClassDefBy(RedditContentFilterPatch.LINK_SOURCE));
                    RedditContentFilterPatch.hookLinkRepository(
                        context.mutableClassDefBy(RedditContentFilterPatch.LINK_REPOSITORY));
                    RedditContentFilterPatch.hookFeedLinkMapper(RedditContentFilterPatch.findFeedLinkMapper(
                        context.mutableClassDefBy(RedditContentFilterPatch.FEED_LINK_MAPPER), "a"));
                    RedditContentFilterPatch.hookFeedLinkMapper(RedditContentFilterPatch.findFeedLinkMapper(
                        context.mutableClassDefBy(RedditContentFilterPatch.FEED_LINK_ALTERNATE_MAPPER), "D"));
                    RedditContentFilterPatch.hookFeedElementProcessor(
                        RedditContentFilterPatch.findFeedElementProcessor(
                            context.mutableClassDefBy(RedditContentFilterPatch.FEED_ELEMENT_PROCESSOR)));

                    MutableClass layout = context.mutableClassDefByOrNull(LAYOUT);
                    if (layout == null) throw RedditContentFilterPatch.unsupported("Morphe Layout category is missing");
                    MutableMethod status = null, preferences = null;
                    for (MutableMethod method : layout.getMethods()) {
                        if ("getSettingsStatus".equals(method.getName()) && "Z".equals(method.getReturnType()))
                            status = method;
                        if ("addPreferences".equals(method.getName()) && "V".equals(method.getReturnType())
                            && method.getParameterTypes().equals(Collections.singletonList("Landroid/content/Context;")))
                            preferences = method;
                    }
                    if (status == null || preferences == null || status.getImplementation() == null
                        || preferences.getImplementation() == null)
                        throw RedditContentFilterPatch.unsupported("Morphe Layout methods changed");
                    status.getImplementation().addInstruction(0, new BuilderInstruction11n(Opcode.CONST_4, 0, 1));
                    status.getImplementation().addInstruction(1, new BuilderInstruction11x(Opcode.RETURN, 0));
                    int firstParameter = preferences.getImplementation().getRegisterCount() - 2;
                    preferences.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, firstParameter, 2,
                            new ImmutableMethodReference(RedditContentFilterPatch.EXTENSION,
                                "addHomeFlairSetting", Arrays.asList("Ljava/lang/Object;", "Landroid/content/Context;"),
                                "V")));

                    MutableMethod mapper = RedditContentFilterPatch.findFeedSectionMapper(
                        context.mutableClassDefBy(RedditContentFilterPatch.FEED_SECTION_MAPPER));
                    int sourceRegister = mapper.getImplementation().getRegisterCount() - 1;
                    mapper.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, sourceRegister, 1,
                            new ImmutableMethodReference(RedditContentFilterPatch.EXTENSION,
                                "inspectFeedSource", Collections.singletonList("Ljava/lang/Object;"), "V")));
                    List<Instruction> instructions = RedditContentFilterPatch.instructions(mapper);
                    int insertion = -1, sectionRegister = -1;
                    int create = -1;
                    for (int i = 0; i < instructions.size(); i++) {
                        Instruction instruction = instructions.get(i);
                        if (instruction.getOpcode() == Opcode.NEW_INSTANCE
                            && instruction instanceof ReferenceInstruction
                            && RedditContentFilterPatch.FEED_POST_SECTION.equals(
                                ((ReferenceInstruction) instruction).getReference().toString())) {
                            create = i;
                            sectionRegister = ((OneRegisterInstruction) instruction).getRegisterA();
                        } else if (create >= 0 && instruction.getOpcode() == Opcode.RETURN_OBJECT
                            && ((OneRegisterInstruction) instruction).getRegisterA() == sectionRegister) {
                            insertion = i;
                            break;
                        }
                    }
                    if (insertion < 0) throw RedditContentFilterPatch.unsupported(
                        "Home-feed section return was not found");
                    mapper.getImplementation().addInstruction(insertion,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, sectionRegister, 1,
                            new ImmutableMethodReference(RedditContentFilterPatch.EXTENSION,
                                "showHomePostFlair", Collections.singletonList("Ljava/lang/Object;"),
                                "Ljava/lang/Object;")));
                    mapper.getImplementation().addInstruction(insertion + 1,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, sectionRegister));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
        return patch;
    }
}
