# NOS Teletekst

**Ondersteunde app:** 2.8.10 · **Build:** 62 · **Invoer:** APKS

`com.eoffice.android`

[Download de originele APKS](https://buzzheavier.com/xse5agsu2tia){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je Teletekstpagina's leest, registreert de app NOS/NPO-publieksmetingen, en de scorebordpagina toont een terugkerende promotie voor de NOS-app. De patches stoppen de onderzochte metingen en die promotie. We vonden in deze versie geen door de app aangestuurde commerciële advertentielader of betaalmuur. De gebruiker meldde een geslaagde telefoontest en gaf op 29 oktober 2026 toestemming voor publicatie op main.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| `topspin.npo.nl/mob-event` | De app zet weergaven van pagina's en subpagina's, navigatie, interacties met favorieten, delen en promoties, en zichtbaarheid in een wachtrij. Elke registratie bevat gebeurtenis-, party-, sessie- en DAM-ID's, tijdstippen en context over de app, het apparaat en het scherm. | Disable tracking voorkomt dat de NOS/NPO-analyse wordt opgebouwd, inclusief de blijvende wachtrij en de periodieke zichtbaarheidsmetingen (heartbeats). De app krijgt in plaats daarvan de eigen lege tracker van NOS, zodat aanroepen normaal worden afgerond zonder de SDK op te bouwen of een verzendresultaat te verzinnen. |
| `nmonpoendpoint.2cnt.net` | Een afzonderlijk NMO-verzoek verstuurt de DAM-identificatie (`cs_fpid`) en de leverancier, met minstens 24 uur tussen inzendingen. | Disable tracking voorkomt ook dat deze dienst wordt gestart. |
| NOS-app-promotie | Een ingebouwd dialoogvenster op het scorebord promoot de NOS-app bij het derde geschikte bezoek aan pagina 818. | Hide promotions stopt de controle die het venster oproept, voordat het verschijnt en voordat promotiebezoeken worden geteld. Pagina 818 blijft werken. |
| `teletekst-data.nos.nl` | Levert Teletekstinhoud en vernieuwing. | Blijft werken, net als favorieten, delen en de ingebouwde paginaweergave. |

## Wat blijft bestaan en wat weten we nog niet?

Bestaande lokale tracking-ID's en wachtrijgegevens blijven op het apparaat staan. Het gepatchte proces start hun SDK niet. Gegenereerde tracking-ID's kunnen gedrag koppelen zonder advertentie-ID of account. Inhoudsverzoeken delen nog gewone netwerkinformatie, zoals je IP-adres, met de server.

Het instellen van de Google Play-beveiligingsprovider en de informatieve privacymelding voor tv's blijven behouden. De app bevat ongebruikte Piano/ATInternet-code, en die aanwezigheid bewijst geen actieve verzameling. Deze bevindingen komen uit broncodeonderzoek. Ze zijn geen ontsleutelde analyseopname en geen bewijs van het volledige gedrag op een telefoon. Gebruik de volledige originele Android 6+-Play-splitset van precies deze versie, want de winkelversie kan afwijken.

## Beschikbare opties

Disable tracking, Hide promotions.

Beide opties staan standaard aan en werken los van elkaar.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen main `1edd321`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/teletekst-audit.md), [implementatie](https://github.com/johnneerdael/dutch-applications-patches/tree/1edd321fd8bb94354f25b2462ebe9e51335740ca/patches/src/main/kotlin/patches/teletekst) en [bestemmingen, gegevens en overige diensten](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/privacy/nos-teletekst/README.md). Controles op de originele APK en op volledig herbouwde APK's (FULL) omvatten beide opties afzonderlijk en samen, de ingebouwde paden voor tracker, promotie en levenscyclus, en 148 behouden methodegrafen. Het onderzoek legt de telefoongoedkeuring van de gebruiker vast. Die goedkeuring is geen ontsleutelde verkeersopname en geen uitputtende test op alle Android-apparaten. [Zo lees je het bewijs](../reference/methodology.md).
