# Minigore 2 v1.28 — moltiplicatore configurabile 1–1000 (sperimentale)

**Una sola applicazione nel catalogo Morphe:** `net.mountainsheep.minigore2zombies`, versione 1.28 (28). La precedente build parallela `net.mountainsheep.minigore2zombiex` non è elencata né alterata.

Patch: `patches/src/main/kotlin/lab/minigore/patches/MinigoreCoinMultiplierPatch.kt`.

## Funzionamento

Opzione numerica `coinMultiplier`: interi da 1 a 1000, default 1000.
La patch modifica soltanto il guadagno elaborato da `GameUtility::addScores`, non cambia i prezzi degli upgrade né i salvataggi.
Per cambiare il fattore bisogna ricreare e reinstallare l'APK.

- ARMv7: valori 1–255 con `movs r2,#N`, valori 256–1000 con un trampoline Thumb nel sito `0xE46EE` e 12 byte nella code cave `0x20538C` (`movw r2,#N`, moltiplicazione, ritorno).
- x86: sito `0x112AD0`, `mov edi,#N; nop`, imm32.
- Sono verificate la lunghezza delle librerie e la SHA-256 dell'intero file con i soli siti previsti mascherati; un binario differente interrompe la patch.

Sono stati confrontati offline con l'APK x1000 già preparato gli output ARMv7 e x86: i byte patchati con N=1000 sono identici. Test statici anche per N=1,10,25,100,255,256,999.

## Compatibilità Android 17

La stessa patch dipende da una `resourcePatch` che conserva il package originale e applica al manifest:

- `targetSdkVersion=25`, per installazione compatibile.
- `android:debuggable=true` sull'elemento application, per copiare i dati con ADB/`run-as`.
- `android:resizeableActivity=false` all'attività `net.mountainsheep.minigore2zombies.xtPlay`, come il fix grafico già verificato sulla build parallela.

**Non cambia il nome del package e non usa il nome parallelo.**

## Migrazione dei salvataggi

Prima di disinstallare il vecchio originale, fare e verificare un backup sia dell'originale sia della versione parallela. Il backup della versione parallela disponibile all'utente si chiama `MinigoreMorphe-current.tar`; verificare che contenga `./files/Minigore.dat` e `./files/Minigore.bak` e che `tar -tf` termini con 0.

L'APK patchato con Morphe avrà una firma diversa dalla versione dello sviluppatore: non sarà installabile sopra l'originale senza disinstallarlo. Il backup da solo non autorizza una disinstallazione finché il ripristino non è verificabile. La versione parallela deve restare installata fino alla verifica in gioco.

Il ripristino dei dati privati può essere effettuato via `adb exec-in run-as <original-package> tar -xf -` sulla nuova app debuggable, con la sessione di gioco ferma.

## Stato e limiti

**Sperimentale (default=false).** Il funzionamento delle varianti a diversi moltiplicatori è stato verificato offline, ma la compilazione sul repository, il patching dal Morphe Manager e la procedura completa di migrazione su dispositivo richiedono test separati.

Il pacchetto già preparato manualmente con identificativo originale, target SDK 25, debug e fix dello schermo è distinto dalla build generata dal Manager. Conservare le chiavi private fuori dal repository e riutilizzare la stessa firma per gli aggiornamenti successivi.
