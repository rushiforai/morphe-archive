package app.wagg.patches.pinterest.trash

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val PINTEREST_COMPATIBILITY = Compatibility(
    name = "Pinterest",
    packageName = "com.pinterest",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "14.39.0"),
        AppTarget(version = "14.40.0"),
        AppTarget(version = "14.41.0"),
    ),
)

private const val EXT = "Lapp/morphe/extension/pinterest/TrashBubble;"
private const val ITEM_VIEW = "Lcom/pinterest/ui/menu/ContextMenuItemView;"
private const val PIN_SERVICE = "Lcom/pinterest/repository/pin/PinService;"

private const val PIN_OWNED_BY_VIEWER = "W5()Ljava/lang/Boolean;" // is_owned_by_viewer
private const val PIN_UID = "c()Ljava/lang/String;"               // uid
private const val FIELD_M = "m"                                   // ContextMenuItemView.m (boolean)
private const val FIELD_N = "n"                                   // ContextMenuItemView.n (boolean)
private const val FIELD_R = "r"                                   // ContextMenuItemView.r (int)
private const val METHOD_SET_ICON = "f(I)V"

private data class PinterestNames(
    val pinModel: String,      // classe Pin
    val iconEnum: String,      // enum de ícones gestalt (tem TRASH_CAN + drawableRes(Context))
    val deleteConfirm: String, // R.string.delete_confirm ("Excluir")
    val setLabel: String,      // ContextMenuItemView: setter de rótulo por resource id
)

private val NAMES_BY_BUBBLE_CLASS = mapOf(
    // 14.39.0
    "La/a;" to PinterestNames(
        pinModel = "Lcom/pinterest/api/model/oe;",
        iconEnum = "Lzx1/n0;",
        deleteConfirm = "Loi0/b;->delete_confirm:I",
        setLabel = "i(I)V",
    ),
    // 14.40.0
    "Ll60/d0;" to PinterestNames(
        pinModel = "Lcom/pinterest/api/model/pe;",
        iconEnum = "Lfy1/o0;",
        deleteConfirm = "Lri0/b;->delete_confirm:I",
        setLabel = "h(I)V",
    ),
    // 14.41.0 (a bolha agora fica numa classe do pacote kotlin.jvm.internal, efeito do R8)
    "Lkotlin/jvm/internal/r;" to PinterestNames(
        pinModel = "Lcom/pinterest/api/model/pe;",
        iconEnum = "Lyy1/n0;",
        deleteConfirm = "Ldj0/b;->delete_confirm:I",
        setLabel = "h(I)V",
    ),
)

/** Monta a bolha "compartilhar no app recente" (WhatsApp). Casa em 14.39, 14.40 e 14.41. */
private object RecentShareBubbleFingerprint : Fingerprint(
    // Sem accessFlags: o método é public static FINAL e o Morphe exige igualdade exata.
    returnType = ITEM_VIEW,
    strings = listOf("copy_link", "more_apps", "com.whatsapp", "com.kakao.talk"),
)

/** Construtor do apresentador do long-press de pin: recebe o PinService. */
private object LongPressPresenterCtorFingerprint : Fingerprint(
    custom = { method, classDef ->
        method.name == "<init>" &&
            method.parameterTypes.any { it.toString() == PIN_SERVICE } &&
            classDef.methods.any { it.returnType == ITEM_VIEW && it.name != "<init>" }
    },
)

@Suppress("unused")
val pinterestTrashBubblePatch = bytecodePatch(
    // Título e descrição visíveis ao usuário: sempre em inglês, simples e curtos.
    name = "Delete button in pin menu",
    description = "Replaces the WhatsApp button in the menu that opens when you press and hold " +
        "your saved pin with a trash button that deletes it.",
) {
    compatibleWith(PINTEREST_COMPATIBILITY)

    // OBRIGATÓRIO: leva a classe TrashBubble para o APK (use o mesmo caminho dos seus outros patches).
    extendWith("extensions/extension.mpe")

    execute {
        val bubbleMethod = RecentShareBubbleFingerprint.method
        val names = NAMES_BY_BUBBLE_CLASS[bubbleMethod.definingClass]
            ?: throw PatchException(
                "Versão do Pinterest não suportada (classe da bolha: ${bubbleMethod.definingClass}). " +
                    "Suportadas: 14.39.0, 14.40.0 e 14.41.0.",
            )

        // 1) Guardar o PinService quando o apresentador do long-press é criado.
        LongPressPresenterCtorFingerprint.method.apply {
            val idx = parameterTypes.indexOfFirst { it.toString() == PIN_SERVICE }
            val reg = "p${idx + 1}" // p0 = this
            val last = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            addInstructions(
                last,
                "invoke-static/range { $reg .. $reg }, $EXT->setPinService(Ljava/lang/Object;)V",
            )
        }

        // 2) Antes do return do item montado, trocar ícone/rótulo/clique se o pin for do usuário.
        bubbleMethod.apply {
            val retIdx = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            val view = getInstruction<OneRegisterInstruction>(retIdx).registerA
            if (view !in 3..15) throw PatchException("Registrador do item inesperado: v$view")

            // p9 = pin; p1 = Context. v0..v2 estão mortos neste ponto.
            addInstructionsWithLabels(
                retIdx,
                """
                move-object/from16 v0, p9
                instance-of v1, v0, ${names.pinModel}
                if-eqz v1, :morphe_skip
                check-cast v0, ${names.pinModel}
                invoke-virtual { v0 }, ${names.pinModel}->$PIN_OWNED_BY_VIEWER
                move-result-object v1
                if-eqz v1, :morphe_skip
                invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
                move-result v1
                if-eqz v1, :morphe_skip
                invoke-virtual { v0 }, ${names.pinModel}->$PIN_UID
                move-result-object v0

                const/4 v1, 0x0
                iput-boolean v1, v$view, $ITEM_VIEW->$FIELD_M:Z
                iput-boolean v1, v$view, $ITEM_VIEW->$FIELD_N:Z
                iput v1, v$view, $ITEM_VIEW->$FIELD_R:I

                sget-object v1, ${names.iconEnum}->TRASH_CAN:${names.iconEnum}
                move-object/from16 v2, p1
                invoke-virtual { v1, v2 }, ${names.iconEnum}->drawableRes(Landroid/content/Context;)I
                move-result v1
                invoke-virtual { v$view, v1 }, $ITEM_VIEW->$METHOD_SET_ICON
                sget v1, ${names.deleteConfirm}
                invoke-virtual { v$view, v1 }, $ITEM_VIEW->${names.setLabel}

                invoke-static { v$view, v0 }, $EXT->bind(Landroid/view/View;Ljava/lang/String;)V
                :morphe_skip
                nop
                """,
            )
        }
    }
}
