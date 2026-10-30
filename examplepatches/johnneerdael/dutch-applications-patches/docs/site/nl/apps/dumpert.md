# Dumpert

**Ondersteunde app:** 5.8.0 · **Build:** 22001778 · **Invoer:** APKS

`nl.dumpert`

[Download de originele APKS](https://buzzheavier.com/nh0wyw185itn){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte Dumpert-app verzamelt centrale gebruiksstatistieken en verstuurt daarnaast zelf gebeurtenissen voor aanbevelingen. De trackingopties dekken beide soorten metingen. Je kunt nog steeds clips bekijken en kudo's geven. Bij de metingen gebruikt de app identificatoren: waarden die opeenvolgende registraties aan dezelfde installatie of hetzelfde account kunnen koppelen.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | De code stelt advertentie- en veilingverzoeken samen met een PPID (uitgevers-ID) of gehasht advertentie-ID, beschikbare account- en profiel-ID's en gegevens over de inhoud, speler en toestemming. | De patch onderdrukt ingebouwde feed- en banneradvertenties en de koppelingen voor reclame vóór video's op detailpagina's en in Shorts. Noodzakelijke speleronderdelen blijven geïnitialiseerd. |
| Eigen PostRec-dienst | `api-dms.dumpert.nl/api/v1.0/post-rec/…` ontvangt gebeurtenissen over weergaven, video's, voortgang en kudo's voor aanbevelingen, eventueel met een inlogtoken en Cxense-ID. | Deze afzonderlijke verzending stopt, ook als externe instellingen die inschakelen. Kudo's en favorieten worden gewoon verwerkt. |
| Piano/Cxense en [Comscore](../trackers/additional-services.md#audience-measurement) | In de code zijn paginaweergaven, segmenten, identiteitskoppelingen en bereikmetingen gevolgd. Centrale gebeurtenissen bevatten gegevens over inloggen en Deluxe. | Verzameling, doelgroepselectie, de optionele PPID-, advertentie- en App Set-ID's en de onderzochte verzending vanuit wachtrijen stoppen. Terugmeldingen van de wachtrij geven nog steeds aan of iets echt is verzonden. Oude, onverzonden Piano-records kunnen blijven staan tot ze verlopen. |
| [Firebase](../trackers/firebase.md) en [Meta/Facebook](../trackers/meta.md) | Het onderzoek vond app-, scherm-, aankoop-, deel- en videogebeurtenissen, identificatoren, diagnostiek en sessie- en pushstatistieken. | De patches onderdrukken de verzameling, ook als de app die tijdens gebruik opnieuw probeert in te schakelen. Ze filteren eerder opgeslagen Firebase-bundels met meet- en diagnosegegevens vóór verzending, zonder de app ten onrechte te melden dat die bundels zijn afgeleverd. Functionele diensten blijven werken. |
| [Didomi](../trackers/didomi.md) | Didomi toont automatisch toestemmingsschermen en regelt daarnaast de initialisatie, keuzes over leveranciers en doelen, en voorkeuren die je zelf instelt. | De patch slaat de automatische schermen over zonder toestemming of weigering op te slaan. De optionele metingen van het toestemmingsplatform zijn niet apart onderzocht. |

## Wat blijft bestaan en wat weten we nog niet?

Inhoud, accounts, reacties, uploads, echte aankopen, push en privacyconfiguratie blijven werken. Ze gebruiken daarvoor nog de verbindings- en dienstidentificatoren die ze nodig hebben. Facebook-aanmelding en Firebase-authenticatie en -configuratie blijven geïnitialiseerd.

De Cast-client en de Play Billing-bibliotheek kunnen nog diagnosegegevens versturen. De precieze inhoud daarvan is niet volledig onderzocht. Externe sociale spelers en reclame die de server invoegt, zijn nog niet gecontroleerd. De patches werken niet als algemeen web- of netwerkfilter. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie staan standaard aan. Hide ads verwijdert ingebouwde advertenties en abonnementspromoties. De optie toont een lokale accounttekst over Deluxe of reclamevrij gebruik en verbergt de Free-prijs, maar dat geeft geen echt Deluxe-recht. Echte abonnementsgegevens en het beheer van je abonnement blijven beschikbaar.

Disable tracking omvat Hide ads en stopt de onderzochte gebruiksmetingen, optionele identificatoren, doelgroepselectie, diagnostiek en verzending vanuit wachtrijen. Skip consent screens omvat beide andere opties. Je kunt de privacyinstellingen zelf nog openen, en de keuzes die je echt hebt opgeslagen blijven bewaard.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `8ca0ddb`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/docs/dumpert-audit.md) en [catalogus van bestemmingen en opties](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/README.md#dumpert). Na v1.9.0-dev.2 keurde de gebruiker de stabiele release goed, inclusief het opschonen van account- en promotieonderdelen. Die goedkeuring bewijst niet hoe de app zich op elk apparaat of in elk aankoopscenario gedraagt, en is geen volledige opname van het netwerkverkeer. [Zo lees je het bewijs](../reference/methodology.md).
