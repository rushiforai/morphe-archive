# Deezer-patches kiezen

Dutch App Patches bevat dertien aanpassingen voor Deezer 9.0.27.3, allemaal standaard geselecteerd. Naast afspelen, advertenties, wachtrijen en afspeellijsten voegt de bundel een Android Auto-weergave met templates, Google-aanmelding via microG-RE en een terugvalbron voor songteksten toe. Bekijk de [volledige patchlijst](../apps/deezer.md).

## Getest gedrag

De beheerder gebruikt een gratis account in Nederland, waar de gewone app toegang tot Deezer Free blokkeert. Volledige nummers afspelen en nummers rechtstreeks vanuit zoekresultaten starten zijn met dat account getest. De patches slaan de onderzochte land-/abonnementsomleiding en proefabonnementspagina's over. Ze verwijderen ook afzonderlijke upgrade-elementen, waaronder de banner bij Gedownloade muziek en de menuoptie Luisteren zonder advertenties.

Downloads van albums, afspeellijsten en favoriete nummers gebruiken Deezers eigen opslag en bibliotheekregistratie. Afspelen van downloads is in vliegtuigmodus getest. Losse nummers volgen de normale werkwijze via de bibliotheek of een afspeellijst.

Songteksten gebruiken eerst Deezers eigen gegevens. Ontbreken die, dan kan een passende LRCLIB-vermelding gewone of gesynchroniseerde teksten in het oorspronkelijke songtekstenscherm tonen, met bronvermelding. De terugvalknop verschijnt pas zodra bruikbare gegevens beschikbaar zijn. LRCLIB ontvangt trackmetadata, zonder Deezer- of Google-inloggegevens; de dekking verschilt per opname en speelduur.

Android Auto krijgt een browser en speler met selecteerbare nummers uit de echte Up next-wachtrij en toegang tot de oorspronkelijke Home- en Explore-inhoud. Geschikte aangepaste hosts worden toegelaten. De API 9-weergave wordt alleen gebruikt als de host API 9 onderhandelt. Google-aanmelding via de geïnstalleerde microG-RE gebruikt Deezers oorspronkelijke OAuth-identiteit en standaard pakketnaam.

## Bronnen vergelijken

Gecontroleerd op 22 november 2026 aan de hand van AudioPatchLabs v1.2.0-broncode (`e6b40de`), de [README](https://github.com/AudioPatchLab/deezer-morphe-patches) en de [Reddit-update van de auteur](https://www.reddit.com/r/MorpheApp/comments/1xzvhcc/release_i_made_deezer_premium_features_work_for/).

Dat project beschrijft acht patches voor vrije nummerkeuze, navigatie, wachtrijen, zoeken/sorteren in afspeellijsten, advertenties, aanbiedingen, songteksten en downloads. Die categorieën overlappen met de aanpassingen hier. De README beschrijft een verplichte `.morphe`-pakketnaam en geen omzeiling van de landbeperking. De Reddit-update noemt een omweg voor afspelen vanuit zoekresultaten en een resterend proefabonnementsscherm bij nieuwe accounts. De resultaten voor Nederland en rechtstreeks zoeken hierboven betreffen de eigen tests van dit project.

Het aanvullende werk hier betreft de API 9-autoweergave en hosttoelating, selectie uit de echte autowachtrij, microG-RE-integratie, bredere afhandeling van opstart-/promotieschermen en LRCLIB als terugvalbron naast de oorspronkelijke songteksten. Gebruik één Deezer-bron met het originele archief; het combineren van overlappende versiegebonden patches wordt niet ondersteund.

Deezer-ondersteuning verscheen voor het eerst in [Dutch App Patches v1.53.5 op 7 november 2026](https://gitlab.com/johninnld/nl-morphe-patches/-/releases/v1.53.5). De verbeterde autoweergave en de terugvalbron voor songteksten zijn later ontwikkeld.

## Reikwijdte

Gebruik het volledige originele APKM van 9.0.27.3 en de standaard pakketnaam `deezer.android.app`. Deze port ondersteunt 9.0.26.3 niet meer. De Nederlandse test bewijst geen beschikbaarheid in ieder land of voor ieder account. Beschikbaarheid en kwaliteit van streams volgen wat Deezer levert; de patches veranderen een gratis account niet in een betaald abonnement.

[Installatie](install.md) · [Deezer-aanpassingen](../apps/deezer.md)
