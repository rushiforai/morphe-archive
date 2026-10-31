# Videoland Android

**Ondersteunde app:** 1.116.4 · **Build:** 1627 · **Invoer:** APKS

`nl.rtl.videoland.v2`

[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Deze opties richten zich op de Android-app voor telefoons en tablets. Ze stoppen clientadvertenties en optionele metingen, slaan een echte weigering van optionele cookiedoelen op en laten meldingen uit zonder automatische toestemmingsvraag. Het filter voor inhoud buiten het gratis abonnement valt buiten deze mobiele uitgave.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Video-, banner- en pauzeadvertenties | De mobiele Bedrock-aanvragers en speler gebruiken afzonderlijke getypeerde resultaten. Het aangeleverde live-alternatief behoudt zijn eigen DRM-object. | Hide ads voltooit clientaanvragen met de ondersteunde lege resultaten en gebruikt uitsluitend een aangeleverd live-alternatief. |
| Metingen en identificatoren | Tealium, Snowplow, NPAW, New Relic, Firebase, Facebook, Salesforce-analytics, Usabilla en JOIN-metingen hebben afzonderlijke start-, configuratie- en uploadpaden. | Disable tracking stopt deze optionele paden, inclusief opgeslagen instellingen en uploads in wachtrijen. Redactionele JOIN-inhoud en expliciete feedback blijven behouden. |
| Privacy en meldingen bij het starten | De OneTrust-SDK slaat de weigering op voordat de normale gereedmelding wordt afgehandeld. Een bestaande opstarttaak kan zonder meldingenvenster voltooien. | Skip consent screens weigert optionele doelen en voltooit de automatische meldingenstap zonder toestemming te vragen. Handmatige instellingen blijven beschikbaar. |

## Wat blijft bestaan en wat weten we nog niet?

Accounts, abonnementen, authenticatie, inhoudsbezorging en licentiediensten blijven echt. De opties verlenen geen toegangsrechten en verwijderen geen reclame die in het programma zelf is verwerkt. Live-inhoud zonder aangeleverd schoon alternatief kan serverreclame behouden. De mobiele versie bevat niet het tv-filter voor niet-beschikbare inhoud. Daadwerkelijk casten en ieder abonnementstype zijn niet afzonderlijk getest.

Het ophalen van aangepaste configuratie en experimenttoewijzingen blijft bestaan. Daarbij kunnen gebruikers-, profiel- of apparaatcodes bepalen welke instellingen worden opgehaald. Dit is niet vastgesteld als gebeurtenismeting; verwerking op de server valt buiten het waargenomen bereik. Nieuwe installaties, alle apparaten en lange sessies vragen om bredere tests.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie opties staan standaard aan. Skip consent screens bevat Disable tracking; advertentieverwijdering blijft afzonderlijk te kiezen.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Gevalideerd op 31 oktober 2026 met de originele telefoonsplits: [mobiele analyse](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-videoland-mobile.md) en [consent- en notificatiecontracten](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-31-videoland-consent.md). Onafhankelijke vergelijkingen controleren alle 161.557 oorspronkelijke methoden, klassedeclaraties, geselecteerde wijzigingen en bestanden uit de splits. De 41 geïsoleerde Android 16 ART-controles betreffen de eerdere advertentie- en trackingopties. Consent en notificatieopstart zijn gecontroleerd op de uitgevoerde bytecode en met de definitieve telefoontest, niet met een aparte ART-test. De gebruiker testte de definitieve APK met alle drie opties, bevestigde dat opstarten en afspelen werken en keurde de stabiele release goed. Het bestaande account en de appgegevens bleven behouden. [Zo lees je het bewijs](../reference/methodology.md).
