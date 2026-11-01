# Shizuku installeren en starten

Met Shizuku kunnen apps die je toestemming geeft ondersteunde Android-debugtaken uitvoeren. Root is niet nodig. Start voor Android Auto-installatie de dienst en geef KingInstaller toegang voordat je de gepatchte APK installeert.

## Kies een uitvoering

| Optie | Wanneer gebruiken? |
| --- | --- |
| [Shizuku-Next](https://github.com/rushiranpise/Shizuku-Next/releases) | De standaard voor deze handleidingen en de KingInstaller-installatie. |
| [Porter](https://github.com/d4rken-org/porter/releases) | Een alternatief met een eigen [installatiehandleiding](https://porter.darken.eu/setup). Apps die alleen Shizuku ondersteunen hebben de compatibiliteitsapp nodig. |
| [ShizukuPlus](https://github.com/thejaustin/ShizukuPlus/releases) | Een geavanceerde optie voor apps die specifiek Plus-functies vereisen. Volg de compatibiliteitsinstructies van die build. |

Behoud een werkende installatie. Volg bij overstappen de vervangingsinstructies van het gekozen project. Next en de oorspronkelijke Shizuku gebruiken verschillende ondertekeningssleutels. Porters Shizuku-compatibiliteitsapp kan niet naast een andere Shizuku-aanbieder bestaan; gebruik de begeleide migratie voordat je iets verwijdert.

Download bij de release onder **Assets** de **APK**, niet het broncodearchief, en installeer die op je telefoon.

## Starten op Android 11 of nieuwer

Deze stappen vereisen een bruikbare instelling **Draadloze foutopsporing** en meestal wifi.

1. Schakel **Ontwikkelaarsopties** in, meestal door herhaaldelijk op **Buildnummer** onder **Over de telefoon** te tikken.
2. Open **Ontwikkelaarsopties → Draadloze foutopsporing** en geef zo nodig het netwerk toestemming.
3. Open Shizuku-Next en kies draadloos koppelen. Geef de benodigde toestemming voor het koppelen.
4. Kies in Androids draadloze foutopsporing **Apparaat koppelen met koppelcode**. Houd het venster open en volg de koppelinstructies van Next.
5. Ga terug naar Next en tik op **Start**. Wacht totdat de app meldt dat de dienst draait.
6. Open KingInstaller of een andere app, zet de Shizuku-optie aan en geef die app toegang wanneer daarom wordt gevraagd.

## Starten met een computer

Installeer voor Android 10 of ouder, of zonder bruikbare draadloze foutopsporing, [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools). Schakel **USB-foutopsporing** in, verbind de telefoon en geef de computer toestemming.

Controleer de verbinding:

```sh
adb devices
```

Open de computerstartinstructies van de geïnstalleerde aanbieder en voer exact het weergegeven commando uit. Voeg bij meerdere apparaten direct na `adb` de optie `-s DEVICE_SERIAL` toe.

## Na opnieuw opstarten

Controleer of de dienst draait voordat je een app gebruikt die deze nodig heeft. Opnieuw starten kan nodig zijn. Controleer bij verbindingsproblemen de toestemming en open de app opnieuw na een overstap.

[Android Auto-installatie](android-auto.md) · [Android TV instellen](shizuku-tv.md)
