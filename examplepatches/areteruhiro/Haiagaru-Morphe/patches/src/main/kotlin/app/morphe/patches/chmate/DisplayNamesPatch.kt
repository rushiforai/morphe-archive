package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Alias only UI reads. Native matching, editing and serialization keep the original values. */
internal fun BytecodePatchContext.patchDisplayNames(version: String) {
    val old = version == "0.8.10.191 dev"
    val middle = version == "0.8.10.226 dev"
    if (!old && !middle && version != "0.8.10.242 dev") return
    val runtime = "Lapp/morphe/extension/chmate/DisplayNames;"
    val keywordType = if (old) "Lo/onAdCollapsed;" else "Ljp/syoboi/a2chMate/data/Keyword;"
    val keywordField = if (old) "keyword" else if (middle) "d" else "b"
    val subject = if (old) "Lo/MaxAdViewImplExternalSyntheticLambda1;" else if (middle) "Lo/CertificateChainCleaner;" else "Lo/setSkipText;"
    val subjectField = if (middle) "d" else "c"
    val adapterType = if (old) "Lo/m8a;" else if (middle) "Lo/getWriteBytesTotal;" else "Lo/zzavb;"
    val homeType = if (old) "Lo/r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA;" else if (middle) "Lo/bea1;" else "Lo/ModuleInstallStatusCodes;"
    val homeRow = if (old) "Lo/onAdDisplayed\$ActivityResult;" else if (middle) "Lo/Yy2\$open;" else "Lo/getAvailabilityStatus\$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ;"
    val homeField = if (old) "e" else if (middle) "k" else "m"
    val keywordViews = if (old) setOf(adapterType, homeType, "Lo/ina;")
        else if (middle) setOf(adapterType, homeType, "Lo/encodeString\$write;")
        else setOf(adapterType, "Lo/ModuleInstallRequestBuilder;", "Lo/Kjv41\$ComponentActivity;")
    var keywordSites = 0
    var threadSites = 0
    for (type in keywordViews + homeType) {
        val owner = mutableClassDefBy(type)
        for (method in owner.methods) {
            val body = method.implementation?.instructions?.toList() ?: continue
            val isBind = method.name == "getView" || method.name == "onBindViewHolder"
            val sites = body.indices.filter { index ->
                val ref = (body[index] as? ReferenceInstruction)?.reference as? FieldReference
                body[index].opcode == Opcode.IGET_OBJECT && ref?.type == "Ljava/lang/String;" &&
                    ((type in keywordViews && ref.definingClass == keywordType && ref.name == keywordField) ||
                        (isBind && ((type == adapterType && ref.definingClass == subject && ref.name == subjectField) ||
                            (type == homeType && ref.definingClass == homeRow && ref.name == homeField))))
            }
            for (index in sites.asReversed()) {
                val instruction = body[index] as TwoRegisterInstruction
                val ref = (body[index] as ReferenceInstruction).reference as FieldReference
                val name = if (ref.definingClass == keywordType) "keyword" else "thread"
                method.replaceInstruction(index, "invoke-static/range {v${instruction.registerB} .. v${instruction.registerB}}, $runtime->$name(Ljava/lang/Object;)Ljava/lang/String;")
                method.addInstructions(index + 1, "move-result-object v${instruction.registerA}")
                if (name == "keyword") keywordSites++ else threadSites++
            }
            if (type == adapterType && isBind)
                method.addInstructions(0, "invoke-static/range {p0 .. p0}, $runtime->begin(Ljava/lang/Object;)V")
        }
    }
    check(keywordSites >= 3 && threadSites >= 2) { "Missing display-name UI bindings for $version ($keywordSites/$threadSites)" }
    println("Display-name bindings: $version keywords=$keywordSites threads=$threadSites")
}
