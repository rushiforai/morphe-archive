package app.template.patches.daylio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_DAYLIO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

// Adapted from Epxec/android-patches v1.15.0 (GPL-3.0), with separately
// verified targets and callback-preserving behavior for Daylio 1.71.1 (289).
private val preferenceInit = Fingerprint(definingClass = "Lt38;", name = "<clinit>", returnType = "V", parameters = emptyList())
private val preferenceGet = Fingerprint(definingClass = "Lt38;", name = "f", returnType = "Ljava/lang/Object;", parameters = listOf("Ls38;"))
private val premiumStatus = Fingerprint(definingClass = "Luu6;", name = "x", returnType = "Z", parameters = emptyList())
private val expiryStatus = Fingerprint(definingClass = "Lb17;", name = "A", returnType = "Z", parameters = emptyList())
private val premiumLost = Fingerprint(definingClass = "Luu6;", name = "C", returnType = "V", parameters = listOf("Ln44;"))
private val premiumExpired = Fingerprint(definingClass = "Liz1;", name = "g", returnType = "V", parameters = emptyList())
private val completion = Fingerprint(definingClass = "Llb0;", name = "w", returnType = "J", parameters = listOf("[Ln44;"))

private fun reference(i: Instruction) = (i as? ReferenceInstruction)?.reference
private fun field(i: Instruction) = reference(i) as? FieldReference
private fun method(i: Instruction) = reference(i) as? MethodReference
private fun str(i: Instruction) = (reference(i) as? StringReference)?.string
private fun List<Instruction>.hasField(owner: String, name: String, type: String) = any {
    val f = field(it); f?.definingClass == owner && f.name == name && f.type == type
}
private fun List<Instruction>.hasMethod(owner: String, name: String, args: List<String>, ret: String) = any {
    val m = method(it); m?.definingClass == owner && m.name == name && m.parameterTypes.toList() == args && m.returnType == ret
}

// Replace whole methods only after resolving and validating every target. This
// preserves access flags/annotations and the original parameter register layout.
private fun BytecodePatchContext.replaceBody(target: MutableMethod, body: String) {
    val impl = target.implementation ?: error("Missing implementation: ${target.name}")
    check(impl.tryBlocks.isEmpty()) { "Unexpected try blocks in ${target.name}" }
    val replacement = MutableMethod(ImmutableMethod(target.definingClass, target.name, target.parameters,
        target.returnType, target.accessFlags, target.annotations, target.hiddenApiRestrictions,
        MutableMethodImplementation(impl.registerCount)))
    replacement.addInstructions(0, body.trimIndent())
    val owner = mutableClassDefBy(target.definingClass)
    @Suppress("UNCHECKED_CAST")
    val methods = (owner as ClassDef).methods as MutableSet<MutableMethod>
    val found = methods.filter { it.name == target.name && it.returnType == target.returnType &&
        it.parameterTypes.toList() == target.parameterTypes.toList() }
    check(found.size == 1 && methods.remove(found.single()) && methods.add(replacement)) { "Could not replace ${target.name}" }
}

