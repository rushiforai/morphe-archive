# Parool

**Appversie:** 7.53.1 · **Build:** 23136515 · **Origineel bestand:** APKS

[Download originele app](https://buzzheavier.com/mezktjli0rmt){ .md-button .md-button--primary }

Selecteer het exacte originele bestand in Morphe Manager. Gebruik bij een gesplitste app het volledige archief.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Android Auto nieuws** | Aan | Maakt Nieuws het eerste Android Auto-tabblad en toont de nieuwste koppen van de voorpagina met gesproken audio. |
| **Disable tracking** | Aan | Stopt de ondersteunde optionele gebruiksstatistieken, advertentie-ID’s en diagnostiek. |
| **Hide Premium banner** | Aan | Verbergt automatische abonnementsaanbiedingen en Premium-promoties. |
| **Hide ads** | Aan | Verwijdert ondersteunde advertenties in overzichten, artikelen, video’s en spellen. |
| **Read full articles** | Aan | Toont volledige artikeltekst wanneer de uitgever die levert. Maakt geen abonnement aan. |
| **Skip consent screens** | Aan | Slaat automatische toestemming, login en meldingsinstellingen over. Start als gast met meldingen uit; handmatige instellingen blijven beschikbaar. |

## Android Auto nieuws

De auto-interface krijgt een eerste tabblad **Nieuws**: een doorlopende lijst met de nieuwste koppen waarvan de uitgever gesproken audio levert — precies de artikelen waar de telefoonapp de luisterknop bij zet. Rijen gebruiken de eigen car-stijl van de app (titel, kleine afbeelding, duur en datum) en spelen af via de bestaande artikelaudiospeler. De oude serverinhoud van het Start-tabblad wordt volledig vervangen door deze feed.

Het tabblad bevat alle artikelen met gesproken audio van de voorpagina, zonder vaste artikellimiet. Elke rij start de volledige feed bij het gekozen artikel, in de getoonde volgorde, en gaat daarna automatisch verder met de latere artikelen. De standaardbediening voor het vorige artikel is beschikbaar vanaf het tweede artikel; die voor het volgende artikel tot en met het voorlaatste. **Hierna** toont de artikelen die na het huidige artikel nog volgen. Een rij in die lijst kiezen gaat naar dat artikel binnen dezelfde feed. Eerdere artikelen blijven bereikbaar via Vorige.

Compacte rijen houden de volledige lijst beschikbaar. De bladerlijst wordt vernieuwd met een korte cache voor herhaalde verzoeken, zonder extra accounts of instellingen. Vernieuwen verandert de volgorde van de actieve afspeelwachtrij niet en voegt daar geen nieuwe koppen aan toe: een artikel uit de vernieuwde feed kiezen start die nieuwe reeks. Artikelen achter de betaalmuur houden de normale rechtencontrole en het afspeelbeleid van de app: ze spelen voor abonnees en blijven gesloten voor anderen. Is de feed niet beschikbaar, dan toont het tabblad nieuws uit de cache of blijft het leeg; de oude Start-inhoud wordt nooit getoond. Kan een oude feed niet meer worden hersteld, open Nieuws dan opnieuw en kies een artikel uit de huidige lijst.

## Advertentie- en trackingdiensten

De advertentie- en trackingpatches beperken de ondersteunde optionele activiteit van: Snowplow, Contentsquare / Heap, Gemius, Comscore, Piano/Cxense, Firebase, Usabilla, BrandMetrics; metingen van de uitgever en speler.

Metingen blokkeren blokkeert niet elke functie van dezelfde aanbieder. Noodzakelijke appdiensten kunnen nog verbinding maken.

## Voor gebruik

Artikelbeschikbaarheid hangt af van wat de uitgever levert. Er wordt geen account, aankoop of abonnement aangemaakt. Accounts, push en mediadiensten blijven online.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
