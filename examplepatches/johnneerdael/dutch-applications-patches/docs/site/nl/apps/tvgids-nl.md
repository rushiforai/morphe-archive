# TVgids.nl

**Ondersteunde app:** 7.0.16 · **Build:** 106691 · **Invoer:** APK

`nl.tvgids`

[Download de originele APK](https://buzzheavier.com/tgxpzbzghwec){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je de gids gebruikt, kan de app pagina-, item-, campagne- en gebeurteniscontext naar de OSB-verzamelaar van de uitgever sturen, samen met een koppeling aan je account, een sessie-ID, de reclame-ID en, als je dat toestaat, je locatie. Een pushbericht dat op de achtergrond binnenkomt, leidt tot een apart rapport met een apparaat-ID. Daarnaast bevat de app metingen van Comscore, Sentry, Facebook en Firebase en native advertenties.

TVgids.nl zit vanaf v1.19.0 in de stabiele bundel. De gebruiker heeft de app op een telefoon getest, ook het verdwijnen van het automatische toestemmingsscherm, en de release goedgekeurd.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| OSB-verzameling en toestemmingspagina | Pagina-, item-, campagne- en gebeurteniscontext met een koppeling aan je account, een sessie-ID, de reclame-ID en je locatie als je daar toestemming voor geeft. De URL van de toestemmingspagina kan een opgeslagen `osb-cduid`, de reclame-ID of de Android-ID bevatten. | Disable tracking stopt het aanmaken van een sessie-ID, het verzamelen en doorgeven van ID's, gebeurtenissen op de voorgrond, locatie- en hervatwerk, de wachtrij en de uiteindelijke upload. Handmatige toestemming en configuratie blijven; de URL van de toestemmingspagina krijgt een lege `cduid`. |
| OSB-rapport bij pushberichten op de achtergrond | Een `received_background`-POST met een apparaat-ID, de User-Agent van app en apparaat en velden over melding, campagne en push. Dit rapport loopt buiten de verzamelaar op de voorgrond om. | Disable tracking stopt het rapport voordat de apparaat-ID wordt opgevraagd en het verzoek wordt opgebouwd. Firebase-setup en het opschonen van de cache houden hun oorspronkelijke code. |
| [Comscore](../trackers/additional-services.md#audience-measurement) | Publieks- en paginameting, configuratie van uitgever en site, inhouds- en categoriewaarden en een gegenereerde `cs_fpid`. Welke hosts zijn benaderd en met welke gegevens is niet vastgelegd. | De start, configuratie, paginameting en ID-paden in de app en in de native verzamelaar stoppen. Het gaat om meting van app en media; er is geen bewijs voor opnames via de microfoon. |
| Sentry | Fout- en crashdiagnostiek met bijbehorende context; de volledige gegevens tijdens gebruik zijn niet waargenomen. | Disable tracking volgt de beslissing bij een lege DSN naar de no-opstand van de SDK en stopt de native activering en de onderzochte opstartproviders. De DSN-waarde en native bibliotheken blijven in de APK staan. |
| [Meta/Facebook](../trackers/meta.md) | Namen en parameters van app-gebeurtenissen, een anonieme GUID voor app en apparaat, optionele attributie via de reclame-ID, app-identiteit en installatieattributie. | Instellingen voor gebeurtenissen en de reclame-ID, gebeurtenisverwerking, timers, het lezen en versturen van opgeslagen gebeurtenissen en attributietaken worden geblokkeerd. De basisinitialisatie, instellingen en inloggen dat je zelf start blijven, dus functionele Facebook-verzoeken kunnen nog plaatsvinden. |
| [Firebase](../trackers/firebase.md)-meting van berichten | Afleverstatistieken kunnen bericht- en installatie-identiteit, project- en pakketgegevens, prioriteit, TTL, onderwerp en campagnelabels bevatten. Export staat hier standaard uit, maar herstelde voorkeuren of API-aanroepen kunnen die aanzetten. Er is geen Firebase Analytics-registratie gevonden. | Analyse bij ontvangen en openen en het opnieuw aanzetten van de export worden geblokkeerd. Uit opgeslagen batches verdwijnen de aflever- en clientstatistieken. Batches met alleen telemetrie worden via de eigen foutafhandeling van de app weggegooid; andere gebeurtenistypen houden hun echte uitkomsten en herhaalpogingen. |
| Advertenties en promoties | Start en laden van native advertentie-SDK's, een verzoek om advertentieconfiguratie, huisadvertenties als terugval, de NLZIET-promotiebalk met affiliateparameters en expliciet gesponsorde onderdelen op de startpagina. | Hide ads verwijdert de advertentievakken en hun gereserveerde ruimte, de huisadvertenties, de NLZIET-balk en gesponsorde onderdelen op de startpagina, en stopt het verzoek om advertentieconfiguratie en het starten en laden van native advertenties. Niet elke mogelijke advertentiehost is in kaart gebracht. |

## Wat blijft bestaan en wat weten we nog niet?

De gids, zoeken, redactionele inhoud, accountdiensten, bewaarde items, handmatige privacykeuzes en functionele berichten blijven werken. Firebase Installations, FCM-tokens, onderwerpen, meldingen en herinneringen blijven ook, en de patch maakt deze ID's niet anoniem. Kanaalbanners zonder bewezen advertentiekenmerk blijven staan, net als links naar aanbieders en media die je zelf opent. Externe spelers, ingesloten inhoud zoals YouTube en Instagram en gekoppelde diensten kunnen zelf gegevens verzamelen. Functionele diensten ontvangen nog verzoeken en gewone verbindingsgegevens.

De oorspronkelijke toestemmingsomzetter slaat lokaal het label `ANALYTICS_STORAGE=GRANTED` op, ook als je advertentietoestemming weigert. Tracking blijft na beide keuzes geblokkeerd, en dat label alleen bewijst geen upload. Lokale geschiedenis en gegevens bij aanbieders worden niet gewist. Of de server de toestemmingspagina met een lege `cduid` accepteert, moet nog op een telefoon worden getest. Er is geen netwerkopname van een telefoon gemaakt en we beweren niet dat alle tracking verdwenen is. Gebruik een originele losse APK van precies deze versie, op Android 8.0 (API 26) of nieuwer.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie staan standaard aan. Disable tracking bevat Hide ads, en Skip consent screens bevat beide.

Skip consent screens stopt het automatische toestemmingsscherm nadat de app zelf klaar is met opstarten, nog voordat de URL van de toestemmingspagina wordt gemaakt of geopend. Open je het toestemmingsscherm zelf, dan blijven de oorspronkelijke URL en navigatie werken. Bestaande keuzes blijven staan en er wordt namens jou geen toestemming of weigering opgeslagen. Door de afhankelijkheid van tracking blijven de optionele verzamelaars geblokkeerd, wat er ook aan toestemming is opgeslagen.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen main `1817cc2`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/1817cc2/docs/tvgids-nl-audit.md), [bestemmingen, gegevens en resterende diensten](https://github.com/johnneerdael/dutch-applications-patches/blob/1817cc2/docs/privacy/tvgids-nl/README.md) en [patchbroncode](https://github.com/johnneerdael/dutch-applications-patches/tree/1817cc2/patches/src/main/kotlin/patches/tvgids). Bij native uitvoering slaagt de toestemmingswijziging voor 54 gevallen op de drie meegeleverde architecturen, inclusief de handmatige toestemmingsroute, en worden negen opzettelijke mutanten afgewezen. FULL-controles van herbouw, ondertekening en decodering leggen 270 originele Android-methodegrafen en de 24 native bibliotheken vast, en begrensde instructietests draaien op de drie meegeleverde architecturen (arm64-v8a, armeabi-v7a en x86_64). Ze tonen de Flutter-interface niet, leveren geen echte pushberichten af en bewijzen niet dat al het verkeer is verdwenen. [Zo lees je het bewijs](../reference/methodology.md).
