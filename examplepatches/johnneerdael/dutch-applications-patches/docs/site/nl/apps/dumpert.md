# Dumpert

**Ondersteunde app:** 5.8.0 · **Build:** 22001778 · **Invoer:** originele Play-APKS · **Android:** 12L / API 32 of nieuwer

`nl.dumpert`

[Download de originele APKS](https://buzzheavier.com/nh0wyw185itn){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte Dumpert-app verzamelt centrale gebruiksstatistieken en verstuurt daarnaast zelf gebeurtenissen voor aanbevelingen. De trackingopties dekken beide soorten metingen. Een clip bekijken en een kudo geven blijven mogelijk. Bij de metingen gebruikt de app identificatoren: waarden die opeenvolgende registraties aan dezelfde installatie of hetzelfde account kunnen koppelen.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | De code stelt advertentie- en veilingverzoeken samen met een PPID (uitgevers-ID) of gehasht advertentie-ID, beschikbare account- en profiel-ID's en gegevens over de inhoud, speler en toestemming. | De patch onderdrukt ingebouwde feed- en banneradvertenties en de koppelingen voor reclame vóór video’s op de detailpagina en in Shorts. Noodzakelijke speleronderdelen blijven geïnitialiseerd. |
| Eigen PostRec-dienst | `api-dms.dumpert.nl/api/v1.0/post-rec/…` ontvangt gebeurtenissen over weergaven, video’s, voortgang en kudo’s voor aanbevelingen, eventueel met een inlogtoken en Cxense-ID. | Deze afzonderlijke verzending stopt, ook als externe instellingen die activeren. Kudo’s en favorieten worden nog steeds echt verwerkt. |
| Piano/Cxense en [Comscore](../trackers/additional-services.md#audience-measurement) | In de code zijn paginaweergaven, segmenten, identiteitskoppelingen en bereikmetingen gevolgd. Centrale gebeurtenissen bevatten gegevens over inloggen en Deluxe. | Verzameling, doelgroepselectie, optionele PPID-, advertentie- en App Set-ID's en onderzochte verzending vanuit wachtrijen stoppen. Terugmeldingen blijven aangeven of iets echt is verzonden. Oude, onverzonden Piano-records kunnen tot hun vervaldatum blijven staan. |
| [Firebase](../trackers/firebase.md) en [Meta/Facebook](../trackers/meta.md) | Het onderzoek bracht app-, scherm-, aankoop-, deel- en videogebeurtenissen, identificatoren, diagnostiek en sessie- en pushstatistieken in kaart. | De patches onderdrukken de verzameling en voorkomen dat die opnieuw wordt ingeschakeld. Ze filteren eerder opgeslagen Firebase-bundels met meet- en diagnosegegevens vóór verzending. De app krijgt daarbij geen onterechte melding dat ze zijn bezorgd. Functionele diensten blijven werken. |
| [Didomi](../trackers/didomi.md) | Didomi toont automatisch toestemmingsschermen en beheert daarnaast initialisatie, keuzes over leveranciers en doelen, en voorkeuren die je zelf instelt. | De patch slaat de automatische schermen over zonder toestemming of weigering op te slaan. De optionele metingen van het toestemmingsplatform zijn niet afzonderlijk geïsoleerd. |

## Wat blijft bestaan en wat weten we nog niet?

Inhoud, accounts, reacties, uploads, echte aankopen, push en privacyconfiguratie blijven werken. Daarvoor blijven noodzakelijke verbindings- en dienstidentificatoren in gebruik. Facebook-aanmelding en Firebase-authenticatie en -configuratie blijven geïnitialiseerd.

De Cast-client en Play Billing-bibliotheek kunnen nog diagnosegegevens versturen; de exacte inhoud is niet volledig onderzocht. Externe sociale spelers en reclame die op de server wordt ingevoegd, zijn nog niet bevestigd. De patches werken niet als algemeen web- of netwerkfilter.

## Beschikbare opties

Alle drie staan standaard aan in stabiele versie **v1.9.0**:

- Hide ads verwijdert ingebouwde advertenties en abonnementspromoties. De lokale accounttekst die Deluxe of reclamevrij gebruik vermeldt en het verbergen van de Free-prijs geven geen echt Deluxe-recht. Echte abonnementsgegevens en beheer blijven behouden.
- Disable tracking omvat Hide ads en stopt de onderzochte gebruiksmetingen, optionele identificatoren, doelgroepselectie, diagnostiek en verzending vanuit wachtrijen.
- Skip consent screens omvat beide opties. Je kunt privacyinstellingen zelf blijven openen en de app bewaart je echte keuzes.

Zie [installeren](../guides/install.md), [patches kiezen](../guides/choose-patches.md) en de [catalogus](../reference/catalogue.md).

## Bewijs

Beoordeeld op **28 oktober 2026** tegen main `8ca0ddb`: [implementatieonderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/docs/dumpert-audit.md) en [bestemmings-/patchcatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/8ca0ddb/README.md#dumpert). Na v1.9.0-dev.2 keurde de gebruiker de stabiele release goed, inclusief het opschonen van account- en promotieonderdelen. Deze goedkeuring bewijst niet hoe de app op elk apparaat of in elk aankoopscenario werkt en levert geen volledige opname van netwerkverkeer. [Zo lees je het bewijs](../reference/methodology.md).
