# Kantar/NMO: hoe telt een appbezoek mee in bereiksonderzoek?

## Wie doet wat?

NMO, Nationaal Media Onderzoek, coördineert Nederlands onderzoek naar mediabereik. Kantar voert het online- en kijkonderzoek uit. NMO beschrijft een combinatie van geworven panels en **censusmetingen**: meettags in deelnemende websites en apps tellen gebruik. Een **tag** is meetcode. Meetellen via zo'n tag is iets anders dan deelnemen aan een onderzoekspanel waarvoor mensen worden geworven. [NMO-informatie voor deelnemers](https://www.nationaalmediaonderzoek.nl/privacy-deelnemers-nmo).

Volgens de NMO-FAQ omvatten censusdata paginatellingen en kenmerken zoals tijdsduur, inhoudscategorie en apparaat. Deze tellingen helpen het bereik te berekenen. De FAQ beschrijft het onderzoeksmodel; de precieze inhoud van een appverzoek vraagt afzonderlijk onderzoek. [NMO Online FAQ](https://www.nationaalmediaonderzoek.nl/nmo-onlinefaq).

## Waarom kan een telling een ID bevatten?

**Denkbeeldig voorbeeld:** een dienst wil tien openingen door één installatie onderscheiden van één opening door tien installaties. Met een terugkerende identificator kan de dienst herhaalde meetrecords herkennen. Zo'n identificator hoeft geen naam te bevatten om handelingen te verbinden. Andersom bewijst de aanwezigheid ervan niet dat een onderzoeksorganisatie weet hoe de persoon achter de telefoon heet.

Een **ping** is een klein netwerkverzoek dat een meting doorgeeft. Daar kunnen parameters in staan: benoemde waarden die het verzoek meekrijgt. Welke waarden worden meegestuurd en wat ze betekenen, moet uit de appcode blijken. Het woord “telling” vertelt dat niet.

## Wat vonden we in Buienradar?

In [Buienradar 7.4.8](../apps/buienradar.md) voegt een plugin bij de RTL-[Snowplow](snowplow.md)-tracker een Kantar/NMO-ping toe aan `nmortlendpoint.2cnt.net`. De parameter `cs_fpid` krijgt het Snowplow-gebruikers-ID. Dat is concreet bewijs van een koppeling tussen identificatoren in de appcode. Het is geen netwerkopname van een bepaalde persoon en toont niet welke verdere koppeling, bewaring of aggregatie plaatsvond. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## Wat verandert de patch?

**Disable tracking** voorkomt bij Buienradar de aanmaak van de Snowplow-tracker waaraan deze plugin hangt. Daarmee stopt ook de aangetroffen NMO-ping. Daarvoor worden niet alle domeinen van het onderzoeksbedrijf geblokkeerd.

Trek die conclusie niet automatisch door naar een andere app of latere versie: hetzelfde bereiksonderzoek kan via zelfstandige code zijn ingebouwd. Beoordeel ook paneldeelname en de afzonderlijk beschreven censustag apart. Het onderzoek laat zien hoe de app de meting aanroept; de onderzoeksorganisatie beschrijft waarvoor de meting volgens haar dient.

## Wat verandert er in RTL Nieuws?

Bij [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt **Disable tracking** ook de onderzochte publieksmeting met een gebruikers-ID. De app heeft een eigen NMO/FocalMeter-verzender naar `nmortlendpoint.2cnt.net`, met `vendor=snowplow`, het gebruikers-ID in `cs_fpid` en `c12=not_set`. Deze verzender staat los van de Snowplow-verzender. De patch stopt beide afzonderlijk. Dat verschilt van Buienradars gekoppelde plugin hierboven. De code toont welke waarden worden doorgegeven; er is geen netwerkopname die de ontvangst of verdere verwerking door de server vaststelt. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## Wat verandert er in Omroep Brabant?

[Omroep Brabant 11.1.0](../apps/omroep-brabant.md) heeft een zelfstandige client voor `nmorpoendpoint.2cnt.net`. Hij registreert en hergebruikt een willekeurig ID, geeft het mee als `cs_fpid` en deelt het met Piano. **Disable tracking** stopt de onderzochte registratie en laat de app bij het opvragen van het opgeslagen ID de bestaande uitkomst ‘geen waarde’ krijgen. Zo stopt het onderzochte doorgeven, zonder te beweren dat eerder opgeslagen ID's zijn gewist. Er is geen netwerkopname die toont wat de server ontving of bewaarde. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [identificatoren](../learn/identifiers.md), [toestemming](../learn/consent.md) en [bewijsniveaus](../reference/methodology.md).
