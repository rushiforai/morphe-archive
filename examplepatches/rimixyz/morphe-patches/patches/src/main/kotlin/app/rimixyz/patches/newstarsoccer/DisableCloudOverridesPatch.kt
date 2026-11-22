package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val CLOUD_CLASS = "Lcom/newstargames/newstarsoccer/c_Cloud;"

/**
 * Congela o sistema de Cloud / Remote Config / DLC do New Star Soccer 4.34 para blindar
 * todos os assets locais (como saveslot.uis, controlpanel.uih e TweakValues.txt) contra
 * sobrescritas remotas da produtora e eliminar o atraso de rede na inicialização.
 *
 * Pontos neutralizados (confirmados no DEX de New Star Soccer 4.34 / versionCode 142):
 *  1. `c_Cloud.m_Setup_Internal`: salva os parâmetros básicos (incluindo `m_cloudCallbacks`
 *     usado por `m_SetState`), zera `m_mustFinishUpdating`/`m_offlineModeActive` e transita
 *     imediatamente para `m_CLD_Disabled_FailedToGetRootConfig` (< 0), fazendo
 *     `c_TScreen_CloudSetup.m_Update` avançar no 1º frame para o menu principal sem rede.
 *  2. `c_TScreen_CloudSetup.m_MoveOnToGame`: força `m_mustFinishUpdating = false` no início
 *     para que saves antigos com flag de download interrompido nunca travem na mensagem
 *     `MSGINSTANT_SIMONREAD_MUSTFINISHDOWNLOAD`.
 *  3. `c_Cloud.m_HasGameConfigurationValue`: retorna sempre `false`, impedindo overrides
 *     de `TweakValues.txt` e strings de localização via arquivos `.cnfs`.
 *  4. `c_DLCService.m_AssetsLoad` e `c_URLCache.p_StartUpdate`: retornam imediatamente sem
 *     iniciar downloads HTTP (`c_AsyncDownload`).
 *  5. `c_PathStack.p_AddPath`: ignora entradas de `monkey://internal/assets_service`,
 *     garantindo que mesmo arquivos de DLC já em cache no aparelho nunca tenham precedência
 *     sobre os assets empacotados/patcheados do APK (`monkey://data/...`).
 */
@Suppress("unused")
val disableCloudOverridesPatch = patch(
    name = "Disable remote config and cloud overrides",
    description = "Freezes the in-game Cloud/DLC/Cohort override system so remote updates and cached DLC files can never overwrite local patched assets or TweakValues, and speeds up startup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // 1. Curto-circuita a máquina de estados de c_Cloud sem fazer rede nem ler cohorts offline.
        val setupInternal = CloudSetupInternalFingerprint.method
        val siRegs = checkNotNull(setupInternal.implementation) {
            "Disable cloud overrides: c_Cloud.m_Setup_Internal sem implementação"
        }.registerCount
        val localSrvReg = siRegs - 3
        val assetsReg = siRegs - 2
        val callbacksReg = siRegs - 1
        check(localSrvReg >= 0 && callbacksReg < 16) {
            "Disable cloud overrides: layout inesperado em c_Cloud.m_Setup_Internal (regs=$siRegs)"
        }
        setupInternal.addInstructions(
            0,
            """
                sput-object v$localSrvReg, $CLOUD_CLASS->m_localServerPath:Ljava/lang/String;
                sput-object v$assetsReg, $CLOUD_CLASS->m_assetsPath:Ljava/lang/String;
                sput-object v$callbacksReg, $CLOUD_CLASS->m_cloudCallbacks:Lcom/newstargames/newstarsoccer/c_CloudCallbacks;
                const/4 v0, 0x0
                sput-boolean v0, $CLOUD_CLASS->m_mustFinishUpdating:Z
                sput-boolean v0, $CLOUD_CLASS->m_offlineModeActive:Z
                sget v0, $CLOUD_CLASS->m_CLD_Disabled_FailedToGetRootConfig:I
                invoke-static { v0 }, $CLOUD_CLASS->m_SetState(I)V
                return-void
            """.trimIndent(),
        )

        // 2. Evita que saves com m_mustFinishUpdating=true fiquem presos na tela de erro de download.
        CloudSetupMoveOnToGameFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                sput-boolean v0, $CLOUD_CLASS->m_mustFinishUpdating:Z
            """.trimIndent(),
        )

        // 3. Bloqueia leitura de overrides remotos (.cnfs) de TweakValues e localização.
        CloudHasGameConfigValueFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // 4. Bloqueia qualquer disparo de download de assets/catálogos DLC.
        DlcServiceAssetsLoadFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
        UrlCacheStartUpdateFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // 5. Impede que arquivos DLC já gravados em getFilesDir()/assets_service/ sobrescrevam o APK.
        val addPath = PathStackAddPathFingerprint.method
        val apRegs = checkNotNull(addPath.implementation) {
            "Disable cloud overrides: c_PathStack.p_AddPath sem implementação"
        }.registerCount
        val pathReg = apRegs - 1
        check(pathReg in 1..15) {
            "Disable cloud overrides: layout inesperado em c_PathStack.p_AddPath (regs=$apRegs)"
        }
        addPath.addInstructionsWithLabels(
            0,
            """
                if-eqz v$pathReg, :allow_path
                const-string v0, "monkey://internal/assets_service"
                invoke-virtual { v$pathReg, v0 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :allow_path
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
            ExternalLabel("allow_path", addPath.instructions.first()),
        )
    }
}
