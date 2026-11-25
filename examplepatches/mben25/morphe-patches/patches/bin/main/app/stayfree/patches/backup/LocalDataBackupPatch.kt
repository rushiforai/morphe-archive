package app.stayfree.patches.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import app.stayfree.patches.shared.resource.androidManifest
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val LOCAL_BACKUP = "Lapp/template/extension/stayfree/LocalBackup;"
private const val LOCAL_BACKUP_ACTIVITY = "app.template.extension.stayfree.LocalBackupActivity"
private const val APPLICATION_CLASS = "Lcom/burockgames/timeclocker/StayFreeMobileApplication;"

private const val ROW_TITLE = "Local Data Backup"
private const val ROW_SUMMARY = "Export your usage data to a file on this device, or restore it from one."

private val localDataBackupManifestPatch = resourcePatch(
    description = "Declares the local backup file picker activity.",
) {
    execute {
        androidManifest {
            val application = getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                if ((activities.item(i) as Element).getAttribute("android:name") == LOCAL_BACKUP_ACTIVITY) return@androidManifest
            }
            application.appendChild(
                createElement("activity").apply {
                    setAttribute("android:name", LOCAL_BACKUP_ACTIVITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:configChanges", "orientation|keyboard|keyboardHidden|screenSize|smallestScreenSize|screenLayout|uiMode")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                },
            )
        }
    }
}

@Suppress("unused")
val localDataBackupPatch = bytecodePatch(
    name = "Local data backup",
    description = "Replaces the Google Drive \"Usage Data Backup\" in Settings > Storage with a " +
        "local backup: export your usage history, limits and settings to a zip file you pick, " +
        "and restore them from one. Needs no Google account and no longer asks you to opt in " +
        "to data collection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    dependsOn(localDataBackupManifestPatch)

    execute {
        val rowMethod = UsageDataBackupRowFingerprint.method
        val rowInstructions = rowMethod.implementation!!.instructions.toList()
        val summaryIndex = UsageDataBackupRowFingerprint.instructionMatches.last().index

        // 1. The row: wt9.b(scope, icon, ?, title, ?, summary, …, onClick, …). It is a range call
        //    (19 arguments), so title/summary sit at fixed registers from the range start;
        //    overwrite them right before the call. Matched as the first range call after the
        //    summary string that takes a String at argument 3 and at argument 5.
        val rowCallIndex = (summaryIndex until rowInstructions.size).firstOrNull { index ->
            val instruction = rowInstructions[index]
            if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@firstOrNull false
            val parameters = ((instruction as ReferenceInstruction).reference as MethodReference).parameterTypes
            parameters.size > 5 && parameters[3] == "Ljava/lang/String;" && parameters[5] == "Ljava/lang/String;"
        } ?: throw PatchException("Settings row call not found")

        val rowCall = rowInstructions[rowCallIndex] as RegisterRangeInstruction
        val rowParameters = ((rowCall as ReferenceInstruction).reference as MethodReference).parameterTypes
            .map(CharSequence::toString)
        fun argumentRegister(argument: Int): Int {
            var register = rowCall.startRegister
            for (i in 0 until argument) register += if (rowParameters[i] == "J" || rowParameters[i] == "D") 2 else 1
            return register
        }

        rowMethod.addInstructions(
            rowCallIndex,
            """
                const-string v${argumentRegister(3)}, "$ROW_TITLE"
                const-string v${argumentRegister(5)}, "$ROW_SUMMARY"
            """,
        )

        // 2. The click lambda: the last constructor call before the row is `new <lambda>(…)`, a
        //    merged lambda class whose int field selects the case and whose constructor stores
        //    a constant into it (0xc in 20.16.1). That case shows the data-collection opt-in
        //    dialog, Google Sign-In or the Drive backup screen; short-circuit it to the local
        //    backup menu, handing over every captured object (one of them is the activity).
        val lambdaInit = (rowCallIndex downTo summaryIndex).firstNotNullOfOrNull { index ->
            val instruction = rowInstructions[index]
            if (instruction.opcode != Opcode.INVOKE_DIRECT_RANGE && instruction.opcode != Opcode.INVOKE_DIRECT) {
                return@firstNotNullOfOrNull null
            }
            ((instruction as ReferenceInstruction).reference as MethodReference).takeIf { it.name == "<init>" }
        } ?: throw PatchException("Click lambda constructor not found")

        val lambdaClass = mutableClassDefBy(lambdaInit.definingClass)
        val constructor = lambdaClass.methods.first {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == lambdaInit.parameterTypes.map(CharSequence::toString)
        }
        val constructorInstructions = constructor.implementation!!.instructions.toList()
        val caseFieldIndex = constructorInstructions.indexOfFirst {
            it.opcode == Opcode.IPUT && ((it as ReferenceInstruction).reference as FieldReference).type == "I"
        }
        if (caseFieldIndex < 0) throw PatchException("Lambda case field not found")
        val caseField = (constructorInstructions[caseFieldIndex] as ReferenceInstruction).reference as FieldReference
        val caseRegister = (constructorInstructions[caseFieldIndex] as TwoRegisterInstruction).registerA
        val caseValue = constructorInstructions.subList(0, caseFieldIndex).lastOrNull {
            it is NarrowLiteralInstruction && it is OneRegisterInstruction && it.registerA == caseRegister
        }?.let { (it as NarrowLiteralInstruction).narrowLiteral }
            ?: throw PatchException("Lambda case value not found")

        val capturedFields = lambdaClass.fields
            .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/Object;" }
            .map { it.name }
        if (capturedFields.size != 5) throw PatchException("Expected 5 captured objects, found ${capturedFields.size}")

        val invoke = lambdaClass.methods.first {
            it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
        }
        if (invoke.implementation!!.registerCount - invoke.parameterTypes.size - 1 < 6) {
            throw PatchException("Lambda invoke() has too few registers")
        }
        // p0 is past v15 (invoke() has many locals), out of reach of iget's 4-bit operands, so
        // copy it down first; the original code starts by overwriting these registers anyway.
        val type = lambdaClass.type
        invoke.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v5, p0
                iget v0, v5, $type->${caseField.name}:I
                const v1, $caseValue
                if-ne v0, v1, :original
                ${capturedFields.mapIndexed { i, name -> "iget-object v$i, v5, $type->$name:Ljava/lang/Object;" }.joinToString("\n")}
                invoke-static {v0, v1, v2, v3, v4}, $LOCAL_BACKUP->onBackupRowClicked(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """,
            ExternalLabel("original", invoke.getInstruction(0)),
        )

        // 3. Application.attachBaseContext: apply a staged restore before anything opens the
        //    databases. StayFreeMobileApplication and its (obfuscated) base don't override it,
        //    so add the override.
        val application = mutableClassDefBy(APPLICATION_CLASS)
        val existing = application.methods.firstOrNull {
            it.name == "attachBaseContext" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
        }
        if (existing != null) {
            existing.addInstructions(0, "invoke-static {p1}, $LOCAL_BACKUP->applyPendingRestore(Landroid/content/Context;)V")
        } else {
            val attach = ImmutableMethod(
                APPLICATION_CLASS,
                "attachBaseContext",
                listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)),
                "V",
                AccessFlags.PROTECTED.value,
                null,
                null,
                ImmutableMethodImplementation(2, emptyList(), null, null),
            ).toMutable()
            application.methods.add(attach)
            attach.addInstructions(
                0,
                """
                    invoke-static {p1}, $LOCAL_BACKUP->applyPendingRestore(Landroid/content/Context;)V
                    invoke-super {p0, p1}, ${application.superclass}->attachBaseContext(Landroid/content/Context;)V
                    return-void
                """,
            )
        }
    }
}
