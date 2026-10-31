# NPO Start

**Ondersteunde app:** 1.48.2-2405 · **Build:** 240497937 · **Invoer:** APKS

`nl.uitzendinggemist`

[Download de originele APKS](https://buzzheavier.com/ys1rjymo12zp){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Bij het afspelen kan de app prerollreclame laden en publieks-, speler- en diagnosegebeurtenissen versturen. De patches ondersteunen de Android-app voor telefoons en tablets op Android 12L (API 32) of nieuwer. Vernieuw de patchbron in Morphe Manager, kies NPO Start en selecteer het volledige bestand `npo-start.apks`. Controleer naast de versienaam ook build 240497937; het Android TV-invoerbestand heeft een andere buildcode.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Preroll- en IMA-reclame | Vijf concrete preroll-getters en een optionele IMA-loader leveren reclame-invoer aan de speler. | Hide ads maakt deze invoer leeg en behoudt de bestaande afspeelroute zonder clientreclame. |
| NPO Tag, Topspin en DAM | App- en spelergebeurtenissen gaan naar NPO Tag-providers en de verzendpaden van Govolte/Topspin en NMO DAM. | Disable tracking maakt de providerset leeg en stopt de onderzochte gebeurtenis- en sessieproducenten. |
| STER-targeting | Optionele STER-configuratie en streamaanvragen bevatten targetinggegevens voor reclame. | Disable tracking verwijdert die optionele invoer en behoudt inhouds- en DRM-velden. |
| Sentry- en Bitmovin-analytics | De app bevat diagnose- en spelermeetsystemen, waaronder een Sentry-provider voor opstartmetingen. | Disable tracking stopt de onderzochte grenzen en automatische verzamelvlaggen en verwijdert de performance-provider. |
| Google-telemetrie en Cast-diagnostiek | DataTransport verzamelt gebeurtenissen en kan oude CCT-batches uploaden. Cast- en reclame-ID-diagnostiek hebben eigen producenten. | Disable tracking stopt de onderzochte verzamel- en verzendgrenzen; oude batches krijgen lokaal een getypeerde fatale respons. Vier reclamepermissies verdwijnen. |
| PairIP en functionele mediacallbacks | Deze build beveiligt opstarten, discovery, een receiver voor media/audio/netwerk en twee asynchrone Cast-afbeeldingsladers. | Fix PairIP startup herstelt de exacte opstartgegevens en functionele callbacks, inclusief echte bitmapaanvragen via Binder en het laden van Cast-iconen met de oorspronkelijke cache. |

## Wat blijft bestaan en wat weten we nog niet?

Inhoud, authenticatie, account- en profielfuncties en DRM blijven behouden. NPO blijft controleren op accountrechten, waaronder Plus-toegang. De oorspronkelijke tokenaanvraag van de telefoon-app en de validatiecallbacks blijven ongewijzigd. De patches maken geen account, abonnement, token of DRM-licentie aan.

Reclame in uitzendingen, reclame die al in een stream zit en reclame op externe Cast-ontvangers vallen buiten deze acceptatie. Volledig stil netwerkverkeer, langdurig afspelen, alle fysieke audio- en netwerkwijzigingen en iedere ABI zijn nog niet geverifieerd. Het verwijderen van de onderzochte meetgebeurtenissen kan invloed hebben op daarvan afgeleide aanbevelingen en kijkgeschiedenis.

Het invoerbestand vereist Android 12L (API 32) of nieuwer. Updates tussen gepatchte builds vereisen dezelfde ondertekeningssleutel om app-gegevens te behouden. Gebruik de volledige originele splitset; telefoon- en tv-builds met dezelfde pakket- en versienaam zijn afzonderlijke ondersteunde doelen.

## Beschikbare opties

Disable tracking, Fix PairIP startup, Hide ads.

Alle drie staan standaard aan, ook in Simple mode. Hide ads en Disable tracking bevatten Fix PairIP startup. Functionele Cast-afbeeldingen en mediaknoppen blijven behouden; diagnoseproducenten worden afzonderlijk gestopt.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Gevalideerd op 30 oktober 2026: [telefoonport en PairIP-onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-npo-start-phone.md). Alle 110.188 contracten van oorspronkelijke methoden slagen, samen met controles van vastgelegde opstartgegevens, helpers en manifest. Eenenvijftig controles op de werkelijke APK slagen op emulators met Android 14 en Android 16, inclusief levering aan een echte MediaSession, asynchrone bitmapaanvragen via Binder en de Cast-icooncache. Frida identificeerde beveiligde afbeeldingstaken die voor het herstel faalden en daarna hun echte resultaat leverden. De gecorrigeerde APK zonder Gadget werkte de OnePlus-telefoon met Android 16 bij zonder app-gegevens te wissen; de gebruiker herhaalde de mislukte handeling en bevestigde dat deze werkt. Deze controles bewijzen geen volledig stil netwerkverkeer. [Zo lees je het bewijs](../reference/methodology.md).
