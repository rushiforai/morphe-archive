package dev.local.mixplorer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val PROVIDER = "Lcom/mixplorer/providers/FileProvider;"
internal const val CALLER_CHECK = "morpheHideExternalData"

@Suppress("unused")
val fixScopedStorageFileSharingPatch = bytecodePatch(
    name = "Fix scoped-storage file sharing",
    description = "Hides unreadable _data filesystem paths from external apps for single-file and multi-file shares, preserving content URI access and same-app queries.",
) {
    dependsOn(localSigningPatch)
    compatibleWith(
        Compatibility(
            packageName = "com.mixplorer",
            name = "MiXplorer",
            targets = listOf(
                AppTarget(
                    version = null,
                    minSdk = 30,
                ),
            ),
        ),
        Compatibility(
            packageName = "com.mixplorer.beta",
            name = "MiXplorer Beta",
            targets = listOf(
                AppTarget(
                    version = null,
                    minSdk = 30,
                ),
            ),
        ),
    )

    execute {
        patchProvider(mutableClassDefBy(PROVIDER))
    }
}

internal fun patchProvider(provider: MutableClass) {
    check(provider.type == PROVIDER) { "Unexpected provider class: ${provider.type}" }
    check(provider.methods.none { it.name == CALLER_CHECK }) { "Sharing fix is already applied." }
    val parameters = listOf(
        "Landroid/net/Uri;", "[Ljava/lang/String;", "Ljava/lang/String;",
        "[Ljava/lang/String;", "Ljava/lang/String;",
    )
    val query = provider.methods.singleOrNull {
        it.name == "query" && it.returnType == "Landroid/database/Cursor;" &&
            it.parameterTypes.map(CharSequence::toString) == parameters
    } ?: error("Expected exactly one FileProvider.query(Uri, String[], String, String[], String).")
    val instructions = query.implementation?.instructions?.toList()
        ?: error("FileProvider.query has no implementation.")
    check(instructions.none {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Landroid/os/Binder;" && reference.name == "clearCallingIdentity"
    }) { "FileProvider.query clears Binder identity; this version needs a different hook." }
    val dataIndex = instructions.indices.filter {
        ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == "_data"
    }.singleOrNull() ?: error("Expected exactly one _data column match.")
    check(dataIndex >= 6 && dataIndex + 4 < instructions.size) { "Incomplete _data column branch." }
    val constant = instructions[dataIndex] as? OneRegisterInstruction
        ?: error("Unexpected _data constant instruction.")
    val comparison = instructions[dataIndex + 1] as? FiveRegisterInstruction
        ?: error("Unexpected _data comparison instruction.")
    val comparisonReference = (instructions[dataIndex + 1] as? ReferenceInstruction)?.reference
    val result = instructions[dataIndex + 2] as? OneRegisterInstruction
        ?: error("Missing _data comparison result.")
    val branch = instructions[dataIndex + 3] as? BuilderOffsetInstruction
        ?: error("Missing _data conditional branch.")
    val scratch = result.registerA
    check(instructions[dataIndex].opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
        instructions[dataIndex + 1].opcode == Opcode.INVOKE_VIRTUAL &&
        comparisonReference.toString() == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" &&
        comparison.registerCount == 2 && comparison.registerC == constant.registerA &&
        instructions[dataIndex + 2].opcode == Opcode.MOVE_RESULT &&
        scratch == constant.registerA && branch.opcode == Opcode.IF_NEZ &&
        (branch as OneRegisterInstruction).registerA == scratch
    ) { "Unsupported _data comparison layout." }

    val increment = instructions[dataIndex - 6] as? TwoRegisterInstruction
        ?: error("Missing neighboring column index increment.")
    val store = instructions[dataIndex - 2] as? ThreeRegisterInstruction
        ?: error("Missing neighboring metadata store.")
    val done = instructions[dataIndex - 1] as? BuilderOffsetInstruction
        ?: error("Missing neighboring column continuation.")
    check(instructions[dataIndex - 6].opcode == Opcode.ADD_INT_LIT8 &&
        (increment as NarrowLiteralInstruction).narrowLiteral == 1 &&
        instructions[dataIndex - 2].opcode == Opcode.APUT_OBJECT &&
        store.registerA == scratch && increment.registerB == store.registerC &&
        done.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) &&
        listOf(increment.registerA, store.registerB, store.registerC).none { it == scratch }
    ) { "Unsupported metadata array/index layout." }
    val alias = instructions[dataIndex + 4]
    check(((alias as? ReferenceInstruction)?.reference as? StringReference)?.string == "path") {
        "Expected the unchanged path alias immediately after _data."
    }
    val pathTarget = branch.target.location.instruction
        ?: error("Missing original path branch target.")
    val doneTarget = done.target.location.instruction
        ?: error("Missing original column continuation target.")

    val helper = ImmutableMethod(
        PROVIDER, CALLER_CHECK, null, "Z",
        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(2),
    ).toMutable()
    helper.addInstructionsWithLabels(
        0,
        """
            invoke-static {}, Landroid/os/Binder;->getCallingUid()I
            move-result v0
            invoke-static {}, Landroid/os/Process;->myUid()I
            move-result v1
            if-eq v0, v1, :same_app
            const/4 v0, 0x1
            return v0
            :same_app
            const/4 v0, 0x0
            return v0
        """.trimIndent(),
    )
    query.addInstructionsWithLabels(
        dataIndex + 3,
        """
            if-eqz v$scratch, :morphe_path_alias
            invoke-static {}, $PROVIDER->$CALLER_CHECK()Z
            move-result v$scratch
            if-eqz v$scratch, :morphe_original_path
            add-int/lit8 v${increment.registerA}, v${store.registerC}, 0x1
            const/16 v$scratch, 0x0
            aput-object v$scratch, v${store.registerB}, v${store.registerC}
            goto/32 :morphe_column_done
        """.trimIndent(),
        ExternalLabel("morphe_path_alias", alias),
        ExternalLabel("morphe_original_path", pathTarget),
        ExternalLabel("morphe_column_done", doneTarget),
    )
    query.removeInstruction(query.implementation!!.instructions.indexOf(branch))
    provider.methods.add(helper)
}