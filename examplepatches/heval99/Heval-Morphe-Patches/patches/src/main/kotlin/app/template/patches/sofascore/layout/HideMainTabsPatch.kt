package app.template.patches.sofascore.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.sofascore.controls.SOFASCORE_CONTROLS
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Constants of the main screen's bottom tab enum (R8-renamed, x0e in 26.10.26). */
private val MAIN_TAB_NAMES = listOf("MATCHES", "FAVORITES", "FEATURED_TOURNAMENT", "FEED", "FANTASY")

/**
 * One switch per hideable bottom tab, off by default. SofascoreControls.mainTabFeature maps the
 * enum constant names to these ids (FEATURED_TOURNAMENT and WORLD_CUP share one). The sport tab
 * has no switch. Restart required: the tab list is built when the main screen is created.
 */
internal val MAIN_TAB_FEATURES: List<HevalFeature> = listOf(
    Triple("favorites", "Favorites", "Favorites tab"),
    Triple("feed", "Never Miss", "Never Miss tab"),
    Triple("fantasy", "Fantasy", "Fantasy tab"),
    Triple("featured", "Featured tournament", "featured tournament tab (World Cup and similar)"),
).map { (id, title, what) ->
    HevalFeature(
        id = "sofascore.hide_main_tab_$id",
        name = "Hide $title tab",
        description = "Hides the $what from the bottom bar.",
        category = SofascoreControlsCategory.MAIN_TABS,
        default = false,
        restartRequired = true,
    )
}

private fun ClassDef.isMainTabEnum() = superclass == "Ljava/lang/Enum;" && methods.any { method ->
    method.name == "<clinit>" && method.implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }?.toSet()?.containsAll(MAIN_TAB_NAMES) == true
}

// Several Heval Controls features in one patch: they are registered once the hook is in place.
@Suppress("unused")
val hideMainTabsPatch = bytecodePatch(
    name = "Hide main tabs",
    description = "Adds switches to hide tabs from the bottom bar.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        val enums = classDefByStrings("FEATURED_TOURNAMENT").filter { it.isMainTabEnum() }
        val tabEnum = enums.singleOrNull()?.type
            ?: throw PatchException("Expected one main tab enum, found ${enums.map { it.type }}")

        // The tab list builder (wse.q in 26.10.26): static ArrayList(Context, String sport) that
        // starts from the enum entries, keeps the sport's tabs, adds the featured tournament / World
        // Cup tab behind "should_show_world_cup", always adds the feed and adds Fantasy when it is
        // available. MainActivity builds its pager and bottom bar from the result.
        val builders = classDefByStrings("should_show_world_cup").flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "Ljava/util/ArrayList;" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.SGET_OBJECT &&
                            ((it as ReferenceInstruction).reference as FieldReference).type == tabEnum
                    } == true
            }
        }
        val builder = builders.singleOrNull()
            ?: throw PatchException("Expected one main tab list builder, found ${builders.map { "${it.definingClass}->${it.name}" }}")

        val returns = builder.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("The main tab list builder has no return-object")

        // Back to front, so the earlier indices stay valid. At the label: jumps to the return land
        // on the filter too.
        returns.sortedDescending().forEach { ret ->
            val register = (builder.getInstruction(ret) as OneRegisterInstruction).registerA
            builder.addInstructionsAtControlFlowLabelChecked(
                ret,
                """
                    invoke-static/range { v$register .. v$register }, $SOFASCORE_CONTROLS->filterMainTabs(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                    move-result-object v$register
                """.trimIndent(),
            )
        }

        MAIN_TAB_FEATURES.forEach { sofascoreControls.register(it) }
    }
}
