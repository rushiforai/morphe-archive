package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal fun BytecodePatchContext.applyDiscoverSearch(hideDiscoverTabs: Boolean, hideTrendingSearches: Boolean) {
    if (hideDiscoverTabs == true) {
        DiscoverInitTabsFingerprint.method.addInstructions(0, "return-void")
    }

    if (hideTrendingSearches == true) {
        DiscoverTrendingSearchFingerprint.matchAll(1..1)
        DiscoverViewCreatedFingerprint.matchAll(1..1)
        val renderer = DiscoverTrendingSearchFingerprint.originalMethod
        val owner = DiscoverTrendingSearchFingerprint.classDef
        val fields = renderer.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.distinct()
        val refresh = fields.single { it.type == "Lcom/bilibili/magicasakura/widgets/TintImageView;" }
        val binding = fields.single { it.definingClass == owner.type && it.type == refresh.definingClass }
        check(DiscoverViewCreatedFingerprint.originalMethod.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference == refresh
        }) { "Discover refresh control is not initialized by the native view setup" }

        // Keep native list assignment and empty-state rendering instead of bypassing them.
        DiscoverTrendingSearchFingerprint.method.addInstructions(0, """
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object p1
        """.trimIndent())

        val helperName = "morpheHideDiscoverTrending"
        check(owner.methods.none { it.name == helperName })
        val helper = MutableMethod(ImmutableMethod(owner.type, helperName,
            listOf(ImmutableMethodParameter(owner.type, emptySet(), null)), "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            MutableMethodImplementation(3)))
        helper.addInstructions(0, """
            iget-object v0, p0, $binding
            if-eqz v0, :done
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v1
            invoke-virtual {p0, v1}, $renderer
            iget-object v0, v0, $refresh
            if-eqz v0, :done
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
            invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V
            const/16 v1, 0x8
            invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            :done
            return-void
        """.trimIndent())
        owner.methods.add(helper)
        val setup = DiscoverViewCreatedFingerprint.method
        val returns = setup.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(returns.size == 1)
        val index = returns.single().index
        setup.replaceInstruction(index, "invoke-static/range {p0 .. p0}, ${owner.type}->$helperName(${owner.type})V")
        setup.addInstructions(index + 1, "return-void")
        DiscoverLoadingStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )
    }
}
