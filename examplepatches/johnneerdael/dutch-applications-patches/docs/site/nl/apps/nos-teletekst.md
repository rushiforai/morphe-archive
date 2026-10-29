# NOS Teletekst

**Ondersteunde versie:** 2.8.10 · **Build:** 62 · **Invoer:** originele Play-APKS · **Android:** 6 / API 23 of nieuwer

`com.eoffice.android`

[Officiële appvermelding](https://play.google.com/store/apps/details?id=com.eoffice.android){ .md-button .md-button--primary }

Gebruik de volledige originele splitset van precies deze versie. De winkelversie
kan afwijken. Zie [originele bestanden](../guides/downloads.md) en [installatie](../guides/install.md).

De patches stoppen de onderzochte NOS/NPO-publieksmetingen en
terugkerende NOS-app-promotie. De gebruiker meldde een geslaagde telefoontest en gaf op 29 oktober 2026 toestemming voor publicatie op main. We vonden
geen door de app aangestuurde commerciële advertentielader of betaalmuur in deze versie.

## Activiteit en patcheffecten

| Bestemming / activiteit | Wat de onderzochte app doet | Wat verandert |
| --- | --- | --- |
| `topspin.npo.nl/mob-event` | Zet pagina-/subpaginaweergaven, navigatie, favoriet-/deel-/promotie-interacties en zichtbaarheid in een wachtrij, met gebeurtenis-/party-/sessie-/DAM-ID's, tijdstippen en app-/apparaat-/schermcontext. | Disable tracking voorkomt dat NOS/NPO-analyse wordt opgebouwd, inclusief de blijvende wachtrij en periodieke zichtbaarheidsmetingen. |
| `nmonpoendpoint.2cnt.net` | Een onafhankelijk NMO-verzoek verstuurt de DAM-identificatie (`cs_fpid`) en leverancier, met minstens 24 uur tussen inzendingen. | Dezelfde optie voorkomt dat deze dienst wordt gestart. |
| NOS-app-promotie | Een ingebouwd dialoogvenster promoot de NOS-app bij het derde geschikte bezoek aan scorebordpagina 818. | Hide promotions stopt de voorwaarde vóór weergave of het tellen van promotiebezoeken. Pagina 818 blijft werken. |
| `teletekst-data.nos.nl` | Levert Teletekstinhoud en vernieuwing. | Blijft werken, evenals favorieten, delen en de ingebouwde paginaweergave. |

## Beschikbare opties

Beide opties staan standaard aan en zijn onafhankelijk van elkaar.

- Disable tracking geeft de ingebouwde lege tracker van NOS terug. Aanroepen
  worden normaal afgerond, zonder de SDK op te bouwen of een verzendresultaat te verzinnen.
- Hide promotions voorkomt het gevonden NOS-app-venster voordat het verschijnt.

[Exacte catalogus en standaardkeuzes](../reference/catalogue.md).

## Overige verbindingen en grenzen van het bewijs

Bestaande lokale tracking-ID's en wachtrijgegevens blijven bewaard. Het gepatchte
proces start hun SDK niet. Gegenereerde ID's kunnen gedrag koppelen zonder
advertentie-ID of account. Inhoudsverzoeken delen nog gewone netwerkinformatie,
zoals het IP-adres, met de server.

Het instellen van de Google Play-beveiligingsprovider en de informatieve
privacymelding voor tv's blijven behouden. Aanwezige maar ongebruikte
Piano/ATInternet-code bewijst geen actieve verzameling. Dit zijn bevindingen uit
broncodeonderzoek, geen ontsleutelde analyseopname of bewijs van volledig telefoongedrag.

## Bewijs

Beoordeeld op 29 oktober 2026. Controles op de originele en volledig herbouwde
APK omvatten beide opties afzonderlijk en samen, de ingebouwde tracker-/promotie-/levenscycluspaden
en 148 behouden methodegrafen. De gemelde telefoongoedkeuring staat in de audit.
[Hoe je het bewijs leest](../reference/methodology.md).

[implementatie](https://github.com/johnneerdael/dutch-applications-patches/tree/1edd321fd8bb94354f25b2462ebe9e51335740ca/patches/src/main/kotlin/patches/teletekst) · [implementatie-audit](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/teletekst-audit.md) · [bestemmingen, gegevens en overige diensten](https://github.com/johnneerdael/dutch-applications-patches/blob/1edd321fd8bb94354f25b2462ebe9e51335740ca/docs/privacy/nos-teletekst/README.md).
