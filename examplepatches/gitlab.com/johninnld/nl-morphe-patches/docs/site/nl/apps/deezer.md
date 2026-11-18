# Deezer

Gebruik de volledige catalogus van Deezer, verwijder advertenties en abonnementsprompts, en houd de auto-mediabrowser bruikbaar met DriveDeck, Gearslip of een andere geschikte Android Auto-host.

**Appversie:** 9.0.26.3 · **Build:** 9002603 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief voor deze versie in Morphe Manager, inclusief de architectuur-, taal- en scherm-splits.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow any Android Auto host** | Aan | Laat de auto-mediabrowser van Deezer elke Android Auto-host accepteren via de ingebouwde Android Auto-structuur, met Home, Library, Recent en Explore plus de eigen Up next-wachtrij van Deezer. |
| **Enable full streaming** | Aan | Houdt volledige nummers speelbaar voor het aangemelde account: verwijdert preview- en apparaatlimiet-oordelen, behoudt offline- en radiorechten, wist de streamingtijdslimiet en laat catalogusitems via Deezer's eigen mediaservice afspelen. |
| **Remove advertising** | Aan | Schakelt banner-, native-, audio- en preroll-advertenties uit. Weergave gaat verder zonder advertentiepauze en de audio-advertentielancering krijgt nooit zijn advertentiedata. |
| **Disable tracking** | Aan | Schakelt Adjust-initialisatie en -events, Segment-eventlevering en de Braze-bestemming, de Firebase Analytics/Crashlytics/Performance/Sessions-verzamelaars, automatische Facebook-app-events en advertentie-ID's uit. |
| **Remove premium upsell UI** | Aan | Verwijdert de Premium-tab uit de onderste navigatiebalk, de Get Premium-knop op het gebruikersprofiel, de conversiebanner en de Plan management-rij in Instellingen, en toont het gratis accountabonnement als Deezer Premium. De rest van Instellingen, profiel, account en weergave blijft intact. |
| **Remove subscription paywalls** | Aan | Slaat de abonnementenpagina bij het opstarten over (behandelt het account als niet wachtend op betaling en negeert de no-freemium-startdoorverwijzing), verbruikt de Premium-tab voordat die start, leidt de Premium-startactiviteit naar Home in plaats van naar de launcher, blokkeert de premiumtab-webviewpaywall na het aanmelden en sluit de artiestenpaywall, trial-start en aanbiedingsdialoogvensters na hun normale lifecycle. |

## Weergave

Een aangemeld Deezer-account ontvangt een tracktoken en een volledige stream van `media.deezer.com/v1/get_url`. De Milkbeat Deezer-plugin gebruikt dezelfde route: `deezer.ping` opent de gatewaysessie, `deezer.getUserData` geeft het licentietoken, `song.getData` geeft het token per nummer en `get_url` geeft de `BF_CBC_STRIPE`-stream. **Enable full streaming** houdt Deezer's eigen mediaservice intact en verwijdert alleen de oordelen aan de clientzijde die die stream in een preview, een apparaatlimiet-weigering of een abonnementsvereiste zouden veranderen. Account, catalogus en transport blijven ongewijzigd; de kwaliteit die terugkomt volgt nog steeds wat het account en de licentie toestaan.

## Advertenties en tracking

Deezer bepaalt zijn plaatsingen met het `AdsConfigDataModel` van de gateway. De advertentiepatch geeft een lege advertentieconfiguratie terug, zodat bannereligibiliteit, de audio/preroll-poort, de audio-advertentieplanner en de SmartAdServer-opzet allemaal hun bestaande "niets te tonen"-pad nemen. Video-advertentieactiviteiten worden gesloten en de audio-advertentielancering kan geen advertentie in de intent zetten.

De trackingpatch grijpt aan op de SDK-ingangen in plaats van klassen te verwijderen die de app nog gebruikt: Adjust wordt nooit geconfigureerd en zijn eventsink doet niets; Segment's track/leveringsmethoden en de Braze-bestemming doen niets; Firebase, automatische Facebook-events, attributiepermissies en de Adjust/Facebook-manifestproviders zijn uitgeschakeld. Aanmelden, catalogus, weergave en functionele meldingen blijven werken.

## Waarom de auto leeg bleef

De mediabrowserservice van Deezer controleert pakket en ondertekeningscertificaat van de caller en zet de browserroot op null als die niet vertrouwd is. De patch behoudt de callerlookup en de rootopbouw en slaat alleen die afwijzingsbranch over. `QUERY_ALL_PACKAGES` wordt toegevoegd zodat Android 11 en nieuwer een willekeurig hostpakket kan vinden.

## Voor gebruik

Meld je eerst op de telefoon aan bij Deezer. Een gepatchte APK heeft een nieuw certificaat en kan niet in-place via de Play Store worden bijgewerkt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
