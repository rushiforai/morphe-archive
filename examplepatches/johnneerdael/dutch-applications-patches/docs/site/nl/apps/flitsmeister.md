# Flitsmeister

**Ondersteunde app:** 14.17 · **Build:** 1287 · **Invoer:** APKS

`nl.flitsmeister`

[Download de originele APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Nieuw in [patchbundel v1.23.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.23.1): Disable tracking voorkomt de vastgestelde Insider-crash bij het begin van een rit. De app riep nog marketingfuncties aan terwijl de bijbehorende SDK niet was gestart. Beide berichtschakelaars keren nu veilig terug; de rijstatuswaarnemer en bestaande privacymaatregelen blijven behouden. Deze gerichte reparatie is op Android Runtime gecontroleerd. Een echte rijtest van deze versie is nog niet uitgevoerd.

Flitsmeister gebruikt actuele posities voor routes en waarschuwingen. Daarnaast registreert de app automatisch gebruik en bewegingen, bevat hij marketingsoftware en biedt hij betaalde partnerdiensten aan. Het onderzoek behandelt deze onderdelen afzonderlijk.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Insider bij het begin van een rit | De rijstatuswaarnemer schakelt marketingberichten uit. De oude berichtschakelaar crashte als Disable tracking de SDK-initialisatie had gestopt. | Disable tracking laat beide Insider-berichtschakelaars veilig terugkeren zonder de SDK opnieuw te starten of de rijstatuswaarnemer te wijzigen. |
| Installatieherkomst voor Android Auto | De onderzochte host weigert deze Car App Library-app na een gewone Shizuku-installatie. Het vinkje Onbekende bronnen laat deze appcategorie niet toe. | Behoud de crashreparatie en gebruik de KingInstaller-werkwijze hieronder; andere patchopties herstellen de installatieherkomst niet. |
| Android Auto en achtergrondtaken | De eerdere PairIP-opstartfix liet noodzakelijke verbindings- en andere systeemcallbacks weg; een WorkManager-taak kon daardoor geen geldig resultaat teruggeven. | Fix PairIP startup herstelt dertien functionele callbacks, waaronder de Android Auto-verbindingsupdate en het resultaat van achtergrondtaken. |
| [Firebase](../trackers/firebase.md) en [Insider](../trackers/insider.md) | Het onderzoek bracht gebruiksanalyse, crash-, prestatie- en sessierapportage, marketinggebeurtenissen en -profielen, geofences en opgeslagen taken in kaart. | De patch onderdrukt de onderzochte aanroepen naar de SDK’s, verzamelinstellingen en codes voor advertenties en attributie (handelingen koppelen aan een campagne of herkomst). |
| Automatische bewegingsregistraties | Footprints registreert welke waarschuwingen je onderweg tegenkomt. FCD bundelt GPS-gegevens met tijdstippen, snelheid, rijrichting en sessiecodes. | De onderzochte verzameling, opstart, timers en verzending stoppen. |
| Gebruik en ritgeschiedenis | In de code zijn metingen over navigatie en incidenten, ritstatistieken en automatische registraties van gepasseerde camera’s gevolgd. | De onderzochte uploads en luisteraars stoppen. De app blijft lokale statistieken op de bestaande manier wissen. |
| Verbonden CITS-waarschuwingen | Live GPS-uitwisseling maakt verbonden waarschuwingen mogelijk. Daarnaast zijn er optionele sensor- en evaluatiegegevens en blijvende apparaatgegevens. | De optionele meet- en apparaatgegevens stoppen. Live CITS-GPS-uitwisseling blijft aan. |
| Commerciële gebiedsberichten | De LBA-catalogus bevat commerciële berichten en berichten voor informatie en monitoring. | De patch onderdrukt commerciële registraties, bestanden en weergaven. De gedeelde catalogusgegevens en berichten voor informatie en monitoring blijven. |

## Wat blijft bestaan en wat weten we nog niet?

Live locatie verlaat de app nog via CITS. Noodzakelijke kaart- en routediensten, accountregistratie en pushregistratie blijven ook werken. Gevaarmeldingen die je zelf verstuurt en handmatige beoordelingen blijven mogelijk; automatische feedback over wegafsluitingen met GPS stopt.

Disable partner services verwijdert Parkeren, Tol en Carwash uit menu en instellingen, plus de parkeersnelkoppeling. De optie stopt ook het opvragen van klantgegevens vóór de bekende crash in native code. Niet alle onderliggende partnerklassen en deep links verdwijnen. Alle zes opties staan standaard aan.

Op 30 oktober 2026 bevestigde de gebruiker dat Flitsmeister in de Android Auto-appkiezer verschijnt en de kaart opent op de geteste telefoon en auto. Dat was geen volledige rijtest en bewijst niet dat de toenmalige versie vrij was van rijgerelateerde crashes. Andere hosts, elk betaald servervoordeel en volledig verkeersonderzoek zijn nog niet geverifieerd. Die acceptatie betrof de originele Android 12L+-Play-splitset.

De patches accepteren ook de door de uitgever ondertekende Android 10+-variant van 14.17 / 1287. De downloadknop hierboven biedt de bestaande Android 12L+-splitset; Android 10-apparaten hebben de API 29-APKM van de uitgever als invoer nodig. Alle zes opties doorstaan compilatie en onafhankelijke APK-controles, met behoud van minSDK 29; de Android 12L+-variant blijft ondersteund. Gebruik een patchbundel met deze compatibiliteitsupdate: v1.19.2 weigert deze invoer. Werking op een Android 10-apparaat of in de auto is nog niet geverifieerd. [Variantcontroles](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-flitsmeister-android10.md).

## Beschikbare opties

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

Werk de patchbron in Morphe Manager bij naar de nieuwste stabiele release, patch opnieuw met de originele Flitsmeister 14.17 / 1287-APKS en houd Fix PairIP startup en Disable tracking ingeschakeld. Installeer het nieuwe resultaat met dezelfde ondertekeningssleutel als je bestaande gepatchte app om je gegevens te behouden. Alleen de patchbron bijwerken verandert de geïnstalleerde app niet. Android Auto vereist nog steeds een echte Flitsmeister-aanmelding en acceptatie door de autohost.

Verdwijnt Flitsmeister na een herinstallatie uit Android Auto, volg dan de [installatiehandleiding voor Android Auto](../guides/android-auto.md). [Installeer en start Shizuku-Next](../guides/shizuku.md) en download [KingInstaller](https://github.com/fcaronte/KingInstaller/releases) en gebruik Morphes optie voor **KingInstaller als externe installer**:

Start Shizuku en geef KingInstaller toestemming om deze dienst te gebruiken. Kies **KingInstaller** als externe installer in Morphe en stuur de gepatchte APK ernaartoe. Schakel in KingInstaller **Shizuku** in, kies **Install as king** en bevestig **Bijwerken** in het Android-installatiescherm.

De gebruiker bevestigde dat KingInstaller op de fysieke telefoon werkt. Een nieuwe controle op de telefoon bevestigde de vereiste installatieherkomst; een onafhankelijke emulatortest via KingInstallers echte schermen herstelde de zichtbaarheid in de Android Auto-applijst. Behoud de bestaande ondertekeningssleutel en werk de app bij zonder deze te verwijderen; de crashreparatie blijft ingeschakeld. Een nieuwe autosessie en andere hosts zijn nog niet geverifieerd.

De ingebouwde System installer- en Shizuku-modi van Morphe Manager 2.3.0, inclusief hun Play Store-vinkje, leverden in de geteste paden niet de vereiste herkomst op. Ontwikkelaarsmodus en Onbekende bronnen in Android Auto waren voor deze appcategorie niet voldoende. [Installatiebewijs en terugvaloptie voor ontwikkelaars](https://github.com/johnneerdael/dutch-applications-patches/blob/8a7d2c0b5bf20a653ced309e4d93858e3c788ced/docs/research/2026-10-30-flitsmeister-android-auto-installer.md#remediation-and-validation-boundary).

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Het [onderzoek naar de installatieherkomst voor Android Auto](https://github.com/johnneerdael/dutch-applications-patches/blob/8a7d2c0b5bf20a653ced309e4d93858e3c788ced/docs/research/2026-10-30-flitsmeister-android-auto-installer.md) vergelijkt de uitgegeven v1.23.0- en v1.23.1-bundels en hun gepatchte APK’s. De Android Auto-declaraties, resources en callbacks zijn gelijk; de crashreparatie wijzigt alleen beide Insider-berichtschakelaars. Een afzonderlijke emulatortest reproduceert de weigering na een Shell-installatie met ontwikkelaarsmodus en Onbekende bronnen ingeschakeld.

Beoordeeld op 30 oktober 2026: de Insider-reparatie uit [PR #54](https://github.com/johnneerdael/dutch-applications-patches/pull/54), commit `0f3ffee`, met [vastgepinde bron en technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/0f3ffee7bb4086c1b053bc610f5c5484bb674ea5/docs/FLITSMEISTER_PATCH_AUDIT.md#insider-message-toggles-during-driving). De volledige Android-build en de oorspronkelijke arm64-validatiematrix slagen. Op de telefoon reproduceren vijf gerichte Android Runtime-tests de oude fout; drie reparatietests slagen, waaronder honderd stilstand/rijden/stilstand-cycli. De tests voeren de uitgegeven SDK-methoden uit met vervangende afhankelijkheden; ze simuleren geen GPS-rit of volledige app. De eerdere Android Auto-callbackreparatie is afzonderlijk [vastgelegd bij v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/privacy/flitsmeister/README.md#runtime-callback-restoration). Andere hosts, echte rijscenario's, backendfuncties en volledig netwerkverkeer zijn niet uitputtend getest. [Zo lees je het bewijs](../reference/methodology.md).
