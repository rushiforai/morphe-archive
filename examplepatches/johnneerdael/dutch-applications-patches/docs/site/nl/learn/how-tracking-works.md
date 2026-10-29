# Van een tik naar een registratie van je gedrag

Een app kan na één handeling twee verzoeken versturen. Om een artikel te openen vraagt de app de tekst op. Een afzonderlijk verzoek kan doorgeven dát je het artikel hebt geopend. Alleen het eerste verzoek is nodig om de tekst te leveren.

## Volg een voorbeeld

Stel dat je in een weerapp de radar voor Utrecht opent. Zo zou een registratie eruit kunnen zien. Dit voorbeeld komt niet uit een onderschept gegevenspakket:

```text
Handeling: radar openen
Gebeurtenis: radar_opened
Context: gekozen plaats = Utrecht, tijd = 08:15
Herkenningscode: installatie = voorbeeld-7f3
```

De gebeurtenis vertelt wat er is gebeurd, en de context geeft daar details bij. Met de herkenningscode kan een dienst deze registratie aan een volgende koppelen. Een reeks registraties kan laten zien hoe vaak dezelfde app-installatie terugkomt en welke plaatsen daarin worden opgezocht. Of een dienst dat ook onderzoekt, hangt af van de instellingen en het gebruik.

## Hoe de registratie de telefoon verlaat

De ontwikkelaar kan zelf code schrijven om gegevens te versturen of een SDK opnemen: een herbruikbaar softwareonderdeel van een andere organisatie. Een SDK kan bijhouden wanneer je van scherm wisselt of gebeurtenissen van de app ontvangen. Sommige SDK's bewaren gebeurtenissen in een wachtrij op de telefoon en versturen er later meerdere tegelijk. Eén netwerkverzoek staat dus niet altijd voor één handeling.

```text
Je handeling → app of SDK → lokale wachtrij → verzamelpunt → opslag en analyse
```

[De architectuur van Snowplow](https://docs.snowplow.io/docs/fundamentals/) beschrijft één uitvoering van verzameling en verwerking. [De documentatie van Contentsquare](https://docs.contentsquare.com/en/csq-sdk-android/experience-analytics/data-collection/) laat zien hoe scherm- en interactiegebeurtenissen gebundeld worden verstuurd. Deze documentatie beschrijft wat de producten kunnen. De precieze instellingen kunnen per app in dit project verschillen.

## Wie ontvangt de gegevens?

De gegevens kunnen naar de uitgever gaan, naar een dienstverlener of naar infrastructuur die een van beide gebruikt. Ook op een domein van de uitgever kan trackingsoftware draaien. Een extern domein kan een kaart of privacy-instellingen leveren. Kijk daarom wie het verzoek verstuurt, welke velden het bevat en waarvoor het dient. De naam alleen vertelt dat niet.

## Wat een patch kan veranderen

Een patch kan een onderdeel dat gegevens verzamelt tegenhouden bij het starten. Ook kan hij voorkomen dat het gebeurtenissen aanmaakt, gegevens uit een wachtrij uploadt, herkenningscodes toevoegt of een bepaald webverzoek verstuurt. Als alleen een schermelement verdwijnt, weet je nog niet of die onderdelen zijn gestopt. [Lees hoe we dat controleren](../reference/methodology.md) en bekijk daarna [je app](../apps/index.md).
