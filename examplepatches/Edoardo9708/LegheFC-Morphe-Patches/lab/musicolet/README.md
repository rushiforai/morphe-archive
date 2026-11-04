# Musicolet 6.14.1 build540

**Sync folder playlists** è una patch facoltativa per `in.krosbits.musicolet` ARM64, versionCode 54000, Android 10+. La funzione principale è stata provata dall'utente su dispositivo. La creazione importa i brani indicizzati dalla cartella; la scansione aggiunge i nuovi brani. Il selettore nell'editor di una playlist esistente resta un'anteprima, senza modifica del collegamento. Il catalogo JSON ufficiale viene generato dalla pipeline di release.

I risultati e le note sottostanti documentano prove intermedie storiche; non rappresentano necessariamente lo stato del collaudo attuale.

## Anteprima

- `PlaylistEditActivity.onCreate(Bundle)` monta il pannello subito dopo `Lx5.setContentView(int)`.
- `Ly71.onClick(View)` monta lo stesso pannello dopo il caricamento di `Lqs0.n` nel ramo Nuova playlist. Il pannello si inserisce dopo il campo nome e lascia i pulsanti del dialogo nel layout originale.
- Il secondo uso di `Lw71` in `Lb81.onClick` costruisce `Lnk(Context, Stack, int, Loy)`, un selettore con callback di lista. Il costruttore non imposta l'input di testo tramite `Lks0.g`. L'anteprima è agganciata al dialogo con input nome.
- Il pannello dell’editor avvolge la vista originale e la mantiene nello spazio residuo. Evita così di riferirsi ai campi ConstraintLayout offuscati. La posizione risultante del pannello è sopra la toolbar.
- Il picker SAF usa un Fragment di piattaforma. La selezione vive nel pannello corrente. Se l'Activity viene ricreata durante il picker, la callback può andare persa. Persistenza, sincronizzazione e icona sono fasi successive.

## Build locale riproducibile

1. Usare JDK 21, il compilatore Kotlin della distribuzione Gradle 9.8.1, Android SDK 35, D8 dei Build Tools 36.0.0 e Morphe Desktop 1.20.0.
2. Compilare i due Java sotto `extensions/extension/src/main/java/app/morphe/musicolet/sync` con `javac --release 8 -cp <android.jar>`. Creare un JAR con le classi, convertirlo con `D8 --min-api 29 --lib <android.jar>` e mettere il DEX risultante nel bundle come `extensions/extension.mpe`.
3. Compilare `SyncFolderPlaylistsPatch.kt` con `K2JVMCompiler -no-stdlib -no-reflect -jvm-target 17 -classpath <morphe-desktop.jar>`. Inserire le classi JVM nel bundle. Per includere la variante Android, convertire anche queste classi con D8, aggiungendo `--classpath <morphe-desktop.jar>`, e inserire il risultato come `classes.dex` alla radice.
4. Impacchettare con `jar cfm`. Il manifest locale usa `Manifest-Version: 1.0`, `Name: Musicolet folder playlists preview`, `Version: 0.1.0`, `Patcher-Version: 2.1.0`.
5. Dalla radice Dev, usare il wrapper canonico con un nome di output `.apk` per il pacchetto universale.

```powershell
. ./scripts/morphe-java.ps1
Invoke-MorpheJava -jar tools/morphe-desktop-1.20.0-all.jar patch --exclusive `
  -p <hxreborn-1.69.0.mpp> -e 'Unlock premium' `
  -p <musicolet-folder-playlists.mpp> -e 'Sync folder playlists' `
  -o <preview-universal.apk> -r <risultato.json> -t <directory-di-lavoro> <originale.apkm>
