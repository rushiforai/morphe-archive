# YTM Extras Pitch

[Read in English](README.md)

Una patch di intonazione per YouTube Music, compatibile con [Morphe](https://morphe.software).
È un progetto indipendente, non realizzato né approvato dal progetto Morphe o da Google.

**Versione supportata:** YouTube Music 9.30.53, con Morphe Patcher 2.0.0.

## Cosa fa

- Aggiunge al player `-`, il valore attuale e `+`, sotto il pulsante shuffle.
- Cambia il pitch da -2 a +2 semitoni a passi di 1, con fattore `2^(semitoni/12)`.
- Non cambia la velocità.
- Usa il processore Sonic già presente nell'app, alla frequenza di campionamento con cui arriva l'audio.
- A 0 l'app riceve i propri valori, quindi l'audio non viene elaborato.
- Mantiene il valore tra un brano e l'altro e dopo il riavvio.
- Aggiunge un pulsante per condividere il brano in ascolto, sotto il pulsante ripeti.

La voce Intonazione nelle impostazioni Morphe apre una pagina con un selettore On/Off, che mostra
o nasconde i controlli. Su Off l'audio non viene elaborato, e tornando su On riprende l'ultimo
valore. Se l'app non ha le impostazioni Morphe, la voce è nelle impostazioni di YouTube Music.

Se la patch ufficiale "Playback speed" è impostata per cambiare il pitch insieme alla velocità,
quell'opzione può sostituire questa.

## Uso con Morphe Manager

1. Apri [Aggiungi a Morphe](https://morphe.software/add-source?github=AnTo88-svg/ytm-extras-pitch)
   dal telefono, oppure aggiungi `https://github.com/AnTo88-svg/ytm-extras-pitch` come sorgente di
   patch in Morphe Manager. Puoi anche scaricare il file `.mpp` dalle release e caricarlo a mano.
2. Mantieni anche la sorgente delle patch ufficiali.
3. Seleziona l'APK originale di YouTube Music 9.30.53 e applica le patch.
4. Per accedere all'account, applica anche la patch ufficiale "GmsCore support".

## Compilazione

Servono JDK 21 o successivo e l'Android SDK con la piattaforma 36.

```bash
cd pitch
./gradlew buildAndroid
```

Il risultato è in `pitch/patches/build/libs/`. Il plugin Gradle di Morphe si trova su GitHub
Packages, quindi crea un token personale con il permesso `read:packages` e aggiungilo a
`~/.gradle/gradle.properties`:

```properties
gpr.user = <nome utente GitHub>
gpr.key = <token>
```

## Licenza

[GNU General Public License v3.0](LICENSE) con i termini aggiuntivi in [NOTICE](NOTICE).
Questo progetto parte dal template delle patch Morphe e segue codice delle patch Morphe.
