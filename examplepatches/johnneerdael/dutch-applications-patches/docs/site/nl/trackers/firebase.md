# Firebase: waarom staat één naam voor verschillende gegevensstromen?

## Welk Firebase-onderdeel bedoelen we?

Firebase is Googles verzameling appdiensten. **Analytics** meet gebeurtenissen en gebruikerseigenschappen en kan doelgroepen vormen. **Crashlytics** meldt fouten en kan eigen logregels, kenmerken en gebruikersidentificatoren ontvangen. Deze onderdelen verzamelen andere gegevens en hebben elk hun eigen instellingen. [Firebase Analytics](https://firebase.google.com/docs/analytics), [crashrapporten aanpassen](https://firebase.google.com/docs/crashlytics/android/customize-crash-reports).

Andere onderdelen bezorgen pushmeldingen, leveren een installatie-identiteit of halen instellingen op afstand op. Een **installatie-ID** herkent een installatie voor een dienst; met een **pushtoken** kan een dienst daar meldingen aan richten. Als die functies blijven werken, wisselt de app dus nog gegevens met identificatoren uit, ook wanneer optionele gebruiksmetingen uitstaan. Firebase In-App Messaging, voor marketingberichten binnen een app, is bovendien iets anders dan de bezorging van meldingen via Cloud Messaging.

## Waarom verdienen foutmeldingen aandacht?

**Denkbeeldig voorbeeld:** een crashrapport bevat de plaats van de fout, de naam van het vorige scherm en een eigen accountreferentie. Dat kan helpen om een probleem na te bootsen. De schermnaam en accountreferentie voegen wel informatie toe die gevoelig kan zijn, ook bij een technisch doel. Onze onderzoeken beweren niet dat alle apps accountgegevens aan elke crash toevoegen.

## Wat deden de onderzochte apps?

[Buienalarm 4.32.0](../apps/buienalarm.md) bevat code voor gebeurtenissen, eigenschappen en gebruikers-ID's, Crashlytics-foutmeldingen, logregels en extra kenmerken, Sessions en meldingsmetingen. De patch stopt deze onderzochte optionele functies. Installations, Remote Config en het bezorgen van meldingen blijven werken; het onderzoek behandelt die onderdelen afzonderlijk. [Buienalarm-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md).

[Weeronline 3.61.0](../apps/weeronline.md) schakelt Crashlytics bij het opstarten expliciet in en stuurt applogs door. De patch voorkomt daarom ook dat de app Crashlytics tijdens het gebruik opnieuw inschakelt, naast het aanpassen van de manifestinstellingen. De Performance-code rond functionele HTTP-verzoeken blijft bestaan, maar verzamelt geen metingen meer. De advies-API ontvangt nog een Firebase-installatie-ID. De app haalt instellingen op bij `firebase-settings.crashlytics.com`; dat adres bewijst niet waar crashrapporten heen gaan. [Weeronline-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [toelichting op bestemmingen](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## Wat betekent “uitgeschakeld” hier?

De genoemde optie stopt de onderzochte functies voor gebruiksmetingen, diagnostiek of meldingsmetingen in die appversie. De patch verwijdert dus niet elk Firebase-onderdeel. Ook [Flitsmeister](../apps/flitsmeister.md) onderdrukt optionele Firebase-collectors en behoudt operationele tokenfuncties. De nieuwsapps behouden functionele installatie-, configuratie- en pushpaden.

## Wat verandert er in RTL Nieuws?

**Disable tracking** vermindert in [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) de optionele gebruiks- en foutmetingen, ook wanneer bekende meetgegevens al klaarstaan voor verzending. De patch onderdrukt analytics-ID's, eigenschappen en gebeurtenissen, crashlogs en extra foutgegevens, prestatiemetingen, sessiemetingen en statistieken over het bezorgen van meldingen. Hij filtert daarnaast acht bekende CCT-transportnamen uit opgeslagen verzendbatches. CCT is hier de onderzochte verzendlaag. Records met onbekende transportnamen blijven behouden, waaronder oudere records waarvan de naam niet is geverifieerd.

Firebase Auth, Installations en configuratie blijven beschikbaar. De gewone opties behouden ook pushbezorging. De afzonderlijke [Swrve-expertoptie](swrve.md) schakelt push en het automatisch opstarten van FCM uit, maar verwijdert die gedeelde Firebase-diensten niet. De exacte uploadhosts voor RTL's Firebase-metingen zijn niet vastgesteld. Dit bewijst geen volledige netwerkstilte. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## Wat verandert er in Omroep Brabant?

Bij [Omroep Brabant 11.1.0](../apps/omroep-brabant.md) stopt **Disable tracking** de onderzochte gebruiks-, crash-, sessie- en meldingsmetingen en optionele advertentie-ID's. De patch blokkeert ook eerder opgeslagen meetuploads en filtert vier bekende recordsoorten: Crashlytics-rapporten, appkwaliteitssessies, FCM-clientgebeurtenissen en clientmetingen. Onbekende transportnamen blijven behouden. Nuttige installatie-, configuratie- en pushdiensten blijven beschikbaar; hun verzoeken kunnen nog dienst-ID's en IP-informatie bevatten. De precieze meetuploadadressen zijn niet vastgesteld. [Omroep Brabant-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

Bewijs beoordeeld op **28 oktober 2026**. Er is geen nieuwe verkeersopname die volledige stilte aantoont. Zie [identificatoren](../learn/identifiers.md), [de woordenlijst](../reference/glossary.md) en [de methode](../reference/methodology.md).
