# Shizuku op Android TV en Google TV

Installeren op Android TV heeft twee afzonderlijke eisen: de verhoogde dienst moet starten en de bediening moet met een afstandsbediening werken. Een APK die installeert of Android TV-ondersteuning vermeldt, heeft niet automatisch beide controles doorstaan. Deze handleiding gaat over televisies; [Android Auto](android-auto.md) draait vanaf je telefoon en gebruikt een andere installatiewerkwijze.

## Welke implementatie proberen?

| Optie | Praktische reden om deze op TV te overwegen | Wat je nog moet controleren |
| --- | --- | --- |
| **[Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases)** | Een vermelding in de TV-launcher en afzonderlijke afhandeling van D-pad-focus en tekstinvoer, naast opties voor dienstherstel. Een bruikbare eerste keuze als je dezelfde Shizuku-client-API wilt gebruiken als in de telefoonhandleiding. | Test het startscherm, de toestemmingsdialoog en je client met je afstandsbediening. Herstel, starten met alleen ethernet en onbeheerd opstarten na een herstart hangen af van de TV en startmethode. |
| **[Porter](https://github.com/d4rken-org/porter/releases)** | Een kleinere manager met een [TV-koppelwerkwijze](https://porter.darken.eu/setup#android-tv) die Androids koppelcode via een tijdelijke toegankelijkheidsdienst uitleest. Dat kan invoer met de afstandsbediening voorkomen. | Clients die alleen Shizuku ondersteunen hebben Porter Compatibility nodig. Toegankelijkheid voor koppelen, overlaytoestemming en de foutopsporingsmenu's van de TV moeten werken. De onderzochte `v0.8.1-rc0`-release draagt een release-candidate-naam. |

Shevery is hier niet de eerste aanbeveling voor bediening met een afstandsbediening: de gebruiker meldt onhandige TV-navigatie. Meer hulpmiddelen, autostartschakelaars of een Material 3-interface lossen D-pad-focus niet vanzelf op. Andere forks linken we hier niet zonder een extra aangetoond voordeel voor deze werkwijze. De [vergelijking van geselecteerde implementaties](shizuku.md#kies-een-implementatie) behandelt de afzonderlijke optie voor geavanceerde clients.

## Installeer en controleer eerst de afstandsbediening

1. Download de normale APK via de releases van het gekozen project en sideload die via de gebruikelijke installatiemethode van je TV. Houd de manager-APK en een eventuele compatibiliteitsapp uit elkaar.
2. Open de manager via de TV-launcher of Androids app-instellingen. Controleer of je met de afstandsbediening **Home**, de lijst met app-toestemmingen en **Settings** bereikt.
3. Open een instellingendialoog, beweeg met de D-pad tussen de bedieningselementen en verlaat hem met **Terug**. Controleer of de focus zichtbaar blijft en of een zoekveld de bediening niet vasthoudt of onverwacht aanraking vereist.
4. Kun je een Android-installatie- of toestemmingsdialoog niet met de afstandsbediening bedienen, dan kan een USB-/Bluetooth-muis daarbij helpen. Dat is een noodoplossing, geen bewijs van goede TV-bediening. Porter beschrijft [installatieproblemen op TV](https://porter.darken.eu/troubleshooting). Een TV zonder browser kan externe hulplinks mogelijk ook niet openen; lees de handleiding dan op je telefoon of computer.

Vervang een werkende TV-installatie niet alleen voor een ander uiterlijk. Volg de [instructies voor overstappen](shizuku.md#1-installeer-een-aanbieder) als een andere aanbieder nodig is. Vooral Next en Shizuku-compatibiliteitsapps kunnen conflicteren met de pakket- of toestemmingsidentiteit van een andere aanbieder.

## Start via het TV-scherm voor draadloze foutopsporing

Sommige TV's met Android 11+ tonen **Ontwikkelaarsopties → Draadloze foutopsporing**, met **Apparaat koppelen met koppelingscode**. Alleen de Android-versie bewijst niet dat de fabrikant deze bediening beschikbaar maakt.

Volg bij **Next** de koppel-/startwerkwijze van de app en de koppeldialoog op de TV. Kies bij **Porter** voor **Pairing** en volg de TV-instructies om de tijdelijke toegankelijkheidsdienst voor koppelen aan te zetten. Open de koppelcodedialoog van de TV binnen de aangegeven tijd en laat die open terwijl Porter de code uitleest. Wacht op het resultaat; het resultaatscherm meldt ook of de tijdelijke dienst is uitgezet. Kies na een geslaagde koppeling **Start**. Alleen koppelen start de verhoogde dienst niet.

Ontbreekt de bediening voor draadloze foutopsporing of werkt die niet bruikbaar op de TV, gebruik dan de computerroute hieronder. Ga er niet van uit dat telefoonuitleg met meldingen ook op een televisie werkt.

## Start vanaf een computer via het netwerk

Installeer [Googles Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools). Zet de foutopsporingsoptie van de TV aan en gebruik het adres en de poort die deze werkelijk toont.

Heeft de TV een koppelcodedialoog, voer dan uit:

```sh
adb pair TV_ADRES:KOPPELPOORT
adb connect TV_ADRES:VERBINDINGSPOORT
```

De koppelpoort en verbindingspoort kunnen verschillen. Heeft de TV een oudere optie **Netwerkfoutopsporing** zonder koppeling, gebruik dan `adb connect` met het adres en de poort uit die instructies. Ga er niet van uit dat elke TV poort 5555 gebruikt. Zet netwerkfoutopsporing alleen aan op een vertrouwd netwerk.

Keur het foutopsporingsverzoek op de TV goed en controleer de verbinding:

```sh
adb devices
```

Open de computerstartinstructies van de geïnstalleerde aanbieder en voer **de actuele opdracht van die app** uit. Gebruik `adb -s APPARAATSERIE ...` als meerdere apparaten zijn verbonden. Kopieer geen startpad van een andere fork, telefoon of oudere installatie.

## Controleer de client en het gedrag na herstart

Open de TV-app die verhoogde rechten nodig heeft en keur het verzoek goed. Stel bij Porter de compatibiliteitsapp alleen in als de client Shizuku vereist en Porter niet rechtstreeks ondersteunt. Controleer een echte handeling in de client; alleen een actieve manager bewijst geen clientcompatibiliteit.

Test daarna slaapstand/ontwaken, een volledige herstart en de netwerkverbinding die je echt gebruikt. Werken via wifi bewijst geen herstel met alleen ethernet. Automatisch koppelen, een watchdog en een autostartinstelling garanderen niet dat iedere TV onbeheerd opstart. Noteer bij een probleem het TV-model, de Android-versie, de versie van de aanbieder en welke controles wel slaagden.

## Bewijs en grenzen

De TV-selectie is gebaseerd op [Nexts TV-specifieke implementatie](https://github.com/rushiranpise/Shizuku-Next#features) en [Porters beschreven TV-werkwijze](https://porter.darken.eu/setup#android-tv), gecontroleerd op 30 oktober 2026. De onafhankelijke controle op een Android TV 16-emulator staat in het [onderzoeksverslag](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-shizuku-implementations.md). Basale afstandsbediening, volledige draadloze koppeling, clienttoestemming, compatibiliteit met echte TV-modellen en herstel na herstart zijn afzonderlijke controles; het ene bewijst het andere niet.
