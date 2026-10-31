# Yahoo Finance — stato patch

Versione verificata: **26.21.2 (1360038759)**. Tutte le patch sono sperimentali e disabilitate per default.

| Patch | Effetto | Esito |
| --- | --- | --- |
| Remove ads A2 | Forza solo AdsFree; corregge il salto A1 con addInstructionsWithLabels. | Verificata su tablet/telefono; combinazione con microG confermata dall’utente. |
| GOLD A3 | Simula il livello locale GOLD; conserva la mappa delle autorizzazioni server. | GOLD visibile nel profilo; da sola lascia annunci e contenuti bloccati. Può persistere nello stato locale. |
| microG A5 | Provider credenziali alternativo e routing selettivo dei due client Identity verso app.revanced.android.gms. | Accesso Google confermato dall’utente con GmsCore 7.3.0 già installato. |
| Diagnostica A7 | Registra stati HTTP dei percorsi finance selezionati e risultati originali dei controlli di accesso. | Analisi TSLA/insights e abbonamento HTTP 200; 35 REQUIRES_UPGRADE. Nessun token, query, header o corpo registrato. |

**Build A6:** A2 + A3 + A5, funzionante secondo la prova utente. **Build A7:** stessa combinazione con diagnostica aggiuntiva; il codice 200 non dimostra la disponibilità dell’analisi completa. Nessuna modifica a Billing/acquisti o alle autorizzazioni restituite dal server.

Compilazione locale Kotlin/D8 e ricostruzione tramite Morphe Desktop 1.20.0 riuscite. La build Gradle standard resta bloccata dalla risoluzione del plugin app.morphe.patches 1.3.4. Gli aggiornamenti sul telefono conservano dati e firma di test; dopo la richiesta dell’utente l’app non viene avviata automaticamente. APK, chiavi e log account/dispositivo non fanno parte del repository.