@Suppress("unused")
val enableDaylioPremium = bytecodePatch(
    name = "Enable premium",
    description = "Enables local premium status in Daylio 1.71.1. Account- or server-dependent features may not work; this is not a purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DAYLIO)
    execute {
        check(packageMetadata.packageName == "net.daylio" && packageMetadata.versionName == "1.71.1" &&
            packageMetadata.versionCode == "289") { "Unsupported Daylio version; refusing to patch." }

        // Resolve everything and validate before changing anything.
        val init = preferenceInit.method.instructions.toList()
        fun hasKeyMapping(key: String, fieldName: String): Boolean {
            val indexes = init.indices.filter { str(init[it]) == key }
            if (indexes.size != 1) return false
            val i = indexes.single()
            val f = init.getOrNull(i + 2)?.let(::field)
            return init.getOrNull(i + 1)?.opcode == Opcode.INVOKE_DIRECT &&
                init.getOrNull(i + 2)?.opcode == Opcode.SPUT_OBJECT &&
                f?.definingClass == "Lt38;" && f.name == fieldName && f.type == "Ls38;"
        }
        check(init.size == 1160 && hasKeyMapping("IS_PRO_VERSION_PURCHASED", "E") &&
            hasKeyMapping("IS_PREMIUM_EXPIRED", "e1")) { "Unexpected preference key mapping." }

        val get = preferenceGet.method
        val getIns = get.instructions.toList()
        check(get.accessFlags == 9 && get.implementation?.registerCount == 6 &&
            get.implementation?.tryBlocks?.isEmpty() == true && getIns.size == 54 &&
            getIns[0].opcode == Opcode.IGET_OBJECT &&
            getIns.hasMethod("Landroid/content/SharedPreferences;", "getBoolean", listOf("Ljava/lang/String;", "Z"), "Z")) {
            "Unexpected preference reader."
        }
        val status = premiumStatus.method.instructions.toList()
        val expired = expiryStatus.method.instructions.toList()
        check(status.size == 7 && status.hasField("Lt38;", "E", "Ls38;") &&
            status.hasMethod("Lt38;", "f", listOf("Ls38;"), "Ljava/lang/Object;") &&
            expired.size == 7 && expired.hasField("Lt38;", "e1", "Ls38;") &&
            expired.hasMethod("Lt38;", "f", listOf("Ls38;"), "Ljava/lang/Object;")) { "Unexpected premium status gates." }
        val lost = premiumLost.method
        val lostIns = lost.instructions.toList()
        check(lost.accessFlags == 17 && lost.implementation?.registerCount == 7 && lost.implementation?.tryBlocks?.isEmpty() == true &&
            lostIns.size == 43 && lostIns.any { str(it) == "p_be_premium_lost" } &&
            lostIns.hasField("Lt38;", "E", "Ls38;") &&
            lostIns.hasMethod("Llb0;", "w", listOf("[Ln44;"), "J")) { "Unexpected premium-lost handler." }
        val expiry = premiumExpired.method
        val expiryIns = expiry.instructions.toList()
        check(expiry.accessFlags == 17 && expiry.implementation?.registerCount == 6 && expiry.implementation?.tryBlocks?.isEmpty() == true &&
            expiryIns.size == 43 && expiryIns.any { str(it) == "p_be_premium_expired" } &&
            expiryIns.hasField("Lt38;", "e1", "Ls38;") && expiryIns.hasField("Liz1;", "G", "Lnz1;") &&
            expiryIns.hasField("Liz1;", "q", "Ln44;") &&
            expiryIns.hasMethod("Llb0;", "w", listOf("[Ln44;"), "J")) { "Unexpected premium-expired handler." }
        val callbackIns = completion.method.instructions.toList()
        check(callbackIns.size == 11 && callbackIns.hasMethod("Ln44;", "g", emptyList(), "V") &&
            callbackIns.last().opcode == Opcode.RETURN_WIDE) { "Unexpected completion dispatch." }

        // The app reads these static key objects through this common accessor in
        // many UI paths. Other preferences retain the original implementation;
        // no subscription state is written to the user's preferences.
        get.addInstructionsWithLabels(0, """
            sget-object v0, Lt38;->E:Ls38;
            if-ne p0, v0, :check_expired
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
            :check_expired
            sget-object v0, Lt38;->e1:Ls38;
            if-ne p0, v0, :ordinary
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
            :ordinary
            nop
        """)

        // Preserve the exact app completion-dispatch path rather than turning
        // the asynchronous handlers into no-ops that drop their callbacks.
        replaceBody(lost, """
            filled-new-array {p1}, [Ln44;
            move-result-object v0
            invoke-virtual {p0, v0}, Llb0;->w([Ln44;)J
            return-void
        """)
        replaceBody(expiry, """
            iget-object v0, p0, Liz1;->G:Lnz1;
            iget-object v1, p0, Liz1;->q:Ln44;
            filled-new-array {v1}, [Ln44;
            move-result-object v1
            invoke-virtual {v0, v1}, Llb0;->w([Ln44;)J
            return-void
        """)
    }
}
