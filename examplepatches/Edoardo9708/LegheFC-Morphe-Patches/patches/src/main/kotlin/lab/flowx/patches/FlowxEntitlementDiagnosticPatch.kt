package lab.flowx.patches

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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Flowx 4.650, APK esaminato (classes.dex).
 *
 * Lxi1; = EntitlementRow, costruttore sintetico:
 *   <init>(I, String, String, String, String, String, String)V
 * Il primo int e' la maschera Kotlin dei parametri predefiniti.
 * Maschera 0: usa i valori predefiniti (status vuoto).
 * Maschera 0x3f: usa tutte e sei le stringhe passate dal chiamante.
 *
 * Lz5;->k()V valuta gli elementi dell'elenco e chiama:
 *   Ldw6;->B(Lxi1;J)Z
 *
 * La patch NON sostituisce gli elementi reali: all'inizio di k()
 * crea un oggetto di prova separato e stampa soltanto il risultato.
 * Registra inoltre le chiamate ORIGINALI a B() effettuate dal ciclo di k().
 * La revisione r3 legge la dimensione della List in Lz5.x dopo getValue()
 * e prima del test originale Collection.isEmpty().
 * Nei metodi c() ed h(), subito dopo la scrittura in x, passa la lista
 * originale a un helper separato. Quest'ultimo mantiene nello stesso scope
 * la lista originale (p0) e quella di prova (v8), e registra entrambe.
 * NON assegna mai la lista di prova a x.
 * Una prova neutra indipendente restituisce inoltre una List<String>\n * al chiamante, che la conserva brevemente in un registro temporaneo.\n * Nessuna modifica a parametri, booleani o stato abbonamento.
 */
