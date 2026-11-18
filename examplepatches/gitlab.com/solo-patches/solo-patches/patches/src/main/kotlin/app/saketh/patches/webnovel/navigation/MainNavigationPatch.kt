package app.saketh.patches.webnovel.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.hookAt
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val HOOKS = "Lapp/saketh/extension/navigation/NavigationHooks;"
private const val ACTIVITY = "Landroid/app/Activity;"
private const val VIEW = "Landroid/view/View;"
private const val PARAMS = "Landroidx/constraintlayout/widget/ConstraintLayout\$LayoutParams;"
private const val MAIN = "Lcom/qidian/Int/reader/MainActivity;"

@Suppress("unused")
val mainNavigationControlsPatch = patch(
    name = "Main navigation controls",
    description = "Adds persistent reorder and show/hide controls for the main bottom tabs. Opens Library at launch when Featured is hidden. Keeps Library, Profile and native Writing availability intact.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("navigation_controls")
        val params = mutableClassDefBy(PARAMS)
        // resolveLayoutDirection checks startToEnd, startToStart, endToStart and endToEnd against UNSET first.
        // Keep start/end constraints (not left/right), existing weights, sizes and vertical anchors.
        val (startToEnd, startToStart, endToStart, endToEnd) = params.methods.single {
            it.name == "resolveLayoutDirection" && it.parameterTypes == listOf("I")
        }.implementation!!.instructions.zipWithNext().mapNotNull { (read, compare) ->
            val field = (read as? ReferenceInstruction)?.reference as? FieldReference
            field?.name?.takeIf {
                read.opcode == Opcode.IGET && field.definingClass == PARAMS && compare.opcode == Opcode.IF_EQ
            }
        }.take(4).also { check(it.toSet().size == 4) }
        val hooks = mutableClassDefBy(HOOKS)
        val declaration = hooks.methods.single {
            it.name == "link" && it.parameterTypes == listOf(VIEW, "I", "I") && it.returnType == "V"
        }
        check(AccessFlags.NATIVE.isSet(declaration.accessFlags))
        val link = MutableMethod(ImmutableMethod(
            HOOKS,
            declaration.name,
            declaration.parameters,
            "V",
            declaration.accessFlags and AccessFlags.NATIVE.value.inv(),
            declaration.annotations,
            declaration.hiddenApiRestrictions,
            MutableMethodImplementation(5),
        ))
        // This patch-time bridge needs neither bundled AndroidX nor runtime reflection/JNI.
        // https://developer.android.com/reference/androidx/constraintlayout/widget/ConstraintLayout.LayoutParams
        link.addInstructions(0, """
            invoke-virtual { p0 }, $VIEW->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
            move-result-object v0
            check-cast v0, $PARAMS
            const/4 v1, -0x1
            iput v1, v0, $PARAMS->$startToEnd:I
            iput v1, v0, $PARAMS->$startToStart:I
            iput v1, v0, $PARAMS->$endToStart:I
            iput v1, v0, $PARAMS->$endToEnd:I
            if-eqz p1, :start
            iput p1, v0, $PARAMS->$startToEnd:I
            goto :end
            :start
            iput p1, v0, $PARAMS->$startToStart:I
            :end
            if-eqz p2, :parent_end
            iput p2, v0, $PARAMS->$endToStart:I
            goto :apply
            :parent_end
            iput p2, v0, $PARAMS->$endToEnd:I
            :apply
            invoke-virtual { p0, v0 }, $VIEW->setLayoutParams(Landroid/view/ViewGroup${'$'}LayoutParams;)V
            return-void
        """)
        check(hooks.methods.remove(declaration))
        hooks.methods.add(link)

        val availability = MainTabAvailabilityFingerprint.method
        availability.addInstructions(0, "invoke-static/range { p0 .. p0 }, $HOOKS->beforeNative($ACTIVITY)V")
        availability.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.reversed().forEach { index ->
                availability.hookAt(index, "invoke-static/range { p0 .. p0 }, $HOOKS->afterNative($ACTIVITY)V")
            }
        val resume = mutableClassDefBy(MAIN).methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        listOf(resume, MainOperationVisibilityFingerprint.method).forEach { method ->
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach { index ->
                    method.hookAt(index, "invoke-static/range { p0 .. p0 }, $HOOKS->resume($ACTIVITY)V")
                }
        }
        MainLaunchScreenFingerprint.let {
            val store = it.instructionMatches.first().index
            val screen = (it.method.implementation!!.instructions[store] as OneRegisterInstruction).registerA
            it.method.hookAt(store, """
                invoke-static { v$screen }, $HOOKS->startTab(I)I
                move-result v$screen
            """)
        }
    }
}

/** Decides which main tabs exist from the server tab configuration before the activity lays them out. */
internal object MainTabAvailabilityFingerprint : Fingerprint(
    definingClass = MAIN,
    returnType = "V",
    parameters = listOf(),
    strings = listOf("triangleUp"),
    filters = listOf(methodCall(definingClass = "Lcom/qidian/QDReader/components/entity/CloudConfigBean\$TabConf;", name = "getTabType")),
)

/** Shows or hides the main operation view, which re-lays out the bottom tabs. */
private object MainOperationVisibilityFingerprint : Fingerprint(
    definingClass = MAIN,
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(fieldAccess(type = "Lcom/qidian/Int/reader/view/MainOperationView;")),
)

/** Stores the screen WebNovel opens at launch in the static current-screen field, then schedules launch reporting. */
private object MainLaunchScreenFingerprint : Fingerprint(
    definingClass = MAIN,
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SPUT, definingClass = MAIN, type = "I"),
        literal(1200L),
        methodCall(definingClass = "Landroid/view/View;", name = "postDelayed"),
    ),
)
