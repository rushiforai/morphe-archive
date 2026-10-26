package lab.outdooractive.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Test sperimentale per Outdooractive 3.23.20.
 * Registra i valori originali ma modifica i valori restituiti dai getter.
 *
 * Getter verificati su classes4.dex:
 * isProUser():Z -> iget-boolean v0,p0; return v0
 * getLevel():I  -> iget v0,p0; return v0
 */
@Suppress("unused")
val membershipDiagnosticPatch = bytecodePatch(
    name = "Outdooractive - Test getter abbonamento",
    description = "Unlock Pro",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Outdooractive",
            packageName = "com.outdooractive.Outdooractive",
            targets = listOf(AppTarget(version = "3.23.20"))
        )
    )

    execute {
        val target = "Lcom/outdooractive/sdk/objects/ooi/Membership;"
        val targetClass = mutableClassDefBy(target)
        // Registro dei soli controlli nuovi: metodo + valore + chiamante.
        // La mappa è condivisa dai due logger, ma NON modifica i campi Membership.
        val seenField = "morpheDiagSeen"
        val seenType = "Ljava/util/concurrent/ConcurrentHashMap;"
        require(targetClass.staticFields.none { it.name == seenField }) {
            "Campo diagnostico già presente"
        }
        targetClass.staticFields.add(
            ImmutableField(
                target,
                seenField,
                seenType,
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                null
            ).toMutable()
        )

        fun instrumentGetter(
            name: String,
            opcode: Opcode,
            type: String,
            fieldName: String,
            helper: String,
            example: Int
        ) {
            val method = Fingerprint(definingClass = target, name = name).method
            val body = method.implementation ?: error("$name: missing bytecode")
            val instructions = body.instructions.toList()
            val fieldRead = instructions.firstOrNull() as? TwoRegisterInstruction
            val reference = (instructions.firstOrNull() as? ReferenceInstruction)?.reference as? FieldReference
            val returning = instructions.getOrNull(1) as? OneRegisterInstruction

            // Nella versione analizzata v0 e p0 sono lo stesso registro.
            // Ricreiamo il getter con tre registri:
            // v0 = valore originale, v1 = prova libera, p0 = this (alias v2).
            require(
                body.registerCount == 1 &&
                instructions.size == 2 &&
                method.parameterTypes.isEmpty() &&
                instructions[0].opcode == opcode &&
                fieldRead?.registerA == 0 && fieldRead.registerB == 0 &&
                reference?.definingClass == target &&
                reference.name == fieldName && reference.type == type &&
                instructions[1].opcode == Opcode.RETURN &&
                returning?.registerA == 0 &&
                method.returnType == type
            ) {
                "$name: unexpected getter bytecode"
            }
            require(targetClass.methods.none { it.name == helper }) {
                "$name: diagnostic helper already exists"
            }

            // Il registerCount dell'implementazione esistente è immutabile.
            // Copiamo firma, flag e annotazioni, creando i tre registri.
            val modified = ImmutableMethod(
                target,
                name,
                method.parameters,
                method.returnType,
                method.accessFlags,
                method.annotations,
                method.hiddenApiRestrictions,
                MutableMethodImplementation(3)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                    iget${if (type == "Z") "-boolean" else ""} v0, p0, $target->$fieldName:$type
                    invoke-static {v0}, $target->$helper($type)V

                    # Registro libero per un valore dimostrativo.
                    const/4 v1, 0x${example.toString(16)}
                    #return v0
                    return v1
                    """.trimIndent()
                )
            }

            require(targetClass.methods.remove(method)) {
                "$name: original getter not present in target class"
            }
            require(targetClass.methods.add(modified)) {
                "$name: failed to register patched getter"
            }
        }

        fun addLogger(helper: String, type: String, label: String) {
            // Sei registri locali (v0-v5) e un parametro (p0).
            // La prima chiamata crea il registro; eventuali gare tra thread
            // possono produrre al massimo qualche log doppio iniziale.
            targetClass.methods.add(
                ImmutableMethod(
                    target,
                    helper,
                    listOf(ImmutableMethodParameter(type, null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(7)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                        # Inizializzazione pigra del registro dei chiamanti.
                        sget-object v0, $target->$seenField:$seenType
                        if-nez v0, :map_ready
                        new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;
                        invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V
                        sput-object v0, $target->$seenField:$seenType
                        :map_ready

                        # Solo il chiamante diretto (indice 2), non tutto lo stack.
                        new-instance v1, Ljava/lang/Throwable;
                        invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V
                        invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
                        move-result-object v1
                        array-length v3, v1
                        const/4 v4, 0x2
                        if-le v3, v4, :no_caller
                        aget-object v1, v1, v4
                        invoke-virtual {v1}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;
                        move-result-object v1
                        goto :caller_ready
                        :no_caller
                        const-string v1, "unknown"
                        :caller_ready

                        new-instance v2, Ljava/lang/StringBuilder;
                        invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
                        const-string v3, "$label"
                        invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                        invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append($type)Ljava/lang/StringBuilder;
                        const-string v3, " | caller: "
                        invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                        invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                        invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                        move-result-object v2

                        # Scrive soltanto se la combinazione non è stata vista.
                        sget-object v0, $target->$seenField:$seenType
                        const/4 v3, 0x1
                        invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                        move-result-object v3
                        invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v4
                        if-nez v4, :done
                        const-string v3, "OA-Membership"
                        invoke-static {v3, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                        :done
                        return-void
                        """.trimIndent()
                    )
                }
            )
        }

        instrumentGetter("isProUser", Opcode.IGET_BOOLEAN, "Z", "isProUser", "morpheDiagPro", 1)
        instrumentGetter("getLevel", Opcode.IGET, "I", "level", "morpheDiagLevel", 2)
        addLogger("morpheDiagPro", "Z", "isProUser = ")
        addLogger("morpheDiagLevel", "I", "getLevel = ")
    }
}
