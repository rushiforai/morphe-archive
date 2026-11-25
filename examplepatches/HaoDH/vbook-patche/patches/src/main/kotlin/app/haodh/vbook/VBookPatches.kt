package app.haodh.vbook

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val vBook = Compatibility(
    name = "vBook",
    packageName = "com.vbook.android",
    apkFileType = ApkFileType.XAPK,
    targets = listOf(AppTarget(version = "1.2.9"), AppTarget(version = "1.2.7"), AppTarget(version = "1.2.6"), AppTarget(version = "1.2.5"))
)

@Suppress("unused")
val premiumPatch = patch(
    name = "Local Premium state",
    description = "Enable device-side Premium state for the authorized vBook 1.2.5, 1.2.6, 1.2.7 and 1.2.9 test builds. Server entitlements are unchanged.",
    default = true
) {
    compatibleWith(vBook)
    execute {
        val userStateType = Fingerprint(
            name = "toString",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;",
            filters = listOf(string("UserState(isLogin="))
        ).method.definingClass
        // shortcut: class mappings cover only inspected releases; re-inspect before adding versions.
        val (accountType, combinedType) = when (userStateType) {
            "Le7j;" -> "Lj5j;" to "Lafd;"
            "Le8j;" -> "Lh6j;" to "Lufd;"
            "Lnmj;" -> "Lskj;" to "Lyqd;"
            "Lenj;" -> "Lilj;" to "Lprd;"
            else -> error("Unexpected UserState class: $userStateType")
        }
        for (type in listOf(userStateType, accountType)) {
            val method = Fingerprint(definingClass = type, name = "<init>", returnType = "V").method
            check(method.parameterTypes.getOrNull(5) == "Z") { "Unexpected Premium constructor: $type" }
            val instructions = method.implementation!!.instructions
            val matches = instructions.indices.filter { index ->
                val instruction = instructions[index]
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IPUT_BOOLEAN &&
                    field?.definingClass == type && field.name == "f" && field.type == "Z"
            }
            check(matches.size == 1) { "Expected one Premium field assignment in $type" }
            method.addInstruction(matches.single(), "const/4 p6, 0x1")
        }
        val method = Fingerprint(
            definingClass = combinedType,
            name = "invokeSuspend",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;"
        ).method
        val implementation = method.implementation!!
        val matches = implementation.instructions.indices.filter { index ->
            val instruction = implementation.instructions[index] as? Instruction11n
            instruction?.opcode == Opcode.CONST_4 && instruction.narrowLiteral == 0 &&
                instruction.registerA == implementation.registerCount - 1
        }
        check(matches.size == 1) { "Expected one non-Premium fallback" }
        method.replaceInstruction(matches.single(), "const/4 p1, 0x1")
    }
}

@Suppress("unused")
val installerCheckPatch = patch(
    name = "Local installer test",
    description = "Skip the Play installer gate in an authorized local test build. Does not change server integrity checks.",
    default = true
) {
    compatibleWith(vBook)
    execute {
        val method = Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "checkLicense",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "V"
        ).method
        val instructions = method.implementation!!.instructions
        val matches = instructions.indices.filter { index ->
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_INTERFACE && reference?.name == "run" &&
                reference.definingClass == "Lcom/pairip/licensecheck/LicenseClient\$ImmediateTaskExecutor;"
        }
        check(matches.size == 1) { "Unexpected installer check implementation" }
        val index = matches.single()
        method.removeInstruction(index)
        method.addInstructions(index, """
            sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->FULL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
            sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
        """)
    }
}
