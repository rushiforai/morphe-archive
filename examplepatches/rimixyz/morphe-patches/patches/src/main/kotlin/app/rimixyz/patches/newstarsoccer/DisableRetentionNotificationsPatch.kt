package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Bloqueia as notificações locais de retenção ("volte a jogar!") agendadas sempre que o jogo
 * vai para segundo plano.
 *
 * Neutraliza c_LocalNotifyComponent.p_OnPause() e, defensivamente, c_LocalNotification.p_ScheduleAfter(I).
 * Os caminhos de cancelamento em p_OnStart() e p_OnResume() permanecem intactos para limpar
 * qualquer notificação que tenha sido agendada antes da aplicação do patch.
 */
@Suppress("unused")
val disableRetentionNotificationsPatch = patch(
    name = "Disable retention notifications",
    description = "Prevents the game from scheduling local \"come back and play\" reminder notifications whenever it goes to the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        LocalNotifyOnPauseFingerprint.method.addInstructions(0, "return-void")
        LocalNotificationScheduleAfterFingerprint.method.addInstructions(0, "return-void")
    }
}
