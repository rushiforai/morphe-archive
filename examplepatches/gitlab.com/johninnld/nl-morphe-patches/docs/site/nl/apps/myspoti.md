# Myspoti

**Appversie:** 2.4.1 · **Build:** 1175 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de door de uitgever ondertekende Myspoti-APK. **Allow any Android Auto host** en **Custom branding** zijn compatibel met elke versie waarvan de bestaande toegangsstructuur van de muziekbrowser eenduidig wordt herkend; bij een onbekende of dubbelzinnige structuur stopt het patchen. **Android Auto Up next** accepteert 2.3.0 / 1121, 2.4.0 / 1142 en 2.4.1 / 1175. De versie hierboven is het referentiebestand. Myspoti wordt ontwikkeld door [kota-zo/myspoti](https://github.com/kota-zo/myspoti). Orpheon, de hernoemde Myspoti, heeft een eigen [apppagina](orpheon.md) met dezelfde patches.

[Muziekspelers en persoonlijke bibliotheken in Gearslip instellen](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow any Android Auto host** | Aan | Laat elke Android Auto-compatibele host verbinden met de bibliotheek en het afspelen van Myspoti, zoals Google Android Auto, DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto en AARE, ongeacht pakketnaam of ondertekeningssleutel. |
| **Android Auto Up next** | Uit | Op 2.4.0 en nieuwer exporteert Myspoti de echte huidige en komende wachtrij van afspeellijsten/radio met metadata en selectie al zelf; deze patch kan het browsen beperken tot de hostpakketten die je opgeeft, en op 2.3.0 exporteert de patch de wachtrij ook. |
| **Custom branding** | Uit | Stelt een eigen appnaam in en kiest een van zes meegeleverde launchericonen in Spotify-stijl, of behoudt het originele icoon. |

## Advertentie- en trackingdiensten

Deze compatibiliteitspatches veranderen de toegang tot de muziekbrowser en de beslissing welke autohost mag verbinden. Ze verwijderen geen onlinediensten, leveren geen account en veranderen geen abonnementsrechten.

## Voor gebruik

**Allow any Android Auto host** staat standaard aan en haalt de oorspronkelijke beperking voor autohosts weg: elke Android Auto-compatibele host, inclusief externe systemen zoals DriveDeck en Gearslip, kan de bibliotheek bekijken, zoeken en muziek kiezen om af te spelen. Myspoti's eigen controle dat de UID van een aanroeper ook echt het opgegeven pakket bezit, blijft actief; een vervalste pakketclaim wordt nog steeds afgewezen.

Myspoti 2.4.1 publiceert zijn eigen wachtrij naar de mediasessie, dus **Android Auto Up next** dupliceert die niet. Schakel deze alleen in om het browsen te beperken tot een expliciete lijst hostpakketten, of op 2.3.0 om de wachtrij te exporteren. Voer een of meer Android-apppakketten in, gescheiden door komma's, bijvoorbeeld `app.johninnl.drivedeck`; elke andere app mag niet bladeren, en `com.google.android.projection.gearhead` moet in de lijst staan wanneer ook Google's Android Auto toegestaan moet blijven. Staat de patch aan met zo'n lijst, dan beslist die lijst het browsen voor elke host. Patch opnieuw om deze keuze te wijzigen.

Schakel op 2.3.0 / 1121 **Android Auto Up next** in om maximaal 50 echte wachtrij-items inclusief het huidige item te publiceren en komende items via Myspoti's bestaande wachtrijhandler te kiezen. De gebruiker heeft bevestigd dat de ontbrekende Up next-weergave op de telefoon is opgelost na installatie van de ondertekende APK als update, met behoud van appgegevens en de bestaande Spotify-naam en het icoon.

Schakel **Custom branding** in om **App name** en de keuzelijst **App icon** te gebruiken. De keuzes zijn Original, Classic Spotify Green, Elegant dark Spotify, Emerald Spotify on pitch black, Dark emerald Spotify glass, Platinum Spotify on charcoal en Black Spotify on warm white. Een lege naam behoudt Myspoti. Naam en icoon zijn onafhankelijk instelbaar; voor een wijziging moet de APK opnieuw worden gepatcht. Branding kan samen met de andere twee patches uit dezelfde bundel worden gekozen. De patch verandert de Android-appnaam en het launchericoon; logo’s in de app, het opstartscherm, notificatieafbeeldingen en accounttoegang blijven zoals Myspoti ze levert.

Log in bij Myspoti voordat je de auto test. Een gepatchte APK moet opnieuw worden ondertekend. De door de uitgever ondertekende installatie kan niet met een andere sleutel worden bijgewerkt. Bewaar deze tijdens het testen van een aparte kopie; verwijder de installatie niet alleen om deze patch te proberen.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
