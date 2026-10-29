# Swrve: waarom delen weermeldingen en profielverzameling één onderdeel?

## Wat levert Swrve?

Swrve levert hulpmiddelen voor berichten, campagnes en doelgroepselectie. De documentatie beschrijft selectie op gebruikers- en apparaatprofielen en gedragsgeschiedenis, waaronder sessies en interacties met campagnes. Een **profiel** is een verzameling eigenschappen bij een identificator. Een **doelgroep** is een groep die voldoet aan voorwaarden voor die eigenschappen of gebeurtenissen. Deze mogelijkheden bewijzen niet dat iedere klant elke selectiemethode gebruikt. [Swrve over doelgroepfilters](https://docs.swrve.com/user-documentation/segmentation/about-audience-filters/).

Een SDK kan zulke meetfuncties combineren met functionele pushbezorging. Een **pushmelding** is een bericht dat een meldingsdienst aan een appinstallatie bezorgt. De SDK verwijderen kan daardoor zowel optionele profilering als een gewenste functie wegnemen.

## Waarom zijn locatie en een ID samen relevant?

**Denkbeeldig voorbeeld:** twee paren lengte- en breedtegraden worden met enkele uren verschil en hetzelfde gebruikers-ID verstuurd. Het ID maakt die punten voor de ontvanger koppelbaar, ook zonder naam in het bericht. Het maakt bovendien verschil of het om actuele GPS-locaties of bewust opgeslagen weersplaatsen gaat. Dit beschrijft geen gereconstrueerde reis en bewijst niet welke conclusies een server trekt.

## Wat is de concrete Buienradar-bevinding?

[Buienradar 7.4.8](../apps/buienradar.md) start Swrve en levert apparaat- en sessiegegevens en eigenschappen zoals donkere modus en abonnementsstatus. Daarnaast bevat de achtergrondtaak `LocationIntelligenceWorker` een verzoek aan `userapi.buienradar.nl/2.0/userlocation`, met breedtegraad, lengtegraad en het Swrve-gebruikers-ID. De locatieontvanger is een Buienradar-dienst. Het onderzoek noemt dit geen rechtstreekse Swrve-upload en stelt niet alle Swrve-uploadhosts vast. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## Verwijdert Disable tracking dit?

**Nee: Swrve en de achtergrondlocatie-upload blijven standaard bestaan.** De afzonderlijke optie **Disable Swrve and location upload** staat **standaard uit** en omvat Disable tracking. Die optie laat de app de bestaande inactieve versie van Swrve gebruiken en stopt de upload. De achtergrondtaak kan de laatste locatie nog lokaal bewaren.

Wie die optie selecteert, schakelt Buienradars weermeldingen uit: alle weermeldingen lopen via Swrve-push. Meldingen voor de huidige locatie zijn bovendien afhankelijk van de upload. Dit raakt regen-, luchtkwaliteits-, barbecue- en dagelijkse weersmeldingen. De standaardtrackingpatch garandeert dus niet dat alle locatiegegevens op je telefoon blijven.

## Wat verandert er in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt **Hide ads**, ook opgenomen in **Disable tracking**, de onderzochte promotiecampagnes voordat hun schermen verschijnen. Dit geldt ook voor later ingestelde campagnes die dezelfde onderzochte app- en SDK-routes gebruiken. **Disable tracking** stopt daarnaast optionele gebeurtenissen, klikken en vertoningen. Bekende opgeslagen records van het type `event` en `session_start` worden uit de wachtrij verwijderd; onbekende of onjuist gevormde records blijven behouden.

Zo kun je de onderzochte campagnemeldingen en gebruiksmeting stoppen en Swrve-push behouden. De SDK blijft in deze gewone modus gebruikers-, apparaat- en configuratiegegevens verwerken voor de functies die blijven werken, waaronder pushregistratie en het synchroniseren van gevolgde kanalen. Die uitwisseling kan dienstidentificatoren en IP-informatie bevatten. Het onderzoek stelt geen exacte Swrve-uploadhosts vast en bevat geen verkeersopname van actuele campagneberichten.

De afzonderlijke optie **Disable Swrve (expert)** staat **standaard uit** en omvat de gewone controles. Voor wie geen pushmeldingen wil, vermindert die ook de resterende SDK-uitwisseling rond gebruikers, apparaten, kanalen en achtergrondtaken. De optie gebruikt Swrves meegeleverde inactieve implementatie, stopt opgeslagen SDK-achtergrondtaken en schakelt de pushonderdelen en het automatisch opstarten van FCM uit. **Pushmeldingen en het synchroniseren van Swrve-kanalen werken dan niet meer.** Lokale voorkeuren blijven bewaard. Gedeelde Firebase Auth-, Installations- en configuratiediensten blijven beschikbaar; ook met deze expertoptie kan de app nog netwerkverzoeken versturen. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md), [implementatie van de expertoptie](https://github.com/johnneerdael/dutch-applications-patches/blob/a55b09a6f8e8acaf1ea0a2944c3b13993831b18f/patches/src/main/kotlin/patches/rtl/DisableSwrvePatch.kt).

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [locatie](../learn/location.md), [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
