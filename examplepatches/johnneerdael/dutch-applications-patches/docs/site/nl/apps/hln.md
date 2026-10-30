# HLN

**Ondersteunde app:** 9.22.0 · **Build:** 2009220000 · **Invoer:** APKS · **Kanaal:** Pre-release

`be.persgroep.android.news.mobilehln`

[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Gebruik de originele Android 12L+-Play-splitset. Het origineel en elk van de vijf opties afzonderlijk en samen zijn gecontroleerd met de daadwerkelijke patchuitvoer, inclusief de toegevoegde Catsure-stops. Apparaattests volgen nog.

De onderzochte app bevat advertenties, publieksmeting en aparte analyse van audio en video. Ook de account- en meldingsdiensten bevatten meetfuncties. De opties richten zich op die paden en behouden echt inloggen, de accountstatus, bezorging van meldingen en synchronisatie van de speler.

Deze opties zijn beschikbaar in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | De app bevat bannertechnieken, voorloopreclame bij video's en games, advertorials en promotiekaarten voor Deals, Shop en Games. | Hide ads verwijdert de onderzochte commerciële onderdelen en gebruikt de bestaande foutafhandeling van games. Redactionele artikelen en media blijven behouden. |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement), [Firebase](../trackers/firebase.md), Facebook en Piano/Cxense | Het codeonderzoek volgt verzamelaars, wachtrijen, advertentiecodes en paden die metingen opnieuw inschakelen. | Disable tracking stopt de onderzochte paden, waaronder geplande Piano-verzending en optionele berichten in de app. |
| Gemius CIM | HLN initialiseert de publieksmeter en verstuurt gebeurtenissen; ook videomodellen bevatten een meetoptie. | Initialisatie, verzending en de onderzochte videomeetopties worden uitgeschakeld. |
| Aparte audio- en videotelemetrie | Het audiopad gebruikt `tracker.prd.dpge.be/track`; videoanalyse gebruikt `/api/v1/events/video.analytics.v1`. | Beide onderzochte verzamelaars worden lokaal afgerond met hun eigen resultaattypen. Lokale wachtrijopslag en spelerstatus blijven behouden. |
| Catsure-rapportage over afspelen en wachtrijen | De heartbeat- en wachtrijtaken gebruiken hun serverantwoord niet; de lokale wachtrij wordt apart bijgewerkt en opgeslagen. | Stop deze twee uploads en hun uitlezing van de apparaatcode; behoud lokale wachtrij-, radio-, auto- en accountlogica. |
| Marketing en toestemmingsschermen | Twee marketingpaden hebben verschillende resultaattypen; de eerste start kan toestemming, inloggen en meldingskeuzes openen. | Lege marketingresultaten stoppen hun aanvragen. Skip consent screens volgt de bestaande gastprocedure en laat melding- en nieuwsbriefkeuzes uit totdat ze handmatig worden aangezet. |

## Wat blijft bestaan en wat weten we nog niet?

Read full articles vraagt de volledige weergave op via de bestaande artikel-API. De optie kan geen tekst leveren die de server achterhoudt, een betaald account ontgrendelen of toegang tot de krant geven. Anonieme levering van volledige premiumartikelen door HLN is nog niet geverifieerd.

Door de twee [Catsure](../trackers/additional-services.md#media-telemetry)-uploads te stoppen vervalt externe rapportage van afspeelpositie en wachtrijen. Het effect op gebruik via meerdere apparaten en op de server is niet getest. Account-, artikel-, meldings-, radio- en mediadiensten blijven gegevens voor hun werking uitwisselen. Scripts op afstand, de actuele serverconfiguratie en volledige netwerkstilte zijn niet getest. Voor dit onderzoek is geen gepatchte app geïnstalleerd.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

Alle vijf opties staan standaard aan. Disable tracking omvat Hide ads; Skip consent screens omvat beide.

[Volledige definities voor deze pre-release](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/nl/reference/catalogue.md).

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026: [technisch HLN-onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/f55de86/docs/hln-audit.md). Het origineel slaagt voor de controles van behouden gedrag; de effectcontrole van elk van de vijf opties faalde vóór implementatie op dat origineel. Alle opties afzonderlijk en samen slaagden voor Morphe FULL, controle van de ondertekening en onafhankelijke controles van gedecodeerde effecten en behouden gedrag. Dit bewijst geen apparaatgedrag of netwerkstilte. [Zo lees je het bewijs](../reference/methodology.md).
