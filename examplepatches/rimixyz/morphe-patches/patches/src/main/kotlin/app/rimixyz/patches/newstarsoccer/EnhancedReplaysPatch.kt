package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val REPLAY_EXTENSION_CLASS = "Lapp/rimixyz/extension/NewStarSoccerReplayHelper;"
private const val CONTROL_PANEL_UIH_PATH = "assets/monkey/NewGUI/Screens/controlpanel.uih"
private const val QUIT_BUTTON_ANCHOR = "PushOrigin:(@R-110,@T+5)"
private const val SLOMO_VIS_EXPR = "set(gel.vis,twk(WatchReplay,Speed) < 1)"

/**
 * Replays aprimorados + exportação nativa de replays para vídeo MP4 (H.264) e GIF animado.
 *
 * Recursos incluídos:
 *  - Botão nativo "Replay Studio" ao lado do botão X na tela de replay (`controlpanel.uih`).
 *  - Exportação limpa (sem HUD nem botões) do replay quadro a quadro via OpenGL ES (`glReadPixels`):
 *      * MP4 H.264 (Normal 30 FPS, Alta fluidez 60 FPS e Câmera Lenta real 0.5x) via MediaCodec + MediaMuxer.
 *      * GIF animado (loop infinito Netscape 2.0, paleta Median Cut 256 cores) em Java puro.
 *      * Salvamento direto na Galeria (MediaStore no Android 10+) + Compartilhar, ou seletor SAF
 *        (ACTION_CREATE_DOCUMENT) no Android 6–16 sem exigir permissões de armazenamento.
 *  - Velocidade de reprodução persistente (0.25x, 0.5x, 0.75x, 1.0x, 1.5x, 2.0x).
 *  - Alternância de loop automático, ocultação dos efeitos visuais de câmera lenta (`ReplayScan`)
 *    e opção para liberar replay em todos os lances da partida (não apenas gols).
 */
