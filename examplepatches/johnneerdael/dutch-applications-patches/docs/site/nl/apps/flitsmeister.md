# Flitsmeister

**Ondersteunde app:** 14.17 · **Build:** 1287 · **Invoer:** APKS

`nl.flitsmeister`

[Download de originele APKS](https://buzzheavier.com/87mpz44q4p8h){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Flitsmeister gebruikt actuele posities voor routes en waarschuwingen. Daarnaast registreert de app automatisch gebruik en bewegingen, bevat hij marketingsoftware en biedt hij betaalde partnerdiensten aan. Het onderzoek behandelt deze onderdelen afzonderlijk.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Firebase](../trackers/firebase.md) en [Insider](../trackers/insider.md) | Het onderzoek bracht gebruiksanalyse, crash-, prestatie- en sessierapportage, marketinggebeurtenissen en -profielen, geofences en opgeslagen taken in kaart. | De patch onderdrukt de onderzochte aanroepen naar de SDK’s, verzamelinstellingen en codes voor advertenties en attributie (handelingen koppelen aan een campagne of herkomst). |
| Automatische bewegingsregistraties | Footprints registreert welke waarschuwingen je onderweg tegenkomt. FCD bundelt GPS-gegevens met tijdstippen, snelheid, rijrichting en sessiecodes. | De onderzochte verzameling, opstart, timers en verzending stoppen. |
| Gebruik en ritgeschiedenis | In de code zijn metingen over navigatie en incidenten, ritstatistieken en automatische registraties van gepasseerde camera’s gevolgd. | De onderzochte uploads en luisteraars stoppen. De app blijft lokale statistieken op de bestaande manier wissen. |
| Verbonden CITS-waarschuwingen | Live GPS-uitwisseling maakt verbonden waarschuwingen mogelijk. Daarnaast zijn er optionele sensor- en evaluatiegegevens en blijvende apparaatgegevens. | De optionele meet- en apparaatgegevens stoppen. Live CITS-GPS-uitwisseling blijft aan. |
| Commerciële gebiedsberichten | De LBA-catalogus bevat commerciële berichten en berichten voor informatie en monitoring. | De patch onderdrukt commerciële registraties, bestanden en weergaven. De gedeelde catalogusgegevens en berichten voor informatie en monitoring blijven. |

## Wat blijft bestaan en wat weten we nog niet?

Live locatie verlaat de app nog via CITS. Noodzakelijke kaart- en routediensten, accountregistratie en pushregistratie blijven ook werken. Gevaarmeldingen die je zelf verstuurt en handmatige beoordelingen blijven mogelijk; automatische feedback over wegafsluitingen met GPS stopt.

Disable partner services verwijdert Parkeren, Tol en Carwash uit menu en instellingen, plus de parkeersnelkoppeling. De optie stopt ook het opvragen van klantgegevens vóór de bekende crash in native code. Niet alle onderliggende partnerklassen en deep links verdwijnen. Alle zes opties staan standaard aan.

Goedkeuring op een apparaat bewijst niet dat een Android-Auto-host de app accepteert, dat elk betaald servervoordeel werkt of dat al het verkeer is onderzocht. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable partner services, Disable tracking, Fix PairIP startup, Hide Pro notices, Hide ads, Unlock Pro.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FLITSMEISTER_PATCH_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
