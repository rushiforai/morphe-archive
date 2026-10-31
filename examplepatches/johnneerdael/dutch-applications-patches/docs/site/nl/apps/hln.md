# HLN

**Ondersteunde app:** 9.22.0 · **Build:** 2009220000 · **Invoer:** APKS

`be.persgroep.android.news.mobilehln`

[Download de originele APKS](https://buzzheavier.com/0p35mq8c5mu7){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Gebruik de originele Android 12L+-Play-splitset. De definitieve uitvoer slaagde voor alle vijf opties afzonderlijk en samen. Na installatie van deze kandidaat opende HLN zonder de eerdere toestemmingswaarschuwing voor aanbevelingen. De eigenaar keurde HLN vervolgens na het testen van deze kandidaat goed voor de stabiele uitgave. Deze waarnemingen bewijzen niet hoe iedere campagne op afstand zich gedraagt.

De onderzochte app bevat advertenties, publieksmeting en aparte analyse van audio en video. Ook de account- en meldingsdiensten bevatten meetfuncties. De opties richten zich op die paden en behouden echt inloggen, de accountstatus, bezorging van meldingen en synchronisatie van de speler.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | De app bevat bannertechnieken, voorloopreclame bij video's en games, advertorials en promotiekaarten voor Deals, Shop en Games. | Hide ads verwijdert de onderzochte commerciële onderdelen en gebruikt de bestaande foutafhandeling van games. Redactionele artikelen en media blijven behouden. |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement), [Firebase](../trackers/firebase.md), Facebook en Piano/Cxense | Het codeonderzoek volgt verzamelaars, wachtrijen, advertentiecodes en paden die metingen opnieuw inschakelen. | Disable tracking stopt de onderzochte paden, waaronder geplande Piano-verzending en optionele berichten in de app. |
| Gemius CIM | HLN initialiseert de publieksmeter en verstuurt gebeurtenissen; ook videomodellen bevatten een meetoptie. | Initialisatie, verzending en de onderzochte videomeetopties worden uitgeschakeld. |
| Aparte audio- en videotelemetrie | Het audiopad gebruikt `tracker.prd.dpge.be/track`; videoanalyse gebruikt `/api/v1/events/video.analytics.v1`. | Beide onderzochte verzamelaars worden lokaal afgerond met hun eigen resultaattypen. Lokale wachtrijopslag en spelerstatus blijven behouden. |
| Catsure-rapportage over afspelen en wachtrijen | De heartbeat- en wachtrijtaken gebruiken hun serverantwoord niet; de lokale wachtrij wordt apart bijgewerkt en opgeslagen. | Stop deze twee uploads en hun uitlezing van de apparaatcode; behoud lokale wachtrij-, radio-, auto- en accountlogica. |
| Marketing en toestemmingsschermen | De oude marketingsectie bij gratis inloggen, startprompts en de personalisatiewaarschuwing zijn aparte schermpaden. | De oude marketingresolver geeft het ondersteunde uitgeschakelde resultaat terug. Skip consent screens verbergt de personalisatiewaarschuwing zonder toestemming in te stellen; de echte provider en gastprocedure blijven bepalend. |
| Widget voor de companion-campagne | De beperkte filter herkent de waargenomen widgetklasse of gedateerde Valley-campagne-URL op HTML-teaserdragers. | Bijpassende dragers worden onder Hide ads gefilterd; andere HTML en redactionele items blijven behouden. De eigenaar accepteerde de geteste kandidaat; niet-waargenomen campagnes op afstand vallen buiten die acceptatie. |

## Wat blijft bestaan en wat weten we nog niet?

Read full articles vraagt de volledige weergave op via de bestaande artikel-API. De optie kan geen tekst leveren die de server achterhoudt, een betaald account ontgrendelen of toegang tot de krant geven. Anonieme levering van volledige premiumartikelen door HLN is nog niet geverifieerd.

Door de twee [Catsure](../trackers/additional-services.md#media-telemetry)-uploads te stoppen vervalt externe rapportage van afspeelpositie en wachtrijen; het effect op gebruik via meerdere apparaten en op de server blijft onbekend. De waargenomen HLN-schermen zonder waarschuwing bewijzen niet dat personalisatietoestemming is gegeven: de echte provider blijft bepalend en de oorspronkelijke toestemmingscontrole houdt aanbevelingsverzoeken tegen zolang toestemming ontbreekt. Artikeltoegang, scripts op afstand, de actuele serverconfiguratie en volledige netwerkstilte vallen buiten deze schermwaarnemingen.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

Alle vijf opties staan standaard aan. Disable tracking omvat Hide ads; Skip consent screens omvat beide.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026: [technisch HLN-onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/hln-audit.md). Het origineel slaagt voor de controles van behouden gedrag; de effectcontrole van elk van de vijf opties faalde vóór implementatie op dat origineel. Alle opties afzonderlijk en samen slaagden voor Morphe FULL, controle van de ondertekening en onafhankelijke controles van gedecodeerde effecten en behouden gedrag. Deze uitvoercontroles staan los van de schermwaarnemingen hierboven en bewijzen geen volledige netwerkstilte. [Zo lees je het bewijs](../reference/methodology.md).
