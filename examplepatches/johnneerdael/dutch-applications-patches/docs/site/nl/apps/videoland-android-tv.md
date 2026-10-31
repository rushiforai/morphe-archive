# Videoland Android TV

**Ondersteunde app:** 1.117.0 · **Build:** 1622 · **Invoer:** APKS

`nl.rtl.videoland.v2`

[Download de originele APKS](https://buzzheavier.com/56tfd9zgaf6g){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Videoland kan advertenties laden en gegevens over je kijkgedrag, apparaat en speler versturen. Deze stabiele patches beperken de onderzochte advertentie- en meetpaden en maken de catalogus overzichtelijker voor gratis accounts. Gebruik de volledige tv-splitset.

Afspelen en navigeren zijn met zowel Premium- als gratis accounts getest. Met een gratis of TV Gemist-account blijven de afleveringen beschikbaar die Videoland op dat moment aan dat account aanbiedt. De patches geven je geen abonnement en ontgrendelen geen betaalde afleveringen.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Video-, banner- en pauzeadvertenties | De onderzochte code heeft afzonderlijke aanvragen voor advertenties en advertentiemomenten. | Hide ads geeft de bestaande lege resultaten terug voordat deze aanvragen worden verstuurd. |
| Yospace-livevideo | De speler kan een alternatieve stream uit de ontvangen lijst kiezen als de advertentiebron ontbreekt. | De patch gebruikt dat bestaande terugvalpad als een geschikte stream beschikbaar is. |
| Tealium en [Snowplow](../trackers/snowplow.md) | De code verzamelt app-, scherm- en spelergebeurtenissen en herkenningscodes. Snowplow maakt ook een opstartgebeurtenis. | De onderzochte initialisatie, registratie en verzending stoppen. |
| NPAW en New Relic | Er zijn afzonderlijke meetpaden voor de speler en app-diagnostiek. | De onderzochte speleranalyse en automatische initialisatie stoppen. |
| [Google/Firebase](../trackers/firebase.md) en [Meta](../trackers/meta.md) | Automatische metingen, advertentie-ID’s en opgeslagen Google CCT-uploads zijn in code en configuratie gevonden. | De onderzochte verzameling en uploads worden uitgeschakeld. Opgeslagen CCT-batches worden lokaal afgehandeld zonder upload. |
| Catalogusinhoud waarvoor een abonnement nodig is | Videoland markeert sommige primaire acties als abonnementsgebonden. Een serie kan beschikbare en betaalde afleveringen bevatten. | Hide unavailable content verwijdert die kaarten en abonneerknoppen. Programma-informatie en beschikbare afleveringen blijven zichtbaar. |
| Lege seizoenen en volgende pagina’s | Een eerste pagina kan alleen onbeschikbare afleveringen bevatten. De app kan een kop laten staan nadat de laatste aflevering verdwijnt. | Volgende pagina’s kunnen blijven laden. Bevestigd lege seizoensblokken en hun lege ruimte verdwijnen; beschikbare seizoenen blijven staan. |

## Wat blijft bestaan en wat weten we nog niet?

Inloggen, toestemming, accountrechten, terugkijktermijnen, ouderlijk toezicht, regiobeperkingen, DRM en functionele mediadiensten blijven echte Videoland-resultaten gebruiken. Een serie kan met een gratis account daardoor maar enkele afleveringen of seizoenen tonen. Heeft een seizoen bijvoorbeeld twee beschikbare afleveringen, dan blijven die twee zichtbaar. Seizoenen met uitsluitend abonnementsgebonden afleveringen verdwijnen. Programma-informatie blijft bereikbaar. Oudere betaalde afleveringen worden door deze patch niet afspeelbaar. Met Premium blijft inhoud waarvoor het account toegang heeft zichtbaar en wordt de gewone speler gebruikt.

Onbekende beschikbaarheid blijft zichtbaar. Een item kan bij het afspelen alsnog mislukken als Videoland het niet als abonnementsgebonden heeft gemarkeerd. Laad- en foutstatussen behouden hun gewone afhandeling. Het filter gebruikt steeds de vernieuwde gegevens van het huidige account en vernietigt de oorspronkelijke gecachte inhoud niet.

De tests zijn uitgevoerd op een 32-bits ARM-tv met Android 14. Het betaalde abonnement met reclame is niet afzonderlijk gevalideerd. Reclame die al in een uitzending of stream zit en livevideo zonder geschikte terugvalstream vallen buiten bevestigde verwijdering. In deze splitset is geen PairIP gevonden; Android 7.0 (API 24) of nieuwer is vereist. [Deel een geslaagde test of een probleem](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml).

## Beschikbare opties

Disable tracking, Hide ads, Hide unavailable content.

Alle drie staan standaard aan, ook in Simple mode. De opties werken onafhankelijk van elkaar. Laat Hide unavailable content bij het patchen uit als je de oorspronkelijke catalogus en abonneerknoppen wilt behouden; de andere gekozen opties blijven werken. Patch je op een telefoon voor je tv, laat Optimize for device architecture dan uit.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026 tegen `2365dcb` voor tv-build 1622: [stabiele acceptatie](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-30-videoland-stable.md), [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-29-videoland-atv.md), [catalogusfilter en seizoensafhandeling](https://github.com/johnneerdael/dutch-applications-patches/blob/2365dcb23f405fd4b675f8225d2cfce7838ba62c/docs/research/2026-10-30-videoland-hide-unavailable.md) en [patchbron](https://github.com/johnneerdael/dutch-applications-patches/tree/2365dcb23f405fd4b675f8225d2cfce7838ba62c/patches/src/main/kotlin/patches/videolandatv). Native runtimetests en onafhankelijke bytecodecontroles toetsen de onderzochte wijzigingen; de gebruiker bevestigt tests met Premium- en gratis accounts. Op de tv is ook bevestigd dat lege seizoenskoppen verdwijnen terwijl beschikbare afleveringen zichtbaar blijven. Dit is geen volledige verkeersaudit. [Zo lees je het bewijs](../reference/methodology.md).
