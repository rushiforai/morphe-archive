# Usabilla/GetFeedback: wanneer wordt feedback automatische meting?

## Waarvoor dient deze dienst?

Usabilla, waarvoor je ook GetFeedback-documentatie tegenkomt, helpt organisaties feedback verzamelen en enquêtes tonen. Een SDK, een ingebouwd codepakket, kan een formulier openen wanneer je dat zelf vraagt. Het kan ook appgebeurtenissen ontvangen en daarmee bepalen wanneer een automatische enquêtecampagne verschijnt.

De aanbieder beschrijft **custom variables**: benoemde waarden die met feedback meegaan of een enquête selecteren, zoals abonnementsvorm of de eerder bezochte pagina. Dat zijn ondersteunde mogelijkheden, geen bewijs dat iedere onderzochte app die voorbeelden verstuurt. Het antwoord op een enquête en de eraan gekoppelde context zijn afzonderlijke gegevens. [GetFeedback over extra variabelen](https://help.surveymonkey.com/en/getfeedback/builder/custom-variables/).

## Hoe kan een enquêtetool gedrag waarnemen?

**Denkbeeldig voorbeeld:** een app meldt driemaal “video mislukt” en de enquêtetool biedt daarna een vragenlijst aan. Je hebt nog geen antwoord getypt, maar de aanleiding beschrijft al je appgebruik. Krijgt het latere antwoord een installatie-ID en abonnementsstatus mee, dan bevat het meer context dan alleen jouw woorden. Daarom behandelen we een feedbackknop en automatische gegevensverzameling afzonderlijk.

**Telemetrie** is informatie die software over haar werking of gebruik verstuurt. Dat kan een ander doel hebben dan reclame. Ook bij kwaliteitsverbetering zijn zulke gegevens niet vanzelf anoniem.

## Wat deden de onderzochte koppelingen?

[Buienradar 7.4.8](../apps/buienradar.md) stelt `UbTelemetryRecorder` in en roept `Usabilla.sendEvent` aan; de aangetroffen bestemming is `sdk.out.usbla.net`. **Disable tracking** zet het telemetrieniveau op nul en stopt automatische gebeurtenissen. Het handmatig geopende feedbackformulier in Instellingen blijft beschikbaar. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

Bij [NU.nl 26.9.0](../apps/nunl.md) stopt de patch ook het opstarten van Usabilla, de gebeurtenissen in de wachtrij en de uiteindelijke verzendfunctie. Daardoor kunnen ook handmatig geopende feedbackformulieren of enquêtes onbeschikbaar zijn.

Bij [AD 9.22.0](../apps/ad.md) stoppen automatische gebeurtenissen en extra variabelen, terwijl het opstarten, de gereedmeldingen en de terugmeldingen van het handmatige feedbackformulier blijven werken. [NU.nl-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md), [AD-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md).

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md) stopt **Disable tracking** automatische feedbackgebeurtenissen en extra variabelen over schermen, het uitlezen van artikelen, het afronden van video's en interacties. Zo stopt de onderzochte automatische doorgifte van gebruikscontext terwijl je zelf nog feedback kunt insturen. Initialisatie en terugmeldingen bij het sluiten van formulieren blijven werken. De exacte RTL-uploadhost voor Usabilla is niet vastgesteld; het Buienradar-adres hierboven mag niet automatisch op RTL worden toegepast. [RTL Nieuws-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## Wat blijft onbekend?

De code laat zien hoe de app gegevens verzamelt en verzendt. Er is geen feedbackbericht van jouw telefoon opgenomen. Een formulier dat je zelf verstuurt, kan via behouden functies nog steeds je ingevulde gegevens verzenden. Een domeinnaam of enquêtesoftware bewijst geen bewaartermijn, doorverkoop of ieder gebruik van een antwoord.

Bewijs beoordeeld op **28 oktober 2026**. Zie [trackingtechnieken](../learn/how-tracking-works.md), [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
