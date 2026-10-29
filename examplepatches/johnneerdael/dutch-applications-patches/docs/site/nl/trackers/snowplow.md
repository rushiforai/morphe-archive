# Snowplow: hoe wordt een reeks handelingen een gegevensverzameling?

## Wat doet Snowplow?

Snowplow levert hulpmiddelen om gestructureerde gebruiksgegevens te verzamelen. Een app neemt daarvoor een **software development kit (SDK)** op: een herbruikbaar pakket programmacode. De SDK legt **events** vast, oftewel gebeurtenissen zoals een scherm openen of een video starten. Een **collector** is de server die deze gegevens ontvangt. De uitgever bepaalt de inrichting; een Snowplow-systeem kan onder een eigen domein van de uitgever draaien.

Een gebeurtenis kan context en identificatoren bevatten. Een **identificator** is een waarde waarmee dezelfde installatie, sessie of account opnieuw te herkennen is. Snowplow beschrijft verschillende identificatoren met uiteenlopende herkomst en levensduur. De mobiele documentatie noemt ook apparaattaal, tijdzone en schermgegevens. Welke velden een app werkelijk toevoegt en welke privacyinstellingen hij gebruikt, moet per app worden onderzocht. [Snowplow-identificatoren](https://docs.snowplow.io/docs/events/identifiers/), [mobiele eigenschappen](https://docs.snowplow.io/docs/sources/mobile-trackers/client-side-properties/).

## Waarom maakt een identificator verschil?

**Denkbeeldig voorbeeld:** drie records melden “radar geopend”, “plaats gekozen” en “abonnementsscherm geopend”. Met één installatie-ID kan een analist die handelingen achter elkaar zetten. Drie losse klikken tellen levert een ander beeld op dan één terugkerende installatie volgen. Dit voorbeeld verduidelijkt de techniek; het is geen onderschepte Buienradar-sessie.

## Wat vonden we werkelijk in de onderzochte apps?

[Buienradar 7.4.8](../apps/buienradar.md) maakt RTL- en DPG-trackers voor `nl-rtl-prod1.collector.snplow.net` en `c.dpgmedia.net`. De onderzochte code bevat gebeurtenissen over schermen, onderdelen van het scherm, stappen in een proces, aankopen, radarlocaties en inloggen. Een **trechtermeting** volgt zulke opeenvolgende stappen in een proces. Er zijn ook metingen ingesteld voor de herkomst van de installatie en veranderingen in de activiteit van de app. De Kantar/NMO-plugin geeft het Snowplow-gebruikers-ID door als `cs_fpid`; zie [Kantar/NMO](kantar-nmo.md). Het onderzoek vond bovendien een vast ingestelde toestemmingscontext. Dat is een codebevinding, geen juridisch oordeel over toestemming. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

[NU.nl](../apps/nunl.md), [de Volkskrant](../apps/volkskrant.md), [Trouw](../apps/trouw.md), [AD](../apps/ad.md) en [Parool](../apps/parool.md) hebben afzonderlijk onderzochte meetpaden van de uitgever, waaronder `tracking-module.api.dpgmedia.cloud`. Gedeelde technologie betekent niet dat elke patch precies hetzelfde afdekt. [Onderbouwing van bestemmingen](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## Wat verandert de patch?

**Disable tracking** voorkomt bij Buienradar dat de trackers worden aangemaakt en stopt de code die gebeurtenissen doorgeeft. Daarmee stopt ook de gekoppelde NMO-plugin. Bij de nieuwsapps stoppen de patches de onderzochte verzendfuncties, wachtrijen en bekende webcollectors. Noodzakelijke inhouds-, account- en meldingsdiensten blijven werken.

Controles van de broncode en het patchresultaat kunnen op zichzelf niet aantonen dat alle netwerkverzoeken zijn gestopt. De patch wist ook geen gegevens die een server al heeft.

## Wat verandert er in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt **Disable tracking** de onderzochte optionele registratie van lees-, scherm- en kijkgedrag. De patch behoudt de inhouds-, account- en afspeelfuncties. De appcode stelt Snowplow/DPG-trackers in voor `c.dpgmedia.net` en `nl-rtl-prod1.collector.snplow.net`. De patch stopt het aanmaken en opnieuw inschakelen van trackers, het doorgeven van gebeurtenissen en de SDK-verzender, ook voor eerder opgeslagen Snowplow-verzoeken.

RTL Nieuws heeft daarnaast een afzonderlijke [NMO/FocalMeter-verzender](kantar-nmo.md). De patch stopt die apart; dit volgt niet automatisch uit de Snowplow-maatregelen. Deze bevindingen komen uit de code en controles van het patchresultaat, niet uit een opgenomen leesgeschiedenis. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [de werking van tracking](../learn/how-tracking-works.md), [identificatoren](../learn/identifiers.md) en [onze methode](../reference/methodology.md).
