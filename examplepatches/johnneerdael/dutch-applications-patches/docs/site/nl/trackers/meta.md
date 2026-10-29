# Meta/Facebook: wat kan een app versturen zonder Facebook-scherm?

## Wat zit er in de app ingebouwd?

De Facebook Android SDK is een bibliotheek die apps met Meta-diensten verbindt. De onderdelen hebben verschillende taken: App Events meet activiteit, Audience Network levert advertenties. De SDK kan ook aanmelden met een sociaal account of ingesloten inhoud ondersteunen. Alleen de naam Facebook vertelt dus niet welk onderdeel draait. [Officiële Android-SDK-broncode](https://github.com/facebook/facebook-android-sdk).

Een **appgebeurtenis** is een record van bijvoorbeeld het openen van de app of een aankoop. Appcode kan die expliciet doorgeven, maar een automatische SDK-functie kan ze ook verzamelen. Een **advertentie-ID** is een apparaatidentificator voor advertentiedoeleinden. Een SDK kan daarnaast andere identificatoren bijhouden; alleen dat ene ID verwijderen stopt gebeurtenissen dus niet vanzelf.

## Waarom zegt “ik ben nooit bij Facebook ingelogd” niet alles?

**Denkbeeldig voorbeeld:** een weerapp bevat een aanroep voor aankoopgebeurtenissen en een ID per installatie. Die aanroep kan plaatsvinden zonder ooit een Facebook-inlogscherm te tonen. Dit verduidelijkt het technische verschil tussen een sociaal account gebruiken en met een dienst communiceren. Het is geen opgenomen aankoopverzoek van jouw telefoon.

Privacy International toonde in **december 2018** met verkeersonderzoek automatische Facebook-SDK-overdrachten in andere Android-apps aan, ook zonder Facebook-aanmelding. Het laat zien waarom ook het opstarten en automatisch verzamelen onderzocht moeten worden. Het bewijst niet wat de hier onderzochte versies uit 2026 verstuurden. [Onderzoek van Privacy International](https://www.privacyinternational.org/appdata).

## Wat vonden we in de weerapps?

[Buienalarm 4.32.0](../apps/buienalarm.md) bevat App Events-opstart- en toestemmingspaden, aankoopgerelateerde aanroepen en een afzonderlijk uitvoerbaar Audience Network-bestand. De patch schakelt de opstartproviders uit en voorkomt dat een toestemmingskeuze de verzameling opnieuw inschakelt. Waar de app een logger verwacht, krijgt die een object dat niets vastlegt. De patch stopt ook de gevonden aankoopaanroepen en verwijdert het advertentiebestand. De exacte Meta-uploadhost is in dat onderzoek niet vastgesteld. [Buienalarm-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

[Weeronline 3.61.0](../apps/weeronline.md) bevat een opstartprovider, een toestemmingscontroller die verzameling inschakelt en een aankooplogger. De patch onderdrukt deze paden en de optionele verzameling van advertentie-ID's. De SDK bouwt Graph-bestemmingen op. Een expliciete verwijzing naar `graph.facebook.com` dient daarnaast voor functionele Instagram-inhoud. Het hele domein blokkeren zou verder gaan dan appgebeurtenissen stoppen. [Weeronline-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [onderbouwing van bestemmingen](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## Wat blijft onzeker?

De bevindingen laten zien welke code is onderzocht en wat de patch stopt. Niet iedere mogelijke overdracht tijdens het gebruik of verdere koppeling op servers is daarmee vastgesteld. Ze bewijzen geen doorverkoop, bewaartermijn of koppeling aan een persoonlijk Meta-profiel.

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [identificatoren](../learn/identifiers.md), [toestemming](../learn/consent.md) en [de methode](../reference/methodology.md).
