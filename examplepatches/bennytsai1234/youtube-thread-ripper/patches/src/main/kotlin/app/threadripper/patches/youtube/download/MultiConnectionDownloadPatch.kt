package app.threadripper.patches.youtube.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.threadripper.patches.youtube.Constants.COMPATIBILITY_YOUTUBE
import app.threadripper.patches.youtube.settings.settingsResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/threadripper/extension/youtube/ThreadRipper;"

@Suppress("unused")
val multiConnectionDownloadPatch = bytecodePatch(
    name = "Multi-connection video download",
    description = "Downloads each video byte range over several concurrent connections, like a download " +
        "manager, to work around per-connection throttling of spoofed video streams. " +
        "Only affects non-SABR streams (for example Spoof video streams set to visionOS or Android VR Downgraded).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/youtube.mpe")
    dependsOn(settingsResourcePatch)

    execute {
        val open = UmpDataSourceOpenFingerprint.method
        val dataSourceClass = UmpDataSourceOpenFingerprint.classDef
        val dataSpecType = open.parameterTypes.single().toString()

        // media3 BaseDataSource transfer-listener helpers, so the app's bandwidth meter
        // keeps seeing the transfer when this patch serves it.
        val baseClass = mutableClassDefBy(
            dataSourceClass.superclass ?: throw PatchException("Data source has no superclass")
        )
        fun Method.writesField() = implementation?.instructions?.any { it.opcode == Opcode.IPUT_OBJECT } == true
        val dataSpecListeners = baseClass.methods.filter {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(dataSpecType)
        }
        if (dataSpecListeners.size != 2) {
            throw PatchException("Expected 2 DataSpec transfer methods in ${baseClass.type}, found ${dataSpecListeners.size}")
        }
        // transferStarted(DataSpec) stores the DataSpec; transferInitializing(DataSpec) does not.
        val transferStarted = dataSpecListeners.single { it.writesField() }
        val transferInitializing = dataSpecListeners.single { !it.writesField() }
        val bytesTransferred = baseClass.methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
        } ?: throw PatchException("bytesTransferred(int) not found in ${baseClass.type}")

        // The data source's own "opened" flag, which makes close() report transferEnded.
        val openedField = open.implementation!!.instructions
            .filter { it.opcode == Opcode.IPUT_BOOLEAN }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .firstOrNull { it.definingClass == dataSourceClass.type }
            ?: throw PatchException("Opened flag not found in ${dataSourceClass.type}")

        fun ref(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
        fun Method.requireLocals(count: Int) {
            val impl = implementation ?: throw PatchException("$name has no code")
            val locals = impl.registerCount - parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 as Int } - 1
            if (locals < count) throw PatchException("$definingClass->$name has $locals locals, needs $count")
        }

        open.requireLocals(6)
        open.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                invoke-static { v0, v1 }, $EXTENSION_CLASS->open(Ljava/lang/Object;Ljava/lang/Object;)J
                move-result-wide v2
                const-wide/16 v4, -0x2
                cmp-long v4, v2, v4
                if-eqz v4, :native
                invoke-virtual { v0, v1 }, ${ref(transferInitializing)}
                invoke-virtual { v0, v1 }, ${ref(transferStarted)}
                const/4 v4, 0x1
                iput-boolean v4, v0, $openedField
                return-wide v2
                :native
                nop
            """,
        )

        UmpDataSourceReadFingerprint.method.apply {
            requireLocals(4)
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    move-object/from16 v1, p1
                    move/from16 v2, p2
                    move/from16 v3, p3
                    invoke-static { v0, v1, v2, v3 }, $EXTENSION_CLASS->read(Ljava/lang/Object;[BII)I
                    move-result v2
                    const/4 v3, -0x2
                    if-eq v2, v3, :native
                    if-lez v2, :done
                    invoke-virtual { v0, v2 }, ${ref(bytesTransferred)}
                    :done
                    return v2
                    :native
                    nop
                """,
            )
        }

        UmpDataSourceCloseFingerprint.method.apply {
            requireLocals(1)
            addInstructions(
                0,
                """
                    move-object/from16 v0, p0
                    invoke-static { v0 }, $EXTENSION_CLASS->close(Ljava/lang/Object;)V
                """,
            )
        }
    }
}
