# Deezer

Gebruik de volledige catalogus van Deezer, verwijder advertenties en abonnementsprompts, en houd de auto-mediabrowser bruikbaar met DriveDeck, Gearslip of een andere geschikte Android Auto-host.

**Appversie:** 9.0.27.3 · **Build:** 9002703 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief voor deze versie in Morphe Manager, inclusief de architectuur-, taal- en scherm-splits.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Remove advertising** | Aan | Schakelt banner-, native-, audio- en preroll-advertenties uit. Weergave gaat verder zonder advertentiepauze en de audio-advertentielancering krijgt nooit zijn advertentiedata. |
| **Disable tracking** | Aan | Schakelt Adjust-initialisatie en -events, Segment-eventlevering en de Braze-bestemming, de Firebase Analytics/Crashlytics/Performance/Sessions-verzamelaars, automatische Facebook-app-events en advertentie-ID's uit. |
| **Search and sort playlists** | Aan | Toont de oorspronkelijke zoekfunctie boven de afspeellijst en Sorteren, met behoud van eigendoms- en hitlijstcontroles. |
| **Player queue shortcuts** | Aan | Toont de bestaande opties voor toevoegen aan de wachtrij en hierna afspelen in het volledige spelermenu wanneer deze beschikbaar zijn voor het gekozen nummer. |
| **Enable queue item selection** | Aan | Laat de autohost een specifieke vermelding in de huidige Deezer-wachtrij kiezen. Keuzes uit een vervangen wachtrij vervallen en het actieve wachtrij-item volgt de huidige vermelding. |
| **Android Auto API 9 media surface** | Aan | Voegt een autobrowser en speler toe. Laat geschikte aangepaste hosts toe en gebruikt de API 9-weergave alleen als de host API 9 onderhandelt; lagere niveaus behouden de terugvalweergave. |
| **Google sign-in through microG-RE** | Aan | Leidt Google-accountkeuze en autorisatie via de geïnstalleerde microG-RE, met Deezer’s oorspronkelijke OAuth-identiteit en standaard pakketnaam. |
| **Remove premium upsell UI** | Aan | Verwijdert de Premium-tab, profielpromotie, conversiebanner en Plan management-rij in Instellingen, abonnementsbanner bij Gedownloade muziek en menuoptie Luisteren zonder advertenties. Toont het gratis abonnement als Deezer Premium; account en afspelen blijven intact. |
| **Enable lyrics** | Aan | Gebruikt eerst Deezers songteksten en anders passende gewone of gesynchroniseerde teksten van LRCLIB. De knop volgt bruikbare data. LRCLIB ontvangt trackmetadata; Deezer- en Google-tokens worden nooit naar LRCLIB gestuurd. |
| **Enable offline downloads** | Aan | Schakelt de oorspronkelijke downloads van albums, afspeellijsten en favoriete nummers in en verwijdert het upgrade-aanbod. Deezer beheert opslag, bibliotheekregistratie en offline afspelen. Afzonderlijke nummers volgen Deezers normale werkwijze via de bibliotheek of een afspeellijst. |
| **Enable full streaming** | Aan | Herstelt de afspeelcontroles voor volledige nummers, zonder het account of de mediadienst te veranderen. |
| **Remove subscription paywalls** | Aan | Slaat de land-/abonnementspagina bij opstarten over en sluit abonnementsprompts. |
| **Allow any Android Auto host** | Aan | Laat de oorspronkelijke mediabrowser en de template-autoservice van Deezer geschikte aangepaste hosts toelaten. |

Deze port is uitsluitend bedoeld voor 9.0.27.3. Alle dertien patches zijn standaard geselecteerd.

## Weergave

Een aangemeld Deezer-account ontvangt een tracktoken en een volledige stream van `media.deezer.com/v1/get_url`. De Milkbeat Deezer-plugin gebruikt dezelfde route: `deezer.ping` opent de gatewaysessie, `deezer.getUserData` geeft het licentietoken, `song.getData` geeft het token per nummer en `get_url` geeft de `BF_CBC_STRIPE`-stream. **Enable full streaming** houdt Deezer's eigen mediaservice intact en verwijdert alleen de oordelen aan de clientzijde die die stream in een preview, een apparaatlimiet-weigering of een abonnementsvereiste zouden veranderen. Account, catalogus en transport blijven ongewijzigd; de kwaliteit die terugkomt volgt nog steeds wat het account en de licentie toestaan.

## Advertenties en tracking

Deezer bepaalt zijn plaatsingen met het `AdsConfigDataModel` van de gateway. De advertentiepatch geeft een lege advertentieconfiguratie terug, zodat bannereligibiliteit, de audio/preroll-poort, de audio-advertentieplanner en de SmartAdServer-opzet allemaal hun bestaande "niets te tonen"-pad nemen. Video-advertentieactiviteiten worden gesloten en de audio-advertentielancering kan geen advertentie in de intent zetten.

De trackingpatch grijpt aan op de SDK-ingangen in plaats van klassen te verwijderen die de app nog gebruikt: Adjust wordt nooit geconfigureerd en zijn eventsink doet niets; Segment's track/leveringsmethoden en de Braze-bestemming doen niets; Firebase, automatische Facebook-events, attributiepermissies en de Adjust/Facebook-manifestproviders zijn uitgeschakeld. Aanmelden, catalogus, weergave en functionele meldingen blijven werken.

## Waarom de auto leeg bleef

De mediabrowserservice van Deezer controleert pakket en ondertekeningscertificaat van de caller en zet de browserroot op null als die niet vertrouwd is. De patch behoudt de callerlookup en de rootopbouw en slaat alleen die afwijzingsbranch over. `QUERY_ALL_PACKAGES` wordt toegevoegd zodat Android 11 en nieuwer een willekeurig hostpakket kan vinden.

## Voor gebruik

Gebruik de standaardinstallatie `deezer.android.app` en meld je eerst op de telefoon aan. Kies die Deezer-vermelding in de autohost als er ook nog een oudere gekloonde kopie is geïnstalleerd. Een gepatchte APK heeft een nieuw certificaat en kan niet in-place via de Play Store worden bijgewerkt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md) · [Dekking en vergelijking](../guides/deezer-patches.md)
