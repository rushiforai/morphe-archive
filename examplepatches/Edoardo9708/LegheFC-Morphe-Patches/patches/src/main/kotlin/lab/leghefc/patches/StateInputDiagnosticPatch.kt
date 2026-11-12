package lab.leghefc.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Leghe FC 13.2.3.
 *
 * Candidato strutturale verificato staticamente:
 * - Npcz.invokeSuspend(Object): 8 registri, 2 registri parametro, 70 unita' DEX
 * - costruisce sVY(List, boolean, Set, String)
 * - sVY contiene il modello della lista; QtY e' il tipo degli elementi.
 *
 * Questa patch e' diagnostica: registra gli input originali, poi sostituisce
 * intenzionalmente la List passata a sVY con una List dimostrativa contenente
 * un QtY sintetico. Non sblocca dati reali e non va usata come patch funzionale.
 */
@Suppress("unused")
val stateInputDiagnosticPatch = bytecodePatch(
    name = "Leghe FC - Sblocca formazione suggerita e comparatore",
    description = "Diagnostica formazione suggerita e confronto fra giocatori (dati dimostrativi).",
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
        val method = Fingerprint(
            definingClass = "LNpcz;",
            name = "invokeSuspend",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;"
        ).method

        val implementation = method.implementation
            ?: error("Npcz.invokeSuspend non ha istruzioni")
        require(implementation.registerCount == 8) {
            "Layout registri Npcz.invokeSuspend diverso da quello atteso"
        }

        val constructorDescriptor = "(Ljava/util/List;ZLjava/util/Set;Ljava/lang/String;)V"
        val constructorCalls = implementation.instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                ref?.name == "<init>"
        }

        require(constructorCalls.size == 1) {
            "Attesa una sola chiamata a costruttore in Npcz.invokeSuspend, trovate ${constructorCalls.size}"
        }

        val (beforeConstructor, constructorInstruction) = constructorCalls.single()
        val constructorReference = (constructorInstruction as ReferenceInstruction).reference as MethodReference
        val actualConstructorDescriptor = constructorReference.parameterTypes
            .joinToString(separator = "", prefix = "(", postfix = ")") + constructorReference.returnType
        require(actualConstructorDescriptor == constructorDescriptor) {
            "Firma del costruttore nello stato Npcz diversa: $actualConstructorDescriptor"
        }

        // Il nome offuscato dello stato può cambiare. Dal suo toString ricaviamo
        // il tipo reale degli elementi tramite il CHECK_CAST della prima voce.
        val stateClass = mutableClassDefBy(constructorReference.definingClass)
        val stateToString = stateClass.methods.singleOrNull {
            it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        } ?: error("Impossibile individuare toString() nella classe di stato")
        val elementCasts = stateToString.implementation?.instructions.orEmpty().mapNotNull { instruction ->
            if (instruction.opcode != Opcode.CHECK_CAST) return@mapNotNull null
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
        }
        val elementConstructorDescriptor = "(JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;)V"
        val elementClassCandidates = elementCasts.distinct().filter { descriptor ->
            runCatching {
                mutableClassDefBy(descriptor).methods.any { method ->
                    method.name == "<init>" &&
                        (method.parameterTypes.joinToString(separator = "", prefix = "(", postfix = ")") + method.returnType) ==
                            elementConstructorDescriptor
                }
            }.getOrDefault(false)
        }
        require(elementClassCandidates.size == 1) {
            "Attesa una classe CHECK_CAST con il costruttore dell'elemento, trovate ${elementClassCandidates.size}"
        }
        val elementClassDescriptor = elementClassCandidates.single()

        val argumentRegisters = when (constructorInstruction) {
            is FiveRegisterInstruction -> listOf(
                constructorInstruction.registerC,
                constructorInstruction.registerD,
                constructorInstruction.registerE,
                constructorInstruction.registerF,
                constructorInstruction.registerG
            )
            is RegisterRangeInstruction -> {
                require(constructorInstruction.registerCount == 5) {
                    "Numero di registri della chiamata a sVY.<init> non supportato"
                }
                (constructorInstruction.startRegister until
                    constructorInstruction.startRegister + constructorInstruction.registerCount).toList()
            }
            else -> error("Formato invoke-direct a sVY.<init> non supportato")
        }

        val (stateRegister, listRegister, booleanRegister, setRegister, stringRegister) = argumentRegisters
        require(listOf(stateRegister, listRegister, booleanRegister, setRegister, stringRegister).all { it in 0..7 }) {
            "Registri della chiamata a sVY fuori dal layout verificato"
        }

        val targetClassDescriptor = method.definingClass
        val targetClass = mutableClassDefBy(targetClassDescriptor)
        val demoMethodName = "patch_logQtYDemo"
        require(targetClass.methods.none { it.name == demoMethodName || it.name == "patch_logInputs" }) {
            "I metodi diagnostici Leghe FC esistono gia'"
        }

        // La diagnostica è in un helper separato, quindi non altera i registri
        // che contengono gli argomenti originali del costruttore.
        method.addInstructions(
            beforeConstructor,
            """
                invoke-static {v$listRegister, v$setRegister}, $targetClassDescriptor->patch_logInputs(Ljava/util/List;Ljava/util/Set;)V
                invoke-static {}, $targetClassDescriptor->patch_logQtYDemo()Ljava/util/List;
                move-result-object v$listRegister
            """.trimIndent()
        )

        targetClass.methods.add(
            ImmutableMethod(
                targetClassDescriptor,
                "patch_logInputs",
                listOf(
                    ImmutableMethodParameter("Ljava/util/List;", null, null),
                    ImmutableMethodParameter("Ljava/util/Set;", null, null)
                ),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                // 2 parametri statici: con 11 registri p0/p1 sono v9/v10;
                // v8 resta locale e non sovrascrive il Set ricevuto in p1.
                MutableMethodImplementation(11)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        const-string v8, "LegheFC-Npcz"

                        invoke-interface {p0}, Ljava/util/List;->size()I
                        move-result v0
                        invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "INPUT A.size = "
                        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1
                        invoke-static {v8, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "INPUT A = "
                        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1
                        invoke-static {v8, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        invoke-interface {p1}, Ljava/util/Set;->size()I
                        move-result v0
                        invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "INPUT C.size = "
                        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1
                        invoke-static {v8, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "INPUT C = "
                        invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1
                        invoke-static {v8, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                        return-void
                    """.trimIndent()
                )
            }
        )

        targetClass.methods.add(
            ImmutableMethod(
                targetClassDescriptor,
                demoMethodName,
                emptyList(),
                "Ljava/util/List;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(11)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        new-instance v0, Ljava/util/ArrayList;
                        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

                        new-instance v1, $elementClassDescriptor
                        const-wide/16 v2, 0x1
                        const-string v4, "a"
                        const-string v5, "b"
                        const-wide/16 v6, 0x2
                        const-string v8, "c"
                        invoke-direct/range {v1 .. v8}, $elementClassDescriptor-><init>(JLjava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
                        invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

                        const-string v9, "LegheFC-Npcz"
                        invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
                        move-result v3
                        invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v3
                        const-string v4, "DEMO QtY: lista.size = "
                        invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v4
                        invoke-static {v9, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        const/4 v3, 0x0
                        invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                        move-result-object v3
                        invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                        move-result-object v4
                        const-string v5, "DEMO elemento = "
                        invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v5
                        invoke-static {v9, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        return-object v0
                    """.trimIndent()
                )
            }
        )

        // Explicit sanity references keep the expected argument roles visible
        // in source review and catch accidental register-map edits.
        require(booleanRegister in 0..7 && stringRegister in 0..7 && stateRegister in 0..7)
    }
}
