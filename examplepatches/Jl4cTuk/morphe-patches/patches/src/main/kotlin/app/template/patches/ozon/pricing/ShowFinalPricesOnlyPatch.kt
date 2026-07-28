package app.template.patches.ozon.pricing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val showFinalPricesOnlyPatch = bytecodePatch(
    name = "Show final prices only",
    description = "Hides crossed-out prices, discount percentages, and redundant price rows in the cart total.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        PriceComponentTextFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lru/ozon/uni/atoms/data/price/PriceDTO${'$'}Component;->textStyle:Lru/ozon/uni/atoms/data/price/PriceDTO${'$'}Component${'$'}TextStyle;
                if-eqz v0, :show_component
                invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I
                move-result v0
                add-int/lit8 v0, v0, -0x4
                if-eqz v0, :hide_component

                :show_component
                iget-object v0, p0, Lru/ozon/uni/atoms/data/price/PriceDTO${'$'}Component;->text:Ljava/lang/String;
                return-object v0

                :hide_component
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )

        PriceDiscountFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )

        val cartTotalBindMethod = CartTotalBindFingerprint.method
        val pageTypeComparisonIndex = cartTotalBindMethod.implementation!!.instructions.indexOfFirst { instruction ->
            val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference

            instruction.opcode == Opcode.INVOKE_STATIC &&
                method?.definingClass == "Lkotlin/jvm/internal/Intrinsics;" &&
                method.name == "d" &&
                method.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
                method.returnType == "Z"
        }
        require(pageTypeComparisonIndex >= 0) {
            "Could not find TotalVH cart page type comparison"
        }

        val pageTypeResultIndex = pageTypeComparisonIndex + 1
        require(
            cartTotalBindMethod.implementation!!.instructions[pageTypeResultIndex].opcode ==
                Opcode.MOVE_RESULT,
        ) {
            "Expected TotalVH cart page type comparison result"
        }

        val cartPageBranchIndex = pageTypeResultIndex + 1
        require(
            cartTotalBindMethod.implementation!!.instructions[cartPageBranchIndex].opcode ==
                Opcode.IF_EQZ,
        ) {
            "Expected TotalVH non-cart branch"
        }

        cartTotalBindMethod.addInstructions(
            cartPageBranchIndex + 1,
            """
                iget-object v0, p0, Lru/ozon/app/android/checkoutcomposer/total/presentation/main/TotalVH;->binding:Lru/ozon/app/android/checkout/databinding/WidgetTotalCommonBinding;
                iget-object v0, v0, Lru/ozon/app/android/checkout/databinding/WidgetTotalCommonBinding;->pricesRv:Landroidx/recyclerview/widget/RecyclerView;
                const/16 p2, 0x8
                invoke-virtual {v0, p2}, Landroid/view/View;->setVisibility(I)V
            """.trimIndent(),
        )
    }
}
