# Tools, extractie en privégeheugen

Deze functies zijn optioneel. Onderhandel ze afzonderlijk; leid beschikbaarheid niet alleen af uit de protocolversie. Jouw app blijft verantwoordelijk voor bevestiging en elke actie op basis van een resultaat.

## Onderbouwen en rechtstreeks opzoeken

De gebruiker schakelt Search tools in Local AI in en kiest een provider. De client geeft afzonderlijk tooltoestemming. Installatie of belading van Gemma geeft modelverzoeken geen netwerktoestemming.

```java
TextRequest online = TextRequest.rawMessages(messages, 512, 120000)
    .withToolPolicy(ToolPolicy.allowWebSearch());
TextRequest offline = TextRequest.rawMessages(messages, 512, 60000)
    .withToolPolicy(ToolPolicy.none());
```

`messages` is een lijst met `ChatMessage`-objecten. `auto` staat een toegestane aanroep toe; `required` vereist een toegestane aanroep of een expliciete fout. Het verzoekbeleid vervangt de sessiestandaard. Prompts en opgehaalde pagina's verlenen geen toolrechten.

| Provider | Instelling |
| --- | --- |
| DuckDuckGo | Geen sleutel; Instant Answers en best-effort-webresultaten, met expliciete blokkerings-/limietfouten |
| Brave | Brave Search-API-sleutel van de gebruiker |
| Tavily | Tavily Search-API-sleutel van de gebruiker |
| Muziek opzoeken | Door gebruiker ingeschakelde MusicBrainz-/Deezer-route, afzonderlijk toegestaan als `music.search` |

Het lokale model genereert het onderbouwde antwoord. Zoekproviders ontvangen de toegestane zoekopdracht. Sleutels blijven versleuteld in de host en worden niet aan clients of prompts meegegeven. Bewaar bron-ID's, attributie en URL's bij het resultaat.

`client.openToolSession()` biedt rechtstreeks opzoeken zonder een Gemma-belading aan te vragen. Ook apps met een ander lokaal of cloudmodel kunnen dit gebruiken. Expliciete tooltoestemming vereist nog steeds een ingeschakelde/geconfigureerde provider. Wissel niet stilzwijgend van provider na een fout.

## Extractie en prefetch

Onderhandel `supportsExtraction()` en open een `ExtractionSession`. Geef tekst, entiteitslabels en eventuele classificatietaken mee. Het geselecteerde profiel bepaalt de taken; `UNSUPPORTED_TASK` wisselt nooit stilzwijgend van model. Spans gebruiken halfopen UTF-16-posities in de ongewijzigde invoer. Valideer die vóór gebruik.

`supportsExtractionPrefetch()` voegt eigen opzoekregels en callbacks toe. Extractie vindt een kandidaatnaam en verleent geen zoekrecht. Jouw regel en expliciete toolbeleid bepalen of wordt gezocht. Kandidaten zijn referentiegegevens, geen afspeel- of navigatieopdrachten.

## Privégeheugen en onderbouwde keuzes

Onderhandel `supportsPrivateMemory()` voordat een geheugensessie wordt geopend. Elke app krijgt eigen versleutelde UID-ruimte. Sla feiten expliciet op volgens jouw toestemmingsbeleid; de host maakt gesprekken niet automatisch permanent. Laat gebruikers opgeslagen gegevens bekijken en verwijderen.

Vanaf **Local Model Host v0.1.143** kan elke toegelaten client bij het eerste gebruik zijn geheugenschema registreren zonder aparte geheugenschakelaar. Nieuwe gegevens blijven standaard bewaard totdat ze worden verwijderd. Bestaande bewaartermijnen blijven gelden. De eigenaar kan alle Host-functies beperken via **App access**. Verwijs bij `CLIENT_ACCESS_DENIED` naar die instelling en verbind opnieuw zodra toegang is hersteld. [DriveDeck-integratiecontract](https://gitlab.com/johninnld/local-model-host/-/releases/v0.1.143/downloads/DriveDeck-Local-AI-Final-State-Compliance.md).

Geef herinneringen, eigen appresultaten en toolkandidaten mee als begrensde referentiegegevens. Laat het model een aangeleverde ID kiezen en controleer die in de app. Voer geen verzonnen ID, ruwe modelopdracht of instructie uit een opgehaalde pagina uit.

Sluit sessies en laat gespreksholds los na afloop. Stop, eigendom, verval, annulering en geheugendruk gelden voor alle routes.

[Companion-contracten en broncode](https://gitlab.com/johninnld/local-model-host) · [Eerste verzoek](quickstart.md)
