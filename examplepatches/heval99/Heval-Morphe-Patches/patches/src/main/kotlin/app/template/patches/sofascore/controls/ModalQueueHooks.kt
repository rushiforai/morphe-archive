package app.template.patches.sofascore.controls

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Sofascore's modal queue (BaseActivity) shows one-time dialogs. Each is an R8-renamed subclass of
 * one descriptor class, created with a display name ("Rating Info", "Survey", ...). Two paths add
 * them to the queue:
 * - the startup list (consent, Match of the Week, Rating Info, Active subscription) goes through
 *   the queue's eligibility evaluator, a suspend method returning a Boolean;
 * - the on-demand ("MANUAL") modals (Remove Ads, Promotion modal, Survey, Weekly Challenge, Propose
 *   Follow Entity) are enqueued directly by a (descriptor)Z method that holds
 *   "last_shown_pop_up_timestamp" (at most one a day) and never reach the evaluator.
 * Both get the same hook: SofascoreControls.hideModal(name) drops the modal before it is queued
 * (evaluator answers Boolean.FALSE, enqueue answers false), so nothing waits for a dismiss.
 */

/** The anchor modal: its descriptor's superclass is the descriptor base. */
private const val RATING_MODAL = "Rating Info"
private const val ENQUEUE_KEY = "last_shown_pop_up_timestamp"

private fun Method.holdsString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

/** The modal descriptor base class (superclass of the "Rating Info" descriptor). */
internal fun BytecodePatchContext.modalDescriptorBase(): ClassDef {
    val descriptors = classDefByStrings(RATING_MODAL).filter { classDef ->
        classDef.methods.any { it.name == "<clinit>" && it.holdsString(RATING_MODAL) }
    }
    val descriptor = descriptors.singleOrNull()
        ?: throw PatchException("Expected one modal named \"$RATING_MODAL\", found ${descriptors.map { it.type }}")
    return classDefBy(descriptor.superclass ?: throw PatchException("${descriptor.type} has no superclass"))
}

/** Whether a modal named [name] (a descriptor subclass passing it to the base constructor) exists. */
internal fun BytecodePatchContext.hasModal(name: String): Boolean {
    val base = modalDescriptorBase().type
    return classDefByStrings(name).any { classDef ->
        classDef.superclass == base && classDef.methods.any { it.holdsString(name) }
    }
}

/**
 * The modal queue hooks, shared by Disable rating prompts and Hide promo pop-ups. With every
 * switch off, hideModal answers false and the queue is stock.
 */
internal val modalQueueHookPatch = bytecodePatch(
    description = "Lets Patch settings drop Sofascore's one-time pop-ups before they are queued.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch)

    execute {
        val base = modalDescriptorBase()
        val nameField = base.fields.filter { it.type == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags) }
            .singleOrNull() ?: throw PatchException("${base.type} has no single String name field")

        fun MutableMethod.isInstanceWithDescriptorFirst() = !AccessFlags.STATIC.isSet(accessFlags) &&
            implementation != null && parameterTypes.firstOrNull()?.toString() == base.type

        // The queue class: the one with the (descriptor)Z enqueue holding ENQUEUE_KEY.
        val enqueues = classDefByStrings(ENQUEUE_KEY).flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter {
                it.isInstanceWithDescriptorFirst() && it.returnType == "Z" && it.parameterTypes.size == 1 && it.holdsString(ENQUEUE_KEY)
            }
        }
        val enqueue = enqueues.singleOrNull()
            ?: throw PatchException("Expected one modal enqueue holding \"$ENQUEUE_KEY\", found ${enqueues.size}")
        // The evaluator: the queue class's suspend method returning Serializable (the boxed
        // Boolean or COROUTINE_SUSPENDED) whose first parameter is the descriptor.
        val evaluators = mutableClassDefBy(enqueue.definingClass).methods.filter {
            it.isInstanceWithDescriptorFirst() && it.returnType == "Ljava/io/Serializable;"
        }
        val evaluator = evaluators.singleOrNull()
            ?: throw PatchException("Expected one modal evaluator in ${enqueue.definingClass}, found ${evaluators.size}")

        listOf(enqueue, evaluator).forEach { method ->
            val implementation = method.implementation!!
            if (implementation.registerCount - method.parameterTypes.size - 1 < 1) {
                throw PatchException("${method.definingClass}->${method.name} has no local register for the modal hook")
            }
            method.requireNoBranchTargetAt(0, "modal queue hook")
        }

        // p1 is the descriptor. The evaluator is a suspend method: when it resumes, its
        // continuation calls it again with null arguments, which the null check leaves stock.
        fun MutableMethod.hook(dropped: String) = addInstructionsWithLabelsChecked(
            0,
            """
                if-eqz p1, :heval_stock
                iget-object v0, p1, ${base.type}->${nameField.name}:Ljava/lang/String;
                invoke-static/range { v0 .. v0 }, $SOFASCORE_CONTROLS->hideModal(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :heval_stock
            """.trimIndent() + "\n" + dropped,
            ExternalLabel("heval_stock", getInstruction(0)),
        )
        enqueue.hook("const/4 v0, 0x0\nreturn v0")
        evaluator.hook("sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\nreturn-object v0")
    }
}
