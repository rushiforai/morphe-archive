package app.morphe.patches.realmelink.bypasssession

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.realmelink.shared.Constants.COMPATIBILITY_REALMELINK

@Suppress("unused")
val bypassSessionPatch = bytecodePatch(
    name = "Bypass Session Expiry",
    description = "Kills session expiry dialogs",
    default = true
) {
    compatibleWith(COMPATIBILITY_REALMELINK)

    execute {
        AccountCheckFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object p0
            """
        )

        MainPresenterFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p1}, Lcom/realme/iot/common/eventbus/BaseMessage;->getType()I
                move-result v0
                const/16 v1, 0x133
                if-ne v0, v1, :continue_original
                return-void
                :continue_original
            """
        )
    }
}