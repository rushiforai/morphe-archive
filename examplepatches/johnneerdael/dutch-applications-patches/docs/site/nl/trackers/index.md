# Trackers en dienstverleners: wat doet ieder onderdeel?

“Tracker” omvat verschillende technieken. Het ene onderdeel telt artikelbezoeken, het andere meldt spelerfouten en weer een ander kiest marketingberichten. Ook een toestemmings- of abonnementsdienst kan naast optionele metingen noodzakelijke dienstgegevens uitwisselen. Als je weet waarvoor een onderdeel dient, kun je beter beoordelen wat een patch stopt en welke functies ervan afhankelijk zijn.

Een **SDK** is een herbruikbaar codepakket in een app. Een **event** legt iets vast dat gebeurde, meestal met details over de handeling. Een **identificator** is een waarde waarmee een dienst gegevens aan dezelfde installatie, sessie of account kan koppelen. **Telemetrie** is informatie die software over haar werking of gebruik verstuurt. Geen van die woorden bewijst op zichzelf anonimiteit of herkenning van een persoon bij naam.

## Welke tools meten gedrag en interacties?

- [Snowplow](snowplow.md): gestructureerde scherm-, handelings- en uitgeversgebeurtenissen met identificatoren en context.
- [Contentsquare en Heap](contentsquare-heap.md): schermweergaven en handelingen in de app registreren en die koppelen aan een identiteit of aan activiteit op ingebouwde webpagina's.
- [Usabilla/GetFeedback](usabilla.md): handmatige feedback naast automatisch gestarte enquêtes en telemetrie.
- [Matomo en Eventor](additional-services.md#publisher-measurement): eigen verzameling in FTM's ingebouwde website.

- [DMOI](additional-services.md#publisher-identity): optionele koppelingen tussen uitgevers-, apparaat- en account-ID's die RTL Nieuws onderdrukt, met behoud van aanmelding.

## Welke tools meten bereik, inhoud en video?

- [Kantar/NMO](kantar-nmo.md): bereikstellingen en de concrete koppeling met het Snowplow-ID in Buienradar. RTL Nieuws heeft een afzonderlijke NMO-verzender.
- [Piano Analytics](additional-services.md#piano): artikel- en mediagebeurtenissen, optionele ID's en opgeslagen uploads bij Omroep Brabant.
- [Bitmovin](bitmovin.md): spelerkwaliteit en kijkmetingen, afzonderlijk van afspelen en licenties.
- [Comscore en Gemius](additional-services.md#audience-measurement): bereiksonderzoek via meetcode in de app, waaronder native code.
- [Chartbeat, Parse.ly en Smartocto](additional-services.md#editorial-analytics): leesgedrag, actieve gebruikstijd en videometingen.
- [Blue Billywig, JWPlayer en DPG-media](additional-services.md#media-telemetry): metingen over afspelen, Catsure-synchronisatie die blijft werken en audiometingen die nog niet worden gestopt.

## Welke onderdelen onderzoeken problemen?

- [Firebase](firebase.md): Analytics, Crashlytics, Performance en Sessions hebben andere taken dan installatie-identiteit, configuratie en pushbezorging.
- De [aanvullende dienstprofielen](additional-services.md) verklaren ook waarom spelerkwaliteitsmetingen overlappen met gedragsgegevens.

## Welke tools ondersteunen marketing en doelgroepselectie?

- [Meta/Facebook](meta.md): App Events en Audience Network, met afzonderlijke code voor opstarten en identificatoren.
- [Swrve](swrve.md): profielen en campagnes. Buienradar gebruikt deze dienst ook voor weermeldingen. Swrve blijft standaard ingeschakeld. RTL Nieuws stopt optionele campagnes en biedt een expertoptie zonder pushmeldingen.
- [Insider](insider.md): gebeurtenissen, profielen en geofencing die Flitsmeister onderdrukt; live CITS-locatie blijft bestaan.
- [BrandMetrics en VWO](additional-services.md#experiments-and-surveys): enquêtes over reclame-effect en experimenten.

## Welke diensten beheren toestemming en abonnementen?

- [OneTrust](onetrust.md): privacyschermen, instellingen en gegevensuitwisseling bij het beheren van toestemming.
- [Didomi](didomi.md): privacykeuzes bewaren en optionele metingen over de dienst uitvoeren. Wat de patch stopt, verschilt per app.
- [RevenueCat](revenuecat.md): aankopen en toegang tot betaalde functies beheren, naast optionele klanteigenschappen en diagnostiek.

## Hoe lees ik het bewijs?

De profielen maken onderscheid tussen wat een product volgens de documentatie kan, wat er in de onderzochte appcode staat en wat er tijdens het gebruik is waargenomen. Ze vermelden ook welke ontvangstadressen zijn ingesteld en welke adressen de webfilters afdekken. Een denkbeeldig voorbeeld verklaart een techniek; het is geen opgenomen gebruikerssessie. De gekoppelde apppagina's noemen exact ondersteunde versies en controles. Aanbiedersdocumentatie beschrijft wat een product kan, niet alles wat een onderzochte app deed.

Deze onafhankelijke bronnen beschrijven de diensten en hun context: [Exodus' trackercatalogus](https://reports.exodus-privacy.eu.org/en/trackers/), [DuckDuckGo Tracker Radar](https://github.com/duckduckgo/tracker-radar) en het historische [Cracked Labs-rapport](https://crackedlabs.org/en/corporate-surveillance) uit **2017**. Tracker Radar levert uitdrukkelijk een gegevensverzameling en geen kant-en-klare blokkeerlijst. Deze bronnen vervangen geen appbewijs en tonen geen actuele overdrachten in deze versies aan.

Bewijs beoordeeld op **28 oktober 2026**. Er is geen nieuwe ontsleutelde verkeersopname gemaakt. De bevindingen bewijzen geen bewaartermijn, doorverkoop, overtreding of volledige netwerkstilte. Begin bij [de werking van tracking](../learn/how-tracking-works.md) en lees verder over [identificatoren](../learn/identifiers.md), [locatie](../learn/location.md), [toestemming](../learn/consent.md) en [onze methode](../reference/methodology.md). De [bronnengids](../reference/sources.md) verklaart de soorten bronnen.
