package app.aliexpress.patches.ads

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// A search result item is a paid placement ("Sponsored"/AD badge) exactly when its item JSON
// carries a `p4p` object — the result view holders set `isAd` from
// `getModel().getJSONObject("p4p") != null`. Search results are parsed by two stacks, both
// patched here so the ad never becomes a cell (no empty slot left behind).

/**
 * Legacy search (`search/core/ahe/srp/AHEListBean.onParse(JSONObject, JSONObject item, …)`).
 * All callers null-check the result and skip the item.
 */
internal object AheListBeanOnParseFingerprint : Fingerprint(
    definingClass = "Lcom/alibaba/aliexpress/android/search/core/ahe/srp/AHEListBean;",
    name = "onParse",
    parameters = listOf("Lcom/alibaba/fastjson/JSONObject;", "Lcom/alibaba/fastjson/JSONObject;", "L"),
)

/**
 * New search (`aesearch/srp`, `cy/d.b(JSONObject, SrpContext, int)List` in 8.162.8): loops over
 * `itemList.content`, skipping null entries, and wraps each in `srp/module/waterfall/product/e`.
 */
internal object SrpItemListParserFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/alibaba/fastjson/JSONObject;", "L", "I"),
    strings = listOf("itemList", "addiction_start_page", "content"),
)

private const val SRP_PRODUCT_ITEM = "Lcom/aliexpress/android/aesearch/srp/module/waterfall/product/e;"

@Suppress("unused")
val hideSponsoredItemsPatch = bytecodePatch(
    name = "Remove sponsored items from search",
    description = "Removes sponsored (AD) products from search results.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        // Legacy stack: return null for p4p items. `.locals 6`, p2 (= v8) is the item JSON.
        AheListBeanOnParseFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    if-eqz p2, :keep
                    const-string v0, "p4p"
                    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/JSONObject;->getJSONObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;
                    move-result-object v0
                    if-eqz v0, :keep
                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("keep", getInstruction(0)),
            )
        }

        // New stack: right after `item = content.getJSONObject(i)`, null the item when it is
        // an ad; the loop's own `if (item == null) continue` then drops it. Registers are taken
        // from the method rather than hardcoded: the item register from the move-result, and
        // as scratch the register of the following `new-instance product/e`, which is written
        // before it is ever read.
        SrpItemListParserFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            val getItemIndex = instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == "Lcom/alibaba/fastjson/JSONArray;" && ref.name == "getJSONObject"
                    }
            }
            val newItemIndex = instructions.indexOfFirst {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as ReferenceInstruction).reference as TypeReference).type == SRP_PRODUCT_ITEM
            }
            if (getItemIndex < 0 || newItemIndex < getItemIndex) {
                throw PatchException("AliExpress: search item loop not found.")
            }

            val moveResultIndex = getItemIndex + 1
            val itemRegister = (instructions[moveResultIndex] as OneRegisterInstruction).registerA
            val scratchRegister = (instructions[newItemIndex] as OneRegisterInstruction).registerA

            addInstructions(
                moveResultIndex + 1,
                """
                    if-eqz v$itemRegister, :done
                    const-string v$scratchRegister, "p4p"
                    invoke-virtual {v$itemRegister, v$scratchRegister}, Lcom/alibaba/fastjson/JSONObject;->getJSONObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;
                    move-result-object v$scratchRegister
                    if-eqz v$scratchRegister, :done
                    const/4 v$itemRegister, 0x0
                    :done
                    nop
                """,
            )
        }
    }
}
