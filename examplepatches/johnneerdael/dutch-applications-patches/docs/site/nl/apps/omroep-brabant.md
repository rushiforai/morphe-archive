# Omroep Brabant

**Ondersteunde app:** 11.1.0 · **Build:** 7331764 · **Bestand:** originele Play-APKS · **Android:** 12L / API 32 of nieuwer

`nl.omroepbrabant.android`

[Download de originele APKS](https://buzzheavier.com/hkxqb9c6hj02){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De patches verwijderen de onderzochte advertenties en promotionele aanbevelingen uit nieuwsoverzichten, artikelen en video. Ze stoppen ook de onderzochte lees- en kijkmetingen en optionele advertentie-ID's. Nieuws, je lokale leesgeschiedenis, radio, video en pushdiensten behouden hun bestaande werking in de code.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en aanbevelingen | Pinch, Outbrain en Start.io leveren ingebouwde advertentieplekken en promotionele widgets. Blue Billywig heeft afzonderlijke advertentieroutes voor video. | Hide ads verwijdert de onderzochte plekken, hun lege ruimte en advertentie-invoer voor video. Inhoud en de afhandeling van afspelen blijven behouden. |
| Leesmetingen | [ContentInsights/Smartocto](../trackers/additional-services.md#editorial-analytics) legt artikelen, sessies en leesactiviteit vast. [Piano](../trackers/additional-services.md#piano) ontvangt artikel- en schermcontext. Het eigen `event/readarticle`-verzoek van de uitgever bevat een artikel-ID en een van Android afgeleid apparaat-ID. | Disable tracking stopt de onderzochte verzamelaars en de afzonderlijke upload van leesgeschiedenis. Gelezen artikelen blijven in de lokale geschiedenis op je telefoon staan. |
| ID's voor bereiksonderzoek | Een zelfstandige [NMO-client](../trackers/kantar-nmo.md) gebruikt een opgeslagen willekeurig ID en geeft dat door aan Piano. Optionele advertentie-ID's kunnen records ook verbinden. | De onderzochte NMO-registratie, het opvragen van het opgeslagen ID en de optionele advertentie-ID-routes stoppen. Bestaande opgeslagen ID's zijn daarmee niet aantoonbaar gewist. |
| Videostatistieken en diagnostiek | [Blue Billywig](../trackers/additional-services.md#media-telemetry) heeft statistiekcode naast afspelen. [Firebase](../trackers/firebase.md) bevat metingen over gebruik, crashes, sessies en meldingen. Sommige records kunnen lokaal op een latere upload wachten. | De patch stopt de onderzochte statistiek- en diagnostiekverzenders en filtert vier bekende soorten opgeslagen Firebase-metingen. Onbekende soorten blijven behouden. Noodzakelijke configuratie-, installatie- en pushdiensten blijven beschikbaar. |

## Beschikbare opties

Alle drie de opties staan standaard aan.

- Hide ads verwijdert de onderzochte ingebouwde advertenties, promotionele widgets en advertentieroutes voor video.
- Disable tracking bevat Hide ads en stopt de onderzochte metingen, optionele ID's en bekende uploads uit de wachtrij.
- Skip consent screens bevat beide opties. Hij voorkomt het automatische meldingsverzoek bij het opstarten en de cookiedialoog en verwijdert **Cookie instellingen** uit het menu. Hij slaat geen toestemming of weigering op. Bestaande keuzes, handmatige Android-meldingsinstellingen en privacyschermen voor embeds die je zelf opent blijven behouden.

Met Skip consent screens schakel je meldingen zo nodig zelf in via de meldingsinstellingen van de app. [Patches kiezen](../guides/choose-patches.md) of [alle patchbeschrijvingen lezen](../reference/catalogue.md).

## Wat blijft werken en wat weten we nog niet?

Inhouds- en configuratieverzoeken blijven actief. Accounts, echte aankopen, mediatoegang, radio, livevideo, casten en Android Auto behouden hun bestaande gedrag. Door optionele metingen te verwijderen worden deze overgebleven verzoeken niet anoniem.

De onderzochte speler ontvangt nog steeds zijn eigen afspeelgebeurtenissen. Het is niet aangetoond dat webinhoud, externe scripts, overlays of door een server in de stream geplaatste advertenties verdwijnen. De precieze uploadadressen van sommige SDK's zijn niet vastgesteld. De gedeelde uitgevers- en mediahosts leveren ook nuttige inhoud; die hosts volledig blokkeren zou meer raken dan tracking.

De patches maken geen abonnement aan en ontsluiten geen inhoud die de backend achterhoudt. Gebruik de volledige originele splitset voor Android 12L+. [Installatiehandleiding](../guides/install.md).

## Bewijs

De beheerder heeft publicatie als stabiele release op 29 oktober 2026 goedgekeurd. Dit is de bestaande dev-implementatie; er wordt geen nieuwe apparaat- of netwerktest mee bedoeld. De vastgelegde controles behandelen de originele app en iedere patchselectie, ook alle patches samen. De weergave door Android, afspelen op ieder apparaat en het resterende netwerkverkeer vragen afzonderlijk runtimeonderzoek.

[Implementatie-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md) · [Bestemmingen, gegevens en resterende uitwisseling](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/privacy/omroep-brabant/README.md) · [Hoe lees je het bewijs?](../reference/methodology.md).
