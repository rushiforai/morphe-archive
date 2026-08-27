package app.template.patches.ozon.notifications

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ozon.shared.Constants.COMPATIBILITY_OZON_CURRENT

@Suppress("unused")
val disableTipNotificationsPatch = bytecodePatch(
    name = "Disable tip notifications",
    description = "Suppresses Ozon push notifications asking the user to leave a pickup-point tip.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OZON_CURRENT)

    execute {
        // The first two instructions copy p0 and p1 into low registers v1 and v3.
        // Use those low registers because the method's parameter registers exceed
        // the four-bit register range supported by invoke-interface.
        OzonPushServiceDelegateFingerprint.method.addInstructions(
            2,
            """
                invoke-virtual {v3}, Lru/ozon/push/sdk/external/service/RemoteMessage;->b()Ljava/util/Map;
                move-result-object v0
                const-string v2, "Можно оставить чаевые"
                invoke-interface {v0, v2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z
                move-result v2
                if-nez v2, :morphe_drop_tip_notification
                const-string v2, "Поблагодарите сотрудника за выдачу заказа"
                invoke-interface {v0, v2}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z
                move-result v2
                if-eqz v2, :morphe_allow_notification
                :morphe_drop_tip_notification
                return-void
                :morphe_allow_notification
                nop
            """.trimIndent(),
        )
    }
}
