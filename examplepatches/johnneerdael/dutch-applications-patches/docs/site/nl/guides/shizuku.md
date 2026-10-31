# Shizuku installeren en starten

Met Shizuku kan een app die je toestemming geeft Androids foutopsporingsrechten gebruiken. Je apparaat wordt daarmee niet geroot. Voor de geteste [installatie voor Android Auto](android-auto.md) moet de dienst actief zijn en moet KingInstaller toestemming hebben voordat je de gepatchte APK installeert.

Gebruik bij een nieuwe installatie **Shizuku-Next** hieronder. Werkt je bestaande implementatie al met de app die je nodig hebt, dan hoef je die niet te vervangen om deze handleiding te volgen. Lees voor een televisie de afzonderlijke [handleiding voor Android TV en afstandsbediening](shizuku-tv.md).

## Kies een implementatie

Dit is een selectie, geen overzicht van iedere fork. We controleerden releases en inhoudelijk onderhoud op **30 oktober 2026** en kozen voor elke optie een praktisch voordeel.

| Implementatie | Kies deze voor | Voordeel en grenzen |
| --- | --- | --- |
| **[Shizuku-Next-releases](https://github.com/rushiranpise/Shizuku-Next/releases)** | De standaardwerkwijze in deze handleidingen; KingInstaller en gewone Shizuku-clients | Behoudt de gebruikelijke Shizuku-identiteit/API, helpt bij koppelen en dienstherstel en bevat afzonderlijke TV-focusafhandeling. Onze KingInstaller-test gebruikte deze implementatie. Herstel en automatisch starten hangen af van het apparaat en de gekozen startmethode. |
| **[Porter-releases](https://github.com/d4rken-org/porter/releases)** | Een kleinere, gerichte rechtenbrug; een alternatief voor koppelen op TV | Richt zich op de brug, niet op een uitgebreide gereedschapskist. De TV-koppeling kan de code uit Androids dialoog lezen. Apps die alleen Shizuku ondersteunen hebben een aparte compatibiliteitsapp nodig; gebruik de [begeleide overstap](https://porter.darken.eu/compatibility). Dit is geen geteste vervanger voor Next in onze KingInstaller-werkwijze. De onderzochte release heette `v0.8.1-rc0`; lees de release-informatie voordat je een build kiest. |
| **[ShizukuPlus-releases](https://github.com/thejaustin/ShizukuPlus/releases)** | Een app of integratie die expliciet de [Plus-API's](https://github.com/thejaustin/ShizukuPlus-API) of Device Owner/Dhizuku-integratie nodig heeft | Voegt interfaces toe bovenop de gewone Shizuku-API. Die vereisen een geschikte client en maken shellrechten niet gelijk aan root. Builds met een eigen pakketnaam en drop-in-builds verschillen in compatibiliteit; recente releases bevatten testversies. Dit is een geavanceerde optie, niet nodig voor KingInstaller. |

De [Awesome Shizuku-lijst](https://github.com/timschneeb/awesome-shizuku#shizuku-implementations) helpt bij het vinden van projecten. De waarschuwing daar over Android 17-compatibiliteit van de oorspronkelijke app is een reden om de oude upstream-download hier niet als standaard te kiezen. We bevelen niet automatisch elk project uit die lijst aan. Alleen een recente commit of een nieuw uiterlijk is geen reden om over te stappen.

Shevery wordt nog actief ontwikkeld als uitgebreide gereedschapskist, maar de gebruiker meldde onprettige navigatie met een TV-afstandsbediening. Daarom is het hier niet de standaardaanbeveling voor TV. De TV-handleiding behandelt bediening en het kunnen starten van de dienst als afzonderlijke vragen.

## 1. Installeer één aanbieder

Download de normale release-APK via **Releases → Assets** van het gekozen project. Broncodearchieven met ZIP/TAR zijn geen Android-apps; een debug-APK is niet de normale gebruikersdownload. Installeer de APK en geef je browser of bestandsbeheerder zo nodig toestemming om vanuit die bron apps te installeren.

**Overstappen is iets anders dan bijwerken.** Next gebruikt dezelfde pakketidentiteit als de oorspronkelijke Shizuku, maar een andere ondertekeningssleutel. Stop de oude dienst en volg de vervangingsinstructies van het project voordat je Next installeert. Verwijder alleen de oude aanbieder als dat nodig is, niet KingInstaller of je gepatchte apps. Mogelijk moet je opnieuw koppelen en clients toestemming geven. Een oude server kan actief blijven totdat je hem stopt of het apparaat herstart.

Porter is een uitzondering op een algemeen verwijderadvies: losse Porter kan naast Shizuku bestaan voor apps met een aanbiederkeuze. **Porter Compatibility kan niet naast een andere aanbieder met de Shizuku-identiteit/toestemming bestaan.** Start Porter en gebruik het begeleide vervangings- en importscherm voordat je zelf iets verwijdert. Lees bij Plus de compatibiliteitsinstructies van de gekozen build; installeer niet meerdere concurrerende compatibiliteitsapps.

## 2. Start zonder root vanaf Android 11

Je hebt een telefoon nodig waarop **Draadloze foutopsporing** beschikbaar is, meestal met een wifi-verbinding. Menunamen verschillen per fabrikant.

1. Open zo nodig **Instellingen → Over de telefoon → Buildnummer** en tik herhaaldelijk op het buildnummer om **Ontwikkelaarsopties** aan te zetten.
2. Zet in **Ontwikkelaarsopties** de foutopsporingsopties aan die de gekozen app vereist en open **Draadloze foutopsporing**. Accepteer de netwerktoestemming als Android daarom vraagt.
3. Open Next en kies de werkwijze voor koppelen/starten via draadloze foutopsporing. Geef de gevraagde toestemmingen voor meldingen en toegang tot het lokale netwerk of apparaten in de buurt.
4. Kies in Androids scherm **Draadloze foutopsporing** voor **Apparaat koppelen met koppelingscode**. Laat die dialoog open. Volg Nexts koppelinstructies; vul de code zelf in als automatisch uitlezen niet lukt.
5. Ga terug naar Next en start de dienst. Koppelen en starten zijn afzonderlijke stappen. Wacht totdat de app meldt dat de dienst actief is.
6. Open de clientapp, bijvoorbeeld KingInstaller, zet diens optie **Shizuku** aan en keur het verzoek goed. Geef toestemming aan de bedoelde client, niet aan alle geïnstalleerde apps.

Gebruik bij Porter de eigen [installatie- en koppelhandleiding](https://porter.darken.eu/setup) en stel de compatibiliteitsapp in als de client alleen Shizuku ondersteunt. Deze stappen geven foutopsporingsrechten, geen root. Sommige fabrikanten beperken wat shellrechten kunnen doen.

## 3. Als draadloze foutopsporing ontbreekt

Gebruik voor Android 10 en ouder, of een apparaat zonder bruikbaar scherm voor draadloze foutopsporing, de **computer/USB-startmethode** van de aanbieder. Installeer [Googles Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools), zet USB-foutopsporing aan, verbind het apparaat, geef de computer toestemming en voer uit:

```sh
adb devices
```

Open de startinstructies van de geïnstalleerde aanbieder en kopieer **de opdracht die deze nu toont**. Voer die op de computer uit. Hergebruik geen startpad van een andere fork of oudere installatie; APK-paden en startprogramma's kunnen veranderen. Voeg bij meerdere apparaten `-s APPARAATSERIE` direct na `adb` toe.

Op een apparaat dat al geroot is kan de aanbieder een root-startoptie bieden. Je telefoon rooten is geen voorwaarde voor de Android Auto-werkwijze; deze handleiding vraagt daar niet om.

## 4. Controleer na een herstart of update

Een geïnstalleerde manager-APK betekent niet dat de verhoogde dienst actief is. Controleer na een herstart de status voordat je een client gebruikt die de dienst nodig heeft. Zet automatisch starten/herstel alleen aan als de gekozen methode dit ondersteunt en test daarna een echte herstart. Koppelgegevens, een watchdog of een autostartschakelaar bewijzen niet dat de dienst bleef draaien of opnieuw startte.

Ziet een client de aanbieder niet, controleer dan de toestemming, de actieve server en de vereiste compatibiliteitsapp/build. Stop de client geforceerd en open hem opnieuw na een overstap. Meldt Android **INSTALL_FAILED_DUPLICATE_PERMISSION**, los dan het conflict tussen aanbieders of compatibiliteitsapps op in plaats van er nog meer APK's overheen te installeren.

## Bronnen en controle

Onze selectie is gebaseerd op [Nexts beschreven mogelijkheden](https://github.com/rushiranpise/Shizuku-Next#features), [Porters documentatie voor installatie en compatibiliteit](https://porter.darken.eu/setup) en [Plus' clientvereisten](https://github.com/thejaustin/ShizukuPlus#-third-party-app-compatibility). De [oorspronkelijke opstarthandleiding](https://shizuku.rikka.app/guide/setup/) legt Androids basisstartmethoden uit; gebruik de actuele opdracht en compatibiliteitsinstructies van de gekozen fork.

KingInstaller met Next is getest op een Android 16-emulator; de gebruiker bevestigde de werkende KingInstaller-installatie op de telefoon. Niet elke combinatie van aanbieder/client of elk Android 17-apparaat is getest. Bij [Android TV](shizuku-tv.md) staan de afzonderlijke TV-beoordeling en de grenzen daarvan.
