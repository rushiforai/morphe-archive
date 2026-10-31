# Omroep West

**Ondersteunde app:** 20.1 · **Build:** 10596 · **Invoer:** APKS

`nl.omroepwest.android`

[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De patches verwijderen de onderzochte advertenties en het nieuwsbriefblok op pagina’s en in video, stoppen vastgestelde metingen van de app en SDK’s en beperken het opstarten tot regiokeuze. Gebruik het volledige originele splitarchief dat je vanuit versie 20.1 op je telefoon hebt geëxporteerd.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Pagina-advertenties en promotionele aanbevelingen | Pinch levert native advertentieblokken, ook binnen andere blokken en in horizontale lijsten. Outbrain kan aanbevelingswidgets maken en advertentieadapters initialiseren. | Hide ads laat de vastgestelde advertentie- en nieuwsbriefmodellen, hun koppen en bijbehorende lege ruimte weg, rondt Pinch-aanvragen af via de bestaande foutcallback en voorkomt dat bewaarde Outbrain-widgets starten. |
| Videoadvertenties | Blue Billywig heeft aparte paden voor planning, renderers, outstream en later aangeleverde opties. De verticale videolijst kan kunstmatige advertentie-items invoegen en indices daarvoor corrigeren. | Hide ads onderdrukt de onderzochte advertentiegegevens en controllers en kiest samenhangende bestaande paden zonder pageradvertenties. Contentidentiteit en de levenscyclus van de speler blijven behouden. |
| Lees- en mediametingen | [Piano](../trackers/additional-services.md#piano) ontvangt artikel-, klik-, zoek-, instellingen- en mediacontext. Een NMO/Piano-identificatie kan apart worden opgeslagen en doorgestuurd. | Disable tracking stopt de onderzochte gebeurtenissen en verzendpaden en het maken en doorsturen van optionele identificaties. Bestaande opschoning van de wachtrij en functionele appdiensten blijven behouden. |
| SDK-diagnostiek en identificaties | [Firebase](../trackers/firebase.md), Google-meetdiensten en advertentie-SDK’s bevatten paden voor gebruik, crashes, sessies, meldingen en optionele identificaties. Blue Billywig-statistieken staan los van de levering van content. | De patch onderdrukt de onderzochte verzameling, statistieken en optionele identificaties en filtert vier vastgestelde meettypen uit wachtrijen. Echte afronding en onbekende transporttypen blijven behouden. |

## Wat blijft bestaan en wat weten we nog niet?

Nieuws, configuratie, accounts, radio, video, casten, Android Auto, widgets en pushdiensten behouden hun functionele codepaden. Die aanvragen kunnen nog steeds gegevens bevatten die de dienst nodig heeft. De patches maken geen abonnement en ontgrendelen geen content die een backend niet levert.

Niet alle externe webscripts, overlays, serverzijdig ingevoegde advertenties en mogelijke metingen van derden zijn bewezen verwijderd. Smartocto staat in de cookie-uitleg, maar die tekst bewijst op zichzelf geen afzonderlijke native verzender. Bestaande opgeslagen identificaties worden niet aantoonbaar gewist. Afspelen, weergave, bezorging van meldingen en resterend verkeer moeten op een apparaat met deze versie worden getest.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie de opties staan standaard aan. Disable tracking bevat Hide ads. Skip consent screens bevat beide en verwijdert automatische cookieschermen en toestemmingsvragen voor meldingen, plus de cookieoptie in beide instellingenweergaven. Bij het opstarten wordt alleen naar je regio gevraagd en wordt die keuze opgeslagen. De welkomst-, taal-, meldings- en toestemmingspagina’s vervallen; zonder beschikbare regio’s gaat de app direct verder. Meldingen blijven standaard uit, terwijl bestaande keuzes en handmatige meldingsinstellingen behouden blijven. Toestemming voor externe inhoud die je zelf opent blijft beschikbaar. De patch slaat geen acceptatie of weigering op en verleent geen meldingsrechten.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

De [stabiele versies](https://github.com/johnneerdael/dutch-applications-patches/releases) bevatten deze drie opties.

De [implementatie-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a5b15fadadd8f990813f6efb59bd11194026fb9c/docs/omroep-west-audit.md) beschrijft de ondersteunde invoer, oorspronkelijke codecontracten, uitvoerverificatie en resterende runtimebeperkingen. Het [onderzoek van de originele APK](https://github.com/johnneerdael/dutch-applications-patches/blob/b7b339af36ba403dc438520c2551cc218f484b98/docs/research/2026-10-31-omroep-west.md) legt de vergelijking met Omroep Brabant vast. Geautomatiseerde fixtures voor native instructies bewijzen geen Android- of netwerkgedrag. [Zo lees je het bewijs](../reference/methodology.md).
