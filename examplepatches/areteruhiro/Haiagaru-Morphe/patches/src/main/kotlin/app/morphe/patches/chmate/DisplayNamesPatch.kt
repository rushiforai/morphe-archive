package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Adds aliases only to keyword labels. Native keyword matching remains unchanged. */
internal fun BytecodePatchContext.patchDisplayNames(version: String) {
    val old = version == "0.8.10.191 dev"
    val middle = version == "0.8.10.226 dev"
    if (!old && !middle && version != "0.8.10.242 dev") return
    val runtime = "Lapp/morphe/extension/chmate/DisplayNames;"
    val keywordType = if (old) "Lo/onAdCollapsed;" else "Ljp/syoboi/a2chMate/data/Keyword;"
    val keywordField = if (old) "keyword" else if (middle) "d" else "b"
    val adapterType = if (old) "Lo/m8a;" else if (middle) "Lo/getWriteBytesTotal;" else "Lo/zzavb;"
    val homeType = if (old) "Lo/r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA;" else if (middle) "Lo/bea1;" else "Lo/ModuleInstallStatusCodes;"
    val keywordViews = if (old) setOf(adapterType, homeType, "Lo/ina;")
        else if (middle) setOf(adapterType, homeType, "Lo/encodeString\$write;")
        else setOf(adapterType, "Lo/ModuleInstallRequestBuilder;", "Lo/Kjv41\$ComponentActivity;")
    var keywordSites = 0
    for (type in keywordViews + homeType) {
        val owner = mutableClassDefBy(type)
        for (method in owner.methods) {
            val body = method.implementation?.instructions?.toList() ?: continue
            val sites = body.indices.filter { index ->
                val ref = (body[index] as? ReferenceInstruction)?.reference as? FieldReference
                body[index].opcode == Opcode.IGET_OBJECT && ref?.type == "Ljava/lang/String;" &&
                    ref.definingClass == keywordType && ref.name == keywordField
            }
            for (index in sites.asReversed()) {
                val instruction = body[index] as TwoRegisterInstruction
                method.replaceInstruction(index, "invoke-static/range {v${instruction.registerB} .. v${instruction.registerB}}, $runtime->keyword(Ljava/lang/Object;)Ljava/lang/String;")
                method.addInstructions(index + 1, "move-result-object v${instruction.registerA}")
                keywordSites++
            }
        }
    }
    check(keywordSites >= 3) { "Missing keyword display-name UI bindings for $version ($keywordSites)" }
    println("Keyword display-name bindings: $version $keywordSites")
}
