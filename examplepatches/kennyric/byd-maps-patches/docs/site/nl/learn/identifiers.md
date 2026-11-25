# Hoe diensten een app-installatie herkennen

Een dienst kan activiteit koppelen zonder iemands naam te kennen. Dezelfde identificatiecode op twee registraties kan ze verbinden aan één bezoek, installatie of account.

| Identificatiecode | Wat die kan koppelen |
| --- | --- |
| Sessie-ID | Activiteit tijdens één bezoek. |
| Installatie-ID | Gebruik van een geïnstalleerde app door de tijd heen. |
| Account-ID | Activiteit van een account, mogelijk op meerdere apparaten. |
| Advertentie-ID | Activiteit bij de advertentiecode van het platform. |
| Uitgevers-ID | Activiteit bij een eigen code van de uitgever. |
| Pushtoken | Bezorging van meldingen aan een installatie. |

Een advertentie-ID weghalen verwijdert geen account-ID’s of codes voor meldingen. Een willekeurig ogende waarde kan herhaalde activiteit nog steeds herkenbaar maken.

De [app-pagina’s](../apps/index.md) beschrijven welke optionele tracking de patches beperken. Beschikbare diensten kunnen nog identificatiecodes gebruiken. Lees voor achtergrond de [uitleg van Snowplow](https://docs.snowplow.io/docs/events/identifiers/).