@Suppress("unused")
val enhancedReplaysPatch = patch(
    name = "Enhanced replays and MP4/GIF export",
    description = "Adds a Replay Studio button during goal replays to customize playback speed, loop, slow-mo overlays, all-chance replays, and export clean HUD-free MP4 videos or animated GIFs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    extendWith("extensions/extension.mpe")

    execute {
        verifyNewStarSoccerTarget()

        // 1. Intercepta retorno do SAF (ACTION_CREATE_DOCUMENT) em AndroidGame.onActivityResult.
        val onActivityResult = AndroidGameOnActivityResultFingerprint.method
        val arRegs = checkNotNull(onActivityResult.implementation) {
            "Enhanced replays: AndroidGame.onActivityResult sem implementação"
        }.registerCount
        val thisReg = arRegs - 4
        val reqReg = arRegs - 3
        val resReg = arRegs - 2
        val dataReg = arRegs - 1
        check(thisReg >= 1 && dataReg < 16) {
            "Enhanced replays: layout inesperado em AndroidGame.onActivityResult (regs=$arRegs)"
        }
        onActivityResult.addInstructionsWithLabels(
            0,
            """
                invoke-static { v$thisReg, v$reqReg, v$resReg, v$dataReg }, $REPLAY_EXTENSION_CLASS->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
                move-result v0
                if-eqz v0, :continue_replay_activity_result
                return-void
            """.trimIndent(),
            ExternalLabel("continue_replay_activity_result", onActivityResult.instructions.first()),
        )

        // 2. Intercepta cliques do botão Replay Studio (e cancelamento limpo ao clicar em Sair).
        val hitGadget = SiGuiHitGadgetFingerprint.method
        val hgRegs = checkNotNull(hitGadget.implementation) {
            "Enhanced replays: bb_sigui.g_HitGadget sem implementação"
        }.registerCount
        val gadgetReg = hgRegs - 2
        check(gadgetReg >= 1) {
            "Enhanced replays: layout inesperado em bb_sigui.g_HitGadget (regs=$hgRegs)"
        }
        hitGadget.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$gadgetReg
                invoke-static { v0 }, $REPLAY_EXTENSION_CLASS->handleHitGadget(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :continue_replay_hit_gadget
                return-void
            """.trimIndent(),
            ExternalLabel("continue_replay_hit_gadget", hitGadget.instructions.first()),
        )

        // 3. Aplica preferências de velocidade, loop e efeitos ao iniciar o replay,
        //    logo antes da checagem de onboarding ("Player" / "ReplayActive") para respeitá-la.
        val startReplay = MatchStartReplayFingerprint.method
        val startInsts = startReplay.instructions
        val playerConstIdx = startInsts.indexOfFirst { ins ->
            ins.opcode == Opcode.CONST_STRING &&
                ((ins as? ReferenceInstruction)?.reference as? StringReference)?.string == "Player"
        }
        check(playerConstIdx > 0) {
            "Enhanced replays: ponto de inserção 'Player' não encontrado em c_TMatch.m_StartReplay"
        }
        startReplay.addInstructions(
            playerConstIdx,
            "invoke-static { }, $REPLAY_EXTENSION_CLASS->onReplayStarted()V",
        )

        // 4. Sincroniza quadros determinísticos durante exportação (e loop) em c_TMatch.m_UpdateReplay.
        MatchUpdateReplayFingerprint.method.addInstructions(
            0,
            "invoke-static { }, $REPLAY_EXTENSION_CLASS->beforeUpdateReplay()V",
        )

        // 5. Permite habilitar o botão de replay em todos os lances gravados (opcional no Replay Studio).
        MatchChanceShowWatchReplayFingerprint.method.addInstructions(
            0,
            "invoke-static { }, $REPLAY_EXTENSION_CLASS->beforeShowWatchReplay()V",
        )

        // 6. Garante cancelamento/limpeza ao sair do replay (botão X ou botão Voltar).
        MatchEndReplayButtonFingerprint.method.addInstructions(
            0,
            "invoke-static { }, $REPLAY_EXTENSION_CLASS->onReplayEnded()V",
        )

        // 7. Captura o frame OpenGL recém-renderizado em BBAndroidGame.onDrawFrame logo após RenderGame().
        val onDrawFrame = BBAndroidGameOnDrawFrameFingerprint.method
        val dfRegs = checkNotNull(onDrawFrame.implementation) {
            "Enhanced replays: BBAndroidGame.onDrawFrame sem implementação"
        }.registerCount
        val dfThisReg = dfRegs - 2
        check(dfThisReg in 0..15) {
            "Enhanced replays: layout inesperado em BBAndroidGame.onDrawFrame (regs=$dfRegs)"
        }
        val dfInsts = onDrawFrame.instructions
        val dfLastIdx = dfInsts.size - 1
        check(dfLastIdx >= 1 && dfInsts[dfLastIdx].opcode == Opcode.RETURN_VOID) {
            "Enhanced replays: instrução final inesperada em BBAndroidGame.onDrawFrame"
        }
        val prevCall = (dfInsts[dfLastIdx - 1] as? ReferenceInstruction)?.reference as? MethodReference
        check(prevCall?.name == "RenderGame") {
            "Enhanced replays: chamada RenderGame() esperada antes do return em BBAndroidGame.onDrawFrame"
        }
        onDrawFrame.addInstructions(
            dfLastIdx,
            "invoke-static { v$dfThisReg }, $REPLAY_EXTENSION_CLASS->afterDrawFrame(Ljava/lang/Object;)V",
        )

        // 8. Atualiza controlpanel.uih:
        //    (a) condiciona overlays de SloMoFX a WatchReplay.ReplayScan (padrão 0 = tela limpa)
        //    (b) adiciona o botão redondo "Replay Studio" à esquerda do botão Sair no topo direito.
        val uihFile = resourceFile(CONTROL_PANEL_UIH_PATH)
        check(uihFile.isFile) {
            "Enhanced replays: asset '$CONTROL_PANEL_UIH_PATH' não encontrado no APK"
        }
        val originalUih = uihFile.readText(Charsets.UTF_8)
        check(!originalUih.contains("watchreplay.studio")) {
            "Enhanced replays: '$CONTROL_PANEL_UIH_PATH' já contém watchreplay.studio"
        }

        val nl = if (originalUih.contains("\r\n")) "\r\n" else "\n"
        val slomoReplacement = listOf(
            "set(gel.vis,0)",
            "\tif(twk(WatchReplay,ReplayScan)>0)",
            "\t<",
            "\t\tif(twk(WatchReplay,Speed)<1)",
            "\t\t<",
            "\t\t\tset(gel.vis,1)",
            "\t\t>",
            "\t>",
        ).joinToString(nl)

        val slomoOccurrences = originalUih.split(SLOMO_VIS_EXPR).size - 1
        check(slomoOccurrences == 2) {
            "Enhanced replays: esperado 2 ocorrências de '$SLOMO_VIS_EXPR' em '$CONTROL_PANEL_UIH_PATH', encontrado $slomoOccurrences"
        }
        val withCleanSlomo = originalUih.replace(SLOMO_VIS_EXPR, slomoReplacement)

        val quitAnchorIdx = withCleanSlomo.indexOf(QUIT_BUTTON_ANCHOR)
        check(quitAnchorIdx >= 0 && withCleanSlomo.indexOf(QUIT_BUTTON_ANCHOR, quitAnchorIdx + 1) < 0) {
            "Enhanced replays: âncora '$QUIT_BUTTON_ANCHOR' não encontrada de forma única em '$CONTROL_PANEL_UIH_PATH'"
        }

        val studioButtonBlock = listOf(
            "PushOrigin:(@R-204,@T+5)",
            "Rect:(10,10,0,0)",
            "{{",
            "    //ReplayStudioButton",
            "    Rect:(0,0,76,76) ref:StudioButton",
            "    {",
            "\t    Draw:(GreenRoundButton,8,8,,,,#00000060)",
            "\t    Draw:(GreenRoundButton,0,0)",
            "    }",
            "         M_Pressable:()",
            "    {",
            "         Draw:(IReplay,13,13,50,50)",
            "    }",
            "        Click(watchreplay.studio)",
            "        <",
            "            PlaySnd(UISelect)",
            "        >",
            "}}",
            "PopOrigin",
            "",
            "",
        ).joinToString(nl)

        val patchedUih = withCleanSlomo.substring(0, quitAnchorIdx) +
            studioButtonBlock +
            withCleanSlomo.substring(quitAnchorIdx)
        uihFile.writeText(patchedUih, Charsets.UTF_8)

        val verifyUih = uihFile.readText(Charsets.UTF_8)
        check(
            verifyUih.contains("Click(watchreplay.studio)") &&
                verifyUih.contains("twk(WatchReplay,ReplayScan)>0"),
        ) {
            "Enhanced replays: falha ao confirmar gravação de '$CONTROL_PANEL_UIH_PATH'"
        }
    }
}
