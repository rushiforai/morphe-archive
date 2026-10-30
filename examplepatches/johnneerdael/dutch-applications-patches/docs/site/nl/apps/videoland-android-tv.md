# Videoland Android TV

**Ondersteunde app:** 1.117.0 · **Build:** 1622 · **Invoer:** APKS · **Kanaal:** Pre-release

`nl.rtl.videoland.v2`

[Download de originele APKS](https://buzzheavier.com/56tfd9zgaf6g){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Tijdens het kijken kan Videoland advertenties laden en gebeurtenissen over je kijkgedrag, apparaat en speler versturen. Deze tv-build gebruikt de Bedrock-speler met afzonderlijke advertentie- en meetpaden. Gebruik de volledige tv-splitset.

Deze patches zitten alleen in de pre-releasebundel (1.17.0-dev.4), niet in de stabiele v1.17.0. [Ontwikkelversies installeren](../guides/install.md#een-ontwikkelversie-testen) legt uit hoe je pre-releasepatches voor deze bron aanzet.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Video-, banner- en pauzeadvertenties | De onderzochte code heeft afzonderlijke aanvragen voor advertenties en advertentiemomenten. | Hide ads geeft de bestaande lege resultaten terug voordat deze aanvragen worden verstuurd. |
| Yospace-livevideo | De speler kan een alternatieve stream uit de ontvangen lijst kiezen als de advertentiebron ontbreekt. | De patch gebruikt dat bestaande terugvalpad als een geschikte stream beschikbaar is. |
| Tealium en [Snowplow](../trackers/snowplow.md) | De code verzamelt app-, scherm- en spelergebeurtenissen en herkenningscodes. Snowplow maakt ook een opstartgebeurtenis. | De onderzochte initialisatie, registratie en verzending stoppen. |
| NPAW en New Relic | Er zijn afzonderlijke meetpaden voor de speler en app-diagnostiek. | De onderzochte speleranalyse en automatische initialisatie stoppen. |
| [Google/Firebase](../trackers/firebase.md) en [Meta](../trackers/meta.md) | Automatische metingen, advertentie-ID’s en opgeslagen Google CCT-uploads zijn in code en configuratie gevonden. | De onderzochte verzameling en uploads worden uitgeschakeld. Opgeslagen CCT-batches worden lokaal afgehandeld zonder upload. |

## Wat blijft bestaan en wat weten we nog niet?

Inhoud, inloggen, toestemming, DRM en functionele mediadiensten blijven echte serverresultaten gebruiken. De patches veranderen je abonnement niet. In deze splitset is geen PairIP gevonden, en het waargenomen opstarten werkte zonder PairIPFix. De app vraagt Android 7.0 (API 24) of nieuwer.

Afspelen met beide patches en een Premium-account is bevestigd op een 32-bits ARM-tv met Android 14. Advertenties op het betaalde abonnement met reclame zijn nog niet getest. Reclame die al in een uitzending of stream zit en livevideo zonder geschikte terugvalstream vallen buiten elke bevestigde verwijdering. [Deel een geslaagde test of een probleem](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml).

## Beschikbare opties

Disable tracking, Hide ads.

Beide staan standaard aan, ook in Simple mode. Patch je op een telefoon voor je tv, laat Optimize for device architecture dan uit.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen `4ce1498` voor tv-build 1622: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/4ce1498035b21de8d427aeed923b980b77289e68/docs/research/2026-10-29-videoland-atv.md) en [patchbron](https://github.com/johnneerdael/dutch-applications-patches/tree/4ce1498035b21de8d427aeed923b980b77289e68/patches/src/main/kotlin/patches/videolandatv). Code- en Android-runtimetests controleren de onderzochte paden, en de gebruiker bevestigt Premium-afspelen. Dit is geen volledige verkeersaudit. [Zo lees je het bewijs](../reference/methodology.md).
