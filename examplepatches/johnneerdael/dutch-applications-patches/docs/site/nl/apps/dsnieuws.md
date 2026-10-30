# DS Nieuws

**Ondersteunde app:** 22.0.0 · **Build:** 2012316104 · **Invoer:** APKS · **Kanaal:** Pre-release

`com.twipemobile.dsmobile`

[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Deze Mediahuis-nieuwsapp bevat advertenties en metingen van lezen, interacties en mediagebruik. Het krantentabblad gebruikt een aparte Twipe-lezer met aanvullende logging en Engage Readers-metingen. Deze prerelease-opties zijn lokaal gepatcht, ondertekend en gecontroleerd in de gedecodeerde uitvoer. Apparaattests moeten nog volgen.

Deze opties zijn beschikbaar in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | Kaching ontvangt advertentieverzoeken en maakt URLs voor video- en audioreclame. De aanroepers kunnen al omgaan met uitgeschakelde advertenties. | Hide ads geeft voor deze verzoeken het eigen uitgeschakelde resultaat van de app terug. |
| Publieks- en interactiemetingen | De onderzochte code verstuurt lees-, scherm-, identiteits- of spelerevents via Mediahuis Glitr, Cxense, Google Analytics, Gemius en Comscore. | Disable tracking stopt de gevonden partners, events, leestijdmetingen, segmenten en videometingen. |
| Diagnostiek en videokwaliteit | Datadog, Mux, de aparte Agnoplay-dataplugin, Firebase en Airship bevatten metingen naast bezorging en push. | De onderzochte verzameling en initialisatie stoppen; pushregistratie en inhoud blijven werken. |
| Ingebouwde krantenlezer | De echte Twipe-JavaScript bevat Kinesis/HTTP-logging en initialisatie, events en timers van Engage Readers. | De bestaande uitgeschakelde logtransportfunctie rondt lokaal af; de onderzochte Engage Readers-paden stoppen. |
| Toestemming en Premium-weergave | Automatische toestemming, PayOrOk en introductie openen aparte schermen. Uitgeversinstellingen regelen betaalmuurkaarten en abonneerknoppen. | Skip consent screens slaat normale voltooiing van de introductie op zonder toestemming te registreren. Hide Premium banner verbergt deze promotionele onderdelen. |

## Wat blijft bestaan en wat weten we nog niet?

Artikelinhoud en krantdownloads blijven echte serverbeslissingen gebruiken. Hide Premium banner kan geen tekst of edities leveren die de uitgever achterhoudt. Inloggen, accountstatus, pushbezorging, personalisatie en alternatieve facturatie blijven behouden.

De controle van de originele invoer slaagt. Elke geselecteerde optie faalde daarop eerst zoals verwacht. Elke afzonderlijke optie en alle opties samen slagen nu voor patching, ondertekening en controle van de gedecodeerde uitvoer. Apparaattests moeten nog volgen. Afspelen, lege advertentievakken, offline lezen, nieuwe ondertekening, externe ingesloten code en werkelijk netwerkverkeer zijn nog niet bevestigd. Een geconfigureerde bestemming bewijst geen verstuurd verzoek.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

Alle vier opties staan standaard aan. Disable tracking omvat Hide ads; Skip consent screens omvat beide.

[Volledige definities voor deze pre-release](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/nl/reference/catalogue.md).

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/bf1741f/docs/dsnieuws-audit.md). De uitvoercontrole bewaakt 1200 methodecontracten en 44 switchkoppelingen. Elf gerichte regressietests slagen. Gecontroleerde tests voeren de werkelijk aangepaste lezerfuncties voor telemetrie en asynchrone afronding uit. Voor dit onderzoek is geen gepatchte app geïnstalleerd en geen netwerkverkeer opgenomen. [Zo lees je het bewijs](../reference/methodology.md).
