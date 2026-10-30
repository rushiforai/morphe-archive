# Flitsmeister

**Ondersteunde app:** 14.17 · **Build:** 1287 · **Invoer:** APKS

`nl.flitsmeister`

[Download de originele APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Nieuw in [patchbundel v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.19.2): de Android Auto-fix herstelt de verbindingsupdates die door de eerdere PairIP-opstartfix waren uitgeschakeld. Ook noodzakelijke callbacks voor audio, netwerk, locatie en achtergrondtaken werken weer. De gebruiker bevestigde dat Flitsmeister in de Android Auto-appkiezer verschijnt, de kaart opent en zonder crashes werkt op de geteste telefoon en auto.

Flitsmeister gebruikt actuele posities voor routes en waarschuwingen. Daarnaast registreert de app automatisch gebruik en bewegingen, bevat hij marketingsoftware en biedt hij betaalde partnerdiensten aan. Het onderzoek behandelt deze onderdelen afzonderlijk.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Android Auto en achtergrondtaken | De eerdere PairIP-opstartfix liet noodzakelijke verbindings- en andere systeemcallbacks weg; een WorkManager-taak kon daardoor geen geldig resultaat teruggeven. | Fix PairIP startup herstelt dertien functionele callbacks, waaronder de Android Auto-verbindingsupdate en het resultaat van achtergrondtaken. |
| [Firebase](../trackers/firebase.md) en [Insider](../trackers/insider.md) | Het onderzoek bracht gebruiksanalyse, crash-, prestatie- en sessierapportage, marketinggebeurtenissen en -profielen, geofences en opgeslagen taken in kaart. | De patch onderdrukt de onderzochte aanroepen naar de SDK’s, verzamelinstellingen en codes voor advertenties en attributie (handelingen koppelen aan een campagne of herkomst). |
| Automatische bewegingsregistraties | Footprints registreert welke waarschuwingen je onderweg tegenkomt. FCD bundelt GPS-gegevens met tijdstippen, snelheid, rijrichting en sessiecodes. | De onderzochte verzameling, opstart, timers en verzending stoppen. |
| Gebruik en ritgeschiedenis | In de code zijn metingen over navigatie en incidenten, ritstatistieken en automatische registraties van gepasseerde camera’s gevolgd. | De onderzochte uploads en luisteraars stoppen. De app blijft lokale statistieken op de bestaande manier wissen. |
| Verbonden CITS-waarschuwingen | Live GPS-uitwisseling maakt verbonden waarschuwingen mogelijk. Daarnaast zijn er optionele sensor- en evaluatiegegevens en blijvende apparaatgegevens. | De optionele meet- en apparaatgegevens stoppen. Live CITS-GPS-uitwisseling blijft aan. |
| Commerciële gebiedsberichten | De LBA-catalogus bevat commerciële berichten en berichten voor informatie en monitoring. | De patch onderdrukt commerciële registraties, bestanden en weergaven. De gedeelde catalogusgegevens en berichten voor informatie en monitoring blijven. |

## Wat blijft bestaan en wat weten we nog niet?

Live locatie verlaat de app nog via CITS. Noodzakelijke kaart- en routediensten, accountregistratie en pushregistratie blijven ook werken. Gevaarmeldingen die je zelf verstuurt en handmatige beoordelingen blijven mogelijk; automatische feedback over wegafsluitingen met GPS stopt.

Disable partner services verwijdert Parkeren, Tol en Carwash uit menu en instellingen, plus de parkeersnelkoppeling. De optie stopt ook het opvragen van klantgegevens vóór de bekende crash in native code. Niet alle onderliggende partnerklassen en deep links verdwijnen. Alle zes opties staan standaard aan.

Op 30 oktober 2026 bevestigde de gebruiker dat Flitsmeister in de Android Auto-appkiezer verschijnt, de kaart opent en zonder crashes werkt op de geteste telefoon en auto. Andere hosts, elk betaald servervoordeel en volledig verkeersonderzoek zijn nog niet geverifieerd. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

Werk de patchbron in Morphe Manager bij naar stable v1.19.2 of een nieuwere stabiele release, patch opnieuw met de originele Flitsmeister 14.17 / 1287-APKS en houd Fix PairIP startup ingeschakeld. Installeer het nieuwe resultaat met dezelfde ondertekeningssleutel als je bestaande gepatchte app om je gegevens te behouden. Alleen de patchbron bijwerken verandert de geïnstalleerde app niet. Android Auto vereist nog steeds een echte Flitsmeister-aanmelding en acceptatie door de autohost. Ontbreekt de app daarna nog in de autolauncher, controleer dan ook de installatieherkomst zoals beschreven in de technische bevindingen. [Callbackcontroles en resterende grenzen](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/privacy/flitsmeister/README.md#runtime-callback-restoration).

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026 tegen [stable v1.19.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.19.2), commit `a739a8b`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/FLITSMEISTER_PATCH_AUDIT.md) en [callbackcontroles](https://github.com/johnneerdael/dutch-applications-patches/blob/a739a8b8ddc0da5c7b9f563ed5436c429dccbc27/docs/privacy/flitsmeister/README.md#runtime-callback-restoration). De reparatie doorstaat 49 synthetische Android Runtime-gedragstests en controles van de gegenereerde APK. De Android Auto-appkiezer en kaart zijn op de geteste telefoon en auto bevestigd; andere hosts, alle rijscenario's en backendfuncties zijn niet volledig getest. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
