package app.template.patches.sofascore.controls

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val EVENT_HEAD_FLAGS = "Lcom/sofascore/model/mvvm/model/EventHeadFlags;"
private const val EVENT_ACTIVITY = "Lcom/sofascore/results/event/EventActivity;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"

/**
 * Constants of the match page's tab enum (EventViewPagerAdapter$Type, R8-renamed). Its <clinit>
 * passes these names to Enum's constructor, so `name()` returns them at runtime; the
 * extension's SofascoreControls.tabFeature maps them to feature ids.
 */
private val EVENT_TAB_NAMES = listOf("DETAILS", "AI_INSIGHTS", "COMMENTARY", "CROWDSOURCING", "CUP_TREE", "MEDIA")

/**
 * The no-arg boolean getter [name] of the kept EventHeadFlags model (the server's per-match tab
 * and block flags; the getters keep their Kotlin names).
 */
internal fun BytecodePatchContext.eventHeadFlag(name: String): MutableMethod =
    mutableClassDefBy(EVENT_HEAD_FLAGS).methods.singleOrNull {
        it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
    } ?: throw PatchException("$EVENT_HEAD_FLAGS.$name()Z not found")

/**
 * Runtime "answer false" for a boolean getter whose only free register is its result (the
 * EventHeadFlags getters are `iget-boolean p0, p0, ...; return p0` with no local register, so
 * [app.template.patches.shared.hevalcontrols.hevalReturnEarly] cannot be used). Right before the
 * single `return vX`:
 * ```
 * if-eqz vX, :heval_stock      # false stays false
 * const-string vX, "<featureId>"
 * invoke-static/range { vX .. vX }, HevalSettings;->isEnabled(Ljava/lang/String;)Z
 * move-result vX
 * xor-int/lit8 vX, vX, 0x1     # true answers !isEnabled
 * :heval_stock
 * return vX
 * ```
 * So the getter answers `flag && !isEnabled(featureId)`: the stock flag while the feature is off.
 */
internal fun MutableMethod.hevalFlagGetter(featureId: String) {
    require(HevalFeature.ID_REGEX.matches(featureId)) { "Invalid Patch settings feature id: $featureId" }
    if (returnType != "Z") throw PatchException("$definingClass->$name returns $returnType, not Z")
    val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }
    val ret = returns.singleOrNull()?.index
        ?: throw PatchException("$definingClass->$name has ${returns.size} returns, expected one")
    requireNoBranchTargetAt(ret, "Patch settings flag gate")
    val register = (getInstruction(ret) as OneRegisterInstruction).registerA
    // xor-int/lit8 and if-eqz take 8-bit registers.
    if (register > 255) throw PatchException("$definingClass->$name returns v$register, above v255")
    val v = "v$register"
    addInstructionsWithLabelsChecked(
        ret,
        """
            if-eqz $v, :heval_stock
            const-string $v, "$featureId"
            invoke-static/range { $v .. $v }, $HEVAL_SETTINGS_CLASS->isEnabled(Ljava/lang/String;)Z
            move-result $v
            xor-int/lit8 $v, $v, 0x1
        """.trimIndent(),
        ExternalLabel("heval_stock", getInstruction(ret)),
    )
}

private fun Method.holdsStrings(values: Collection<String>): Boolean {
    val strings = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }?.toSet() ?: return false
    return strings.containsAll(values)
}

/** The match page's tab enum: the Enum whose <clinit> names the tab constants. */
internal fun BytecodePatchContext.eventTabEnum(): ClassDef {
    val found = classDefByStrings("AI_INSIGHTS").filter { classDef ->
        classDef.superclass == "Ljava/lang/Enum;" &&
            classDef.methods.any { it.name == "<clinit>" && it.holdsStrings(EVENT_TAB_NAMES) }
    }
    return found.singleOrNull()
        ?: throw PatchException("Expected one match page tab enum, found ${found.map { it.type }}")
}

/**
 * Keeps a hidden match page tab from coming back. EventActivity's navigateToTab (a function
 * reference whose body R8 inlined into a shared Function1 lambda) inserts a tab that the page does
 * not have and selects it; the Details cards call it. Right after the lambda casts its argument to
 * the tab enum (and then its receiver to EventActivity), SofascoreControls.isEventTabHidden(tab)
 * makes it return Boolean.FALSE ("not navigated") for a tab whose switch is on. Shared by Hide AI
 * insights and Hide match tabs; with every switch off it answers false, so navigation is stock.
 */
internal val eventTabGuardPatch = bytecodePatch(
    description = "Keeps hidden Sofascore match tabs from being added back.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        val tabEnum = eventTabEnum().type

        fun Method.castsTo(type: String) = implementation?.instructions?.any {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == type
        } == true

        val candidates = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (FUNCTION1 in classDef.interfaces &&
                classDef.methods.any { it.name == "invoke" && it.castsTo(tabEnum) && it.castsTo(EVENT_ACTIVITY) }
            ) {
                candidates += classDef
            }
        }

        // The site: check-cast vT, <tab enum> followed within six instructions by a check-cast to
        // EventActivity (the function reference's receiver).
        data class Site(val method: MutableMethod, val index: Int, val register: Int)
        val sites = candidates.flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter { it.name == "invoke" && it.implementation != null }.flatMap { method ->
                val insns = method.instructions
                insns.indices.filter { i ->
                    insns[i].opcode == Opcode.CHECK_CAST &&
                        ((insns[i] as ReferenceInstruction).reference as TypeReference).type == tabEnum &&
                        (i + 1..minOf(i + 6, insns.lastIndex)).any { j ->
                            insns[j].opcode == Opcode.CHECK_CAST &&
                                ((insns[j] as ReferenceInstruction).reference as TypeReference).type == EVENT_ACTIVITY
                        }
                }.map { Site(method, it, (insns[it] as OneRegisterInstruction).registerA) }
            }
        }
        val site = sites.singleOrNull()
            ?: throw PatchException("Expected one navigateToTab tab cast, found ${sites.map { "${it.method.definingClass}@${it.index}" }}")

        val at = site.index + 1
        site.method.requireNoBranchTargetAt(at, "navigateToTab guard")
        val scratch = site.method.findFreeRegister(at, site.register)
        if (site.register > 255 || scratch > 255) throw PatchException("navigateToTab guard: registers above v255")
        site.method.addInstructionsWithLabelsChecked(
            at,
            """
                invoke-static/range { v${site.register} .. v${site.register} }, $SOFASCORE_CONTROLS->isEventTabHidden(Ljava/lang/Enum;)Z
                move-result v$scratch
                if-eqz v$scratch, :heval_stock
                sget-object v$scratch, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v$scratch
            """.trimIndent(),
            ExternalLabel("heval_stock", site.method.getInstruction(at)),
        )
    }
}
