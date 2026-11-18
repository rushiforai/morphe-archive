# Orpheon

**Appversie:** 1.0.0 · **Build:** 1194 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Orpheon is de hernoemde Myspoti-muziekapp: dezelfde code en mediasessie, gepubliceerd onder een eigen pakketnaam. Selecteer de door de uitgever ondertekende Orpheon-APK. **Allow any Android Auto host** en **Custom branding** zijn compatibel met elke versie waarvan de bestaande toegangsstructuur van de muziekbrowser eenduidig wordt herkend; bij een onbekende of dubbelzinnige structuur stopt het patchen. **Android Auto Up next** accepteert 1.0.0 / 1194. De versie hierboven is het referentiebestand. Myspoti zelf blijft beschikbaar op de eigen [apppagina](myspoti.md).

!!! warning "Orpheon 1.0.0 heeft de Spotify-functionaliteit verwijderd"
    De niet-bèta Orpheon 1.0.0-release biedt geen Spotify-functionaliteit meer. Deze patches veranderen alleen de toegang tot de Android Auto-muziekbrowser, het publiceren van de wachtrij en de branding voor de eigen bibliotheek van de app.

[Muziekspelers en persoonlijke bibliotheken in Gearslip instellen](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow any Android Auto host** | Aan | Laat elke Android Auto-compatibele host verbinden met de bibliotheek en het afspelen van Orpheon, zoals Google Android Auto, DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto en AARE, ongeacht pakketnaam of ondertekeningssleutel. |
| **Android Auto Up next** | Uit | Orpheon exporteert de echte huidige en komende wachtrij van afspeellijsten/radio met metadata en selectie al zelf; deze patch kan het browsen beperken tot de hostpakketten die je opgeeft. |
| **Custom branding** | Uit | Stelt een eigen appnaam in en kiest een van zes meegeleverde launchericonen in Spotify-stijl, of behoudt het originele icoon. |

## Advertentie- en trackingdiensten

Deze compatibiliteitspatches veranderen de toegang tot de muziekbrowser en de beslissing welke autohost mag verbinden. Ze verwijderen geen onlinediensten, leveren geen account en veranderen geen abonnementsrechten.

## Voor gebruik

**Allow any Android Auto host** staat standaard aan en haalt de oorspronkelijke beperking voor autohosts weg: elke Android Auto-compatibele host, inclusief externe systemen zoals DriveDeck en Gearslip, kan de bibliotheek bekijken, zoeken en muziek kiezen om af te spelen. Orpheon's eigen controle dat de UID van een aanroeper ook echt het opgegeven pakket bezit, blijft actief; een vervalste pakketclaim wordt nog steeds afgewezen.

Orpheon publiceert zijn eigen wachtrij naar de mediasessie, dus **Android Auto Up next** dupliceert die niet. Schakel deze alleen in om het browsen te beperken tot een expliciete lijst hostpakketten. Voer een of meer Android-apppakketten in, gescheiden door komma's, bijvoorbeeld `app.johninnl.drivedeck`; elke andere app mag niet bladeren, en `com.google.android.projection.gearhead` moet in de lijst staan wanneer ook Google's Android Auto toegestaan moet blijven. Staat de patch aan met zo'n lijst, dan beslist die lijst het browsen voor elke host. Patch opnieuw om deze keuze te wijzigen.

Schakel **Custom branding** in om **App name** en de keuzelijst **App icon** te gebruiken. De keuzes zijn Original, Classic Spotify Green, Elegant dark Spotify, Emerald Spotify on pitch black, Dark emerald Spotify glass, Platinum Spotify on charcoal en Black Spotify on warm white. Een lege naam behoudt Orpheon. Naam en icoon zijn onafhankelijk instelbaar; voor een wijziging moet de APK opnieuw worden gepatcht. Branding kan samen met de andere twee patches uit dezelfde bundel worden gekozen. De patch verandert de Android-appnaam en het launchericoon; logo’s in de app, het opstartscherm, notificatieafbeeldingen en accounttoegang blijven zoals Orpheon ze levert.

Orpheon is de uitgebrachte variant van Myspoti. Meld je aan voordat je de auto test en bewaar de door de uitgever ondertekende installatie: een gepatchte APK moet opnieuw worden ondertekend en kan een installatie met een andere sleutel niet bijwerken.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
