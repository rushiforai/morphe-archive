# Gestione del repository e pubblicazione patch Morphe

Repository: `Edoardo9708/LegheFC-Morphe-Patches`. Documento operativo per Codex e per la pubblicazione tramite GitHub.

## Branch e responsabilita

- `main` e il canale **stabile**; `dev` e il canale **pre-release**. La pipeline `.github/workflows/release.yml` usa `semantic-release` con regole in `.releaserc`.
- Le app sono indipendenti anche se condividono repository, build e versione del **bundle**. Una release selettiva non deve trascinare modifiche sperimentali di altre app.
- Non usare il merge generale `dev -> main` (es. PR #11) per pubblicare una sola patch quando `dev` contiene modifiche non autorizzate, incluse quelle Spotify.
- Per una release selettiva: crea un ramo **dall'ultimo `main`**, porta solo i file e le dipendenze strettamente necessarie per l'app scelta, e apri una PR verso `main`.

## Sviluppo di una nuova patch: branch locale

1. Prima di iniziare **ogni nuova patch**, individua il repository e verifica `git status`, branch e worktree. Se ci sono modifiche locali non correlate, preservale: non eseguire `reset --hard`, `clean` o checkout che le sovrascrivano.
2. Crea un **branch locale dedicato** (per esempio `feature/musicolet-sync-playlists`), normalmente a partire da `dev`. Se il worktree attuale contiene lavoro da preservare, usa un worktree separato o concorda prima una strategia non distruttiva. Non lavorare direttamente su `main` o `dev`.
3. Mantieni le modifiche isolate alla singola applicazione/patch e alle dipendenze strettamente necessarie. Prima di ogni commit controlla `git diff` e `git status`; aggiungi allo staging **soltanto i percorsi pertinenti** (per esempio `git add -- <percorsi>`, non `git add .` indiscriminato).
4. Quando il codice e i test mirati sono pronti, crea **commit locali** con messaggi convenzionali. Non includere modifiche preesistenti di altre patch, report o file non pertinenti. Un commit non equivale a push, merge o release.
5. Esegui **push, PR, merge o pubblicazione solo quando esplicitamente richiesti**. La prima pubblicazione del lavoro di sviluppo puo essere verso `dev` come pre-release, mantenendo `main` invariato.
6. Per pubblicare una patch collaudata su `main`, usa la **release selettiva** descritta sotto: crea un ramo dall'ultimo `main` e trasferisci soltanto i file/commit pertinenti, verificando che le altre patch siano identiche. Non fondere in blocco `dev`.

## Verifiche obbligatorie prima del merge

1. Confronta `main...ramo-release`: devono comparire soltanto i file dell'app scelta e la documentazione strettamente correlata. Non copiare in blocco la storia o le modifiche di `dev`.
2. Verifica che `patches/src/main/kotlin` e le estensioni delle altre app siano invariati. Nessuna patch Spotify nella versione stabile, salvo decisione esplicita successiva.
3. Controlla `default`, target, ABI, versionCode e `isExperimental` della patch. Non promuovere a stabile funzioni non collaudate; documenta chiaramente quelle parziali.
4. **Prima della PR, compila localmente** con il wrapper Gradle del repository e verifica l'esito; esegui i test mirati appropriati. La pipeline GitHub ricompila indipendentemente prima della pubblicazione. Non fondere con build locale o CI fallita.
5. Assicurati che la PR non contenga modifiche a credenziali, firme, chiavi, artefatti temporanei o versioni di altre app.

## Pubblicazione

- Usa commit convenzionali per generare la versione attraverso `semantic-release` (ad es. `feat(musicolet): ...`). Il merge su `main` innesca automaticamente la pipeline.
- Non creare tag, release o modificare a mano `patches-list.json`, `patches-bundle.json` e le sezioni del README generate dalla pipeline.
- Dopo la pubblicazione, verifica: workflow riuscito, release stabile, `.mpp` allegato, `patches-bundle.json` con URL/versione corretti e changelog riferito soltanto all'app interessata.
- Confronta **per nome e JSON completo** tutte le voci di `patches-list.json` della precedente stabile e della nuova: devono risultare identiche per le patch precedenti; soltanto le voci autorizzate possono essere aggiunte o cambiate. Verifica assenza di voci Spotify.
- La versione della **sorgente/bundle** aumenta comunque. Il confronto del catalogo evita aggiornamenti semantici alle altre patch, ma non dimostra da solo come Morphe Manager visualizzi i badge: verificare il comportamento nell'app se necessario.
- Il backmerge automatico `main -> dev` puo aggiornare `dev`; non usarlo per trasferire modifiche non collaudate verso `main`.

## Riferimento: release selettiva Musicolet v1.10.0

- Base: `main` v1.9.0; PR [#34](https://github.com/Edoardo9708/LegheFC-Morphe-Patches/pull/34), squash commit `1eccdfbc548c539cb2250718068bcf22e59e07f5`.
- Modificati soltanto cinque file di Musicolet e relativa documentazione. `Sync folder playlists` e facoltativa; la scelta della cartella nell'editor di playlist esistente resta una *preview*.
- Pipeline e release [v1.10.0](https://github.com/Edoardo9708/LegheFC-Morphe-Patches/releases/tag/v1.10.0) riuscite: catalogo passato da 16 a 17 patch; **una aggiunta, zero rimosse, zero patch precedenti modificate, Spotify assente**.

## Sviluppo locale

- Usa JDK 21, Android SDK condiviso e il wrapper Gradle del repository. GitHub Packages usa `gpr.user` / `gpr.key` nel Gradle home personale (per es. `C:\Users\edoar\.gradle\gradle.properties`), **non** nel repository.
- Un `GRADLE_USER_HOME` alternativo senza credenziali puo causare errori di risoluzione del plugin `app.morphe.patches`. Non copiare i token nei report o nel codice.
- Per verificare una patch in PowerShell dalla radice del repository, con `JAVA_HOME`, `ANDROID_HOME` e `GRADLE_USER_HOME` correttamente configurati, esegui `.\gradlew.bat :patches:buildAndroid --offline --no-daemon`; se mancano dipendenze nella cache, ripeti senza `--offline`. La compilazione locale non sostituisce la build del workflow di release.
- Prima di cambiare workflow e versioni, consulta i problemi noti e verifica se esiste gia una procedura funzionante.
