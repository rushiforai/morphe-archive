# Marktplaats

**Ondersteunde app:** 16.17.0 · **Build:** 633462 · **Invoer:** APKS

`nl.marktplaats.android`

[Download de originele APKS](https://buzzheavier.com/cq3amiskfsdy){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je advertenties bekijkt en zoekt, kan de app advertentiemetingen en targeting voeden met de advertentie, de positie ervan, je postcode en kenmerken van verkoper, categorie en zoekopdracht. Daarnaast bevat de app SDK's voor attributie, marketingberichten, diagnostiek en optionele onderzoeken, en een ThreatMetrix-beveiligingsprofiel dat aan beveiligde verzoeken wordt meegegeven. De stabiele v1.18.0 bevat alle vijf opties, inclusief de verbeterde inlogroute voor Google.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertentiemeting en Google Ad Manager | Tellers voor aangevraagd, geboden, geladen, getoond, mislukt en zichtbaar, laadtijd, en native gebeurtenissen voor vertoning, klik en kijkduur. De targeting bevat de URN van de advertentie, de positie, de postcode en kenmerken van verkoper, categorie en zoekopdracht. Google-verzoeken voegen reclame- en sessie-ID's en toestemmingsvelden toe. | Hide ads verwijdert de herkenbare display- en native advertentievakken in zoekresultaten, advertentiepagina's en op de startpagina, en stopt het starten, laden, targeten en meten van advertenties. Echte advertenties van verkopers, ook betaalde promoties, paginering en wettelijke informatie blijven. |
| PubMatic OpenWrap en Prebid | OpenWrap-routes voor biedingen, configuratie, weergave en crashrapporten van de SDK, die apparaat- en targetinggegevens kunnen bevatten. Er is een Prebid-host ingesteld, maar het gebruik ervan is niet vastgesteld. | Hide ads stopt de eigen OpenWrap-start van de app en het laden van advertenties. De bibliotheken blijven in de app. |
| Adjust en Criteo | Attributie-, verwijzings- en apparaatgegevens. De Adjust-laag van de app geeft Criteo-product-ID's, transactie-ID's, aantallen, prijzen, productlijsten en deeplinks door. | Disable tracking stopt het starten van de SDK, gebeurtenissen en verwijzingsverwerking, ook de install-referrer-ontvanger. De code voor privacyverzoeken blijft; we beweren niet dat een verwijderverzoek bij de leverancier is aangekomen. |
| [Meta/Facebook](../trackers/meta.md) | Optionele app-gebeurtenissen, ID's, kenmerken en crash-, fout- en ANR-rapporten van de SDK, naast inloggen met Facebook. | Disable tracking stopt het opnemen, opslaan en versturen van gebeurtenissen en de diagnose-uploads. Inloggen met Facebook blijft werken. |
| Braze | Marketingprofielen, koppeling aan je account, in-app-inhoud en reacties op pushberichten. | Disable tracking zet de SDK in de eigen uitgeschakelde stand. Marketing-, in-app- en pushberichten van Braze staan uit. De eigen FCM-meldingen van de app voor chat, bestellingen, beveiliging en bewaarde zoekopdrachten blijven. |
| Datadog en UserZoom | Datadog verzamelt RUM, acties, prestatiecijfers, netwerkbronnen en tracing, logs en koppeling aan de gebruiker. UserZoom voert optionele onderzoeken uit en kan scherm en video opnemen. Er is geen opname waargenomen en deze build vraagt geen `RECORD_AUDIO` aan. | Disable tracking stopt de start van Datadog en de bijbehorende gebruikerskoppeling, en beide startpunten van UserZoom. Uploads via camera, chat en verkopers blijven. |
| [Firebase](../trackers/firebase.md) | App-gebeurtenissen, schermen en kenmerken, diagnose-, prestatie- en sessiegegevens, en export van afleverstatistieken voor berichten. | Disable tracking stopt de centrale gebeurtenisverwerking en het opvragen van de reclame-ID, zet Analytics en Performance permanent uit, houdt diagnostiek uit en zet de export van afleverstatistieken uit. Bekende metingen in de wachtrij worden via de eigen fout- en verwijderafhandeling van de app weggegooid. Onbekende transporttypen houden hun echte verzend- en herhaalgedrag. |
| Adyen-checkoutanalyse | Setup van checkout, 3DS en betaling, setupgegevens van de SDK en een echte checkoutpoging-ID. | Disable tracking stopt optionele gebeurtenissen, timers en uploads. De eerste setupgegevens en de uitwisseling van de poging-ID blijven, omdat de betaalcode die ID gebruikt. |
| ThreatMetrix-beveiligingsprofiel | Apparaat- en beveiligingsprofilering, gekoppeld aan sessieheaders bij beveiligde verzoeken. De volledige native gegevens en de eisen van de server zijn onbekend. | Disable tracking alleen laat dit draaien. Disable ThreatMetrix stopt het starten en profileren en stuurt de lege headers van de app mee. Inloggen, afrekenen en andere beveiligde verzoeken kunnen mislukken. De patch verzint geen profiel of sessie. |

## Wat blijft bestaan en wat weten we nog niet?

Advertenties van verkopers bekijken, zoeken, chatten, inloggen, Maps, verzending, betalingen, toestemmingskeuzes in Sourcepoint en de eigen FCM-meldingen van de app blijven werken. De gedeelde API-verzoeken bevatten nog sessie-, apparaat-, versie- en taalvelden. Oude SDK-bestanden en gegevens bij leveranciers kunnen blijven bestaan. Functionele diensten ontvangen nog de gegevens die je invoert en gewone netwerkinformatie zoals je IP-adres.

De bestemmingstabel in de privacynotities onderscheidt aanroepen die de app doet, ingestelde bestemmingen en activiteit die nog niet is opgehelderd. Een ingestelde bestemming bewijst niet dat die op een bepaalde telefoon gegevens heeft ontvangen.

Account, chat en push, Maps en betaal- en beveiligingsgedrag zijn niet volledig getest. De laatste accountverificatie na inloggen met Google doe je zelf. Zeven native bibliotheken blijven ongewijzigd. Gebruik de volledige originele Play-splitset voor Android 12L+ (API 32) van precies deze versie.

## Beschikbare opties

Disable ThreatMetrix, Disable tracking, Google sign-in via microG-Re, Hide ads, Skip consent screens.

Alle vijf staan standaard aan. Disable tracking bevat Hide ads, en Skip consent screens bevat Disable tracking. Disable ThreatMetrix en Google sign-in via microG-Re werken los van de andere opties.

Skip consent screens voorkomt dat de cookiemelding bij het starten verschijnt en vraagt Sourcepoint om alles te weigeren. De privacy-instellingen blijven handmatig bereikbaar. Met Disable ThreatMetrix kunnen inloggen, afrekenen en andere beveiligde verzoeken mislukken, omdat niet bekend is wat de server vereist. Zet de optie uit als dat gebeurt.

Google sign-in via microG-Re gebruikt microG-Re voor inloggen via Google Credential Manager als de inlogdienst daarvan geïnstalleerd en ingeschakeld is. De optie houdt de oorspronkelijke uitgeversidentiteit aan, laat andere koppelingen met Google-diensten staan en valt terug op de oorspronkelijke route als die dienst ontbreekt. De vertaling van verzoeken en antwoorden ondersteunt de Google-ID-namespace van microG-Re en de Bundle-antwoorden op Android 14 (API 34) en nieuwer.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen release `v1.18.0`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.18.0/docs/marktplaats-audit.md), [bestemmingen, gegevens en resterende diensten](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.18.0/docs/privacy/marktplaats/README.md) en [patchbroncode](https://github.com/johnneerdael/dutch-applications-patches/tree/v1.18.0/patches/src/main/kotlin/patches/marktplaats). Controles van de originele en opnieuw gebouwde APK's bevestigen 912 originele methode- en ABI-contracten en de behouden callbacks, annuleringen en foutpaden. Een live USB- en Frida-test op Android 16 zag correct vertaalde Google-verzoeken en geslaagde antwoorden met inloggegevens, waarna de app zijn eigen verificatiescherm voor accountbeveiliging bereikte. Zonder de diagnosetools startte de normale gepatchte APK zonder Android-runtimefouten, en de gebruiker keurde de release goed. Er is geen ontsleutelde verkeersopname of volledige Android-runtime-audit gemaakt. Tijdens de bouw- en broncontroles is geen accountactie of transactie uitgevoerd. [Zo lees je het bewijs](../reference/methodology.md).
