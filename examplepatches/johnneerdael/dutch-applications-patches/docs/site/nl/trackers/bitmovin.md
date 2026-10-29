# Bitmovin: wat meldt een videospeler naast het ophalen van de video?

## Is een video afspelen hetzelfde als die meten?

Bitmovin levert afspeeltechnologie en een afzonderlijke analyticscollector. Een **speler** haalt media op en toont die. Een **collector** volgt gebeurtenissen in de speler en verstuurt meetgegevens. De speler en collector kunnen gekoppeld zijn, maar hebben verschillende doelen. Bitmovin beschrijft analytics als het aansluiten van een collector die naar spelergebeurtenissen luistert. [Uitleg van de collector](https://developer.bitmovin.com/playback/docs/setup-analytics).

Bitmovin noemt onder meer gegevens over bufferen, opstarttijd en afspeeltechniek, een geschatte stad of een land, advertentievelden en optionele gebruikers-ID's of eigen gegevens van de klant. De dienst ondersteunt deze velden, maar daarmee is nog niet aangetoond dat Buienradar ze allemaal gebruikt. Een app kan andere velden instellen of optionele informatie weglaten. [Overzicht van analyticsvelden](https://developer.bitmovin.com/playback/docs/analytics-api-fields).

## Wat kunnen kijkmetingen laten zien?

**Denkbeeldig voorbeeld:** een reeks gebeurtenissen meldt dat een bepaalde video start, tweemaal buffert en halverwege stopt. Daarmee kan een aanbieder een slechte verbinding onderzoeken. Met een vast ID kunnen herhaalde reeksen ook laten zien wat één installatie bekijkt en wanneer die afhaakt. De meting kan dus zowel technische prestaties als kijkgedrag beschrijven. Dit verduidelijkt mogelijkheden; het is geen waargenomen kijkgeschiedenis.

De relevante vragen zijn welke gegevens de app verstuurt, welke identificator meegaat en of de collector nodig is voor afspelen. Als de app de videostream ophaalt, ontvangt de leverende dienst ook netwerkgegevens. Een analyticscollector verwijderen neemt die functionele uitwisseling niet weg.

## Wat vonden we in Buienradar?

[Buienradar 7.4.8](../apps/buienradar.md) geeft ingeschakelde analyticsinstellingen mee aan zowel de Bitmovin-speler als de bron. Het aangetroffen ontvangstadres is `analytics-ingress-global.bitmovin.com`. Hetzelfde onderzoek volgt afzonderlijk een Smartocto-verzoek bij het afspelen van video. De Smartocto-code gebruikt een afzonderlijke collector. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md), [verwante mediadiensten](additional-services.md#editorial-analytics).

## Wat verandert de patch?

**Disable tracking** past de instellingen voor speler en videobron aan, zodat de meetcollector niet wordt gekoppeld. De video blijft afspelen en Bitmovin blijft licentiecontroles uitvoeren. Er blijft daardoor functioneel verkeer met Bitmovin bestaan.

Deze bevinding berust op onderzochte instellingen, codepaden en patchuitvoer. Ze bewijst niet welke velden een echte kijksessie verstuurt, hoe lang de aanbieder gegevens bewaart of wat een onbekende toekomstige webspeler doet.

## Wat verandert er in RTL Nieuws?

Met **Disable tracking** in [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt de onderzochte optionele videometing zonder de speler of videobron te vervangen. De patch schakelt de videomeetconfiguraties uit en stopt zowel de Bitmovin-koppelingen voor speler en bron als de afzonderlijke Smartocto-verzenders. De onderzochte meetcode omvat video-ID's en spelergebeurtenissen zoals afspelen, pauzeren, voortgang, doorspoelen, bufferen en fouten. De onderzochte code en SDK noemen `analytics-ingress-global.bitmovin.com` en `ingestion.smartocto.com` als meetbestemmingen.

Inhoudsgegevens, afspeelautorisatie en DRM behouden hun eigen functies. Dit is geen garantie voor iedere speler: de compatibiliteit van de oude TFK-speler is nog niet opgelost. Advertenties die al in de stream zitten en op afstand ingesloten inhoud vallen evenmin onder een algemene verwijderingsclaim. Deze bestemmingen en codepaden zijn onderzocht; er is geen nieuwe verkeersopname van een kijksessie. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [de werking van tracking](../learn/how-tracking-works.md) en [onze methode](../reference/methodology.md).
