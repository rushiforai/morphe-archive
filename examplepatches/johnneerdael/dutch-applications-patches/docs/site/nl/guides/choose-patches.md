# Kies wat er in je app verandert

Met elke optie verander je iets anders. Een schermonderdeel verbergen en het bijbehorende netwerkverzoek stoppen vereisen verschillende wijzigingen.

| Naam van de patch | Wat je kunt verwachten |
| --- | --- |
| Hide ads | Stopt de onderzochte advertentiepaden voor die app en haalt de bijbehorende advertenties van het scherm. Andere analysediensten kunnen blijven werken. |
| Disable tracking | Onderdrukt de onderzochte gegevensverzameling, het meesturen van herkenningscodes en uploads. Bij [Omroep Brabant](../apps/omroep-brabant.md) verwijdert Skip consent screens ook **Cookie instellingen** uit het menu en voorkomt hij de cookiedialoog. Opgeslagen keuzes blijven gelijk en handmatige Android-meldingsinstellingen blijven beschikbaar. Schakel meldingen daar zo nodig zelf in.

Lees de uitzonderingen bij je app, vooral voor locatie, meldingen en het afstemmen van het afspelen. |
| Skip consent screens | Slaat de ondersteunde automatische privacyschermen over, met de vereiste privacymaatregelen. De patch legt daarbij niet automatisch toestemming of weigering vast. Je kunt de privacyopties nog steeds zelf instellen. |
| Hide Premium banner / Hide Pro notices | Haalt de genoemde promoties of labels van het scherm. |
| Fix Google services / Fix Google Maps / Fix PairIP startup | Helpt bepaalde ondersteunde apps werken nadat ze zijn aangepast en opnieuw ondertekend. |
| Read full articles / Unlock Plus / Unlock Pro | Lees op de app-pagina wat deze patches wijzigen. Ze maken geen aankoop aan en kunnen geen gegevens leveren die de server niet terugstuurt. |

## Keuzes met gevolgen voor functies {#twee-keuzes-om-bij-stil-te-staan}

In Buienradar blijft Swrve met de gewone trackingpatch actief, omdat de weerwaarschuwingen die dienst gebruiken. De afzonderlijke patch Disable Swrve and location upload stopt ook die waarschuwingen. [Lees deze afweging](../apps/buienradar.md).

In Flitsmeister verwijdert Disable partner services de opties voor Parkeren, Tol en Carwash, inclusief de bijbehorende instellingen. De live locatie-uitwisseling voor CITS blijft aan. In de beoordeelde stabiele release staan alle zes opties standaard aan. [Lees wat blijft bestaan](../apps/flitsmeister.md).

Bij RTL Nieuws stoppen de standaardopties ingebouwde advertenties, promotiecampagnes en de onderzochte metingen, terwijl push en handmatige instellingen beschikbaar blijven. Laat Disable Swrve (expert) uit als je push wilt behouden. Deze extra optie staat standaard uit en stopt de resterende Swrve-activiteit, maar ook pushmeldingen en Swrve-kanaalsynchronisatie. [Vergelijk de opties](../apps/rtl-nieuws.md).

Lees de uitzonderingen op de app-pagina om te weten welke bescherming je krijgt. De patchnaam "Disable tracking" geldt voor de beschreven onderdelen. Hij garandeert niet dat je de app anoniem kunt gebruiken. [Waarom behouden verkeer ertoe doet](../learn/location.md).
