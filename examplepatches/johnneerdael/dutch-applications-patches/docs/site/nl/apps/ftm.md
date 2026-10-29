# FTM

**Ondersteunde app:** 2.6.8 · **Build:** 58 · **Invoer:** APKS

`nl.ftm.ftmpulse`

[Download de originele APKS](https://buzzheavier.com/2cv2n5bgc3tn){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

FTM toont zijn live website in de app. Het privacyonderzoek volgt daarom zowel de Android-app als de scripts en opslag van de website. Een van de onderzochte metingen registreert bij welk artikel de reacties zichtbaar worden.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Matomo](../trackers/additional-services.md#publisher-measurement) op `insight.ftm.nl` | De onderzochte code verstuurt metingen over pagina’s, fouten en gebeurtenissen. | De patch blokkeert de host die deze metingen ontvangt en zijn subdomeinen in de ingebouwde browser (WebView). |
| [Eventor](../trackers/additional-services.md#publisher-measurement) op `eventor.ftm.nl` | De onderzochte code gebruikt vijf sleutels in de lokale opslag om gebeurtenissen te uploaden en herkenningscodes bij te werken. | De patch stopt de verzoeken en wist de vijf sleutels zodra de pagina geladen is. De sleutels kunnen nog tijdelijk worden aangemaakt voordat de patch ze wist. |
| Sentry/GlitchTip-diagnose | De onderzochte code verstuurt fouten en diagnosegegevens naar `glitchtip.ftm.nl`. | De patch blokkeert deze host en zijn subdomeinen in de WebView. |
| [ActiveCampaign](../trackers/additional-services.md#publisher-measurement) en zichtbare reacties | Het onderzoek vond een lader en de exacte route met numeriek ID `/activecampaign/event/create/view_comments/{id}`. | De patch blokkeert de bekende lader, het verzamelpunt en de exacte route; reacties en formulieren die je zelf invult blijven werken. |

## Wat blijft bestaan en wat weten we nog niet?

Artikelen, audio, accounts, geschiedenis en functionele push blijven werken. De website kan veranderen zonder APK-update.

Read full articles behoudt tekst die de website al levert. Gasttoegang tot artikelen en podcasts is getest, maar dat garandeert niet dat ieder toekomstig serverantwoord dezelfde toegang biedt. De blokkades gelden alleen voor de ingebouwde browser van de app, niet voor externe browsers. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FTM_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
