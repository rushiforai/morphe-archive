# Shizuku op Android TV en Google TV

Gebruik deze handleiding voor een televisie. Volg voor een auto die met je telefoon is verbonden de [Android Auto-installatie](android-auto.md).

## Installeer de beheerapp

Probeer eerst [Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases) of gebruik [Porters TV-instructies](https://porter.darken.eu/setup#android-tv). Voor apps die alleen Shizuku ondersteunen heeft Porter de compatibiliteitsapp nodig. Behoud een werkende installatie; lees de [overstapinstructies](shizuku.md#kies-een-uitvoering) voordat je een aanbieder vervangt.

Installeer de release-APK op de TV en open die. Controleer of je met de afstandsbediening de startknoppen, applijst met toestemmingen en instellingen kunt bereiken. Een USB- of Bluetooth-muis kan helpen bij systeemvensters die slecht werken met de afstandsbediening.

## Koppelen en starten op de TV

Sommige Android 11+-TV’s hebben **Ontwikkelaarsopties → Draadloze foutopsporing → Apparaat koppelen met koppelcode**. Beschikbaarheid hangt af van de fabrikant.

1. Open de koppelfunctie van de beheerapp.
2. Open het koppelcodevenster van de TV en houd het zichtbaar.
3. Volg de instructies van de beheerapp. Porter heeft een TV-koppelhulp die tijdelijk toegankelijkheidstoegang nodig heeft.
4. Kies na geslaagd koppelen **Start** en wacht tot de dienst draait.
5. Open de app die toegang nodig heeft en keur het verzoek goed.

## Starten vanaf een computer

Installeer [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools) op een computer en schakel de foutopsporingsoptie van de TV in als koppelen op de TV ontbreekt of lastig is.

Gebruik bij draadloos koppelen het adres en de afzonderlijke poorten die de TV toont:

```sh
adb pair TV_ADDRESS:PAIRING_PORT
adb connect TV_ADDRESS:CONNECTION_PORT
```

Gebruik bij een oudere optie **Netwerkfoutopsporing** `adb connect` met het adres en de poort die de TV opgeeft. Keur het foutopsporingsverzoek goed en controleer daarna:

```sh
adb devices
```

Voer het huidige computerstartcommando van de geïnstalleerde beheerapp uit. Voeg direct na `adb` de optie `-s DEVICE_SERIAL` toe als meerdere apparaten zijn verbonden.

Controleer de app na slaapstand, ontwaken en volledig opnieuw opstarten. Automatisch starten hangt af van je TV, netwerk en startmethode; start de dienst zo nodig opnieuw.
