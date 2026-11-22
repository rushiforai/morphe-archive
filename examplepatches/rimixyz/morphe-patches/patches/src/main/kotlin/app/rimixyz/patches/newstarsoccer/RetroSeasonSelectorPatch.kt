package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_CLASS = "Lapp/rimixyz/extension/NewStarSoccerRetroSeasonHelper;"
private const val BB_CLASS = "Lcom/newstargames/newstarsoccer/bb_;"

/**
 * Seletor opcional de temporada/base de dados histórica (2011–2026) ao iniciar uma nova carreira.
 *
 * O APK já inclui bases históricas completas em assets/monkey/MyData/v2011..v2026, mapeadas
 * nativamente por bb_GSApp.g_GSUpdateDatabaseFolder(String) a partir de c_TPlayer.m_gameversion.
 *
 * Pontos de injeção:
 *  1. c_TPlayer.m_DoNewCareer(): exibe um diálogo nativo para escolher o ano da base de dados
 *     antes de abrir a tela de escolha de país/clube (e retorna aos slots se o usuário cancelar).
 *  2. c_TScreen_ChooseClub.m_SetUpScreen(): substitui o valor lido de bb_.g_gVersion antes de
 *     chamar bb_.g_UpdateDatabaseFolder(String), carregando os clubes/ligas do ano escolhido.
 *  3. c_TPlayer.m_Create(): substitui o valor gravado em c_TPlayer.m_gameversion pela versão do
 *     ano escolhido, persistindo a base no próprio slot sem afetar carreiras existentes.
 */
@Suppress("unused")
val retroSeasonSelectorPatch = patch(
    name = "Retro season selector",
    description = "Prompts to choose a historical club database (2011–2026) bundled in the APK whenever you start a new career. Existing careers are unaffected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    extendWith("extensions/extension.mpe")

    execute {
        verifyNewStarSoccerTarget()

        // 1. Intercepta início de nova carreira para exibir o seletor de temporada.
        val doNewCareer = PlayerDoNewCareerFingerprint.method
        doNewCareer.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->interceptNewCareer()Z
                move-result v0
                if-eqz v0, :proceed_new_career
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("proceed_new_career", doNewCareer.instructions.first()),
        )

        // 2. Em c_TScreen_ChooseClub.m_SetUpScreen(), redireciona o valor lido de bb_.g_gVersion.
        val chooseClub = ChooseClubSetupScreenFingerprint.method
        val chooseClubVersionIdx = chooseClub.instructions.indexOfFirst { inst ->
            inst.opcode == Opcode.SGET_OBJECT &&
                ((inst as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass == BB_CLASS && it.name == "g_gVersion"
                } == true
        }
        check(chooseClubVersionIdx >= 0) {
            "Retro season selector: leitura de bb_.g_gVersion não encontrada em c_TScreen_ChooseClub.m_SetUpScreen"
        }
        val chooseClubReg = (chooseClub.instructions[chooseClubVersionIdx] as OneRegisterInstruction).registerA
        check(chooseClubReg < 16) {
            "Retro season selector: registrador inesperado em c_TScreen_ChooseClub.m_SetUpScreen (v$chooseClubReg)"
        }
        chooseClub.addInstructions(
            chooseClubVersionIdx + 1,
            """
                invoke-static { v$chooseClubReg }, $EXTENSION_CLASS->resolveCareerVersion(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$chooseClubReg
            """.trimIndent(),
        )

        // 3. Em c_TPlayer.m_Create(), grava a versão da temporada escolhida em m_gameversion.
        val playerCreate = PlayerCreateFingerprint.method
        val playerCreateVersionIdx = playerCreate.instructions.indexOfFirst { inst ->
            inst.opcode == Opcode.SGET_OBJECT &&
                ((inst as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass == BB_CLASS && it.name == "g_gVersion"
                } == true
        }
        check(playerCreateVersionIdx >= 0) {
            "Retro season selector: leitura de bb_.g_gVersion não encontrada em c_TPlayer.m_Create"
        }
        val playerCreateReg = (playerCreate.instructions[playerCreateVersionIdx] as OneRegisterInstruction).registerA
        check(playerCreateReg < 16) {
            "Retro season selector: registrador inesperado em c_TPlayer.m_Create (v$playerCreateReg)"
        }
        playerCreate.addInstructions(
            playerCreateVersionIdx + 1,
            """
                invoke-static { v$playerCreateReg }, $EXTENSION_CLASS->consumeCareerVersion(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$playerCreateReg
            """.trimIndent(),
        )
    }
}
