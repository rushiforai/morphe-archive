# De Tijd

**Ondersteunde app:** 5.6.1 · **Build:** 5060100 · **Invoer:** APKS

`mobi.inthepocket.mediafin.detijd`

[Download de originele APKS](https://buzzheavier.com/57j3z167r1n2){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De Tijd bevat advertenties en metingen van lezen, schermen en mediagebruik. Alle zeven opties zijn na goedkeuring door de eigenaar beschikbaar in [stabiele v1.22.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.22.0). De zes standaardopties staan standaard aan; Hide Mijn Tijd (expert) blijft optioneel. Elke optie en de gecombineerde kandidaat slagen voor lokale patching, ondertekening en controle van de gedecodeerde uitvoer. De gecombineerde kandidaat doorstond ook een afgebakende anonieme leestest op een Android 14-arm64-emulator.

Een emulatorsessie zonder ingelogd account ontving voor twee artikelen 21 en 27 paragrafen terwijl de app een abonneemuur toonde. De artikeloptie toont paragrafen die de uitgever al terugstuurt en behoudt de normale verzoeken en echte accountstatus.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties | De app voegt advertenties aan feeds en artikelen toe en maakt native-, banner- en outstreamweergaven en videoreclamelinks. | Hide ads stopt de onderzochte invoeg- en weergavepaden en rondt native advertentieladen via het bestaande foutpad af. |
| Publieks- en interactiemetingen | Snowplow en Gemius hebben in de geleverde code paden voor lezen, schermen, scrollen, audio of videometingen. | Disable tracking stopt de geselecteerde initialisatie en events en behoudt hun normale afronding. |
| Advertentiedoelgroepen en videokwaliteit | Admantx-zoekwoorden, Mux-toestemmingsafhandeling en Firebase-analysestandaarden staan los van het leveren van inhoud. | De onderzochte optionele callbacks ronden af zonder verzameling in te schakelen; analysestandaarden worden uitgeschakeld of geweigerd. |
| Artikelweergave | Twee anonieme artikelantwoorden bevatten meerdere paragrafen ondanks geweigerde betaalmuurverzoeken. De app beperkte daarna de weergave. | Read full articles verwijdert die weergavebeperking en opent de ontvangen De essentie-feed direct, zonder verzoeken of accountstatus te wijzigen. |
| Toestemming, introductie en promoties | Automatische toestemmingsschermen, de trackinguitleg, introductie en servicebanner hebben aparte weergavebeslissingen. | De bijbehorende opties slaan deze automatische schermen en promoties over zonder toestemming of accounttoegang vast te leggen. |

## Wat blijft bestaan en wat weten we nog niet?

Inloggen, het ophalen van het anonieme clienttoken, pushinitialisatie, Airship-schermnamen en handmatige privacyvoorkeuren blijven behouden. Automatische Airship-campagnes in de app worden overgeslagen, ook eventuele servicemeldingen via dat kanaal; pushmeldingen en het handmatige berichtencentrum blijven beschikbaar. Voorlezen, cadeauartikelen, krantedities en inhoud die de server achterhoudt blijven hun echte toegangsregels gebruiken. Twee onderzochte antwoorden bewijzen niet dat elk artikel beschikbaar is.

De essentie opent de feed zonder de promotie- of “Ga verder”-pagina wanneer de API artikelen levert, ook zonder account. De gecombineerde kandidaat opende direct de startpagina en toonde meerdere ontvangen artikelparagrafen zonder abonneemuur in zeven gescrolde schermindelingen. Het betaalmuurantwoord bleef toegang weigeren; de accountstatus veranderde niet. Media, offline lezen, werkelijk onderdrukte tracking en andere apparaten zijn niet bevestigd. De aparte weergave van door de server geleverde advertentieparagrafen is nog onopgelost; labels bij gesponsorde redactionele inhoud blijven staan. Gebruik de originele Play-splits voor Android 8.0+; de onderzochte invoer bevat arm64-bibliotheken.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens, Skip onboarding, Hide Mijn Tijd (expert).

Mijn Tijd is toegankelijk met een gratis De Tijd-account; een betaald abonnement is niet nodig. Ben je niet van plan een account te gebruiken, schakel dan **Hide Mijn Tijd (expert)** in om de knop onderaan te verbergen. Deze expertoptie staat standaard uit.

Disable tracking omvat Hide ads. Skip consent screens omvat beide. Read full articles omvat ook Hide ads, omdat het oorspronkelijke pad voor volledige weergave advertenties invoegt. Skip onboarding en Hide Premium banner zijn onafhankelijke weergaveopties. Hide Premium banner verbergt automatische promoties in de app en de hele servicebanner, inclusief eventuele service- of foutmeldingen op die plek.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026; de eigenaar bevestigde het gedrag op de telefoon en keurde stabiele publicatie goed: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/3c8ad7fd2683fb4579bd609f5b80ee5754d816c1/docs/detijd-audit.md) en [onderzoeksnotitie](https://github.com/johnneerdael/dutch-applications-patches/blob/3c8ad7fd2683fb4579bd609f5b80ee5754d816c1/docs/research/2026-10-30/detijd.md). Alle zeven afzonderlijke opties, de zes standaardopties en de gecombineerde kandidaat slagen voor uitvoercontroles van 23 Hermes-bewerkingscontracten, herstel van de volledige originele bundel en 516 native contracten. De expertoptie staat aantoonbaar standaard uit en behoudt bij inschakelen de overige vier knoppen onderaan. De anonieme De essentie-feed en het afronden van overgeslagen promoties zijn op een emulator getest. Een emulatorsessie zonder account bevestigde de ontvangst voor twee artikelen; de gecombineerde kandidaat toonde voor één artikel meerdere paragrafen zonder waargenomen appfout. Dit is geen volledige dekking van artikelen of netwerkverkeer. [Zo lees je het bewijs](../reference/methodology.md).
