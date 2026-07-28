package app.template.patches.ozon.checkout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableCheckoutTips")

private val returnEmptyList = """
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v0
    return-object v0
""".trimIndent()

private val removePvzTipId = """
    invoke-virtual {p1}, Lru/ozon/composer/state/ComposerRequestState;->f()Ljava/util/concurrent/ConcurrentHashMap;
    move-result-object v0
    const-string v1, "pvzTipID"
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
""".trimIndent()

@Suppress("unused")
val disableCheckoutTipsPatch = bytecodePatch(
    name = "Disable checkout tips",
    description = "Removes courier tips UI and prevents tip IDs or tip API calls from being submitted.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        val optionalMatches = listOf(
            FreshCourierTipsMapperFingerprint.matchAll(0..1) to returnEmptyList,
            OrderDoneCourierTipsMapperFingerprint.matchAll(0..1) to returnEmptyList,
            FreshSendCourierTipsFingerprint.matchAll(0..1) to "return-void",
            OrderDoneSendCourierTipsFingerprint.matchAll(0..1) to "return-void",
        )
        val optionalHooks = optionalMatches.sumOf { (matches, instructions) ->
            matches.forEach { match ->
                match.method.addInstructions(0, instructions)
            }
            matches.size
        }

        // Prevent deeplinks from introducing a tip ID.
        AddPvzTipIdFingerprint.method.addInstructions(0, "return-void")

        // Clear tip state both for normal requests and for server-driven checkout actions.
        AddCheckoutLocationParamsFingerprint.method.addInstructions(0, removePvzTipId)
        CheckoutInterceptStateFingerprint.method.addInstructions(0, removePvzTipId)

        logger.info(
            "Disabled $optionalHooks optional courier tips UI/API hooks and " +
                "3 required checkout request hooks",
        )
    }
}
