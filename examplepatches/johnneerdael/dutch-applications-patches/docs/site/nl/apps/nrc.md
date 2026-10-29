# NRC

**Ondersteunde app:** 5.12.24 · **Build:** 626 · **Invoer:** APK

`com.twipemobile.nrc`

[Download de originele APK](https://buzzheavier.com/qhawp9l19uhc){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte NRC-app gebruikt diensten voor het meten van artikelgebruik, aandachtstijd en publiek, en voor personalisatie. De patches stoppen de onderzochte metingen en behouden het leveren van artikeltekst en het vernieuwen van accountsessies.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Chartbeat](../trackers/additional-services.md#editorial-analytics) en [Parsely](../trackers/additional-services.md#editorial-analytics) | De in de code gevolgde app-koppelingen en webbestemmingen meten lezen en betrokkenheid bij artikelen. | De onderzochte metingen in de app en bekende meetsignalen van webpagina’s stoppen; functionele [Parsely](../trackers/additional-services.md#editorial-analytics)-aanbevelingen blijven. |
| [Comscore](../trackers/additional-services.md#audience-measurement) en Piano/Cxense | In de code zijn publieksmeting en verzoeken voor profielen en segmenten gevolgd. De app bevat meerdere mogelijke bestemmingen; dat bewijst niet dat ze allemaal zijn benaderd. | De onderzochte code die partnerdiensten, analyse en profielen opstart, stopt; de oorspronkelijke beginwaarden voor segmenten (gebruikersgroepen) blijven behouden en sessies worden nog vernieuwd. |
| [Firebase](../trackers/firebase.md) en Mediahuis | Het onderzoek bracht gebeurtenissen, kenmerken, gebruikerscodes, aandachtstijd en verzending naar partners in kaart. | De patch onderdrukt de onderzochte verzending, verzameling van diagnosegegevens en pushanalyse. |
| Eigen appview-domeinen | De onderzochte broninhoud en blokkaderegels voor webverzoeken noemen bekende bestemmingen voor klikmeting, tags en Sophi. | De patch blokkeert bekende meetverzoeken; de exacte gegevens die naar externe diensten gaan zijn niet onderschept. |

## Wat blijft bestaan en wat weten we nog niet?

De server voor inhoud en edities behoudt de echte gast-`phone_id` en de sessie- en accountstatus.

Hide newspaper tab verwijdert navigatie naar een onbeschikbare functie en geeft geen recht om kranten te downloaden. Reclame die in een redactionele afbeelding is afgedrukt, blijft zichtbaar als een los advertentie-element wordt verborgen. Read full articles behoudt ontvangen tekstonderdelen en kan geen tekst leveren die de server achterhoudt. Gebruik de originele Android 6+-APK.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Hide newspaper tab, Read full articles, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NRC_PATCH_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
