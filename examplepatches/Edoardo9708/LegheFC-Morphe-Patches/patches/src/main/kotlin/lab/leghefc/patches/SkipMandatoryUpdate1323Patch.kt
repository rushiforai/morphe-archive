package lab.leghefc.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * LAB: Leghe FC 13.2.3, APK originale XAPK fornito dall'utente.
 *
 * L'evento mandatoryUpdate e' il risultato di un controllo fra versionCode
 * locale e soglia remota. Per la sola 13.2.3 il collector sintetico Lui.emit
 * contiene un ramo distinto che emette Boolean.TRUE (versione obsoleta)
 * oppure Boolean.FALSE (versione accettata).
 *
 * Sostituisce solo il caricamento del singleton TRUE con FALSE.
 * Lascia invariati confronto, eventi, dialoghi, metadata e richieste HTTP.
 * E' un test locale: la compatibilita' con API/server NON e' garantita.
 */
@Suppress("unused")
val skipMandatoryUpdate1323Patch = bytecodePatch(
    name = "Leghe FC - Ignora aggiornamento obbligatorio [LAB 13.2.3]",
    description = "LAB: neutralizza l'esito locale del confronto di versione; non modifica API o versionCode.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Leghe FC",
            packageName = "it.quadronica.leghe",
            targets = listOf(AppTarget(version = "13.2.3"))
        )
    )

    execute {
        // Classe specifica della build analizzata. Qualsiasi cambiamento
        // di offuscamento fa fallire il fingerprint invece di patchare a caso.
        val method = Fingerprint(
            definingClass = "Lui;",
            name = "emit",
            parameters = listOf(
                "Ljava/lang/Object;",
                "Lkotlin/coroutines/Continuation;"
            ),
            returnType = "Ljava/lang/Object;"
        ).method

        val instructions = method.implementation?.instructions?.toList()
            ?: error("Leghe FC 13.2.3: Lui.emit senza implementation")

        fun booleanSingleton(index: Int, field: String): Boolean {
            val inst = instructions.getOrNull(index) ?: return false
            if (inst.opcode != Opcode.SGET_OBJECT) return false
            val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
                ?: return false
            return ref.definingClass == "Ljava/lang/Boolean;" &&
                ref.type == "Ljava/lang/Boolean;" && ref.name == field
        }

        fun methodRef(index: Int): MethodReference? =
            (instructions.getOrNull(index) as? ReferenceInstruction)?.reference as? MethodReference

        fun isFlowEmit(index: Int): Boolean {
            val inst = instructions.getOrNull(index) ?: return false
            if (inst.opcode != Opcode.INVOKE_INTERFACE &&
                inst.opcode != Opcode.INVOKE_INTERFACE_RANGE) return false
            val ref = methodRef(index) ?: return false
            return ref.name == "emit" &&
                ref.parameterTypes.map { it.toString() } == listOf(
                    "Ljava/lang/Object;", "Lkotlin/coroutines/Continuation;"
                ) && ref.returnType.toString() == "Ljava/lang/Object;"
        }

        val positiveCandidates = instructions.indices.filter { booleanSingleton(it, "TRUE") }
        require(positiveCandidates.size == 1) {
            "Atteso un unico Boolean.TRUE in Lui.emit, trovati ${positiveCandidates.size}"
        }
        val index = positiveCandidates.single()

        // Dalla 13.2.3 originale: getLongVersionCode(Context), lettura soglia,
        // CMP_LONG, IF_GEZ, Boolean.TRUE e FlowCollector.emit.
        require(index >= 8) { "Ramo versione troppo corto" }
        val expected = listOf(
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_WIDE, Opcode.IGET_OBJECT,
            Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_WIDE,
            Opcode.CMP_LONG, Opcode.IF_GEZ
        )
        require(instructions.subList(index - 8, index).map { it.opcode } == expected) {
            "Non riconosciuto il confronto versione locale/remota nella 13.2.3"
        }
        val localVersion = methodRef(index - 8)
        require(localVersion != null &&
            localVersion.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;") &&
            localVersion.returnType.toString() == "J") {
            "Il confronto non legge il versionCode locale come Long"
        }
        val remoteThreshold = methodRef(index - 4)
        require(remoteThreshold != null &&
            remoteThreshold.parameterTypes.size == 2 &&
            remoteThreshold.parameterTypes[0].toString() == "Ljava/util/Map;" &&
            remoteThreshold.returnType.toString() == "J") {
            "Il confronto non legge la soglia remota attesa"
        }
        require(isFlowEmit(index + 1)) {
            "Boolean.TRUE non e' seguito da FlowCollector.emit"
        }

        // Il ramo opposto deve gia' emettere FALSE con lo stesso registro.
        val falseCandidates = (index + 2 until minOf(index + 10, instructions.size))
            .filter { booleanSingleton(it, "FALSE") && isFlowEmit(it + 1) }
        require(falseCandidates.size == 1) {
            "Il ramo alternativo Boolean.FALSE non e' univoco"
        }
        val trueRegister = (instructions[index] as? OneRegisterInstruction)?.registerA
            ?: error("SGET_OBJECT TRUE senza registro destinazione")
        val falseRegister = (instructions[falseCandidates.single()] as? OneRegisterInstruction)?.registerA
            ?: error("SGET_OBJECT FALSE senza registro destinazione")
        require(trueRegister == falseRegister) {
            "I due rami emettono valori da registri diversi"
        }

        // I due SGET_OBJECT hanno la stessa lunghezza (format 21c).
        // Si conserva il salto e il normale completamento del coroutine collector.
        method.replaceInstruction(
            index,
            "sget-object v$trueRegister, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
        )
    }
}
