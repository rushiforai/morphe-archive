# Contentsquare en Heap: wat kunnen interactiemetingen vastleggen?

## Zijn dit alleen paginatellers?

Met experience analytics van Contentsquare en product analytics van Heap kun je meten hoe mensen een app gebruiken. Ze kunnen vastleggen welke schermen iemand bekijkt en welke handelingen diegene uitvoert, naast het berekenen van totalen. De huidige Contentsquare-documentatie onderscheidt gewone analytics van Session Replay en beschrijft bundels gebeurtenissen met apparaat- en sessiegegevens. Die huidige mogelijkheden bewijzen niet dat een oudere onderzochte SDK volledige sessies visueel opneemt. [Contentsquare over gegevensverzameling](https://docs.contentsquare.com/en/csq-sdk-android/experience-analytics/data-collection/).

Heaps Android-documentatie beschrijft **autocapture**: ondersteunde interacties automatisch verzamelen nadat opname en de benodigde koppelingen zijn ingesteld. Daarnaast bestaan expliciete gebeurtenissen en identiteitsaanroepen. Welke interacties automatisch worden verzameld, hangt af van de inrichting en de gebruikte onderdelen. Daarmee staat nog niet vast dat elke app ieder tekstveld of scherm vastlegt. [Heap Android-handleiding](https://developers.heap.io/docs/android).

## Hoe vormen losse tikken een gedragsbeeld?

**Denkbeeldig voorbeeld:** na een schermweergave volgen twee tikken op een knop die niet reageert en een terugkeer naar het vorige scherm. Met een sessie-ID kan die reeks laten zien waar iemand vastloopt. Een blijvende identiteit kan herhaald gedrag over meerdere bezoeken verbinden. Een **sessie** is een gebruiksperiode die het meetsysteem afbakent. Die hoeft niet samen te vallen met een accountaanmelding.

Dit voorbeeld verduidelijkt het doel en de mogelijke gevoeligheid van interactiegegevens. Het beweert niet dat de onderzochte nieuwsapps schermafbeeldingen, wachtwoorden of volledige visuele sessies opnamen. Zulke verdergaande uitspraken vereisen afzonderlijk bewijs.

## Wat vonden we in de nieuwsapps?

Het onderzoek naar [de Volkskrant 7.53.1](../apps/volkskrant.md) volgt hoe Contentsquare opstart, gebeurtenissen en schermen vastlegt, gebeurtenissen klaarzet, via toestemming wordt ingeschakeld, identiteit instelt en webpagina's koppelt. Het onderzoek bekijkt Heap afzonderlijk: de opstartproviders, opname, vastgelegde gebeurtenissen, identiteit en eigenschappen, uploads en webkoppelingen. Een **WebView** is een webpagina binnen de app. Een koppeling kan webactiviteit met ingebouwde meetcode verbinden. [Volkskrant-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/VOLKSKRANT_TRACKING_AUDIT.md).

[Trouw](../apps/trouw.md) en [Parool](../apps/parool.md), beide 7.53.1, hebben zelfstandig gecontroleerde verwante paden. De webfilters kunnen onder meer `contentsquare.net`, `contentsquare.com`, `heapanalytics.com` en `heap.io` blokkeren als de app ze laadt. De vermelding in een filter bewijst niet dat er een upload is waargenomen. [Trouw-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/trouw-audit.md), [Parool-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md).

## Wat verandert de patch?

De patches stoppen de onderzochte routes voor opstarten, opnemen, gebeurtenissen, identiteit, uploads en koppelingen met webpagina's. De app krijgt nog wel de gereedmeldingen die hij nodig heeft om verder op te starten. Ook webfuncties voor cookies en updates blijven bestaan waar ze een terugmelding aan de app moeten geven. Zo onderbreken de patches de gevonden meetroutes en kan de app verder werken.

Bewijs beoordeeld op **28 oktober 2026**. Er is geen verkeersopname die laat zien dat webpagina's die de app later insluit vrij van tracking zijn. Lees over [trackingtechnieken](../learn/how-tracking-works.md), [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
