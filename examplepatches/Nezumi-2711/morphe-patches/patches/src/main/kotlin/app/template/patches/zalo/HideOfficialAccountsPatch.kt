package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private object MessagesListFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(
        string("listFilter"),
        string("LatestMention"),
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "add"),
        literal(45),
    ),
)

@Suppress("unused")
val hideOfficialAccountsPatch = bytecodePatch(
    name = "Hide OA accounts in Messages",
    description = "Hide OA accounts in Messages and mute them permanently by default.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(MessagesListFingerprint.matchAll(1..1).size == 1)
        val method = MessagesListFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
        check(returns.size == 2)
        returns.reversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            check(register < 16)
            method.replaceInstruction(index,
                "invoke-static {v$register}, Lapp/template/extension/extension/NezumiSettings;->filterOfficialAccounts(Ljava/util/List;)Ljava/util/List;")
            method.addInstructions(index + 1, "move-result-object v$register\nreturn-object v$register")
        }
        attachNezumiSettings("attachOAMessages")
    }
}