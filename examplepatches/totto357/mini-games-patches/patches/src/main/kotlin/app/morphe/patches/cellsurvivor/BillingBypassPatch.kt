package app.morphe.patches.cellsurvivor

import app.morphe.patches.cellsurvivor.Constants.COMPATIBILITY_CELL_SURVIVOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GAME_HELPER = "Lcom/common/sdk/GameHelper;"
private const val GAME_ACT_HELPER = "Lcom/common/game/GameActHelper;"
private const val PAY_MANAGER_COM = "Lcom/common/pay/PayManagerCom;"

internal object NewOrderInfoByGameStaticFingerprint : Fingerprint(
    definingClass = GAME_HELPER,
    name = "newOrderInfoByGameStatic",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object NewOrderInfoByStrongNetGameStaticFingerprint : Fingerprint(
    definingClass = GAME_HELPER,
    name = "newOrderInfoByStrongNetGameStatic",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object GameActHelperNewOrderInfoFingerprint : Fingerprint(
    definingClass = GAME_ACT_HELPER,
    name = "newOrderInfoByGameStatic",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object GameActHelperNewOrderInfoStrongNetFingerprint : Fingerprint(
    definingClass = GAME_ACT_HELPER,
    name = "newOrderInfoByStrongNetGameStatic",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object NotifyGamePaySucceedFingerprint : Fingerprint(
    definingClass = PAY_MANAGER_COM,
    name = "notifyGamePaySucceed",
    parameters = listOf("Ljava/lang/String;", "Lcom/common/pay/PayData;"),
)

internal object TrackPlatPayResultToServerFingerprint : Fingerprint(
    definingClass = PAY_MANAGER_COM,
    name = "trackPlatPayResultToServer",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object AddUploadServerCacheFingerprint : Fingerprint(
    definingClass = PAY_MANAGER_COM,
    name = "addUploadServerCache",
    parameters = listOf("Ljava/lang/String;"),
)

internal object GetAllUnFinishOrderIDFingerprint : Fingerprint(
    definingClass = PAY_MANAGER_COM,
    name = "getAllUnFinishOrderID",
    parameters = emptyList(),
)

internal object QueryUnFinishOrderFromServerFingerprint : Fingerprint(
    definingClass = PAY_MANAGER_COM,
    name = "queryUnFinishOrderFromServer",
    parameters = emptyList(),
)

private const val INSTANT_GRANT_SMALI = """
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v0
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;
    move-result-object v0

    new-instance v1, Lcom/common/pay/PayData;
    invoke-direct {v1}, Lcom/common/pay/PayData;-><init>()V
    iput-object p0, v1, Lcom/common/pay/PayData;->productId:Ljava/lang/String;
    iput-object v0, v1, Lcom/common/pay/PayData;->orderNum:Ljava/lang/String;
    const-string v2, "test_plat_order"
    iput-object v2, v1, Lcom/common/pay/PayData;->pltOrderNum:Ljava/lang/String;
    const/4 v2, 0x0
    iput v2, v1, Lcom/common/pay/PayData;->status:I
    const/4 v2, 0x1
    iput v2, v1, Lcom/common/pay/PayData;->serverStatus:I
    const-string v2, "test_order_sign"
    iput-object v2, v1, Lcom/common/pay/PayData;->orderSign:Ljava/lang/String;

    new-instance v2, Lcom/google/gson/Gson;
    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V
    invoke-virtual {v2, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v1

    invoke-static {v0, v1}, Lcom/common/game/UserGameHelper;->platSucceedCallback(Ljava/lang/String;Ljava/lang/String;)V
    return-void
"""

@Suppress("unused")
val billingBypassPatch =
    bytecodePatch(
        name = "Free In-App Purchases",
        description = "Bypasses Google Play billing and immediately grants purchased diamonds/packs.",
    ) {
        compatibleWith(COMPATIBILITY_CELL_SURVIVOR)

        execute {
            // Hook all order entry points to immediately grant item via UserGameHelper.platSucceedCallback
            listOf(
                NewOrderInfoByGameStaticFingerprint,
                NewOrderInfoByStrongNetGameStaticFingerprint,
                GameActHelperNewOrderInfoFingerprint,
                GameActHelperNewOrderInfoStrongNetFingerprint,
            ).forEach { fingerprint ->
                fingerprint.method.apply {
                    val count = implementation?.instructions?.size ?: 0
                    if (count > 0) {
                        removeInstructions(0, count)
                    }
                    ensureLocals(3)
                    addInstructions(0, INSTANT_GRANT_SMALI.trimIndent())
                }
            }

            // Fallback for notifyGamePaySucceed
            NotifyGamePaySucceedFingerprint.method.apply {
                ensureLocals(1)
                addInstructions(
                    0,
                    """
                    if-nez p2, :cond_pay_not_null
                    return-void
                    :cond_pay_not_null
                    new-instance v0, Lcom/google/gson/Gson;
                    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V
                    invoke-virtual {v0, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    invoke-static {p1, v0}, Lcom/common/game/UserGameHelper;->platSucceedCallback(Ljava/lang/String;Ljava/lang/String;)V
                    return-void
                    """.trimIndent(),
                )
            }

            TrackPlatPayResultToServerFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) removeInstructions(0, count)
                addInstructions(0, "return-void")
            }

            AddUploadServerCacheFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) removeInstructions(0, count)
                addInstructions(0, "return-void")
            }

            GetAllUnFinishOrderIDFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) removeInstructions(0, count)
                addInstructions(0, "const-string v0, \"\"\nreturn-object v0")
            }

            QueryUnFinishOrderFromServerFingerprint.method.apply {
                val count = implementation?.instructions?.size ?: 0
                if (count > 0) removeInstructions(0, count)
                addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            }
        }
    }
