# Omroep Brabant

**Ondersteunde app:** 11.1.0 · **Build:** 7331764 · **Invoer:** APKS

`nl.omroepbrabant.android`

[Download de originele APKS](https://buzzheavier.com/hkxqb9c6hj02){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De patches verwijderen de onderzochte advertenties en promotionele aanbevelingen uit nieuwsoverzichten, artikelen en video. Ze stoppen ook de onderzochte lees- en kijkmetingen en optionele advertentie-ID's. Nieuws, je lokale leesgeschiedenis, radio, video en pushdiensten werken via hun bestaande code.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en aanbevelingen | Pinch, Outbrain en Start.io leveren ingebouwde advertentieplekken en promotionele widgets. Blue Billywig heeft afzonderlijke advertentieroutes voor video. | Hide ads verwijdert de onderzochte plekken, hun lege ruimte en advertentie-invoer voor video. Inhoud en de afhandeling van afspelen blijven behouden. |
| Leesmetingen | [ContentInsights/Smartocto](../trackers/additional-services.md#editorial-analytics) legt artikelen, sessies en leesactiviteit vast. [Piano](../trackers/additional-services.md#piano) ontvangt artikel- en schermcontext. Het eigen `event/readarticle`-verzoek van de uitgever bevat een artikel-ID en een van Android afgeleid apparaat-ID. | Disable tracking stopt de onderzochte verzamelaars en de afzonderlijke upload van leesgeschiedenis. Gelezen artikelen blijven in de lokale geschiedenis op je telefoon staan. |
| ID's voor bereiksonderzoek | Een zelfstandige [NMO-client](../trackers/kantar-nmo.md) gebruikt een opgeslagen willekeurig ID en geeft dat door aan Piano. Optionele advertentie-ID's kunnen records ook verbinden. | De onderzochte NMO-registratie, het opvragen van het opgeslagen ID en de optionele advertentie-ID-routes stoppen. Bestaande opgeslagen ID's zijn daarmee niet aantoonbaar gewist. |
| Videostatistieken en diagnostiek | [Blue Billywig](../trackers/additional-services.md#media-telemetry) heeft statistiekcode naast afspelen. [Firebase](../trackers/firebase.md) bevat metingen over gebruik, crashes, sessies en meldingen. Sommige records kunnen lokaal op een latere upload wachten. | De patch stopt de onderzochte statistiek- en diagnostiekverzenders en filtert vier bekende soorten opgeslagen Firebase-metingen. Onbekende soorten blijven behouden. Noodzakelijke configuratie-, installatie- en pushdiensten blijven beschikbaar. |

## Wat blijft bestaan en wat weten we nog niet?

Inhouds- en configuratieverzoeken blijven actief. Accounts, echte aankopen, mediatoegang, radio, livevideo, casten en Android Auto werken zoals voorheen. Door optionele metingen te verwijderen worden deze overgebleven verzoeken niet anoniem.

De onderzochte speler ontvangt nog steeds zijn eigen afspeelgebeurtenissen. Het is niet aangetoond dat webinhoud, externe scripts, overlays of door een server in de stream geplaatste advertenties verdwijnen. De precieze uploadadressen van sommige SDK's zijn niet vastgesteld. De gedeelde uitgevers- en mediahosts leveren ook nuttige inhoud, dus die hosts volledig blokkeren zou meer raken dan tracking.

De patches maken geen abonnement aan en ontsluiten geen inhoud die de backend achterhoudt. Gebruik de volledige originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie de opties staan standaard aan. Hide ads verwijdert de onderzochte ingebouwde advertenties, promotionele widgets en advertentieroutes voor video. Disable tracking omvat Hide ads en stopt de onderzochte metingen, optionele ID's en bekende uploads uit de wachtrij.

Skip consent screens omvat beide opties. De patch voorkomt het automatische meldingsverzoek bij het opstarten en de cookiedialoog en haalt Cookie instellingen uit het menu. Er wordt geen toestemming of weigering opgeslagen. Bestaande keuzes, handmatige Android-meldingsinstellingen en privacyschermen voor embeds die je zelf opent blijven behouden. Met deze optie zet je meldingen zo nodig zelf aan in de meldingsinstellingen van de app.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

De beheerder heeft op 29 oktober 2026 publicatie als stabiele release goedgekeurd. Bewijs vastgepind op `a01857d`: [implementatie-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md) en [bestemmingen, gegevens en resterende uitwisseling](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/privacy/omroep-brabant/README.md). De goedkeuring maakt de bestaande dev-implementatie stabiel en betekent geen nieuwe apparaat- of netwerktest. De vastgelegde controles behandelen de originele app en iedere patchselectie, ook alle patches samen. De weergave door Android, afspelen op ieder apparaat en het resterende netwerkverkeer vragen afzonderlijk runtimeonderzoek. [Zo lees je het bewijs](../reference/methodology.md).
