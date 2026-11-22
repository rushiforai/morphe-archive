package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

/**
 * Oculta o botão promocional "Jogos que gostamos" (Games we like) na tela de Opções, tanto no
 * visual moderno quanto no clássico, usando a própria flag de configuração do jogo
 * (Settings / GamesWeLikeEnabled).
 *
 * Confirmado no DEX e em assets/monkey/NewGUI/Screens/options.uis:
 *  - Visual clássico: c_TScreen_Options.m_CreateScreen() consulta
 *    c_TweakValueFloat.m_Get("Settings", "GamesWeLikeEnabled") e só cria m_btn_Games se == 1.0f.
 *  - Visual moderno: options.uis controla GamesWeLikeButton com ShowIf(Settings,GamesWeLikeEnabled,1).
 *
 * Forçar 0.0f no início de c_TScreen_Options.m_SetUpScreen() (antes de m_CreateScreen e antes de
 * ativar "options") cobre os dois modos e resiste a eventuais tweaks remotos sem editar assets.
 */
@Suppress("unused")
val hideGamesWeLikePatch = patch(
    name = "Hide Games we like button",
    description = "Hides the promotional \"Games we like\" button on the Options screen in both modern and classic UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // c_TScreen_Options.m_SetUpScreen()I: regs=7, ins=0 -> v0, v1, v2 livres no início.
        OptionsSetupScreenFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Settings"
                const-string v1, "GamesWeLikeEnabled"
                const/4 v2, 0x0
                invoke-static { v0, v1, v2 }, Lcom/newstargames/newstarsoccer/c_TweakValueFloat;->m_Set(Ljava/lang/String;Ljava/lang/String;F)Lcom/newstargames/newstarsoccer/c_TweakValueFloat;
            """.trimIndent(),
        )
    }
}
