package patches.brabant

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal data class OwnedEdit(val index: Int, val opcodes: List<Opcode>, val references: List<String?>, val replacement: List<String>, val target: Int? = null, val branch: Int? = null)
internal data class OwnedMethod(val owner: String, val signature: String, val flags: Int, val registers: Int, val count: Int, val edits: List<OwnedEdit>)

// Original, independently surveyed boundaries. Keep native bodies and results.
private val targets = listOf(
    OwnedMethod("Lpl6;", "h(Lkk6;Le34;)Llk6;", 0x11, 37, 632, listOf(
        OwnedEdit(145, listOf(Opcode.MOVE_RESULT_OBJECT), listOf(null), listOf("const/4 v7, 0x0")),
        OwnedEdit(366, listOf(Opcode.MOVE_RESULT_OBJECT), listOf(null), listOf("const/16 v33, 0x0")),
        OwnedEdit(312, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(ILjava/lang/Object;)V"), listOf("nop")),
        OwnedEdit(434, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
    )),
    OwnedMethod("Ltd5;", "e(Ltd5;Lhp1;)Ljava/lang/Object;", 0x19, 31, 303, listOf(
        OwnedEdit(263, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(ILjava/lang/Object;)V"), listOf("nop")),
    )),
    OwnedMethod("Ley1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 32, 1537, listOf(
        OwnedEdit(513, listOf(Opcode.INVOKE_VIRTUAL), listOf("Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"), listOf("nop")),
    )),
    OwnedMethod("Ld30;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 76, 1523, listOf(
        OwnedEdit(1131, listOf(Opcode.INVOKE_VIRTUAL), listOf("Li85;->add(Ljava/lang/Object;)Z"), listOf("nop")),
        OwnedEdit(1139, listOf(Opcode.IGET_BOOLEAN), listOf("Lpi6;->d:Z"), listOf("const/4 v3, 0x0")),
    )),
    OwnedMethod("Lxc0;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", 0x11, 14, 301, listOf(
        OwnedEdit(35, listOf(Opcode.IGET_OBJECT), listOf("Lxe4;->j:Ljava/lang/String;"), listOf("const/4 p0, 0x0")),
    )),
    OwnedMethod("Lja;", "R0(Lja;Ly9;)V", 0x9, 7, 61, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("const/16 v0, 0x8", "invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V", "return-void")),
    )),
    OwnedMethod("Lnl/omroepbrabant/android/app/App;", "onCreate()V", 0x11, 9, 194, listOf(
        OwnedEdit(56, listOf(Opcode.INVOKE_STATIC), listOf("Luh4;->X(Landroid/content/Context;)V"), listOf("nop")),
    )),
    OwnedMethod("Lcom/startapp/sdk/adsbase/StartAppInitProvider;", "attachInfo(Landroid/content/Context;Landroid/content/pm/ProviderInfo;)V", 0x11, 3, 3, listOf(
        OwnedEdit(1, listOf(Opcode.INVOKE_STATIC), listOf("Lcom/startapp/sdk/internal/xh;->c(Landroid/content/Context;)V"), listOf("nop")),
    )),
    OwnedMethod("Lkj7;", "A0(Lfy2;Ljava/util/Map;)V", 0x11, 15, 990, listOf(
        OwnedEdit(727, listOf(Opcode.NEW_INSTANCE, Opcode.IGET_OBJECT, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IGET_OBJECT, Opcode.IPUT_OBJECT), listOf("Ls96;", "Lkj7;->a:Lrw2;", "Ls96;-><init>(Lrw2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V", "Lkj7;->i0:Ls96;", "Lkj7;->o0:Lv8;", "Ls96;->b:Lv8;"), listOf("nop", "nop", "nop", "nop", "nop", "nop")),
        OwnedEdit(794, listOf(Opcode.NEW_INSTANCE, Opcode.IGET_OBJECT, Opcode.INVOKE_DIRECT, Opcode.IPUT_OBJECT, Opcode.IGET_OBJECT, Opcode.IPUT_OBJECT), listOf("Ls96;", "Lkj7;->a:Lrw2;", "Ls96;-><init>(Lrw2;Lcom/bluebillywig/bbnativeshared/model/EmbedObject;Ljava/util/Map;)V", "Lkj7;->i0:Ls96;", "Lkj7;->o0:Lv8;", "Ls96;->b:Lv8;"), listOf("nop", "nop", "nop", "nop", "nop", "nop")),
    )),
    OwnedMethod("Lyh0;", "A0(Lfy2;Ljava/util/Map;)V", 0x11, 30, 2284, listOf(
        OwnedEdit(1328, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v4, 0x0")),
        OwnedEdit(1344, listOf(Opcode.MOVE_RESULT), listOf(null), listOf("const/4 v4, 0x0")),
    )),
    OwnedMethod("Lyh0;", "t(Lhq;Ljava/util/Map;)V", 0x11, 23, 557, listOf(
        OwnedEdit(471, listOf(Opcode.INSTANCE_OF), listOf("Ljava/util/List;"), listOf("const/4 v6, 0x0")),
    )),
    OwnedMethod("Lyh0;", "g(Ljava/lang/String;Ljava/util/Map;)V", 0x11, 23, 382, listOf(
        OwnedEdit(11, listOf(Opcode.IGET_BOOLEAN), listOf("Lyh0;->m1:Z"), listOf("const/4 v2, 0x0")),
    )),
    OwnedMethod("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;", "getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;", 0x11, 1, 2, listOf(
        OwnedEdit(0, listOf(Opcode.IGET_OBJECT), listOf("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adSchedulingData:Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;"), listOf("const/4 p0, 0x0")),
    )),
    OwnedMethod("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;", "getAdServicesData()Ljava/util/List;", 0x11, 1, 2, listOf(
        OwnedEdit(0, listOf(Opcode.IGET_OBJECT), listOf("Lcom/bluebillywig/bbnativeshared/model/EmbedObject;->adServicesData:Ljava/util/List;"), listOf("const/4 p0, 0x0")),
    )),
    OwnedMethod("Lnl/pinch/optoutadvertising/sdk/ui/OptOutAdView;", "e(Lk9;)V", 0x11, 5, 9, listOf(
        OwnedEdit(2, listOf(), listOf(), listOf("new-instance v0, Ljava/lang/IllegalStateException;", "const-string v1, \"Advertising disabled\"", "invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V", "invoke-interface {p1, v0}, Lk9;->onFailure(Ljava/lang/Throwable;)V", "return-void")),
    )),
    OwnedMethod("Lew9;", "a(Ld66;Lty;Lb45;Lao3;Lgq3;I)V", 0x19, 22, 159, listOf(
        OwnedEdit(0, listOf(), listOf(), listOf("return-void")),
    )),
 )

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyAdEdits() = applyOwnedEdits(targets)

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyOwnedEdits(targets: List<OwnedMethod>) {
    for (target in targets) {
        val method = exact(target.owner, target.signature).method
        val original = method.instructions.toList()
        check(method.accessFlags == target.flags && method.implementation!!.registerCount == target.registers &&
            original.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) } == target.count) {
            "Brabant original contract changed: ${target.owner}->${target.signature}"
        }
        for (edit in target.edits) {
            for (offset in edit.opcodes.indices) {
                val instruction = original[edit.index + offset]
                check(instruction.opcode == edit.opcodes[offset]) { "Brabant original opcode changed" }
                edit.references[offset]?.let { reference ->
                    check((instruction as? ReferenceInstruction)?.reference?.toString() == reference) { "Brabant original reference changed" }
                }
            }
        }
        // Capture original labels before insertion. Replacing an anchor preserves
        // its incoming routes, including coroutine resume and cached SDK paths.
        val labels = target.edits.associateWith { edit -> edit.target?.let { method.implementation!!.newLabelForIndex(it) } }
        for (edit in target.edits.sortedByDescending { it.index }) {
            if (edit.opcodes.isEmpty()) {
                method.addInstructions(edit.index, edit.replacement.joinToString("\n"))
            } else if (edit.opcodes.size == edit.replacement.size) {
                edit.replacement.forEachIndexed { offset, instruction -> method.replaceInstruction(edit.index + offset, instruction) }
            } else {
                check(edit.opcodes.size == 1 && edit.replacement.size > 1)
                method.replaceInstruction(edit.index, edit.replacement.first())
                method.addInstructions(edit.index + 1, edit.replacement.drop(1).joinToString("\n"))
            }
            labels[edit]?.let { label ->
                method.replaceInstruction(edit.index + checkNotNull(edit.branch), BuilderInstruction30t(Opcode.GOTO_32, label))
            }
        }
    }
}
