# Hoe een app een terugkerende installatie herkent

Een dienst heeft je naam niet nodig om twee handelingen aan elkaar te koppelen. Als beide dezelfde blijvende code bevatten, kan de dienst zien dat ze bij dezelfde app-installatie of hetzelfde account horen.

## Verschillende codes beantwoorden verschillende vragen

| Herkenningscode | Wat ermee te verbinden is |
| --- | --- |
| Sessie-ID | Handelingen tijdens één bezoek of gebruiksperiode. |
| Installatie-ID | Gebruik van één geïnstalleerde app door de tijd heen. |
| Account- of gebruikers-ID | Gedrag dat bij het account hoort, mogelijk op meerdere apparaten. |
| Advertentie-ID | Een advertentiecode van het platform. De instellingen van dat platform bepalen hoe je die kunt beheren. |
| Publisher-provided ID (PPID) | Een label van de uitgever. Wat ermee te koppelen is, hangt af van hoe de uitgever het maakt en deelt. |
| Pushtoken | Een adres om meldingen bij een app-installatie af te leveren. Ook dit is informatie waaraan de dienst een installatie kan herkennen. |

De codes hebben elk hun eigen functie. Als je de advertentie-ID verwijdert, blijven de eigen account- en installatiecodes van een app bestaan. [Snowplows uitleg over identifiers](https://docs.snowplow.io/docs/events/identifiers/) toont verschillende soorten en hun levensduur.

## Een bevinding uit deze apps

In de onderzochte code van Buienalarm krijgt een verzoek voor gerichte advertenties een PPID mee die in meerdere apps werkt. Het verzoek bevat ook de gekozen plaats, het land en informatie over de advertentie. De plug-in voor publieksmeting in Buienradar kopieert de Snowplow-gebruikerscode naar het Kantar-veld `cs_fpid`. Deze koppelingen zijn in de code gevolgd. Bekijk [Buienalarm](../apps/buienalarm.md) en [Kantar/NMO](../trackers/kantar-nmo.md).

## Betekent “anoniem” dat je niet herkenbaar bent?

Een code kan willekeurig ogen en je naam niet bevatten, maar toch lang genoeg hetzelfde blijven om je gedrag te koppelen. Ook een hash kan herhaalde waarden herkenbaar houden. Als een aanbieder zegt dat gegevens anoniem zijn, vraag dan welke codes overblijven, hoe lang ze meegaan, of accounts te koppelen zijn en welke extra informatie wordt toegevoegd. [Cracked Labs legt koppelen en matchen uit](https://crackedlabs.org/en/corporate-surveillance#linking).

Onze patches onderdrukken de specifieke codepaden die in de app-onderzoeken staan. Diensten voor accounts, pushmeldingen en afspelen die blijven werken, kunnen eigen herkenningscodes gebruiken. We hebben niet aangetoond dat alle overblijvende verzoeken vrij zijn van gegevens die nog te koppelen zijn.
