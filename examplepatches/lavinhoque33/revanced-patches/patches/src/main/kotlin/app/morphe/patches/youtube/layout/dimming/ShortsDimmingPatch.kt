package app.morphe.patches.youtube.layout.dimming

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.hasResourceId
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.HIDE_SHORTS_DIMMING
import app.morphe.patches.youtube.utils.playservice.is_21_39_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.ResourceUtils.getContext
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.utils.toolbar.hookToolBarWithImageView
import app.morphe.patches.youtube.utils.toolbar.toolBarHookPatch
import app.morphe.util.Utils.printWarn
import app.morphe.util.asSequence
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val SCRIM_VIEW = "app.morphe.extension.youtube.patches.shorts.ShortsScrimView"
private const val PRESENTATION = "Lapp/morphe/extension/youtube/patches/shorts/ShortsPresentation;"
private const val VERTICAL_SCRIMS = "reel_player_overlay_v2_scrims_vertical"
private const val SHORTS_BOTTOM_SCRIM = "reel_scrim_shorts_while_bottom_gradient"
private const val SHORTS_TOP_SCRIM = "reel_scrim_shorts_while_top"
private const val CONTEXT_CONSTRUCTOR = "<init>(Landroid/content/Context;)V"

private object ShortsWatchPlayerFingerprint : Fingerprint(
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    returnType = "Landroid/view/View;",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "reel_watch_player"),
        methodCall(
            smali = "Landroid/view/View;->findViewById(I)Landroid/view/View;",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
    ),
)

private object ProgrammaticShortsScrimFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        resourceLiteral(ResourceType.ID, SHORTS_BOTTOM_SCRIM),
        methodCall(
            smali = "Landroid/view/View;->setId(I)V",
            location = MatchAfterImmediately(),
        ),
    ),
)

private class ScrimCreation(
    val method: MutableMethod,
    val allocationIndex: Int,
    val viewRegister: Int,
    val contextRegister: Int,
) {
    fun install() {
        val descriptor = "L${SCRIM_VIEW.replace('.', '/')};"
        method.replaceInstruction(allocationIndex, "new-instance v$viewRegister, $descriptor")
        method.replaceInstruction(
            allocationIndex + 1,
            "invoke-direct { v$viewRegister, v$contextRegister }, $descriptor->$CONTEXT_CONSTRUCTOR",
        )
    }
}

private fun BytecodePatchContext.findProgrammaticScrim(): ScrimCreation? {
    val match = ProgrammaticShortsScrimFingerprint.matchOrNull() ?: return null
    val idIndex = match.instructionMatches.first().index
    if (idIndex < 2) return null

    val method = match.method
    val allocation = method.getInstruction<Instruction>(idIndex - 2)
    val constructor = method.getInstruction<Instruction>(idIndex - 1)
    val idSetter = method.getInstruction<Instruction>(idIndex + 1) as? FiveRegisterInstruction ?: return null
    if (allocation.opcode != Opcode.NEW_INSTANCE ||
        allocation.getReference<TypeReference>()?.type != "Landroid/view/View;" ||
        constructor.opcode != Opcode.INVOKE_DIRECT ||
        constructor.getReference<MethodReference>()?.toString() != "Landroid/view/View;->$CONTEXT_CONSTRUCTOR"
    ) return null

    val view = (allocation as OneRegisterInstruction).registerA
    val arguments = constructor as FiveRegisterInstruction
    val id = method.getInstruction<OneRegisterInstruction>(idIndex).registerA
    if (view != arguments.registerC || view != idSetter.registerC || id != idSetter.registerD) return null

    return ScrimCreation(method, idIndex - 2, view, arguments.registerD)
}

private fun Element.hasId(name: String) = getAttribute("android:id").substringAfter('/') == name

private fun Document.findDecorativeScrim(name: String, parentId: String? = null): Element? =
    getElementsByTagName("View").asSequence().filterIsInstance<Element>().singleOrNull { view ->
        view.hasId(name) && view.hasAttribute("android:background") &&
                (parentId == null || (view.parentNode as? Element)?.hasId(parentId) == true)
    }

