# Didomi: waarom toestemming en metingen van de toestemmingsdienst scheiden?

## Wat levert Didomi?

Didomi levert een toestemmingsplatform. Dat toont privacymeldingen, geeft een overzicht van doelen en leveranciers en bewaart je keuzes. De Android-SDK ondersteunt instellingen die de app van een server ophaalt en een scherm voor privacyvoorkeuren. De API heeft afzonderlijke functies om te bepalen of een keuze moet worden gevraagd en om een beslissing vast te leggen. Controleren of een scherm nodig is, verschilt dus van een toestemmingskeuze opslaan. [Android-inrichting](https://developers.didomi.io/cmp/mobile-sdk/android/setup), [Android-API](https://developers.didomi.io/cmp/mobile-sdk/android/reference/api).

Een **API** is een interface waarmee code een ander onderdeel of een dienst iets laat doen. Een privacy-SDK kan API's gebruiken voor functionele instellingen en keuzes, maar ook voor metingen over de eigen prestaties of het gebruik. Bekijk instellingen, privacykeuzes en metingen dus afzonderlijk, ook als ze dezelfde aanbieder of hostnaam gebruiken.

## Waarom is een melding verbergen soms onvoldoende?

**Denkbeeldig voorbeeld:** een app toont geen cookiemelding meer, maar een al gestart analyticsonderdeel blijft schermgebeurtenissen versturen. Blokkeer je al het verkeer naar de toestemmingsdienst, dan kan het handmatige voorkeurenscherm uitvallen. Je moet daarom afzonderlijk nagaan wat er gebeurt met de meetcode, opgeslagen keuzes en privacyschermen. Dit voorbeeld beschrijft mogelijke ontwerpkeuzes; er is geen sessie opgenomen.

## Wat bevatten de onderzochte apps?

Bij [Buienalarm 4.32.0](../apps/buienalarm.md) schakelt de patch de functie uit die Didomi's prestatie- en API-metingen toestaat. Je kunt je voorkeuren nog handmatig beheren en de app kan opgeslagen toestemmingskeuzes blijven gebruiken. De exacte uploadhost voor die metingen is niet vastgesteld.

Bij [Weeronline 3.61.0](../apps/weeronline.md) stoppen optionele metingen ook, terwijl configuratie en toestemmings-API-gebeurtenissen blijven werken. De SDK noemt onder meer `sdk.privacy-center.org` en `mobile-2470.api.privacy-center.org` als configuratie- en API-bestemmingen. Dat bewijst niet dat elk verzoek daar tracking is. [Buienalarm-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md), [Weeronline-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [bestemmingstoelichting](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

[Weerplaza 3.13.1](../apps/weerplaza.md) stopt daarnaast de onderzochte wachtrij voor ingebouwde API-gebeurtenissen, het opnieuw verwerken en verzenden ervan, en de exacte webroutes `/v1/events` en `/v1/sync`. Andere instellingen en handmatige privacykeuzes blijven beschikbaar. Deze extra maatregelen zijn voor Weerplaza vastgesteld en gelden niet automatisch voor de andere apps. [Weerplaza-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md).

## Betekent overslaan accepteren of weigeren?

**Skip consent screens** schrijft in deze patches geen toestemming of weigering en omvat trackingonderdrukking. De optie voorkomt dat de schermen automatisch verschijnen. Bestaande keuzes en handmatige instellingen blijven behouden. Ook [NRC](../apps/nrc.md) behoudt echte opgeslagen toestemming en handmatige privacy bij het overslaan van zijn automatische Didomi-interface.

Bewijs beoordeeld op **28 oktober 2026**. Deze bevindingen komen uit het onderzoek naar de appcode. Ze geven geen juridisch oordeel en berusten niet op een netwerkopname. Lees over [toestemming](../learn/consent.md) en [de methode](../reference/methodology.md).
