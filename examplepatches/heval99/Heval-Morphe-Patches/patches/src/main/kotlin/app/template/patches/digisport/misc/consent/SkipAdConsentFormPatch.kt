package app.template.patches.digisport.misc.consent

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// The ad consent form (Google UMP) only exists for personalised ads, which "Disable ads" removes.
// The consent check itself is not skipped: the GDPR onboarding and Settings wait on the consent
// helper's status LiveData for SUCCESS or ERROR before they move on or hide their spinner, so the
// helper still reports SUCCESS, just without asking UMP. updateConsent (the privacy options form)
// is only reachable from the "Actualizare date" button, which shows only after a
// SHOW_UPDATE_CONSENT status and so stays hidden. Since 1.1.16 (R8) the helper, LiveData and
// binding classes are renamed; their shapes are read from the stock code.
@Suppress("unused")
val skipAdConsentFormPatch = bytecodePatch(
    name = "Skip ad consent form",
    description = "Skips the ad consent form.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. loadConsentInfo posts SUCCESS and returns before it touches UMP, so neither
        // requestConsentInfoUpdate nor loadAndShowConsentFormIfRequired runs. Its own first four
        // instructions post STARTED (iget-object status, check-cast LiveData, sget-object
        // STARTED, invoke postValue); the hook repeats them with SUCCESS.
        val load = loadConsentInfoFingerprint.method
        val head = load.implementation!!.instructions.take(4)
        val refs = head.map { (it as? ReferenceInstruction)?.reference }
        val status = refs[0] as? FieldReference
        val liveData = refs[1] as? TypeReference
        val started = refs[2] as? FieldReference
        val post = refs[3] as? MethodReference
        if (head.map { it.opcode } != listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL) ||
            status == null || liveData == null || started?.name != "STARTED" || post == null
        ) {
            throw PatchException("Skip ad consent form: ${load.definingClass}->${load.name} does not start by posting STARTED")
        }
        // The hook posts through the same method as the STARTED post: it must be (Object)V.
        if (post.returnType != "V" || post.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;")) {
            throw PatchException("Skip ad consent form: ${load.definingClass}->${load.name} posts through $post, not (Ljava/lang/Object;)V")
        }
        // The hook uses v0 and v1 next to p0, so the method needs two locals before its parameters.
        val parameterRegisters = load.parameterTypes.sumOf { if (it[0] == 'J' || it[0] == 'D') 2 else 1 } + 1
        if (load.implementation!!.registerCount - parameterRegisters < 2) {
            throw PatchException("Skip ad consent form: ${load.definingClass}->${load.name} has fewer than 2 local registers for the hook")
        }
        val statusEnum = started.definingClass
        if (classDefBy(statusEnum).fields.none { it.name == "SUCCESS" && it.type == statusEnum }) {
            throw PatchException("Skip ad consent form: $statusEnum has no SUCCESS")
        }
        load.addInstructionsChecked(
            0,
            """
                move-object/from16 v0, p0
                iget-object v0, v0, ${status.definingClass}->${status.name}:${status.type}
                check-cast v0, ${liveData.type}
                sget-object v1, $statusEnum->SUCCESS:$statusEnum
                invoke-virtual {v0, v1}, ${post.definingClass}->${post.name}(Ljava/lang/Object;)V
                return-void
            """,
        )

        // 2. With the button gone, the "Publicitate (Google Ad Manager)" heading and paragraph
        // would stay orphaned: the binding hides its whole root (ViewDataBinding's root view)
        // once it is built. Nothing (generated or app code) ever sets the root's visibility, so
        // it stays GONE. In the parent ConstraintLayout the next block (terms) is constrained to
        // this one's bottom with its own marginTop, and a GONE view's margins collapse, so no
        // extra gap is left.
        val factory = userDataAdsBindingFactoryFingerprint
        val binding = (factory.method.implementation!!.instructions.elementAt(factory.instructionMatches[1].index)
            as ReferenceInstruction).reference.let { (it as TypeReference).type }
        val bindingClass = mutableClassDefBy(binding)
        val constructor = bindingClass.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;")
        } ?: throw PatchException("Skip ad consent form: $binding has no (View) constructor")
        val superclass = bindingClass.superclass ?: throw PatchException("Skip ad consent form: $binding has no superclass")
        val root = classDefBy(superclass).fields.singleOrNull { it.type == "Landroid/view/View;" }
            ?: throw PatchException("Skip ad consent form: $superclass has no single root View field")
        val end = constructor.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        constructor.addInstructionsChecked(
            end,
            """
                iget-object v0, p0, $superclass->${root.name}:Landroid/view/View;
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            """,
        )
    }
}
