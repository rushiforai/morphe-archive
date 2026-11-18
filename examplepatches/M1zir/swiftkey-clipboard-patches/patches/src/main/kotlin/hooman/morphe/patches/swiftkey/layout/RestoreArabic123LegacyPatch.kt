package hooman.morphe.patches.swiftkey.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.*
import hooman.morphe.patches.swiftkey.swiftKeyCompatibility

private val layoutEnum = Fingerprint(
    definingClass = "Lxj0/a;",
    name = "<clinit>",
    strings = listOf("ARABIC_3_WESTERN", "arabic_3_western", "ARABIC_3_WESTERN_V2", "arabic_3_western_v2"),
)
private val availableLayouts = Fingerprint(
    definingClass = "Luj0/f;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

private fun signature(i: Instruction): String = buildString {
    append(i.opcode.toString())
    if (i is OneRegisterInstruction) append(":${i.registerA}")
    if (i is TwoRegisterInstruction) append(":${i.registerB}")
    if (i is FiveRegisterInstruction) {
        append(":${i.registerCount}:${i.registerC}:${i.registerD}:${i.registerE}:${i.registerF}:${i.registerG}")
    }
    if (i is ReferenceInstruction) append(":${i.reference}")
    if (i is WideLiteralInstruction) append(":${i.wideLiteral}")
}

/** Two native variants share a label. The requested key arrangement is ARABIC_3_WESTERN. */
@Suppress("unused")
val restoreArabic123LegacyPatch = bytecodePatch(
    name = "Restore Arabic 123 legacy layout",
    description = "Restores the Arabic 123 legacy arrangement with و as the third bottom-row letter and no separate ؤ key. " +
        "Keeps the current layouts and default selection. Select the restored layout in SwiftKey Languages.",
) {
    compatibleWith(swiftKeyCompatibility)
    execute {
        // Fail closed if the enum constants or exact register flow have changed.
        layoutEnum.method
        val method = availableLayouts.method
        val expected = listOf(
            "NEW_INSTANCE:0:Ljava/util/ArrayList;",
            "IGET_OBJECT:1:3:Luj0/f;->a:Ljava/util/ArrayList;",
            "INVOKE_DIRECT:2:0:1:0:0:0:Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V",
            "NEW_INSTANCE:1:Luj0/n;",
            "INVOKE_DIRECT:1:1:0:0:0:0:Ljava/lang/Object;-><init>()V",
            "INVOKE_STATIC:2:0:1:0:0:0:Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V",
            "CONST_4:1:0",
            "IGET_OBJECT:2:3:Luj0/f;->c:Lxj0/a;",
            "INVOKE_VIRTUAL:3:0:1:2:0:0:Ljava/util/ArrayList;->add(ILjava/lang/Object;)V",
            "INVOKE_STATIC:1:0:0:0:0:0:Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;",
            "MOVE_RESULT_OBJECT:0",
            "RETURN_OBJECT:0",
        )
        if (method.implementation!!.registerCount != 4 ||
            method.implementation!!.tryBlocks.isNotEmpty() ||
            method.instructions.map(::signature).toList() != expected
        ) throw PatchException("SwiftKey layout chooser differs from verified 9.13.19.3; refusing to patch.")

        // v0 is a fresh mutable copy, with the default already at index zero.
        // v1 and v2 are dead locals here; p0/v3 must remain the receiver.
        // All four inspected Arabic packs offer ARABIC_3_WESTERN_V2. Checking
        // the actual list also covers future pack refreshes using this layout.
        // Enum names are stable; avoid depending on obfuscated field names.
        method.addInstructionsWithLabels(9, """
            const-string v1, "ARABIC_3_WESTERN_V2"
            invoke-static {v1}, Lxj0/a;->valueOf(Ljava/lang/String;)Lxj0/a;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :finished
            const-string v1, "ARABIC_3_WESTERN"
            invoke-static {v1}, Lxj0/a;->valueOf(Ljava/lang/String;)Lxj0/a;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
            move-result v2
            if-nez v2, :finished
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        """.trimIndent(), ExternalLabel("finished", method.getInstruction(9)))
    }
}