```

## Verifiche

| Area | Risultato |
| --- | --- |
| Originale | APKM SHA-256 `18cc6b87c51d073ea3240fcc0b49b1d7e28c14038e33763706950d3f524ea025`. Estrazione e 21 controlli statici del pacchetto superati. |
| JVM | Compilazione del planner riuscita. Il primo controllo fallisce su Windows a `SyncTests.kt:16`. Il planner usa `Paths.get` per path Android che poi richiede inizino con `/`. Il planner è fuori dal bundle di anteprima. |
| Compilazione | Java SDK, Kotlin e D8 riusciti. D8 ha segnalato metadata Kotlin 2.4 più recenti di quelli supportati per la variante DEX della patch. |
| Applicazione | Morphe ha applicato entrambe le patch all’originale, fuso gli split, ricostruito e firmato. Confermate entrambe le chiamate nel DEX finale e le classi dell’estensione. |
| APK universale | `apksigner` verifica la firma v2. `aapt2` conferma build 54000, ARM64 e le risorse lingua. SHA-256 `4b58d52f773bda6c377e8b113afa192142060a1875283f16d87dcfcfe9d6903f`. |
| Premium | Il bundle v1.69.0 ha SHA-256 `7d1cf6d8d9e4663458fcaff545a9fff063b60be4fb6340081eb56112eee97862`. Morphe riporta applicazione riuscita e `lib_musicolet.so` nel risultato ha digest diverso dall’originale. Le funzioni Pro richiedono verifica su dispositivo. |
| Installazione e dispositivo | Da eseguire. Visibilità dei controlli, picker, rotazione, playlist manuali, avvio e playback di oltre 30 secondi su altoparlante e Bluetooth restano da verificare. |

Gli artefatti locali, il risultato JSON e il log di patching sono sotto `research/musicolet-6.14.1/work`. La prima invocazione aveva estensione `.apkm` in uscita. L'artefatto con estensione `.apk` è una copia con lo stesso contenuto binario verificato come APK universale.

## Anteprima 0.2.0 con importazione iniziale

In `Lw71.a(Lqs0, Editable)` la patch prepara solo il nuovo modello prima del salvataggio originale `Ls71.k`. Legge l’indice `MyApplication.j → Lqn1.c → Lem0.b`, confronta la cartella indicizzata `Ldm0.h` e aggiunge tramite `Lr71.a`, che controlla i duplicati. L’opzione OFF segue il percorso originale. Se la cartella non è supportata, l’indice manca o non ci sono brani corrispondenti, la patch mostra un messaggio e salta il salvataggio. In questa fase è supportato il provider Android della memoria interna primaria.

Firma identica all’anteprima 0.1.0. Entrambe le patch applicate con successo e salto verso il salvataggio originale verificato nel DEX finale. APK SHA-256 `5a4c68a0cf54996c569d6b5a9ba76e59d834dafa71d4b6127d342e3a03771ec4`. Artefatti in `research/musicolet-6.14.1/work/import-v2`. Prova Android da eseguire. Il modello analizzato usa il nome come chiave di salvataggio. L’associazione persistente richiede ancora verifica di rinomina e cancellazione, così che un nome riutilizzato non erediti la cartella di una playlist precedente.

## Correzione 0.2.2

Sul Galaxy S23, ART rifiutava `w71.a` già all’apertura di Nuova playlist. Nella 0.2.0 il registro del dialogo era già stato riusato per il Context. Nella 0.2.1 il dialogo era preservato in v0, ma i due rami originali di validazione passavano v0 come booleano senza attraversare l’hook. La 0.2.2 ripristina il valore booleano originale su entrambi i rami.

## Correzione 0.2.3

Il log sul Galaxy S23 ha mostrato `NoSuchFieldException` cercando `j` sull’istanza Application di PairIP. La 0.2.3 legge il campo statico `MyApplication.j`, come fa il salvataggio originale `Ls71.k`. Se l’indice non è pronto, mostra un messaggio specifico.

## Correzione 0.2.4

La corrispondenza usa l’URI restituito da `Ldm0.c → Lkn1.a()`, quindi confronta la directory padre del file locale con la cartella SAF. Il log riporta soltanto il numero di brani nell’indice, di URI file locali e di corrispondenze. Gli URI di altri provider richiedono un adapter dedicato.

## Correzione 0.2.5

Il log della 0.2.4 sul Galaxy S23 ha contato 382 brani e zero URI file. Il DEX originale mostra che `Lhw0.j()` genera URI `musicolet://media-store` con volume `p_v` e cartella relativa `p_rp`. La 0.2.5 usa tali campi per il volume primario e riconosce anche i documenti SAF della memoria primaria. La prova di corrispondenza sul dispositivo resta da eseguire.

## Correzione 0.2.6

La 0.2.5 ha letto 382 tracce senza risolvere cartelle. Il costruttore `Lhw0` converte il volume MediaStore `external_primary` in `primary` e `Lhw0.H` rappresenta i percorsi sotto `Storage/primary/`. La 0.2.6 riconosce questo prefisso nel campo cartella del modello e accetta entrambi i nomi del volume nell’URI.
