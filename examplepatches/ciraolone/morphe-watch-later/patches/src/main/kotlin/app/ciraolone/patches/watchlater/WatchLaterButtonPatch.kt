/*
 * La patch vera e propria: aggiunge una voce "Later" alla barra di navigazione di YouTube.
 * Lavora in tre iniezioni. (1) Intercetta la costruzione di ogni voce della barra e, riconosciuta
 * quella Home, chiede all'estensione una copia modificata (icona, etichetta, identificatore proprio),
 * la ricostruisce come oggetto YouTube e la mette da parte. (2) Intercetta il montaggio della lista
 * delle voci e ci infila la nostra, prima del profilo. (3) Intercetta la creazione della VISTA di ogni
 * tab: a vista pronta l'estensione riconosce la nostra dall'etichetta "Later" e le attacca il click
 * (apre la playlist Guarda piu' tardi) e la nostra icona-orologio — perche' i tab della barra non
 * navigano leggendo un campo "destinazione", il comportamento va agganciato alla vista.
 * Il disegno dell'orologio viene copiato nell'app come risorsa drawable.
 * Il blocco smali e la gestione dei registri della prima iniezione sono ricopiati da NavigationBarPatch
 * di morphe-patches: l'ordine e il backup del registro non sono arbitrari, non riordinarli.
 */

package app.ciraolone.patches.watchlater

import app.ciraolone.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.copyResources
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS =
    "Lapp/ciraolone/extension/watchlater/WatchLaterButtonPatch;"

@Suppress("unused")
val watchLaterButtonPatch = bytecodePatch(
    name = "Watch later button",
    description = "Aggiunge un pulsante 'Later' alla barra di navigazione in basso, "
            + "che apre la playlist Guarda piu tardi.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        protoLibraryFixPatch,
        resourcePatch {
            execute {
                copyResources(
                    "watchlaterbutton",
                    ResourceGroup("drawable", "morphe_watch_later.xml")
                )
            }
        }
    )

    extendWith("extensions/extension.mpe")

    execute {
        PivotBarRendererFingerprint.let {
            it.method.apply {
                val pivotBarItemRendererType =
                    it.instructionMatches[2].instruction.getReference<TypeReference>()!!.type
                val pivotBarRendererConstructorIndex = it.instructionMatches[3].index
                val pivotBarRendererConstructorReference =
                    getInstruction<ReferenceInstruction>(pivotBarRendererConstructorIndex).reference as MethodReference
                val pivotBarRendererConstructorInstruction =
                    getInstruction<RegisterRangeInstruction>(pivotBarRendererConstructorIndex)
                val pivotBarRendererConstructorStartRegister =
                    pivotBarRendererConstructorInstruction.startRegister
                val pivotBarRendererConstructorEndRegister =
                    pivotBarRendererConstructorStartRegister + pivotBarRendererConstructorInstruction.registerCount - 1
                val messageLiteIndex = pivotBarRendererConstructorReference.parameterTypes
                    .indexOfFirst { parameterType -> parameterType == "Lcom/google/protobuf/MessageLite;" }
                val messageLiteRegister =
                    pivotBarRendererConstructorStartRegister + messageLiteIndex + 1
                val insertIndex = it.instructionMatches.last().index
                val backupRegister = getFreeRegisterProvider(insertIndex, 1).getFreeRegister()
                val parseByteArrayMethod = parseByteArrayMethodRef.get()!!

                addInstructionsAtControlFlowLabel(
                    insertIndex,
                    """
                        # Backup original MessageLite register using /16 to avoid 4-bit register limits
                        move-object/16 v$backupRegister, v$messageLiteRegister

                        invoke-static { v$messageLiteRegister }, $EXTENSION_CLASS->parsePivotBarItemRenderer(Lcom/google/protobuf/MessageLite;)[B
                        move-result-object v$pivotBarRendererConstructorStartRegister
                        if-eqz v$pivotBarRendererConstructorStartRegister, :ignore_watch_later

                        sget-object v$messageLiteRegister, $pivotBarItemRendererType->a:$pivotBarItemRendererType
                        invoke-static { v$messageLiteRegister, v$pivotBarRendererConstructorStartRegister }, $parseByteArrayMethod
                        move-result-object v$messageLiteRegister
                        check-cast v$messageLiteRegister, $pivotBarItemRendererType

                        new-instance v$pivotBarRendererConstructorStartRegister, ${pivotBarRendererConstructorReference.definingClass}
                        invoke-direct/range { v$pivotBarRendererConstructorStartRegister .. v$pivotBarRendererConstructorEndRegister }, $pivotBarRendererConstructorReference

                        invoke-static { v$pivotBarRendererConstructorStartRegister }, $EXTENSION_CLASS->setPivotBarRenderer(Ljava/lang/Object;)V
                        :ignore_watch_later

                        # Restore MessageLite register
                        move-object/16 v$messageLiteRegister, v$backupRegister
                        nop
                        """
                )
            }
        }

        PivotBarRendererListFingerprint.let {
            it.method.apply {
                val insertMatch = it.instructionMatches[2]
                val insertIndex = insertMatch.index
                val insertRegister =
                    getInstruction<TwoRegisterInstruction>(insertIndex).registerA

                val protoListBuilderMethod = Fingerprint(
                    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
                    returnType = insertMatch.instruction.getReference<FieldReference>()!!.type,
                    parameters = listOf("Ljava/util/Collection;")
                ).method

                addInstructions(
                    insertIndex,
                    """
                        # If a renderer was copied to the extension, it is added to the list.
                        invoke-static { v$insertRegister }, $EXTENSION_CLASS->getPivotBarRendererList(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$insertRegister

                        # Convert to proto list.
                        invoke-static { v$insertRegister }, $protoListBuilderMethod
                        move-result-object v$insertRegister
                    """
                )
            }
        }

        // A ogni vista di tab appena creata passiamo la View all'estensione, che riconosce la nostra
        // e le applica click e icona. Iniettiamo prima di ogni return-object (la View restituita).
        PivotBarButtonsCreateDrawableViewFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val viewRegister = getInstruction<OneRegisterInstruction>(index).registerA
                addInstruction(
                    index,
                    "invoke-static { v$viewRegister }, $EXTENSION_CLASS->onPivotViewCreated(Landroid/view/View;)V"
                )
            }
        }
    }
}
