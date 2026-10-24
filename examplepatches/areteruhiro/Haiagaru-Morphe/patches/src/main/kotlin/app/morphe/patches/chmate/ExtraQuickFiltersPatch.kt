package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTRA_FILTERS = "Lapp/morphe/extension/chmate/ExtraQuickFilters;"

internal fun BytecodePatchContext.patchExtraQuickFilters(version: String) {
    if(version !in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.242 dev")) return
    val old = version == "0.8.10.191 dev"
    val middle = version == "0.8.10.226 dev"
    val adapter = mutableClassDefBy(if(old) "Lo/m9ExternalSyntheticLambda1;" else if(middle) "Lo/listener;" else "Lo/zzacr;")
    val fragment = mutableClassDefBy(if(old) "Lo/pa;" else "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val bindFragment = fragment.methods.single { it.name == "onViewCreated" && it.parameterTypes.size == 2 }
    bindFragment.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.asReversed().forEach { (index, _) ->
        bindFragment.addInstructionsWithLabels(index,"invoke-static/range {p0 .. p0}, $EXTRA_FILTERS->register(Ljava/lang/Object;)V")
    }
    if(old || middle) {
        val rebuild = adapter.methods.single { it.name == (if(old) "c" else "b") && it.parameterTypes == listOf("Z") && it.returnType == "V" }
        val sites = rebuild.implementation!!.instructions.withIndex().filter {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "notifyDataSetChanged" && ref.parameterTypes.isEmpty()
        }
        check(sites.size == 1) { "Extra filters: native rebuild notify changed for $version" }
        rebuild.addInstructionsWithLabels(sites.single().index,
            "invoke-static/range {p0 .. p0}, $EXTRA_FILTERS->legacyRows(Ljava/lang/Object;)V")

        val row = if(old) adapter.methods.single { it.name == "getView" && it.parameterTypes.size == 3 }
            else mutableClassDefBy("Lo/listener\$setContentView;").methods.single { it.name == "e" && it.returnType == "Landroid/view/View;" }
        val returns = row.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        returns.asReversed().forEach { (index, insn) ->
            val r = (insn as OneRegisterInstruction).registerA
            // Use spare contiguous parameter words, after the native implementation has finished.
            row.addInstructionsWithLabels(index, """
                move-object/16 p1, v$r
                invoke-static/range {p0 .. p1}, $EXTRA_FILTERS->legacyRowOwner(Ljava/lang/Object;Landroid/view/View;)Landroid/view/View;
                move-result-object v$r
            """.trimIndent())
        }
        val recycle = if(old) "p2" else "p1"
        row.addInstructions(0,"""
            invoke-static/range {$recycle .. $recycle}, $EXTRA_FILTERS->unwrap(Landroid/view/View;)Landroid/view/View;
            move-result-object $recycle
        """.trimIndent())
    } else {
        val rows = mutableClassDefBy("Lo/emptyToNull;").methods.single { it.name == "c" && it.parameterTypes.size == 14 && it.parameterTypes[7] == "Lo/IObjectWrapperStub;" }
        check(rows.parameterTypes[3]=="Lo/zzacn;")
        rows.addInstructions(0,"invoke-static/range {p3 .. p7}, $EXTRA_FILTERS->observeConfigWithMode(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;)V")
        val apply = adapter.methods.single { it.name == "b" && it.parameterTypes == listOf("Lo/zzacr\$read;", "Lo/zzcbx;") }
        apply.addInstructions(0,"""
            invoke-static/range {p0 .. p1}, $EXTRA_FILTERS->modernSnapshot(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, Lo/zzacr${'$'}read;
        """.trimIndent())
        val holder = mutableClassDefBy("Lo/zzaV\$r8lambda7IJBVrN0sHyidCAZufWEJFc7yY;")
        val ctor = holder.methods.single { it.name == "<init>" }
        val site = ctor.implementation!!.instructions.withIndex().single {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.definingClass == holder.superclass && ref.name == "<init>"
        }
        val call = site.value as FiveRegisterInstruction
        check(call.registerCount == 3)
        check(call.registerD != call.registerC && call.registerD != call.registerE)
        // The constructor has no dead local register. Temporarily replace the
        // View argument and restore the original after super, preserving later
        // native accesses to the Compose view without adding a register.
        ctor.addInstructions(site.index + 1,"""
            invoke-static/range {v${call.registerD} .. v${call.registerD}}, $EXTRA_FILTERS->unwrap(Landroid/view/View;)Landroid/view/View;
            move-result-object v${call.registerD}
        """.trimIndent())
        ctor.addInstructionsWithLabels(site.index,"""
            invoke-static/range {v${call.registerD} .. v${call.registerD}}, $EXTRA_FILTERS->wrap(Landroid/view/View;)Landroid/view/View;
            move-result-object v${call.registerD}
        """.trimIndent())
        // The stored Compose view remains intact; bind the visible wrapper to the same adapter.
        val bind = adapter.methods.single { it.name == "a" && it.parameterTypes == listOf("Lo/zzaV;", "I") }
        val sites = bind.implementation!!.instructions.withIndex().filter {
            val ref=(it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lo/r7ExternalSyntheticLambda0;" && ref.name == "setContent"
        }
        check(sites.size == 1)
        val callBind=sites.single().value as FiveRegisterInstruction
        val r=callBind.registerC
        // p2 is no longer needed in the filter-header branch.
        bind.addInstructionsWithLabels(sites.single().index+1,"""
            move-object/16 p2, v$r
            invoke-static/range {p0 .. p2}, $EXTRA_FILTERS->bindHolder(Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;)V
        """.trimIndent())
    }
    println("Extra response filters: $version row, toolbar and display list hooks")
}
