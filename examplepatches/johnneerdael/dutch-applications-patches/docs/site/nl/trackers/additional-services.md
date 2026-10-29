# Andere meetdiensten: welke vergelijkbare namen hebben verschillende rollen?

Ook deze meetdiensten komen voor in de ondersteunde apps. Een **event** is een vastgelegde handeling; een **SDK** is een herbruikbaar codepakket. Een **identificator** koppelt gegevens aan een installatie, sessie of account. Een adres in de code bewijst nog niet dat de app er gegevens naartoe heeft gestuurd. De denkbeeldige voorbeelden leggen uit hoe een techniek werkt en beschrijven geen werkelijk gebruikersgedrag.

<a id="audience-measurement"></a>

## Wat tellen Comscore en Gemius?

Comscore levert publieks- en advertentiemetingen. Ook Gemius meet bereik en combineert volgens zijn methode gegevens van meettags met panelinformatie. De doelen kunnen lijken op [Kantar/NMO](kantar-nmo.md), maar het zijn andere aanbieders en implementaties. [Comscore SDK-beschrijving](https://www.comscore.com/applicationsdk), [Gemius-methode](https://audience.gemius.com/en/methodology/overview/).

**Denkbeeldig voorbeeld:** meldingen dat artikelen worden geopend en terugkerende activiteitsmeldingen helpen het gebruik over een langere periode te schatten. Een terugkerend ID kan een herhaalbezoek van een nieuwe installatie onderscheiden. De uiteindelijke totalen vertellen niet welke velden vóór het samenvoegen zijn verzameld.

[NU.nl](../apps/nunl.md), [NRC](../apps/nrc.md), [AD](../apps/ad.md), [de Volkskrant](../apps/volkskrant.md), [Trouw](../apps/trouw.md) en [Parool](../apps/parool.md) hebben elk afzonderlijk onderzochte Comscore-koppelingen. Daarbij horen `scorecardresearch.com`-bestemmingen, soms ook mogelijkheden in een native bibliotheek. Parools configuratie kiest daarnaast `gabe.hit.gemius.pl`.

De patches stoppen het onderzochte opstarten, vastleggen en verzenden van gebeurtenissen, ook via wachtrijen en de relevante native code. Een meegeleverde native bibliotheek kan dus aanwezig blijven terwijl de gevonden functies niet meer worden aangeroepen. Bij AD vond het onderzoek wel Gemius-typen in de code, maar geen bereikbare koppeling die gegevens verzamelt. [Bestemmingsbewijs](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md), [AD-afbakening](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md).

<a id="editorial-analytics"></a>

## Wat leren Chartbeat, Parse.ly en Smartocto over inhoudsgebruik?

Deze tools ondersteunen redactionele metingen: welke inhoud wordt gebruikt en hoe mensen ermee omgaan. Chartbeat beschrijft metingen van handelingen en van hoe actief mensen inhoud gebruiken. Parse.ly beschrijft periodieke **heartbeats**: verzoeken die actieve gebruikstijd melden. Smartocto beschrijft videogebeurtenissen met inhouds-ID's. Welke gegevens een app hiermee verzamelt, moet per koppeling worden onderzocht. [Chartbeat Android SDK](https://docs.chartbeat.com/cbp/tracking/mobile-app-sdks/android-sdk), [Parse.ly-gebruikstijd](https://docs.parse.ly/installation-resources/parsely-integration/tracking-code-setup/engaged-time/), [Smartocto-videometing](https://knowledgebase.smartocto.com/real-time-video-tracking).

**Denkbeeldig voorbeeld:** “artikel geopend”, gevolgd door activiteitspings, helpt een redactie het openen van een pagina onderscheiden van verder gebruik. Dat kan redactionele keuzes ondersteunen en tegelijk leesgedrag vastleggen.

[NRC 5.12.24](../apps/nrc.md) heeft Chartbeat- en Parse.ly-koppelingen en bestemmingen zoals `ping.chartbeat.net`, `pong.chartbeat.net` en `p1.parsely.com`. De patch stopt het onderzochte opstarten en doorgeven van gebeurtenissen en de webbakens, kleine webverzoeken voor metingen. Functionele Parse.ly-aanbevelingen blijven toegestaan. Parse.ly levert beide functies, maar de patch behandelt aanbevelingen en metingen afzonderlijk. [NRC-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NRC_PATCH_AUDIT.md).

[Buienradar 7.4.8](../apps/buienradar.md) heeft een afzonderlijke verzender voor videoafspelen naar `ingestion.smartocto.com/v?t=videoPlay`. **Disable tracking** stopt de code die deze afspeelgebeurtenis doorgeeft. Dit staat los van [Bitmovin](bitmovin.md)-analytics. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

Bij [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt **Disable tracking** de afzonderlijke Smartocto-videometingen en behoudt hij de bestaande speler en videobron. De onderzochte code bevat video-ID's en spelercontext en noemt `ingestion.smartocto.com` als bestemming. Smartocto en [Bitmovin](bitmovin.md) hebben eigen meetroutes; de patch behandelt beide. Dit zijn code- en configuratiebevindingen, geen opgenomen kijksessie. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

Bij [Omroep Brabant 11.1.0](../apps/omroep-brabant.md) gebruikt ContentInsights/Smartocto `ingestion.contentinsights.com/p` en `/a` voor artikelen, sessies en leesactiviteit op opeenvolgende tijdstippen. Die records kunnen een artikel aan een sessie of ID verbinden. **Disable tracking** stopt de artikelactivatie en de zelfstandige verzender en behoudt lokale leesgeschiedenis en opruimwerk. De onderzochte code toont velden en routes; hij bewijst niet dat gegevens van een bepaalde lezer zijn ontvangen. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="media-telemetry"></a>

## Waarom Blue Billywig-, JWPlayer- en DPG-metingen van afspelen scheiden?

Een speler kan media ophalen en afzonderlijk afspeelgebeurtenissen melden. JWPlayer legt uit hoe periodieke pings worden gebruikt om kijktijd te berekenen. Dat beschrijft een techniek en bewijst niet ieder veld bij NU.nl. [JWPlayer-analyticsdocumentatie](https://docs.jwplayer.com/platform/docs/analytics-reference).

**Denkbeeldig voorbeeld:** “afspelen”, “doorspoelen” en “stoppen” beschrijven hoe iemand een clip gebruikt. Een speler kan zulke handelingen apart melden terwijl hij de video ophaalt. Metingen over het gebruik van een audiospeler betekenen evenmin dat de microfoon wordt opgenomen.

[Weeronline](../apps/weeronline.md) verstuurt Blue Billywig-statistieken naar `stats.bluebillywig.com`. De patch stopt die verzender en behoudt afspelen. [NU.nl](../apps/nunl.md) stopt een geïdentificeerde JWPlayer-pixelverzender en bekende webtelemetrie en behoudt spelerbestanden en mediaverzoeken. [Weeronline-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [NU.nl-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md).

DPG-videotelemetrie gebruikt onder meer `psti.prd.dpge.be`; zelfstandige Amalia-audiogebeurtenissen gebruiken `tracker.prd.dpge.be/track`. **Parool stopt die zelfstandige audiometingen. Bij AD, Trouw en de Volkskrant is dat afzonderlijke meetpad nog niet afgedekt.** Hun videocontroles bewijzen dus niet dat iedere audiogebeurtenis stopt.

Catsure blijft in deze apps gegevens synchroniseren voor de werking van de speler: een apparaat-ID, een geordende wachtrij, media-ID's, de afspeelpositie en de toestand afspelen, pauzeren of stoppen. Wat de server daarbij precies doet, is nog niet volledig vastgesteld. [Huidige dekking en gegevens die blijven](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md), [Parool-audiobevinding](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md).

Bij [Omroep Brabant 11.1.0](../apps/omroep-brabant.md) schakelt **Disable tracking** beide Blue Billywig-statistiekopties uit nadat opgeslagen toestemmingsinstellingen zijn toegepast. Ook de zelfstandige statistiekverzender stopt. Afspeelgebeurtenissen binnen de speler en inhoud blijven behouden. De ingestelde host `omroepbrabant.bbvms.com` levert ook media-informatie; de precieze ontvanger van statistieken is niet vastgesteld. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="publisher-measurement"></a>

## Wat laten Matomo en Eventor zien over eigen verzameling?

Matomo ondersteunt pagina- en gebeurtenisverzoeken, met optionele gebruikers- en paginaweergave-ID's. Een uitgever kan een collector op zijn eigen hostnaam draaien. Ook op een eigen domein kunnen metingen plaatsvinden. [Matomo tracking-API](https://developer.matomo.org/api-reference/tracking-api).

**Denkbeeldig voorbeeld:** de eigen `insight`-host ontvangt een melding dat iemand leest, terwijl de hoofdhost het artikel levert. Ook een domein van de uitgever zelf kan dus voor metingen worden gebruikt.

[FTM 2.6.8](../apps/ftm.md) heeft Matomo-meetcode op `insight.ftm.nl` en Eventor-gebeurtenissen en ID-updates op `eventor.ftm.nl`. De patch filtert deze collectors en wist na het laden vijf specifieke Eventor-sleutels uit browseropslag. Tijdelijke lokale ID-aanmaak vóór die opruiming blijft mogelijk. De patch blokkeert op de productiesites ook de exacte telemetrieroute voor de zichtbaarheid van reacties. Accounttoestand, reactiefuncties en gewone browseropslag worden niet volledig vervangen. [FTM-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FTM_TRACKING_AUDIT.md).

De uitgever van [Omroep Brabant](../apps/omroep-brabant.md) heeft ook een eigen `api.omroepbrabant.nl/api/event/readarticle`-verzoek. De onderzochte aanroep bevat een artikel-ID en een van Android afgeleid apparaat-ID. **Disable tracking** behoudt de lokale geschiedenis en slaat deze upload over. Nieuws, weer en configuratie gebruiken dezelfde host en blijven beschikbaar. De eigenaar van een host vertelt dus niet genoeg om tracking van nuttige verzoeken te onderscheiden. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="publisher-identity"></a>

## Welke identificatoren koppelt DMOI?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) vermindert **Disable tracking** de optionele koppeling van een uitgeversidentificator aan advertentie-, App Set- en apparaat-ID's en externe account-ID's. De onderzochte code gebruikt een wisselende DMOI-identificator, met mogelijke koppelingen aan `gigya_id` en `pw_id`. De ingestelde identiteitsdienst en onderzochte verzender gebruiken `dmoi.api.dpgmedia.net/dmoi`.

De patch onderdrukt optionele ID-opvragingen, stopt de externe koppelingen en laat DMOI-verzoeken via de bestaande foutafhandeling afronden. Aanmelding en account-ID's behouden hun functionele gebruik. Dat beperkt de onderzochte optionele identiteitsuitwisseling zonder echte accounts te vervangen. Het is geen bewijs dat alle resterende gegevens onkoppelbaar zijn of dat historische servergegevens zijn gewist. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

<a id="piano"></a>

## Wat legt Piano Analytics vast?

Piano Analytics beschrijft handelingen als gebeurtenissen met eigenschappen over inhoud, gebruiker of apparaat. De documentatie noemt paginaweergaven, klikken en media-afspelen als voorbeelden. De Android-SDK kan gebeurtenissen bewaren om ze later te versturen. Dit zijn productmogelijkheden; de onderzochte app bepaalt welke daarvan worden gebruikt. [Gebeurtenismodel](https://developers.piano.io/analytics/data-collection/general/how-it-works/), [Android-SDK en offlineopslag](https://developers.piano.io/analytics/data-collection/sdks/android-kotlin/).

**Denkbeeldig voorbeeld:** een artikel-ID en titel tonen wat iemand opent. Een sessie- of bezoekers-ID kan die opening verbinden met latere scherm- of afspeelgebeurtenissen, ook zonder een naam mee te sturen.

Bij [Omroep Brabant 11.1.0](../apps/omroep-brabant.md) bevatten de onderzochte Piano-routes artikel-ID/titel, de vorige pagina, scherm-, sociale en audio-/videogebeurtenissen, optionele advertentie-ID's en een NMO-ID. **Disable tracking** stopt de appaanroep en de SDK-verzenders voor gebeurtenissen, opgeslagen uploads en crashrapporten. De lokale vervaltermijn van zeven dagen en de grens van 2.000 wachtende records blijven werken; onverstuurde gegevens worden niet als bezorgd gemeld. Het precieze Piano-uploadadres is niet vastgesteld. Behouden SDK-initialisatie garandeert geen nulverkeer. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="experiments-and-surveys"></a>

## Hoe verschillen BrandMetrics en VWO van een algemene gebeurtenislogger?

BrandMetrics gaat over reclame-effect en enquêtemeting; VWO over experimenten. Hun eigen uitleg beschrijft merkmeting met enquêtes en bezoekersvoorwaarden voor het tonen van een variant. [BrandMetrics-metingen](https://api.brandmetrics.com/), [VWO-doelgroepinstellingen](https://help.vwo.com/hc/en-us/articles/360020424354-Configuring-the-Segment-Settings-in-VWO).

**Denkbeeldig voorbeeld:** een experiment vergelijkt twee presentaties door bezoekers aan een variant toe te wijzen en uitkomsten te tellen. Een advertentie-enquête stelt een andere vraag, maar beide kunnen identificatoren en antwoordcontext gebruiken. Het voorbeeld beweert niet dat een bepaald experiment plaatsvond.

Parools advertentieconfiguratie kiest `phx.bmtrcs.com` met invulvelden voor DMOI-identiteit en enquêtegegevens. Deze instellingen laten zien welk ontvangstadres is gekozen. Ze tonen geen opname van een ingevulde enquête. Het beleid dekt daarom `bmtrcs.com`; alleen `brandmetrics.com` zou die host missen. De webfilters van verschillende nieuwsapps dekken `dev.visualwebsiteoptimizer.com`, maar dat bewijst niet welk experiment werd geladen. [Parool-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md), [bestemmingsonderscheid](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

Bewijs beoordeeld op **28 oktober 2026**. Er is geen nieuwe verkeersopname gemaakt. De bevindingen stellen geen bewaartermijn of doorverkoop vast. Lees over [tracking](../learn/how-tracking-works.md), [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
