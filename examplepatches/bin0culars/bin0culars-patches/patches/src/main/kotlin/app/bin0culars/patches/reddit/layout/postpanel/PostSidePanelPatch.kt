package app.bin0culars.patches.reddit.layout.postpanel

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.bin0culars.patches.reddit.shared.ScreenCreateViewFingerprint
import app.bin0culars.patches.reddit.shared.screenCreateViewRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/PostSidePanelPatch;"

@Suppress("unused")
val postSidePanelPatch = patch(
    name = "Post side panel",
    description = "On tablets in landscape, opens posts in a panel on the right while the feed stays visible. Can be turned off in Settings → bin0culars mods.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(binocularsModsSettingsPatch)
    extendWith("extensions/extension.mpe")
    execute {
        addBinocularsModsSetting(
            BinocularsModsSetting(
                key = "post_side_panel",
                section = BinocularsModsSection.POSTS,
                title = "Post side panel",
                summary = "On wide screens, posts open in a panel on the right and the feed stays visible behind it. Tap the dimmed feed or press Back to close the panel.",
                default = true,
            ),
        )
        addBinocularsModsSetting(
            BinocularsModsSetting(
                key = "post_side_panel_width",
                section = BinocularsModsSection.POSTS,
                title = "Panel width",
                summary = "How much of the feed the panel covers, in grid columns.",
                parentKey = "post_side_panel",
                choices = listOf(
                    BinocularsModsChoice("one", "One column"),
                    BinocularsModsChoice("two", "Two columns"),
                ),
                defaultChoice = "one",
            ),
        )
        addBinocularsModsSetting(
            BinocularsModsSetting(
                key = "post_side_panel_dim",
                section = BinocularsModsSection.POSTS,
                title = "Feed dimming",
                summary = "How dark the feed behind the panel gets. Light is Reddit's own level.",
                parentKey = "post_side_panel",
                choices = listOf(
                    BinocularsModsChoice("off", "Off"),
                    BinocularsModsChoice("light", "Light"),
                    BinocularsModsChoice("medium", "Medium"),
                    BinocularsModsChoice("strong", "Strong"),
                ),
                defaultChoice = "medium",
            ),
        )

        val modalClass = ModalPresentationFingerprint.instructionMatches.first().methodReference.definingClass

        PostDetailPagerPresentationFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->usePanel(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :full_screen
                new-instance v0, $modalClass
                const/4 v1, 0x1
                const/4 v2, 0x0
                const/16 v3, 0x1e
                invoke-direct { v0, v1, v2, v2, v3 }, $modalClass-><init>(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;I)V
                return-object v0
                :full_screen
                nop
            """,
        )

        val createViewMethod = ScreenCreateViewFingerprint.method
        val (returnIndex, screenRegister, viewRegister) = screenCreateViewRegisters()

        val invokeInstruction = when {
            screenRegister < 16 && viewRegister < 16 ->
                "invoke-static { v$screenRegister, v$viewRegister }, $EXTENSION_CLASS->onScreenViewCreated(Ljava/lang/Object;Landroid/view/View;)V"

            viewRegister == screenRegister + 1 ->
                "invoke-static/range { v$screenRegister .. v$viewRegister }, $EXTENSION_CLASS->onScreenViewCreated(Ljava/lang/Object;Landroid/view/View;)V"

            else ->
                throw PatchException("Registers v$screenRegister and v$viewRegister cannot be passed to onScreenViewCreated (registers >= 16 and not consecutive)")
        }

        createViewMethod.replaceInstruction(returnIndex, invokeInstruction)
        createViewMethod.addInstruction(returnIndex + 1, "return-object v$viewRegister")

        val helperMethodRef = FeedCardOpenPostFingerprint.classDef.methods
            .asSequence()
            .filter { it.implementation != null }
            .flatMap { it.instructions.asSequence() }
            .filter { it.opcode == Opcode.INVOKE_STATIC }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .firstOrNull { ref ->
                val params = ref.parameterTypes.map { it.toString() }
                ref.returnType == "V" &&
                    params.size == 3 &&
                    params[0] == "Landroid/content/Context;" &&
                    params[1] == "Lcom/reddit/screen/BaseScreen;" &&
                    params[2].startsWith("L") &&
                    params[2].endsWith(";")
            } ?: throw PatchException("Could not find helper method reference in ${FeedCardOpenPostFingerprint.classDef.type}")

        val helperReference = "${helperMethodRef.definingClass}->${helperMethodRef.name}(${helperMethodRef.parameterTypes.joinToString("")})${helperMethodRef.returnType}"

        FeedCardOpenPostFingerprint.method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v1, p1
                move-object/from16 v2, p3
                invoke-static { v2 }, $EXTENSION_CLASS->usePanel(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :card_transition
                const/4 v0, 0x0
                invoke-static { v1, v2, v0 }, $helperReference
                return-void
                :card_transition
                nop
            """,
        )
    }
}