@Suppress("unused")
val flowxEntitlementDiagnosticPatch = bytecodePatch(
    name = "Flowx - Test stato Gold locale",
    description = "Inserisce dati dimostrativi Gold nella cache locale dell'app per verificarne il comportamento; non modifica l'abbonamento lato server.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Flowx",
            packageName = "com.enzuredigital.weatherbomb",
            targets = listOf(AppTarget(version = "4.650"))
        )
    )

    execute {
        val target = "Lz5;"
        val helper = "morpheTestEntitlement"
        val entry = Fingerprint(
            definingClass = target,
            name = "k",
            returnType = "V",
            parameters = emptyList()
        ).method
        val body = entry.implementation ?: error("Flowx: metodo k() senza bytecode")

        // Sicurezza: modifica consentita solo se il bytecode contiene
        // esattamente la chiamata a B() verificata nell'APK 4.650.
        val bCalls = body.instructions.withIndex().filter { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC &&
                reference?.definingClass == "Ldw6;" &&
                reference.name == "B" &&
                reference.parameterTypes.toList() == listOf("Lxi1;", "J") &&
                reference.returnType == "Z"
        }
        require(body.registerCount == 5 && bCalls.size == 1) {
            "Flowx: il controllo Gold non corrisponde al bytecode verificato"
        }

        val originalInstructions = body.instructions.toList()
        // Nel DEX originale:
        // 0 iget-object v0,p0,Lz5;->x:Lrs5;
        // 1 invoke-virtual {v0},Lrs5;->getValue()Ljava/lang/Object;
        // 2 move-result-object v0
        // 3 check-cast v0,Ljava/util/List;
        // 4 sget-object (inizio del calcolo temporale)
        // Quindi all'indice 4 v0 contiene esattamente la lista controllata da k().
        val firstField = (originalInstructions.getOrNull(0) as? ReferenceInstruction)
            ?.reference as? FieldReference
        val castType = (originalInstructions.getOrNull(3) as? ReferenceInstruction)
            ?.reference as? TypeReference
        val getValue = (originalInstructions.getOrNull(1) as? ReferenceInstruction)
            ?.reference as? MethodReference
        require(
            originalInstructions.size > 4 &&
            originalInstructions[0].opcode == Opcode.IGET_OBJECT &&
            firstField?.definingClass == target &&
            firstField.name == "x" && firstField.type == "Lrs5;" &&
            originalInstructions[1].opcode == Opcode.INVOKE_VIRTUAL &&
            getValue?.definingClass == "Lrs5;" &&
            getValue.name == "getValue" &&
            getValue.returnType == "Ljava/lang/Object;" &&
            originalInstructions[2].opcode == Opcode.MOVE_RESULT_OBJECT &&
            originalInstructions[3].opcode == Opcode.CHECK_CAST &&
            castType?.type == "Ljava/util/List;" &&
            (originalInstructions[3] as? OneRegisterInstruction)?.registerA == 0 &&
            originalInstructions[4].opcode == Opcode.SGET_OBJECT
        ) {
            "Flowx: il caricamento della lista in k() non corrisponde al DEX 4.650"
        }

        val targetClass = mutableClassDefBy(target)
        val callLogger = "morpheLogOriginalBCall"
        val listLogger = "morpheLogEntitlementList"
        require(targetClass.methods.none {
            it.name == helper || it.name == callLogger || it.name == listLogger
        }) {
            "Flowx: un metodo diagnostico e' gia' presente"
        }

        targetClass.methods.add(
            ImmutableMethod(
                target,
                helper,
                emptyList(),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(13)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        # v0: istanza EntitlementRow da usare solo nel test.
                        new-instance v0, Lxi1;

                        # v1: bit 0-5 a 1: usa i sei valori forniti.
                        # Con 0, status diventerebbe la stringa vuota.
                        const/16 v1, 0x3f

                        # v2/v3: prodotto e stato validi secondo B().
                        const-string v2, "gold"
                        const-string v3, "active"

                        # v4-v7: metadati dimostrativi, mai letti dal server.
                        const-string v4, "morphe-test"
                        const-string v5, "morphe-test"
                        const-string v6, "morphe-test"
                        const-string v7, ""

                        # Inizializza l'oggetto usando il costruttore reale.
                        invoke-direct/range {v0 .. v7}, Lxi1;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

                        # Ottiene un riferimento temporale; con active B() non verifica la scadenza.
                        invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                        move-result-wide v8

                        # Chiama la funzione originale con il SOLO oggetto di test.
                        invoke-static {v0, v8, v9}, Ldw6;->B(Lxi1;J)Z
                        move-result v10

                        # Converte il booleano restituito in una stringa.
                        invoke-static {v10}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;
                        move-result-object v10

                        # Questo identificativo viene stampato ogni volta che
                        # k() esegue il test; e' indipendente dal ciclo originale.
                        # MARCATORE DI REVISIONE DEL CODICE DELLA PATCH:
                        # non e' il numero di versione del bundle .mpp.
                        # Se questo ID compare in Logcat, l'APK installato
                        # contiene la nostra nuova revisione diagnostica.
                        const-string v11, "Flowx-Entitlement"
                        const-string v12, "PATCH CODE ID FX-20261028-R9 (cache post-write injection)"
                        invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        # Composizione del messaggio del test vero e proprio.
                        const-string v12, "TEST gold/active B() = "
                        invoke-virtual {v12, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v12

                        # Scrive il risultato nel log Android.
                        invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        # Fine diagnostica: nessuna modifica al livello reale.
                        return-void
                    """.trimIndent()
                )
            }
        )

        // Questo helper registra SOLO l'arrivo alla chiamata originale.
        // Due registri propri; non necessita di registri liberi dentro k().
        targetClass.methods.add(
            ImmutableMethod(
                target,
                callLogger,
                emptyList(),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        # Tag uguale al test precedente per filtrare con Logcat.
                        const-string v0, "Flowx-Entitlement"
                        # Se questa riga appare, k() ha raggiunto la chiamata reale a B().
                        const-string v1, "ORIGINAL B() called [FlowxDiag r8]"
                        invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                        return-void
                    """.trimIndent()
                )
            }
        )

        // Logger indipendente con parametro: l'oggetto List ricevuto da k().
        // Usa soltanto registri propri; non altera contenuto o riferimenti.
        targetClass.methods.add(
            ImmutableMethod(
                target,
                listLogger,
                listOf(ImmutableMethodParameter("Ljava/util/List;", null, null)),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(4)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        # p0 = stesso oggetto List che k() usa in isEmpty().
                        invoke-interface {p0}, Ljava/util/List;->size()I
                        move-result v0

                        # Converte la dimensione in testo per Logcat.
                        invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "Flowx-Entitlement"
                        const-string v2, "k() entitlement list size = "
                        invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v2

                        # Log della dimensione, prima dell'isEmpty() originale.
                        invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                        return-void
                    """.trimIndent()
                )
            }
        )

        // I registri v11 di c() e v9 di h() contengono gli oggetti
        // originali subito dopo la scrittura in x.
        // Li passiamo al helper come p0: non sostituiamo il valore scritto in x.
        // L'helper costruisce una ArrayList indipendente in v8 e
        // stampa nello stesso metodo sia l'originale che la prova.
        fun addIsolatedListTest(name: String, origin: String) {
            require(targetClass.methods.none { it.name == name }) {
                "Flowx: helper $name esiste gia'"
            }
            targetClass.methods.add(
                ImmutableMethod(
                    target, name,
                    listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null, null, MutableMethodImplementation(14)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            # p0 = originale da c()/h(), puo' essere List o null.
                            # In un metodo STATIC con 14 registri e 1 parametro,
                            # p0 e' l'alias di v13: v0..v12 sono locali.

                            const-string v10, "Flowx-Entitlement"
                            if-eqz p0, :original_null

                            # Stampa numero di elementi della lista originale.
                            instance-of v9, p0, Ljava/util/List;
                            if-eqz v9, :original_other
                            move-object v9, p0
                            check-cast v9, Ljava/util/List;
                            invoke-interface {v9}, Ljava/util/List;->size()I
                            move-result v9
                            invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                            move-result-object v9
                            const-string v11, "$origin WRITE ARG size = "
                            invoke-virtual {v11, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v11
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                            # String.valueOf visualizza il contenuto se la List
                            # implementa toString(), altrimenti la sua rappresentazione.
                            invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                            move-result-object v9
                            const-string v11, "$origin WRITE ARG elements = "
                            invoke-virtual {v11, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v11
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            goto :make_test

                            :original_other
                            const-string v11, "$origin WRITE ARG is not a List"
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            goto :make_test

                            :original_null
                            const-string v11, "$origin WRITE ARG = null"
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                            :make_test
                            # Lista di test LOCALE, mai salvata in x.
                            new-instance v8, Ljava/util/ArrayList;
                            invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

                            # Nuovo EntitlementRow dimostrativo, separato da p0.
                            new-instance v0, Lxi1;
                            const/16 v1, 0x3f
                            const-string v2, "gold"
                            const-string v3, "active"
                            const-string v4, "morphe-test"
                            const-string v5, "morphe-test"
                            const-string v6, "morphe-test"
                            const-string v7, ""
                            invoke-direct/range {v0 .. v7}, Lxi1;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
                            invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

                            # Stampa dimensione e contenuto della lista di test.
                            invoke-virtual {v8}, Ljava/util/ArrayList;->size()I
                            move-result v9
                            invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                            move-result-object v9
                            const-string v11, "$origin TEST size = "
                            invoke-virtual {v11, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v11
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                            invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                            move-result-object v9
                            const-string v11, "$origin TEST elements = "
                            invoke-virtual {v11, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v11
                            invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                            # Nessuna assegnazione a Lz5.x; nessuna chiamata B().
                            return-void
                        """.trimIndent()
                    )
                }
            )
        }

        // Prova indipendente: crea una ArrayList contenente Lxi1.
        // Sono gli stessi TIPI di elementi della List originale, ma i valori
        // restano dimostrativi: non rappresentano autorizzazioni attive.
        // Il valore restituito e' usato soltanto in un registro temporaneo.
        val probeName = "morpheCreateDemoRows"
        require(targetClass.methods.none { it.name == probeName }) {
            "Flowx: helper demo esiste gia'"
        }
        targetClass.methods.add(
            ImmutableMethod(
                target, probeName, emptyList(), "Ljava/util/List;",
                AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                null, null, MutableMethodImplementation(9)
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        # Se questo log manca, la coroutine ha saltato il nostro
                        # blocco di creazione demo prima della scrittura.
                        const-string v0, "Flowx-Entitlement"
                        const-string v1, "FX-R8 demo factory CALLED"
                        invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        # v8: nuova ArrayList di prova, completamente indipendente.
                        new-instance v8, Ljava/util/ArrayList;
                        invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

                        # v0: oggetto Lxi1 (EntitlementRow) di dimostrazione.
                        new-instance v0, Lxi1;

                        # v1: maschera Kotlin, usa tutti i campi stringa v2-v7.
                        const/16 v1, 0x3f

                        # MAPPATURA DEI CAMPI DELL'ENTITLEMENT ROW (Lxi1):
                        # v2=product, v3=status, v4=source,
                        # v5=source_ref, v6=store_product_id,
                        # v7=current_period_end.
                        #
                        # VALORI OSSERVATI NEL PRECEDENTE TEST DI B():
                        #   product = "gold"
                        #   status  = "active"
                        #   bitmask = 0x3f (usa tutti e 6 i campi forniti)
                        # Con questa combinazione B() aveva restituito true
                        # nel test locale. Questo NON dimostra che bastino
                        # tali campi per attivare l'abbonamento nell'app:
                        # possono intervenire altre verifiche lato server.
                        # Gli altri quattro campi erano dati dimostrativi.
                        #
                        # DATI CABLATI NELLA STRUTTURA DI TEST:
                        # v2 = product "gold"; v3 = status "active".
                        # Solo per confrontare i dati di test con B() gia' verificato.
                        # La struttura resta locale: il contenitore x non cambia.
                        const-string v2, "gold"
                        const-string v3, "active"
                        const-string v4, "local-test"
                        const-string v5, "local-test"
                        const-string v6, "local-test"
                        const-string v7, ""

                        # Costruttore della STESSA classe usata negli elementi originali.
                        invoke-direct/range {v0 .. v7}, Lxi1;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

                        # Inserisce v0 nella lista v8: List<Lxi1> a runtime.
                        invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

                        # Registra la dimensione della lista che torna DAVVERO
                        # al chiamante, non quella costruita dal logger di prova.
                        invoke-virtual {v8}, Ljava/util/ArrayList;->size()I
                        move-result v1
                        invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                        move-result-object v1
                        const-string v2, "FX-R8 demo factory RETURN size = "
                        invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v2
                        const-string v1, "Flowx-Entitlement"
                        invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

                        # Restituisce la lista al chiamante.
                        return-object v8
                    """.trimIndent()
                )
            }
        )

        val serverTest = "morpheIsolatedServerList"
        val cacheTest = "morpheIsolatedCacheList"
        addIsolatedListTest(serverTest, "c() server")
        addIsolatedListTest(cacheTest, "h() cache")


        // R7: tracciamento del percorso di caricamento e dello stato
        // effettivo del contenitore x DOPO la scrittura originale.
        // I helper usano solo registri propri, senza modificarne il valore.
        fun addPathDiagnostic(origin: String, entryName: String, afterName: String) {
            require(targetClass.methods.none { it.name == entryName || it.name == afterName }) {
                "Flowx: helper R7 gia' presente"
            }

            targetClass.methods.add(
                ImmutableMethod(
                    target, entryName, emptyList(), "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null, null, MutableMethodImplementation(2)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            const-string v0, "Flowx-Entitlement"
                            const-string v1, "FX-R7 $origin ENTRY"
                            invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            return-void
                        """.trimIndent()
                    )
                }
            )

            targetClass.methods.add(
                ImmutableMethod(
                    target, afterName,
                    listOf(ImmutableMethodParameter("Lrs5;", null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null, null, MutableMethodImplementation(5)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            # Legge davvero il contenuto di x dopo Lrs5.i().
                            # p0 = contenitore Lrs5; v0..v3 locali.
                            invoke-virtual {p0}, Lrs5;->getValue()Ljava/lang/Object;
                            move-result-object v0
                            const-string v1, "Flowx-Entitlement"
                            if-eqz v0, :null_value
                            instance-of v2, v0, Ljava/util/List;
                            if-eqz v2, :other_value
                            check-cast v0, Ljava/util/List;
                            invoke-interface {v0}, Ljava/util/List;->size()I
                            move-result v2
                            invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                            move-result-object v2
                            const-string v3, "FX-R7 $origin x AFTER write size = "
                            invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v3
                            goto :print_result

                            :null_value
                            const-string v3, "FX-R7 $origin x AFTER write = null"
                            goto :print_result

                            :other_value
                            const-string v3, "FX-R7 $origin x AFTER write is not List"

                            :print_result
                            invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            return-void
                        """.trimIndent()
                    )
                }
            )
        }

        addPathDiagnostic("c() server", "morpheLogCEntry", "morpheLogCXAfterWrite")
        addPathDiagnostic("h() cache", "morpheLogHEntry", "morpheLogHXAfterWrite")


        // R8: il DEX originale contiene anche un reset di x nel metodo b().
        // b() usa Lrs5.j(current, emptyList) cioe' compare-and-set, non i().
        // Tracciamo x prima e dopo senza intervenire sull'operazione originale.
        fun addResetStateLogger(name: String, stage: String) {
            require(targetClass.methods.none { it.name == name }) {
                "Flowx: helper R8 $name gia' presente"
            }
            targetClass.methods.add(
                ImmutableMethod(
                    target, name,
                    listOf(ImmutableMethodParameter("Lrs5;", null, null)),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null, null, MutableMethodImplementation(5)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            # p0 = stesso contenitore x usato dalla CAS originale.
                            invoke-virtual {p0}, Lrs5;->getValue()Ljava/lang/Object;
                            move-result-object v0
                            const-string v1, "Flowx-Entitlement"
                            if-eqz v0, :null_state
                            instance-of v2, v0, Ljava/util/List;
                            if-eqz v2, :other_state
                            check-cast v0, Ljava/util/List;
                            invoke-interface {v0}, Ljava/util/List;->size()I
                            move-result v2
                            invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
                            move-result-object v2
                            const-string v3, "FX-R8 b() RESET $stage x size = "
                            invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v3
                            goto :print_state

                            :null_state
                            const-string v3, "FX-R8 b() RESET $stage x = null"
                            goto :print_state

                            :other_state
                            const-string v3, "FX-R8 b() RESET $stage x is not List"

                            :print_state
                            invoke-static {v1, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
                            return-void
                        """.trimIndent()
                    )
                }
            )
        }
        addResetStateLogger("morpheLogBResetBefore", "BEFORE")
        addResetStateLogger("morpheLogBResetAfter", "AFTER")

        val resetMethod = Fingerprint(
            definingClass = target,
            name = "b",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Lq4;", "Lgn0;")
        ).method
        val resetInstructions = resetMethod.implementation?.instructions?.toList()
            ?: error("Flowx: b() senza istruzioni")
        // Distinzione precisa fra le tre j() chiamate di b():
        // il reset di x e' quello preceduto da Lmh1.k (lista vuota).
        val resetCandidates = resetInstructions.withIndex().filter { (idx, ins) ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            val previous = resetInstructions.getOrNull(idx - 1)
            val emptyListRef = (previous as? ReferenceInstruction)?.reference as? FieldReference
            ins.opcode == Opcode.INVOKE_VIRTUAL &&
                ref?.definingClass == "Lrs5;" && ref.name == "j" &&
                ref.parameterTypes.toList() == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") &&
                ref.returnType == "Z" &&
                previous?.opcode == Opcode.SGET_OBJECT &&
                emptyListRef?.definingClass == "Lmh1;" && emptyListRef.name == "k"
        }
        require(resetCandidates.size == 1 && resetMethod.implementation?.registerCount == 10) {
            "Flowx: impossibile localizzare in sicurezza il reset x in b()"
        }
        val (resetIndex, resetInstruction) = resetCandidates.single()
        val resetRegisters = resetInstruction as? FiveRegisterInstruction
            ?: error("Flowx: reset b() non usa invoke-virtual standard")
        require(
            resetRegisters.registerC == 8 &&
            resetRegisters.registerD == 5 &&
            resetRegisters.registerE == 9
        ) {
            "Flowx: registri della CAS x inattesi"
        }
        // Il log BEFORE precede j(), AFTER la segue. j() non e' seguito
        // da move-result, quindi l'inserimento non spezza nessun accoppiamento.
        resetMethod.addInstructions(
            resetIndex,
            "invoke-static {v8}, Lz5;->morpheLogBResetBefore(Lrs5;)V"
        )
        resetMethod.addInstructions(
            resetIndex + 2,
            "invoke-static {v8}, Lz5;->morpheLogBResetAfter(Lrs5;)V"
        )

        fun instrumentXWrite(methodName: String, params: List<String>, expectedWrites: Int,
                              receiver: Int, value: Int, testName: String) {
            val m = Fingerprint(
                definingClass = target,
                name = methodName,
                returnType = "Ljava/lang/Object;",
                parameters = params
            ).method
            val instructions = m.implementation?.instructions?.toList()
                ?: error("Flowx: $methodName() senza istruzioni")
            val writes = instructions.withIndex().filter { (_, ins) ->
                val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
                ins.opcode == Opcode.INVOKE_VIRTUAL &&
                    ref?.definingClass == "Lrs5;" &&
                    ref.name == "i" &&
                    ref.parameterTypes.toList() == listOf("Ljava/lang/Object;") &&
                    ref.returnType == "V"
            }
            require(writes.size == expectedWrites) {
                "Flowx: numero inatteso di chiamate Lrs5.i in $methodName()"
            }
            val (index, ins) = writes.last()
            val registers = ins as? FiveRegisterInstruction
                ?: error("Flowx: registri inattesi in $methodName()")
            require(registers.registerC == receiver && registers.registerD == value) {
                "Flowx: non riconosco la scrittura nella lista x di $methodName()"
            }

            // ===========================================================
            // REGISTRI TEMPORANEAMENTE DISPONIBILI (DEX Flowx 4.650)
            // ===========================================================
            // c() / server:
            //   v11 = lista originale (NON modificare)
            //   v1  = contenitore x (NON modificare)
            //   v7  = temporaneo libero in questo tratto:
            //         scrittura originale al code-unit 109,
            //         ridefinizione con sget-object al code-unit 122.
            //
            // h() / cache:
            //   v9  = lista originale (NON modificare prima della scrittura)
            //   v1  = contenitore x (NON modificare)
            //   v5  = temporaneo libero in questo tratto:
            //         scrittura originale al code-unit 86,
            //         ridefinizione con const-string al code-unit 126.
            //
            // Sono registri TEMPORANEAMENTE disponibili, non liberi
            // per tutto il metodo. registerCount resta invariato.
            val temp = if (methodName == "c") 7 else 5
            // Protezione aggiuntiva: il registro della demo non deve
            // coincidere con i due argomenti della Lrs5.i originale.
            require(temp != receiver && temp != value) {
                "Flowx: v$temp e' ancora necessario alla scrittura originale"
            }
            val expectedRegisterCount = if (methodName == "c") 12 else 10
            val expectedNextMethod = if (methodName == "c") "e" else "k"
            val nextRef = (instructions.getOrNull(index + 1) as? ReferenceInstruction)
                ?.reference as? MethodReference
            val resetOpcode = if (methodName == "c") Opcode.SGET_OBJECT else Opcode.CONST_STRING
            val precedingOpcode = if (methodName == "c") Opcode.IGET_OBJECT else Opcode.MOVE_OBJECT
            val resetFound = instructions.drop(index + 2).take(30).any { instruction ->
                instruction.opcode == resetOpcode &&
                    (instruction as? OneRegisterInstruction)?.registerA == temp
            }
            require(
                m.implementation?.registerCount == expectedRegisterCount &&
                    instructions.getOrNull(index - 1)?.opcode == precedingOpcode &&
                    nextRef?.definingClass == target &&
                    nextRef.name == expectedNextMethod &&
                    resetFound
            ) {
                "Flowx: il temporaneo v$temp di $methodName() non e' verificato"
            }

            // ===========================================================
            // ISTRUZIONI SMALI DIFFERENZIATE PER SERVER E CACHE
            // ===========================================================
            // Ogni metodo riceve il proprio blocco: nessun v$temp nello
            // Smali generato. I registri sono validati sopra, rispetto
            // alla chiamata originale Lrs5.i.
            // c() mantiene esattamente la sequenza di iniezione precedente.
        // h() e' diverso: il percorso osservato raggiunge la scrittura originale
        // e il logger successivo, ma salta le istruzioni inserite PRIMA di Lrs5.i().
        // Lasciamo la scrittura originale intatta e aggiungiamo la prova
        // immediatamente DOPO, nel percorso sicuramente eseguito.
        val afterWriteSmali = when (methodName) {
            "c" -> """
                # c() - dopo la scrittura originale in x.
                invoke-static {v11}, Lz5;->morpheIsolatedServerList(Ljava/lang/Object;)V
                invoke-static {v1}, Lz5;->morpheLogCXAfterWrite(Lrs5;)V
            """.trimIndent()

            "h" -> """
                # h() - dopo la scrittura di prova in x.
                invoke-static {v9}, Lz5;->morpheIsolatedCacheList(Ljava/lang/Object;)V
                invoke-static {v1}, Lz5;->morpheLogHXAfterWrite(Lrs5;)V
            """.trimIndent()

            else -> error("Flowx: metodo $methodName non previsto")
        }

        if (methodName == "c") {
            // Sequenza c() invariata rispetto alla R8.
            val beforeWriteSmali = """
                # ========== c() - SERVER ==========
                # v11 = lista ORIGINALE ottenuta dal server.
                # v7  = registro temporaneo per la nostra lista di prova.
                invoke-static {}, Lz5;->$probeName()Ljava/util/List;
                move-result-object v7

                move-object v11, v7

                # La prova sostituisce v11 PRIMA dell'invoke originale:
                # la scrittura Lrs5.i riceve la lista demo in v11.
            """.trimIndent()
            m.addInstructions(index, beforeWriteSmali)
            // Tre istruzioni aggiunte prima della scrittura originale.
            m.addInstructions(index + 4, afterWriteSmali)
        } else {
            // Il vecchio inserimento all'indice 'index' veniva probabilmente
            // saltato da un branch diretto alla Lrs5.i() originale.
            // In R9 lasciamo l'invoke originale al suo indice/target.
            m.addInstructions(
                index + 1,
                """
                    # ========== h() - CACHE (R9) ==========
                    # Scrittura originale appena eseguita: qui passa
                    # anche il ramo che saltava la vecchia iniezione.
                    # v5 e' un temporaneo validato; v9 e' la lista per il logger.
                    invoke-static {}, Lz5;->$probeName()Ljava/util/List;
                    move-result-object v5
                    move-object v9, v5

                    # Sovrascrive x con la lista demo prima di chiamare k().
                    invoke-virtual {v1, v9}, Lrs5;->i(Ljava/lang/Object;)V
                """.trimIndent()
            )
            // Quattro istruzioni aggiunte DOPO l'invoke originale.
            m.addInstructions(index + 5, afterWriteSmali)
        }

        // Inserito per ultimo a indice 0: non altera gli indici
            // verificati per la chiamata Lrs5.i.
            val entryName = if (methodName == "c") "morpheLogCEntry" else "morpheLogHEntry"
            m.addInstructions(0, "invoke-static {}, Lz5;->$entryName()V")

        }

        // c(): originale v11, registro temporaneo v7 prima della scrittura.
        instrumentXWrite("c", listOf("Li5;", "Lgn0;"), 1, 1, 11, serverTest)
        // h(): originale v9, registro temporaneo v5 prima della scrittura.
        instrumentXWrite("h", listOf("Lgn0;"), 2, 1, 9, cacheTest)

        // Prima inseriamo il log immediatamente PRIMA della chiamata originale.
        // L'istruzione non legge o modifica i registri del ciclo e quindi
        // non sostituisce l'oggetto EntitlementRow ne' il suo risultato.
        entry.addInstructions(
            bCalls.single().index,
            "invoke-static {}, Lz5;->morpheLogOriginalBCall()V"
        )

        // L'indice 4 e' immediatamente dopo il check-cast della List,
        // ma prima della chiamata originale a isEmpty(). Nessun registro
        // del metodo k() viene modificato da questa istruzione.
        // Inseriamo in ordine decrescente per preservare gli indici originali.
        entry.addInstructions(
            4,
            "invoke-static {v0}, Lz5;->morpheLogEntitlementList(Ljava/util/List;)V"
        )

        // Infine aggiungiamo il test sintetico all'inizio di k().
        // Il metodo prosegue poi eseguendo tutto il codice originale.
        entry.addInstructions(
            0,
            "invoke-static {}, Lz5;->morpheTestEntitlement()V"
        )
    }
}
