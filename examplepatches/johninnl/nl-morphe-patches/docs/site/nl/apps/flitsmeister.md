# Flitsmeister

**Appversie:** 14.17 · **Build:** 1287 · **Origineel bestand:** APKS

[Download originele app](https://buzzheavier.com/1esn82va0l3d){ .md-button .md-button--primary }

[Flitsmeister installeren voor Android Auto: stappen met screenshots](../guides/android-auto.md){ .md-button }

Selecteer het exacte originele bestand in Morphe Manager. Gebruik bij een gesplitste app het volledige archief.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Broadcast navigation data** | Aan | Deelt actuele snelheid, geldende limieten, wegmeldingen en naderende/actieve trajectcontroles via hetzelfde lokale contract als Waze. Geen overlay nodig. |
| **Disable partner services** | Aan | Verwijdert Parkeren, Tol en Carwash en de bijbehorende instellingen. |
| **Disable tracking** | Aan | Stopt de ondersteunde optionele gebruiksstatistieken, advertentie-ID’s en diagnostiek. |
| **Fix PairIP startup** | Aan | Laat de gepatchte app na installatie starten en de ondersteunde functies gebruiken. Laat deze patch aan. |
| **Guest mode** | Aan | Voegt Doorgaan als gast toe, laat de app zonder inloggen openen en verbergt het grote accountaanmaakblok. |
| **Hide Pro notices** | Aan | Verbergt automatische Pro/Plus-aanbiedingen, badges en Android Auto-upgradeberichten. |
| **Hide ads** | Aan | Verwijdert commerciële locatiepromoties, hun afbeeldingen en reclamemeldingen. Verkeerswaarschuwingen blijven. |
| **Unlock Pro** | Aan | Schakelt lokaal geregelde Pro-opties in. Functies waarvoor accountactivering nodig is blijven afhankelijk van de dienst. |

## Advertentie- en trackingdiensten

De advertentie- en trackingpatches beperken de ondersteunde optionele activiteit van: Firebase, Insider; automatische gebruiks- en locatiemetingen; commerciële locatiegebonden advertenties.

Metingen blokkeren blokkeert niet elke functie van dezelfde aanbieder. Noodzakelijke appdiensten kunnen nog verbinding maken.

## Voor gebruik

**Broadcast navigation data** werkt zolang de rij-/locatiedienst met locatietoegang op de achtergrond draait. De overlay mag uit blijven. Ontvangende apps gebruiken dezelfde actie en velden voor Flitsmeister en Waze. De bron levert geschatte afstand vóór trajectinrit en beschikbare meldingen van vaste/mobiele flitsers, politie, gevaren, ongevallen, files en afsluitingen. Gemiddelden gaan alleen over het waargenomen deel; berekende voortgang wordt als schatting gemarkeerd. [Gedeeld broadcastcontract](https://github.com/johninnl/nl-morphe-patches/blob/main/docs/navigation-broadcasts.md).

Navigatie, live verkeers-/locatie-uitwisseling, accounts en meldingen gebruiken nog steeds online diensten. Unlock Pro activeert geen serverdiensten. Volg voor Android Auto de [KingInstaller-installatiestappen](../guides/android-auto.md).

Kies **Doorgaan als gast** om de introductie zonder account af te ronden. Je kiest zelf of je locatietoestemming geeft. Optioneel inloggen blijft beschikbaar. Gastmodus activeert geen accountdiensten, zoals ritgeschiedenis in de cloud of parkeren. De patch herstelt Google-inloggen niet en verwijdert de afzonderlijke accountvereiste van Android Auto niet.

Doorgaan als gast en de kaart openen zijn op één telefoon getest. Het verbergen van het accountaanmaakblok moet nog op een toestel worden getest.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
