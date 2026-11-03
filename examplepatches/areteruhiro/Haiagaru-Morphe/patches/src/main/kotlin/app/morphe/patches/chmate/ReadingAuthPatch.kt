package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val READING_AUTH = "Lapp/morphe/extension/chmate/ReadingAuth;"

internal fun BytecodePatchContext.patchReadingChallenge(version: String) {
    val (dialogType, clientType, modelType) = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/addSegment;", "Lo/addSegment\$5;", "Lo/MaxSegmentCollectionImpla;")
        "0.8.10.226 dev" -> Triple("Lo/isOpenJSSEPreferred;", "Lo/isOpenJSSEPreferred\$write;", "Lo/isConscryptPreferred;")
        "0.8.10.242 dev" -> Triple("Lo/getTopDisLike;", "Lo/getTopDisLike\$IconCompatParcelizer;",
            "Ljp/syoboi/a2chMate/client/cloudflare/CloudflareDialogViewModel;")
        else -> return
    }
    var loads = 0
    var callbacks = 0
    var clients = 0
    // Bind known classes directly. Structural checks validate these bindings, never select replacements.
    val challenge = "Ljp/syoboi/a2chMate/client/cloudflare/ChallengeParam;"
    check(mutableClassDefBy(modelType).fields.any { it.type == challenge }) { "Reading challenge model changed: $version" }
    val dialogClass = mutableClassDefBy(dialogType)
    check(dialogClass.methods.any { method ->
            method.name == "onViewCreated" && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? FieldReference)?.type == challenge
            } == true
    }) { "Reading challenge dialog changed: $version" }
    val clientClass = mutableClassDefBy(clientType)
    check(clientClass.superclass == "Landroid/webkit/WebViewClient;" && clientClass.fields.any { it.type == modelType }) {
        "Reading challenge client changed: $version"
    }
    listOf(dialogClass, clientClass).forEach { mutable ->
        val dialog = mutable.type == dialogType
        val client = mutable.type == clientType
        mutable.methods.toList().forEach { method ->
            if (dialog && method.name == "onViewCreated") {
                val code = method.implementation!!.instructions.toList()
                code.indices.reversed().forEach { index ->
                    val instruction = code[index]
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref?.toString() == "Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V") {
                        check(instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction is FiveRegisterInstruction)
                        mutable.findMutableMethodOf(method).replaceInstruction(index,
                            "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, $READING_AUTH->loadChallenge(Landroid/webkit/WebView;Ljava/lang/String;)V")
                        loads++
                    }
                    if (ref?.toString() == "Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V") {
                        check(instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction is FiveRegisterInstruction)
                        mutable.findMutableMethodOf(method).replaceInstruction(index,
                            "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, $READING_AUTH->setChallengeClient(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)V")
                        clients++
                    }
                }
            }
            if (client && method.name == "onPageFinished" &&
                method.parameterTypes.map { it.toString() } == listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")) {
                // p1 and p2 are still intact at entry; preserve every original callback instruction.
                mutable.findMutableMethodOf(method).addInstruction(0,
                    "invoke-static/range {p1 .. p2}, $READING_AUTH->challengeFinished(Landroid/webkit/WebView;Ljava/lang/String;)V")
                callbacks++
            }
        }
    }
    check(loads == 1 && callbacks == 1 && clients == 1) { "Unexpected native Cloudflare dialog bindings: $version $loads/$callbacks/$clients" }
    println("Reading challenge: $version, $loads native loads, $callbacks preserved callbacks, $clients clients")
}
