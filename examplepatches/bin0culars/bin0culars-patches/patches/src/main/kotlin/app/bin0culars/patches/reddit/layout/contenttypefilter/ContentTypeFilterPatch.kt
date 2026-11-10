package app.bin0culars.patches.reddit.layout.contenttypefilter

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private const val HOME_FEED_SCREEN_CLASS = "Lcom/reddit/feeds/home/impl/ui/HomeFeedScreen;"
private const val POPULAR_FEED_SCREEN_CLASS = "Lcom/reddit/feeds/popular/impl/ui/PopularFeedScreen;"
private const val REDDIT_FEED_VIEW_MODEL_CLASS = "Lcom/reddit/feeds/impl/ui/RedditFeedViewModel;"

@Suppress("unused")
val contentTypeFilterPatch =
    patch(
        name = "Content-type filter",
        description = "Show only videos, images, text or link posts on Home and Popular.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            registerSettings()
            val dataSourceType = hookFeedPages()
            hookFeedScreenConstructors()
            fillClassifierBridges()
            fillFeedTypeBridge(dataSourceType)
            fillFeedViewModelBridge()
        }
    }

private fun registerSettings() {
    addBinocularsModsSetting(
        BinocularsModsSetting(
            key = "content_type_filter",
            section = BinocularsModsSection.FEED,
            title = "Content-type filter",
            summary =
            "Show only one kind of post on Home and Popular. Filtering happens on your device, so some pages load fewer posts, and with rare choices like Links the feed can end early; tap Home to load more. GIFs count as videos; posts in Classic view are always shown.",
            choices = listOf(
                BinocularsModsChoice("all", "All posts"),
                BinocularsModsChoice("videos", "Videos"),
                BinocularsModsChoice("images", "Images"),
                BinocularsModsChoice("text", "Text"),
                BinocularsModsChoice("links", "Links"),
            ),
            defaultChoice = "all",
        ),
    )
}

private fun fillFeedTypeBridge(dataSourceType: String) {
    val dsClassDef = classDefBy(dataSourceType)
    val feedTypeField = dsClassDef.fields.firstOrNull { it.type == "Lcom/reddit/feeds/data/FeedType;" }
        ?: throw PatchException("Could not find FeedType field in $dataSourceType")

    val smali = """
        check-cast p0, $dataSourceType
        iget-object p0, p0, $dataSourceType->${feedTypeField.name}:Lcom/reddit/feeds/data/FeedType;
        return-object p0
    """.trimIndent()
    fillBridge("feedType", smali)
}

private fun isViewModelGetterCall(window: List<Instruction>): Boolean {
    val instr0 = window[0]
    val instr1 = window[1]
    return instr0.opcode == Opcode.INVOKE_VIRTUAL &&
        instr0.methodRef()?.let { it.definingClass == HOME_FEED_SCREEN_CLASS && it.parameterTypes.isEmpty() } == true &&
        instr1.opcode == Opcode.MOVE_RESULT_OBJECT &&
        window.drop(2).any { it.opcode == Opcode.CHECK_CAST && it.typeRef() == REDDIT_FEED_VIEW_MODEL_CLASS }
}

private fun fillFeedViewModelBridge() {
    val homeFeedClass = classDefBy(HOME_FEED_SCREEN_CLASS)
    val vmMethodRef = homeFeedClass.methods
        .asSequence()
        .mapNotNull { it.implementation?.instructions?.toList() }
        .flatMap { it.windowed(6).asSequence() }
        .firstOrNull(::isViewModelGetterCall)
        ?.first()
        ?.methodRef()
        ?: throw PatchException("Could not find HomeFeedScreen invoke-virtual followed by check-cast to RedditFeedViewModel")

    val vmMethodName = vmMethodRef.name
    val vmReturnType = vmMethodRef.returnType

    val vmInterface = homeFeedClass.interfaces.firstOrNull { ifaceType ->
        classDefBy(ifaceType).methods.any { m ->
            m.name == vmMethodName &&
                m.returnType == vmReturnType &&
                isAbstractNoArg(m)
        }
    } ?: throw PatchException("Could not find interface declaring abstract $vmMethodName()$vmReturnType in HomeFeedScreen interfaces")

    val smali = """
        check-cast p0, $vmInterface
        invoke-interface {p0}, $vmInterface->$vmMethodName()$vmReturnType
        move-result-object p0
        return-object p0
    """.trimIndent()
    fillBridge("feedViewModel", smali)
}

private fun parameterRegisterCount(method: MutableMethod): Int =
    1 + method.parameterTypes.sumOf { type ->
        val first = type.firstOrNull()
        if (first == 'J' || first == 'D') 2 else 1
    }

private fun hookInitMethod(method: MutableMethod) {
    val implementation = method.implementation ?: return
    val p0 = implementation.registerCount - parameterRegisterCount(method)
    val invokeInstruction = if (p0 < 16) {
        "invoke-static { v$p0 }, $EXTENSION_CLASS->registerFeedScreen(Ljava/lang/Object;)V"
    } else {
        "invoke-static/range { v$p0 .. v$p0 }, $EXTENSION_CLASS->registerFeedScreen(Ljava/lang/Object;)V"
    }

    val returnIndices = method.instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }
        .reversed()

    for (index in returnIndices) {
        method.addInstructions(index, invokeInstruction)
    }
}

private fun hookScreenConstructors(screenType: String) {
    val initMethods = mutableClassDefBy(screenType).methods.filter { it.name == "<init>" }
    for (method in initMethods) {
        hookInitMethod(method)
    }
}

private fun hookFeedScreenConstructors() {
    hookScreenConstructors(HOME_FEED_SCREEN_CLASS)
    hookScreenConstructors(POPULAR_FEED_SCREEN_CLASS)
}
