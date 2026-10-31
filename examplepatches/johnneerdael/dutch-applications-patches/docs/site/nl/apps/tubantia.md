# Tubantia

**Ondersteunde app:** 9.23.2 · **Build:** 9230200 · **Invoer:** APKS

`com.mecom.tctubantia.nl`

[Download de originele APKS](https://buzzheavier.com/ja9uyq2fejyp){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Tubantia gebruikt dezelfde Kubus-appfamilie als AD. Alle vijf opties zijn aangepast aan deze nieuwere versie, inclusief de gewijzigde inlogroute en trackinginitializer. Alle vijf opties zijn beschikbaar in de stabiele patchbundel.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en commerciële artikelonderdelen | De onderzochte constructors bevatten expliciete advertentie-, advertorial- en prerollvelden. | Hide ads filtert geïdentificeerde commerciële onderdelen met behoud van de redactionele volgorde en gebruikt de bestaande foutroute voor speladvertenties. |
| Metingen en identificatie | De code bevat uitgeversevents, Comscore, Firebase, Cxense, automatische Usabilla-events en videotelemetrie. FIAM-start is naar een initializer verplaatst. | Disable tracking stopt de gekoppelde verzenders en het ophalen van identificatie en beveiligt de drie optionele FIAM-gebruikers. |
| Toestemming, onboarding en artikellevering | Deze versie heeft een gewijzigde automatische inlogroute en een reduced-parameter op de artikel-API. | Skip consent screens kiest gastgebruik en handmatige pushinschrijving. Read full articles verstuurt reduced=false en laat marketingresolvers afronden met hun ondersteunde lege resultaten. |

## Wat blijft bestaan en wat weten we nog niet?

De artikeloptie vraagt volledige onderdelen op; beschikbaarheid hangt af van de serverrespons. Er is geen Tubantia-respons met een volledige Premium-artikeltekst vastgelegd. Accountrechten, aankopen, gemeentekeuze en handmatige pushkeuzes blijven behouden. Audiosynchronisatie en externe redactionele embeds houden dezelfde onderzoeksbeperkingen als AD. Opstarten, afspelen en werkelijk netwerkverkeer zijn niet op een apparaat getest voor Tubantia.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

Alle opties staan standaard aan. Disable tracking bevat Hide ads; Skip consent screens bevat beide.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Op 30 oktober 2026 vergeleken met de aangeleverde originele splitset: [technische vergelijking](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-tubantia.md). Controles van origineel en gepatchte uitvoer toetsen de gekoppelde instructies, behouden contracten en ondersteunde selecties. Dit zijn statische en gecontroleerde instructiecontroles, zonder nieuwe apparaattest of netwerkopname. [Zo lees je het bewijs](../reference/methodology.md).
