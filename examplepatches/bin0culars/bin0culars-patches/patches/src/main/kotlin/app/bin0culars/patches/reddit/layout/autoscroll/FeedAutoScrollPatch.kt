package app.bin0culars.patches.reddit.layout.autoscroll

import app.bin0culars.patches.reddit.layout.tabletgrid.ListFeedFingerprint
import app.bin0culars.patches.reddit.layout.tabletgrid.MasonryFeedFingerprint
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.FEED
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/FeedAutoScrollPatch;"

private fun fillBridge(name: String, smali: String) {
    Fingerprint(definingClass = EXTENSION_CLASS, name = name).method.addInstructions(0, smali)
}

private fun allInterfaces(type: String): Set<String> {
    val result = mutableSetOf<String>()
    var current: String? = type
    while (current != null && current != "Ljava/lang/Object;") {
        val def = classDefByOrNull(current) ?: break
        for (iface in def.interfaces) {
            if (result.add(iface)) {
                result.addAll(allInterfaces(iface))
            }
        }
        current = def.superclass
    }
    return result
}

@Suppress("unused")
val feedAutoScrollPatch =
    patch(
        name = "Feed auto-scroll",
        description = "Adds a play button to the navigation bar that slowly scrolls the feed on screen. Speed is set in bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)

        dependsOn(binocularsModsSettingsPatch)

        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "feed_auto_scroll",
                    section = FEED,
                    title = "Feed auto-scroll",
                    summary =
                    "Adds a play button to the navigation bar (on phones, just above it) that slowly scrolls the feed on screen. Tap stop or touch the screen to stop.",
                    default = false,
                ),
            )
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "feed_auto_scroll_speed",
                    section = FEED,
                    title = "Auto-scroll speed",
                    summary = "How fast the feed glides while auto-scrolling.",
                    parentKey = "feed_auto_scroll",
                    choices = listOf(
                        BinocularsModsChoice("slow", "Slow"),
                        BinocularsModsChoice("medium", "Medium"),
                        BinocularsModsChoice("fast", "Fast"),
                        BinocularsModsChoice("very_fast", "Very fast"),
                    ),
                    defaultChoice = "medium",
                ),
            )

            val listInterfaces = allInterfaces("Landroidx/compose/foundation/lazy/b;")
            val gridInterfaces = allInterfaces("Landroidx/compose/foundation/lazy/staggeredgrid/b;")
            val commonInterfaces = listInterfaces.intersect(gridInterfaces)

            val (scrollInterface, scrollMethodName) = commonInterfaces.firstNotNullOfOrNull { iface ->
                classDefByOrNull(iface)?.methods?.firstOrNull { m ->
                    m.returnType == "F" && m.parameterTypes.map { it.toString() } == listOf("F")
                }?.let { iface to it.name }
            } ?: throw PatchException("Could not find Compose ScrollableState interface with (F)F method")

            fillBridge(
                "dispatchScroll",
                """
                    check-cast p0, $scrollInterface
                    invoke-interface {p0, p1}, $scrollInterface->$scrollMethodName(F)F
                    move-result p0
                    return p0
                """,
            )

            val listFeedMethod = ListFeedFingerprint.method
            val listFeedImplementation = listFeedMethod.implementation
                ?: throw PatchException("ListFeedFingerprint has no implementation")

            val listParams = listFeedMethod.parameterTypes.map { it.toString() }
            val stateIndex = listParams.indexOfFirst { it == "Landroidx/compose/foundation/lazy/b;" }
            if (stateIndex == -1) {
                throw PatchException("Could not find state parameter in ListFeedFingerprint")
            }
            if (listParams.size < 2 || !listParams[1].startsWith("L")) {
                throw PatchException("Parameter 1 in ${listFeedMethod.name} is not an object type: ${listParams.getOrNull(1)}")
            }

            val paramRegCount = listFeedMethod.parameterTypes.sumOf {
                if (it.toString() == "J" || it.toString() == "D") 2 else 1
            }
            val locals = listFeedImplementation.registerCount - paramRegCount
            if (locals < 2) {
                throw PatchException("ListFeedFingerprint method has fewer than 2 locals: $locals")
            }

            listFeedMethod.addInstructions(
                0,
                """
                    move-object/from16 v0, p$stateIndex
                    move-object/from16 v1, p1
                    invoke-static {v0, v1}, $EXTENSION_CLASS->onListFeed(Ljava/lang/Object;Ljava/lang/Object;)V
                """,
            )

            val innerMatch = MasonryInnerFeedFingerprint.match(MasonryFeedFingerprint.classDef)
            val innerMethod = innerMatch.method
            val callIndex = innerMatch.instructionMatches.first().index
            val moveResultIndex = callIndex + 1
            val moveResultInstruction = innerMethod.getInstruction(moveResultIndex)
            if (moveResultInstruction.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Instruction after grid state call in ${innerMethod.name} is not move-result-object")
            }
            val stateRegister = (moveResultInstruction as OneRegisterInstruction).registerA

            val invokeGrid = if (stateRegister > 15) {
                "invoke-static/range { v$stateRegister .. v$stateRegister }, $EXTENSION_CLASS->onGridState(Ljava/lang/Object;)V"
            } else {
                "invoke-static { v$stateRegister }, $EXTENSION_CLASS->onGridState(Ljava/lang/Object;)V"
            }
            innerMethod.addInstructions(moveResultIndex + 1, invokeGrid)

            val innerImplementation = innerMethod.implementation
                ?: throw PatchException("Method ${innerMethod.name} has no implementation")
            val innerParams = innerMethod.parameterTypes.map { it.toString() }
            if (innerParams.size < 2 || !innerParams[1].startsWith("L")) {
                throw PatchException("Parameter 1 in ${innerMethod.name} is not an object type: ${innerParams.getOrNull(1)}")
            }
            val parameterRegisterCount = innerMethod.parameterTypes.sumOf {
                if (it.toString() == "J" || it.toString() == "D") 2 else 1
            }
            val vS = innerImplementation.registerCount - parameterRegisterCount + 1

            val invokeComposing =
                "invoke-static/range { v$vS .. v$vS }, $EXTENSION_CLASS->onGridComposing(Ljava/lang/Object;)V"
            innerMethod.addInstructions(0, invokeComposing)

            FeedVisibilityEventFingerprint.method.addInstructions(
                0,
                "invoke-static {}, $EXTENSION_CLASS->onFeedVisibilityChanged()V",
            )

            val postPagerMethod = PostPagerInflateFingerprint.method
            val inflateIndex = PostPagerInflateFingerprint.instructionMatches[1].index
            val inflateResultIndex = inflateIndex + 1
            val inflateResultInstruction = postPagerMethod.getInstruction(inflateResultIndex)
            if (inflateResultInstruction.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Instruction after inflate call in ${postPagerMethod.name} is not move-result-object")
            }
            val viewRegister = (inflateResultInstruction as OneRegisterInstruction).registerA
            val invokePostPage = if (viewRegister > 15) {
                "invoke-static/range { v$viewRegister .. v$viewRegister }, $EXTENSION_CLASS->onPostPageViewCreated(Landroid/view/View;)V"
            } else {
                "invoke-static { v$viewRegister }, $EXTENSION_CLASS->onPostPageViewCreated(Landroid/view/View;)V"
            }
            postPagerMethod.addInstructions(inflateResultIndex + 1, invokePostPage)

            NavBarStateChangeFingerprint.method.addInstructions(
                0,
                "invoke-static { p1 }, $EXTENSION_CLASS->onNavBarFraction(F)V",
            )

            MainActivityResumeFingerprint.method.addInstructions(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS->onActivityResumed(Landroid/app/Activity;)V",
            )

            MainActivityPauseFingerprint.method.addInstructions(
                0,
                "invoke-static { p0 }, $EXTENSION_CLASS->onActivityPaused(Landroid/app/Activity;)V",
            )
        }

        finalize {
            resourceXml("res/values/strings.xml").use { strings ->
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_auto_scroll_start")
                    text = "Start auto-scroll"
                }
                strings.root.appendChild("string") {
                    setAttribute("name", "bin0culars_auto_scroll_stop")
                    text = "Stop auto-scroll"
                }
            }
        }
    }
