package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER
import com.android.tools.smali.dexlib2.Opcode

private const val BB_GAME_SERVICE = "Lcom/newstargames/newstarsoccer/BBGameService;"
private const val SAVE_SLOT = "Lcom/newstargames/newstarsoccer/c_TScreen_SaveSlot;"
private const val TBUTTON = "Lcom/newstargames/newstarsoccer/c_TButton;"
private const val GGADGET = "Lcom/newstargames/newstarsoccer/c_GGadget;"
private const val BB = "Lcom/newstargames/newstarsoccer/bb_;"

/**
 * Desativa o login automático quebrado do Google Play Games (que sempre falha em APKs
 * reassinados porque o SHA-1 do certificado muda) e oculta os botões mortos de Login e
 * Conquistas na tela de Carreira (tanto no visual moderno quanto no clássico).
 *
 * Pontos de injeção confirmados no DEX:
 *  - BBGameService.beginUserSignIn(): fixa loginState = 2 (desconectado) e retorna.
 *  - BBGameService.onStart() / onStop(): neutraliza GameHelper.onStart/onStop no ciclo de vida.
 *  - c_TScreen_SaveSlot.m_SetUpScreen(): antes do return final (onde todos os ramos convergem),
 *    oculta m_btn_Network, m_btn_Achievements, m_gadgGooglePlayLogin e m_gadgGooglePlayAchievements.
 *  - c_TScreen_SaveSlot.m_Update(): retorna 0 para não reexibir esses botões em frames futuros.
 */
@Suppress("unused")
val disableGooglePlayGamesPatch = patch(
    name = "Disable Google Play Games",
    description = "Disables broken Google Play Games auto-sign-in on re-signed APKs and hides the dead Play Games button on the Career screen (modern and classic UI).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // BBGameService.beginUserSignIn()V: regs=2, ins=1 -> v1 = this, v0 livre.
        val beginSignIn = GameServiceBeginSignInFingerprint.method
        val thisReg = checkNotNull(beginSignIn.implementation).registerCount - 1
        beginSignIn.addInstructions(
            0,
            """
                const/4 v0, 0x2
                iput v0, v$thisReg, $BB_GAME_SERVICE->loginState:I
                return-void
            """.trimIndent(),
        )

        GameServiceOnStartFingerprint.method.addInstructions(0, "return-void")
        GameServiceOnStopFingerprint.method.addInstructions(0, "return-void")

        // Impede o loop de polling de login de reexibir os botões do Play Games.
        SaveSlotUpdateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // Oculta todos os botões do Play Games ao final de c_TScreen_SaveSlot.m_SetUpScreen()
        // (o retorno usa v2; v0 é registrador temporário livre imediatamente antes do return).
        // Usa ExternalLabel apontando para a instrução return final para evitar bug de resolução
        // de labels locais em addInstructions() em índices altos.
        val setupScreen = SaveSlotSetupScreenFingerprint.method
        val returnInst = setupScreen.instructions.last()
        val lastIndex = setupScreen.instructions.size - 1
        check(lastIndex >= 0 && returnInst.opcode == Opcode.RETURN) {
            "Disable Google Play Games: instrução final inesperada em c_TScreen_SaveSlot.m_SetUpScreen"
        }
        setupScreen.addInstructionsWithLabels(
            lastIndex,
            """
                const/4 v0, 0x0
                sput-boolean v0, $SAVE_SLOT->m_signedIn:Z
                sput-boolean v0, $SAVE_SLOT->m_networkActive:Z
                sget-object v0, $SAVE_SLOT->m_btn_Network:$TBUTTON
                invoke-virtual { v0 }, $TBUTTON->p_Hide()I
                sget-object v0, $SAVE_SLOT->m_btn_Achievements:$TBUTTON
                invoke-virtual { v0 }, $TBUTTON->p_Hide()I
                invoke-static { }, $BB->g_IsAppearanceNew()Z
                move-result v0
                if-eqz v0, :done_hide_gp
                sget-object v0, $SAVE_SLOT->m_gadgGooglePlayLogin:$GGADGET
                invoke-virtual { v0 }, $GGADGET->p_Hide()I
                sget-object v0, $SAVE_SLOT->m_gadgGooglePlayAchievements:$GGADGET
                invoke-virtual { v0 }, $GGADGET->p_Hide()I
            """.trimIndent(),
            ExternalLabel("done_hide_gp", returnInst),
        )
    }
}