private fun ResourcePatchContext.installScrimViews(): Boolean {
    val overlayScrims = "res/layout/reel_player_overlay_scrims.xml"
    val watchFragment = "res/layout/reel_watch_fragment.xml"
    val playerOverlay = "res/layout/reel_player_overlay.xml"
    if (listOf(overlayScrims, watchFragment, playerOverlay).any { !get(it).isFile }) return false

    // The linear watch fragment includes the regular fragment. Other reel overlays share the scrim layout.
    document(overlayScrims).use { scrimLayout ->
        val verticalScrims = listOf(
            "reel_scrim_vertical_top",
            "reel_scrim_vertical_bottom_static",
            "reel_scrim_vertical_bottom_gradient",
            SHORTS_BOTTOM_SCRIM,
        ).map { scrimLayout.findDecorativeScrim(it, VERTICAL_SCRIMS) ?: return false }

        document(watchFragment).use { watchLayout ->
            val topScrim = watchLayout.findDecorativeScrim(SHORTS_TOP_SCRIM) ?: return false

            document(playerOverlay).use { overlayLayout ->
                val bottomScrim = overlayLayout.findDecorativeScrim(SHORTS_BOTTOM_SCRIM) ?: return false

                for (scrim in verticalScrims + topScrim + bottomScrim) {
                    scrim.ownerDocument.renameNode(scrim, null, SCRIM_VIEW)
                }
            }
        }
    }

    return true
}

private fun BytecodePatchContext.installPresentation() {
    val watchPlayer = if (hasResourceId(ResourceType.ID, "reel_watch_player")) {
        ShortsWatchPlayerFingerprint.matchOrNull()
    } else null
    if (watchPlayer == null || !hasResourceId(ResourceType.ID, "reel_watch_fragment_root")) {
        printWarn("Shorts presentation settings are unavailable: cannot find the native Shorts watch view.")
        return
    }

    val result = watchPlayer.instructionMatches.last().index
    val register = watchPlayer.method.getInstruction<OneRegisterInstruction>(result).registerA
    watchPlayer.method.addInstruction(
        result + 1,
        "invoke-static/range {v$register .. v$register}, $PRESENTATION->onReelCreated(Landroid/view/View;)V",
    )
    addPreference(
        arrayOf("PREFERENCE_SCREEN: SHORTS", "SETTINGS: SHORTS_IMMERSIVE_STATUS_BAR"),
        HIDE_SHORTS_DIMMING,
    )

    if (hasResourceId(ResourceType.ID, "reel_player_delegated_overlay") &&
        hasResourceId(ResourceType.ID, "reel_player_footer_container")
    ) {
        hookToolBarWithImageView("$PRESENTATION->onToolbarIconBound")
        addPreference(arrayOf("PREFERENCE_SCREEN: SHORTS", "SETTINGS: SHORTS_OVERLAY_OPACITY"))
    } else {
        printWarn("Shorts overlay opacity is unavailable: cannot find the native Shorts overlay controls.")
    }
}

@Suppress("unused")
val shortsDimmingPatch = bytecodePatch(
    HIDE_SHORTS_DIMMING.title,
    HIDE_SHORTS_DIMMING.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(settingsPatch, sharedExtensionPatch, resourceMappingPatch, versionCheckPatch, toolBarHookPatch)

    execute {
        installPresentation()

        val programmaticScrim = findProgrammaticScrim()
        if (is_21_39_or_greater && programmaticScrim == null) {
            printWarn("\"${HIDE_SHORTS_DIMMING.title}\" cannot find the Shorts bottom scrim constructor.")
            return@execute
        }

        if (!getContext().installScrimViews()) {
            printWarn("\"${HIDE_SHORTS_DIMMING.title}\" cannot find all of the Shorts scrim layouts.")
            return@execute
        }

        programmaticScrim?.install()
        addPreference(
            arrayOf("PREFERENCE_SCREEN: SHORTS", "SETTINGS: HIDE_SHORTS_DIMMING"),
            HIDE_SHORTS_DIMMING,
        )
    }
}
