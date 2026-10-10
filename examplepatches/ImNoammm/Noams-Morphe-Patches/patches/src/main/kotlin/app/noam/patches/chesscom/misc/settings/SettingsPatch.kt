package app.noam.patches.chesscom.misc.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.extension.extensionHookPatch
import app.noam.patches.chesscom.shared.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val MORE_KEY = "Lcom/chess/home/more/MoreMenuItemKey;"
private const val MORE_VIEW_MODEL = "Lcom/chess/home/more/MoreViewModel;"
private const val MORE_ENTRY = "${Constants.EXTENSION_PACKAGE}/settings/MoreEntry;"

@Suppress("unused")
val settingsPatch = bytecodePatch(
    name = "Noam's Patches settings",
    description = "Adds a Noam's Patches row at the top of the More tab, where the other patches " +
        "of this bundle are switched on and off. Patches you did not select do not show up there.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch, settingsResourcePatch)

    execute {
        // The More tab: a NOAM_PATCHES item key for the row (title and icon looked up at run time).
        val keyClass = mutableClassDefBy(MORE_KEY)
        val constants = keyClass.fields.count { AccessFlags.ENUM.isSet(it.accessFlags) }
        val keyField = ImmutableField(
            MORE_KEY, "NOAM_PATCHES", MORE_KEY,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value or AccessFlags.ENUM.value,
            null, null, null,
        ).toMutable()
        keyClass.fields.add(keyField)
        keyClass.staticFields.add(keyField)
        val keyConstructor = keyClass.methods.single { it.name == "<init>" }
        keyClass.methods.single { it.name == "<clinit>" }.apply {
            // Right after the values array is stored, before the enum entries are built from it.
            val store = instructions.indexOfFirst {
                it.opcode == Opcode.SPUT_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).type == "[$MORE_KEY"
            }
            if (store < 0) throw PatchException("The More keys array was not found")
            val values = getInstruction<OneRegisterInstruction>(store).registerA
            val valuesField = getInstruction<ReferenceInstruction>(store).reference as FieldReference
            if (values != 0 || implementation!!.registerCount < 8) throw PatchException("Unexpected More keys registers")
            val init = "$MORE_KEY-><init>(${keyConstructor.parameterTypes.joinToString("")})V"
            addInstructions(
                store + 1,
                """
                    new-instance v1, $MORE_KEY
                    const-string v2, "NOAM_PATCHES"
                    const/16 v3, $constants
                    invoke-static { }, $MORE_ENTRY->titleRes()I
                    move-result v4
                    invoke-static { }, $MORE_ENTRY->iconRes()I
                    move-result v5
                    const-string v6, "noam_patches"
                    invoke-direct/range { v1 .. v6 }, $init
                    sput-object v1, $MORE_KEY->NOAM_PATCHES:$MORE_KEY
                    array-length v2, v0
                    add-int/lit8 v3, v2, 0x1
                    new-array v3, v3, [$MORE_KEY
                    const/4 v4, 0x0
                    invoke-static { v0, v4, v3, v4, v2 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
                    aput-object v1, v3, v2
                    sput-object v3, $valuesField
                    move-object v0, v3
                """,
            )
        }

        // Every More list gets the row first.
        mutableClassDefBy(MoreMenuStateToStringFingerprint.originalClassDef).methods.single {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "Ljava/util/List;"
        }.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $MORE_ENTRY->items(Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )

        // Its tap opens Noam's Patches; the app handles every other row.
        mutableClassDefBy(MORE_VIEW_MODEL).methods.single {
            it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf(MORE_KEY)
        }.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $MORE_ENTRY->onClick(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_more_rows
                    return-void
                """,
                ExternalLabel("morphe_more_rows", getInstruction(0)),
            )
        }
    }
}
