# NPO Start Android TV

**Ondersteunde app:** 1.48.2-2405 · **Build:** 245497937 · **Invoer:** APKS

`nl.uitzendinggemist`

[Download de originele APKS](https://buzzheavier.com/1s5dezsqvxbq){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je een programma kijkt, kan de app prerollreclame laden en speler-, publieks- en diagnosegebeurtenissen naar NPO en andere aanbieders sturen. De tv-build is beveiligd met PairIP. Daarom herstellen de patches ook delen van de opstart- en inlogcode. Vernieuw in Morphe Manager de patchbron, kies NPO Start Android TV en kies `npo-start-atv-android7.apks` als origineel invoerbestand. Controleer ook het buildnummer: een telefoon-APK met dezelfde versienaam is niet dit tv-versiedoel.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Preroll- en IMA-advertenties | De speler leest vijf optionele preroll-invoeren en kan een optionele IMA-advertentielader laden. | Hide ads laat die invoeren en de advertentielader leeg, zodat de speler zijn bestaande afspeelpad zonder advertenties gebruikt. |
| NPO Tag, Topspin en DAM | App- en spelergebeurtenissen lopen via NPO Tag/Topspin en het Govolte-pad `mob-event`. DAM- en spelersessiegegevens voeden verdere metingen. De hostnamen zijn niet vastgesteld. | Disable tracking stopt de onderzochte bronnen. Buiten dit pad is geen aparte upload van voortgang of kijkgeschiedenis gevonden. |
| STER-targeting | De optionele IMA-configuratie bouwt advertentiegegevens voor STER-targeting op. | Disable tracking verwijdert die configuratie voordat de targetinggegevens ontstaan. Functionele DASH- en Widevine-velden blijven. |
| Sentry- en [Bitmovin](../trackers/bitmovin.md)-analyse | Diagnose- en spelermeting starten samen met de app. Sentry heeft ook een prestatiemeter die bij het opstarten draait. | Disable tracking stopt de initialisatie en verwijdert die opstartmeter van Sentry. |
| Google-telemetrie en Cast-/advertentiediagnostiek | Google DataTransport verzamelt clientmetingen en uploadt opgeslagen CCT-batches. Cast-, tv-advertentie- en reclame-ID-diagnostiek hebben elk een eigen bron. | Disable tracking stopt het verzamelen en de verzendmethode. Opgeslagen batches worden lokaal weggegooid zonder upload. De diagnosebronnen stoppen, vier advertentierechten worden verwijderd en functionele Cast- en mediafuncties blijven gelijk. |

## Wat blijft bestaan en wat weten we nog niet?

Authenticatie, DRM en functionele mediadiensten blijven behouden, en aanvragen voor inhoud en inloggen gaan door. Account-, profiel- en volgfuncties, aanbevelingen en de kijkgeschiedenis van de server blijven werken. NPO blijft controleren of je account recht heeft op Plus-inhoud. De patches vervalsen geen token, abonnement of DRM-licentie. Het huidige bewijs toont niet aan dat reclame in uitzendingen, reclame die al in de stream zit of reclame op een externe Cast-ontvanger is verwijderd. Een volledige verkeersaudit staat nog open.

Netwerkwijzigingen, wisselen van audio-uitvoer, opnieuw inloggen en langer gebruik op de achtergrond en voorgrond moeten nog op een apparaat getest worden. Geef bij een probleem aan of het ontstaat bij het opstarten, inloggen of afspelen, en vermeld het programma of de zender. Een werkend Plus-account bewijst niet dat het advertentiepad voor een gratis account werkt.

Updates tussen gepatchte builds hebben dezelfde ondertekeningssleutel nodig om app-gegevens te behouden. Volg de installatiehandleiding als je de app van de uitgever vervangt, en bewaar bij het testen van een update een werkende gepatchte installer. Gebruik de volledige tv-APKS voor Android 7.0+ (API 24) via de link hierboven. Het eerdere tv-invoerbestand voor API 32 blijft ondersteund. Controleer naast het buildnummer ook de minimale SDK van de uitgever; de patches accepteren alleen de onderzochte API 24- en API 32-varianten.

## Beschikbare opties

Disable tracking, Fix PairIP startup, Hide ads.

Alle drie staan standaard aan, ook in Simple mode. Hide ads en Disable tracking bevatten allebei Fix PairIP startup. Fix PairIP startup herstelt de opstartgegevens van de tv-build, AppAuth-discovery en tokenaanvragen, en de functionele netwerk- en audiocallbacks.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen `2190e42`: [tv-onderzoek en testbewijs](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/research/2026-10-29-atv.md), [verzamelpaden en grenzen van de bestemmingen](https://github.com/johnneerdael/dutch-applications-patches/blob/e2c30be/docs/privacy/npo-start-android-tv/README.md), [PairIP-overdracht](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/NPO_START_TV_PAIRIP_HANDOVER.md) en [patchbron](https://github.com/johnneerdael/dutch-applications-patches/tree/2190e42b1877badaca7a8e1e520e83aa7e95d90a/patches/src/main/kotlin/patches/npostarttv). Afspelen met een gratis account en Hide ads plus Disable tracking is bevestigd op een 32-bits ARM-tv met Android 14. Na de reparatie van de crash bij de tokenaanvraag slaagde de gecombineerde build voor drie koude starts en liep de video zonder foutmelding door. Ook de bytecode-, manifest- en Android-runtimetests slagen. Deze controles dekken het opstarten, het begin van het afspelen en de gepatchte methoden, niet een volledig stil netwerk. [Zo lees je het bewijs](../reference/methodology.md).

Het Android 7+-invoerbestand is op 30 oktober 2026 gevalideerd: [port en testbewijs](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-npo-tv-android7.md). Installatie, opstarten en de uitgevoerde callbacks, tokenaanvragen, reclameblokkades en privacyblokkades slagen op een ARM64-emulator met API 24. Dezelfde gepatchte APK is geïnstalleerd op de ARMv7-tv van de gebruiker met Android 14; de gebruiker bevestigde dat deze werkt. Gedrag op een fysieke Android 7-tv, langdurig afspelen en volledig stil netwerkverkeer zijn nog niet geverifieerd.
