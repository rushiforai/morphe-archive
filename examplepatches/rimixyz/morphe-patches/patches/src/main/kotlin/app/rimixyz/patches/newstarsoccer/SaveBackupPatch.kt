package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.smali.ExternalLabel
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS = "Lapp/rimixyz/extension/NewStarSoccerSaveBackupHelper;"
private const val SAVESLOT_UIS_PATH = "assets/monkey/NewGUI/Screens/saveslot.uis"
private const val SAVESLOT_UIS_ANCHOR =
    "//---------------------------------------------------Google Play Games Login Button (Android Only)--------------------------------------"

/**
 * Adiciona backup e restauração do save completo (dados globais + 3 slots de carreira)
 * diretamente na tela de Carreira (Save Slots), tanto no visual moderno quanto no clássico.
 *
 * Arquitetura confirmada no DEX (New Star Soccer 4.34 / versionCode 142):
 *  - Todo o save do jogo é uma única string texto-puro em Activity.getPreferences(0) sob a
 *    chave ".monkeystate" (fallback legado "gxtkAppState"), gravada por BBAndroidGame.SaveState.
 *  - Na barra inferior da tela de Carreira há um espaço vazio entre Tutorial e Google Play:
 *      * Visual moderno: assets/monkey/NewGUI/Screens/saveslot.uis em x=324, y=@n.
 *      * Visual clássico: c_TScreen_SaveSlot.m_CreateScreen() em x=328, y=816.
 *  - O clique chega em bb_sigui.g_HitGadget("saveslot.btn_Backup", "") e abre um AlertDialog
 *    nativo que usa o Storage Access Framework (ACTION_CREATE_DOCUMENT / ACTION_OPEN_DOCUMENT),
 *    sem exigir permissões de armazenamento no Android 6–16.
 *  - AndroidGame.onActivityResult intercepta o retorno do seletor do sistema antes dos
 *    delegates do jogo. Antes de sobrescrever o save, uma cópia de reversão é gravada em
 *    getFilesDir()/nss_pre_restore_backup.txt e o app é reiniciado de forma limpa.
 */
@Suppress("unused")
val saveBackupPatch = patch(
    name = "Save backup and restore",
    description = "Adds a Backup button to the Career screen (modern and classic UI) to export and restore your full save via the system file picker, with automatic rollback protection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    extendWith("extensions/extension.mpe")

    execute {
        verifyNewStarSoccerTarget()

        // 1. Intercepta retorno do Storage Access Framework em AndroidGame.onActivityResult.
        val onActivityResult = AndroidGameOnActivityResultFingerprint.method
        val arRegs = checkNotNull(onActivityResult.implementation) {
            "Save backup: AndroidGame.onActivityResult sem implementação"
        }.registerCount
        val thisReg = arRegs - 4
        val reqReg = arRegs - 3
        val resReg = arRegs - 2
        val dataReg = arRegs - 1
        check(thisReg >= 1 && dataReg < 16) {
            "Save backup: layout de registradores inesperado em AndroidGame.onActivityResult (regs=$arRegs)"
        }
        onActivityResult.addInstructionsWithLabels(
            0,
            """
                invoke-static { v$thisReg, v$reqReg, v$resReg, v$dataReg }, $EXTENSION_CLASS->onActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z
                move-result v0
                if-eqz v0, :continue_activity_result
                return-void
            """.trimIndent(),
            ExternalLabel("continue_activity_result", onActivityResult.instructions.first()),
        )

        // 2. Intercepta o clique de "saveslot.btn_Backup" no despachante central de gadgets.
        val hitGadget = SiGuiHitGadgetFingerprint.method
        val hgRegs = checkNotNull(hitGadget.implementation) {
            "Save backup: bb_sigui.g_HitGadget sem implementação"
        }.registerCount
        val gadgetReg = hgRegs - 2
        check(gadgetReg >= 1) {
            "Save backup: layout de registradores inesperado em bb_sigui.g_HitGadget (regs=$hgRegs)"
        }
        hitGadget.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$gadgetReg
                invoke-static { v0 }, $EXTENSION_CLASS->handleHitGadget(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :continue_hit_gadget
                return-void
            """.trimIndent(),
            ExternalLabel("continue_hit_gadget", hitGadget.instructions.first()),
        )

        // 3. Adiciona o botão "Backup" na barra inferior do visual clássico.
        val createScreen = SaveSlotCreateScreenFingerprint.method
        val lastIndex = createScreen.instructions.size - 1
        check(lastIndex >= 0 && createScreen.instructions.last().opcode == Opcode.RETURN) {
            "Save backup: instrução final inesperada em c_TScreen_SaveSlot.m_CreateScreen"
        }
        createScreen.addInstructions(
            lastIndex,
            "invoke-static { }, $EXTENSION_CLASS->addClassicSaveSlotButton()V",
        )

        // 4. Adiciona o botão "Backup" na barra inferior do visual moderno (saveslot.uis).
        val uisFile = resourceFile(SAVESLOT_UIS_PATH)
        check(uisFile.isFile) {
            "Save backup: asset '$SAVESLOT_UIS_PATH' não encontrado no APK"
        }
        val originalUis = uisFile.readText(Charsets.UTF_8)
        check(!originalUis.contains("saveslot.btn_Backup")) {
            "Save backup: '$SAVESLOT_UIS_PATH' já contém saveslot.btn_Backup"
        }
        val anchorIndex = originalUis.indexOf(SAVESLOT_UIS_ANCHOR)
        check(anchorIndex >= 0 && originalUis.indexOf(SAVESLOT_UIS_ANCHOR, anchorIndex + 1) < 0) {
            "Save backup: âncora esperada não encontrada de forma única em '$SAVESLOT_UIS_PATH'"
        }

        val nl = if (originalUis.contains("\r\n")) "\r\n" else "\n"
        val backupBlock = listOf(
            "//---------------------------------------------------BackupButton--------------------------------------",
            "",
            "PushOrigin:(324,@n)",
            "M_NavButton:(0,0,,,) ref:BackupButton",
            "{",
            "\tDraw:(IRestore,29,22,90,,,#FFFFFFFF)",
            "\tText:(Backup,0,112,146,48,C,,#FFFFFFFF)",
            "\t\tFontSize(1)",
            "\t\tFontScale(0.55,0.55)",
            "\t\tLayer(AfterGloss)",
            "}",
            "\tDelay(0.3)",
            "\tConvergeFrom(-640,0)",
            "\tClick(saveslot.btn_Backup)",
            "\t<",
            "\t\tPlaySnd(UISelect)",
            "\t>",
            "PopOrigin",
            "",
            "",
            "",
        ).joinToString(nl)

        val patchedUis = originalUis.substring(0, anchorIndex) +
            backupBlock +
            originalUis.substring(anchorIndex)
        uisFile.writeText(patchedUis, Charsets.UTF_8)

        check(uisFile.readText(Charsets.UTF_8).contains("Click(saveslot.btn_Backup)")) {
            "Save backup: falha ao confirmar gravação de '$SAVESLOT_UIS_PATH'"
        }
    }
}
