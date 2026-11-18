# Meldingen van Waze en Flitsmeister in andere kaartapps

Gebruik Google Maps of Vela Maps voor navigatie terwijl gepatchte Waze of Flitsmeister op de achtergrond snelheid, maximumsnelheden en beschikbare wegmeldingen levert. De apps delen die waarnemingen lokaal op dezelfde telefoon. Zowel de bron als de ontvangende kaartapp moet worden gepatcht.

!!! important "Flitsmeister blijft op de achtergrond: werk ook Maps of Vela bij"

    Rond de broninstellingen eenmaal af en kies daarna **Flitsmeister** terwijl de ontvangende kaart zichtbaar is. De herstelde overdracht kan FM starten met locatietoegang **Alleen toestaan bij gebruik van de app**, zonder FM's scherm te openen. Een oudere Maps/Vela-patch kan bij die overdracht mislukken terwijl FM al locatietoegang heeft. Deze oplossing is gecontroleerd op een Android 14-emulator; de Android 16-telefooncontrole staat nog open. Volg [stap 2](#2-stel-de-bron-eenmaal-in).

## Wat de koppeling toevoegt

| Gegeven | Wat de ontvangende kaart kan tonen |
| --- | --- |
| Actuele snelheid en maximumsnelheid | Een compacte snelheidsweergave naast een snelheidsbord, met verse bronwaarden en waar mogelijk terugval op eigen gegevens. |
| Trajectcontroles | Het waargenomen gemiddelde, de voortgang en resterende afstand tijdens een actief traject. Beschikbare waarnemingen vóór de ingang kunnen voorwaarschuwingen geven. |
| Wegmeldingen | Beschikbare vaste en mobiele flitsers, politie, gevaren, ongevallen, files en afsluitingen. Ingeschakelde Waze-cameralagen kunnen hun waarnemingen ook delen. De dekking hangt af van de bron. |

Een gemiddelde gaat alleen over het deel van een traject dat de bron heeft waargenomen. Halverwege starten haalt het eerdere deel niet terug. Geschatte afstanden en voortgang blijven benaderingen; een melding in de buurt ligt niet automatisch op je gekozen route.

Deze navigatiegegevens staan los van advertentie- en gebruiksmetingen. **Remove telemetry** in Waze en **Disable tracking** in Flitsmeister beperken ondersteunde trackingdiensten; **Broadcast navigation data** deelt rijwaarnemingen met je gekozen kaartapp.

## 1. Patch de benodigde apps

Kies één bron en één ontvangende kaartapp. Beide bronnen installeren kan ook; kies daarna in de kaartapp welke je wilt gebruiken.

| App | Ondersteund origineel | Benodigde patch |
| --- | --- | --- |
| [Waze](../apps/waze.md) | 5.26.90.901, volledige APKM | **Broadcast navigation data** |
| [Flitsmeister](../apps/flitsmeister.md) | 14.17 / 1287 of 15.0 / 1289, volledige APKS/APKM | **Broadcast navigation data**; houd **Fix PairIP startup** aan |
| [Google Maps](../apps/google-maps.md) | 26.43.05.1002020710, volledige APK | **Receive alerts from a third-party application**; kies ook **Native navigation for any Android Auto host** voor de native auto-interface |
| [Vela Maps](../apps/vela.md) | 0.5.2621, volledige APK | **Receive alerts from a third-party application** |

Pas deze patches uit Dutch App Patches toe in Morphe Manager. Kies voor Maps alleen patches uit deze bron; de aangepaste bearinmind-opties zitten er al in. Installeer de resultaten en rond de eerste instellingen af op de telefoon. Gebruik voor een ontvangende navigatie-app in Android Auto de [KingInstaller-handleiding](android-auto.md).

De bronpatch heeft een optionele instelling **Receiver package**. Laat die leeg als beide ondersteunde kaartapps updates mogen ontvangen terwijl ze draaien. Vul voor één ontvanger `app.vela` in voor Vela, of de werkelijke pakketnaam van je gepatchte Maps, meestal `org.ungoogled.android.apps.maps`. Een eigen pakketnaam of de microG-RE-variant vereist zijn eigen naam. Een gerichte pakketnaam levert geen updates aan een andere ontvanger.

## 2. Stel de bron eenmaal in

1. Open gepatchte **Waze / De-Waze** of **Flitsmeister** eenmaal en rond de eerste instellingen af. Geef de app locatietoegang.
2. Houd het pictogram van die **bronapp** ingedrukt en kies **App-info**. Of open Android **Instellingen → Apps → Waze / De-Waze / Flitsmeister**.
3. Open **Machtigingen → Locatie**. Voor **Flitsmeister** kan exacte locatie met **Alleen toestaan bij gebruik van de app** volstaan wanneer bijgewerkte Maps/Vela de bron vanuit een zichtbare kaart start. Je hoeft FM voor die overdracht niet opnieuw te openen. Houd voor **Waze / De-Waze** **Altijd toestaan** aan voor de beschreven achtergrondstart. Toestemming geldt per bronapp.
4. Ga terug naar bijgewerkte **Google Maps of Vela Maps**, houd de kaart zichtbaar en kies **De-Waze** of **Flitsmeister**. Controleer de bronstatus; de kaartapp probeert herstelbare startfouten automatisch opnieuw.

Voor het wijzigen van deze Android-toestemming hoef je de apps niet opnieuw te patchen.

**Achtergrondlocatie nodig voor een andere startsituatie?** Vanaf Android 11 geef je **Altijd toestaan** op de instellingenpagina van de app, na de eerste locatietoestemming. Zie de [uitleg van Android](https://developer.android.com/develop/sensors-and-location/location/permissions/background). Dit is geen algemene eis voor de herstelde overdracht vanuit een zichtbare kaart naar FM.

Android kan een herstart beperken wanneer alle ontvangende apps verborgen zijn. Ga terug naar de ontvangende kaart en controleer de status; de koppeling houdt FM's scherm gesloten. Controleer de batterijbeperkingen als updates stoppen zodra het scherm uitgaat. De overlay mag uit blijven.

Met de bijgewerkte patches aan beide kanten start de gekozen rij-engine automatisch zodra je Maps/Vela opent of **De-Waze**/**Flitsmeister** kiest. Het scherm van de bronapp opent niet. Android beheert de bron als foregroundlocatiedienst; de zichtbaarheid van de melding hangt af van de toestemming voor meldingen. Tijdens deze beheerde sessie blijft de bron gedempt: Maps/Vela geeft de gesproken waarschuwingen en geluiden. Opgeslagen geluidsinstellingen en het telefoonvolume blijven ongewijzigd; normaal brongeluid keert terug nadat de deelsessie is verlopen. De kaartapp controleert de eigen motorstatus van de bron tijdens zichtbaar gebruik en actieve navigatie, herstelt de verbinding na een gestopt proces en probeert een gestopte motor opnieuw te starten met tussenpozen. Ontbrekende GPS- of wegwaarnemingen veroorzaken geen herstart en worden niet als verse gegevens behandeld.

De bronstatus maakt onderscheid tussen starten, een actieve motor, ontbrekende locatietoegang en een ontbrekende start-API. Patch beide apps opnieuw als de API ontbreekt; oudere bronpatches kunnen nog steeds gegevens leveren nadat je de bron handmatig opent. Blokkeert Android een herstart op de achtergrond, dan meldt de kaartapp dit zonder de bron te openen. Bij terugkeer naar de kaart volgt een nieuwe stille poging. De koppeling gebruikt geen root of Shizuku.

Kiezen voor eigen gegevens of het beëindigen van de ontvangende sessie verbreekt de startverbinding. Maps/Vela controleren de bron iedere 10 seconden. Na 15 seconden zonder controle wordt Waze of Flitsmeister afgesloten, uitsluitend als deze API de motor heeft gestart. Een bron die zelfstandig draaide of werd gestart, blijft ongemoeid. Open je de bron zelf op de telefoon of in de auto, dan neem je de sessie over en blijft die draaien wanneer de kaart stopt met controleren. Werk zowel de kaart- als de bronpatches bij voor dit gedrag.

## 3. Kies de bron in je kaartapp

### Google Maps / Ungoogled Maps

1. Open het accountmenu en daarna **Waze & external data source**.
2. Open **Navigation data source** en kies **De-Waze · navigation data** of **Flitsmeister · navigation data**.
3. Zet **Compact speed and average-speed control** aan als je snelheid, limiet en actieve trajectgegevens samen wilt zien.
4. Open voor De-Waze en oudere meldingen **Road alert types** en kies de gewenste categorieën; daar zijn aanvankelijk alleen politiemeldingen geselecteerd. Native Flitsmeister-waarschuwingsaudio heeft een eigen categorie-/audiokeuze, [hieronder beschreven](#native-waarschuwingsaudio-van-flitsmeister).
5. Stel **Road alerts on the map** en **Chime for a road alert ahead** apart in. Kaartspelden volgen de waarschuwingspillen, op de eigen positie van de bron; oudere bronnen zetten meldingen met een bekende positie op de kaart.
6. Controleer de bronstatus bij **Source now**. Tik erop om een beschikbare momentopname op te vragen. Automatisch starten gebruikt de aparte bron-API; een momentopname maakt oude waarnemingen nooit vers.

**Off · Google Maps** herstelt de eigen gegevens van Maps. Het alternatief **Waze · Share alerts with Maps** gebruikt de oudere Waze-meldingenkoppeling: Waze moet **Share Waze Alerts with external applications** bevatten, aangemeld zijn en blijven draaien. Die modus levert niet de uitgebreide snelheid-, limiet- en trajectgegevens. Kies voor deze handleiding de optie voor navigatiegegevens.

Flitsmeister laat Maps' onafhankelijke Flock-keuzes actief. Alleen een verse geselecteerde De-Waze-bron houdt de eerdere overname van eigen Flock aan; routevermijding houdt zijn aparte cameragegevens.

### Vela Maps

Na het kiezen van een bron toont Vela in de instellingen aparte regels voor **Waarschuwingsbrug**, **Achtergrondservice** en **Gegevens**. **Waarschuwingsbrug: verbonden** bevestigt de verbinding met de native waarschuwings-API; **Gegevens: verbonden** bevestigt recente bronwaarnemingen. Ontbrekende snelheid of weggegevens kunnen nog op Vela's eigen waarden terugvallen. Onvolledige waarschuwingsdekking en audiogereedheid blijven aparte statussen. Oudere bronversies kunnen voor de nieuwere waarschuwings-API **alleen gegevens · native waarschuwingen niet beschikbaar** melden terwijl hun gegevenskoppeling werkt. Huidige compatibele gepatchte Waze- en FM-versies melden de waarschuwingsverbinding apart van motor- en gegevensstatus. Werk de gekozen bron en ontvanger samen bij; een verbonden status bewijst op zichzelf geen volledige dekking van livewaarschuwingen.

1. Open de navigatie-instellingen en daarna **Snelheid en wegwaarschuwingen**.
2. Kies **De-Waze** of **Flitsmeister**. **Vela (eigen gegevens)** herstelt de eigen bron.
3. Stel zo gewenst **Gesproken wegwaarschuwingen** in. Deze optie volgt de stem- en dempinstellingen van Vela.
4. In de auto-instellingen kiest **Navigatieprovider** dezelfde opgeslagen bron. **Traject- en waarschuwingsdetails tonen** regelt de extra autodetails.

De actuele snelheid en limiet blijven bij elkaar. Op Android Auto toont een aparte waarschuwingspil het symbool en een geldige afstand. Vóór een trajectcontrole is dat de afstand tot de ingang; binnen het traject verschijnen het waargenomen gemiddelde en een onafhankelijke voortgangsbalk voor dat traject. De autopil toont geen waarschuwingstekst, percentage of bijschrift met resterende afstand. Onbekende waarden krijgen **—**. Een puntwaarschuwing (flitser, controle, wegafsluiting) verschijnt alleen met een afstand: de eigen vooruitkijkafstand van Flitsmeister langs de weg, of de routeafstand van de kaart. Een punt waar de route duidelijk langs gaat blijft verborgen, en een pil blijft bij een korte GPS-onderbreking 3 seconden staan in plaats van te knipperen. Een nog actieve FM-waarschuwing blijft zichtbaar tot FM hem verwijdert. De telefoonweergave en beschikbare trajectdetails blijven apart; een gemiddelde blijft onbekend totdat voldoende afstand en tijd zijn waargenomen.

Flitsmeister laat Vela's onafhankelijke Flock-keuzes voor weergave, spraak en omrijden actief. Alleen een verse geselecteerde De-Waze-bron houdt de eerdere overname van eigen Flock aan; een niet-geselecteerde bron pauzeert die functies niet.

## Native waarschuwingsaudio van Flitsmeister

Deze waarschuwingsopties blijven een ontwikkelfunctie. De modellen van Flitsmeister 15.0 en de opname van oorspronkelijke gebeurtenissen hebben de broncontroles doorstaan. Eerdere FM15-ontwikkelversies doorstonden met beide kaartapps ook gecontroleerde levering, bewegende cameracontroles, vertraagde herlevering en trajectcontroles. De huidige kandidaat bevat latere verbeteringen aan tekst, herstel en gereedheid. De uiteindelijke controles van de geïnstalleerde apps, timing en telefoon/auto staan nog open. Een actieve bron of geslaagd voorbeeld bewijst geen volledige waarschuwingsdekking.

Deze waarschuwingsmodus in ontwikkeling richt zich op **Flitsmeister 14.17 (versiecode 1287)** en nu ook **15.0 (versiecode 1289)**, met bijbehorende bijgewerkte bron- en ontvangerpatches. Bestaande basisondersteuning voor FM15 maakt een oudere geïnstalleerde bundel nog geen versie met native waarschuwingen. Werk beide kanten samen bij zodra deze wijziging beschikbaar is. Een oudere kaartapp kan haar oudere koppeling blijven gebruiken. Werk die kaartapp bij of schakel daar Flitsmeister uit voordat een andere kaart de waarschuwingsaudio overneemt.

Kies met compatibele builds aan beide kanten **Flitsmeister**. Waarschuwingsaudio werkt meteen met de aanbevolen keuzes (Spraak; flitsers, trajectcontroles, gevaar op de weg, hulpdiensten en politie); er hoeft niets bevestigd te worden. Wijzigen kan in Maps via **Flitsmeister warning audio** en **Flitsmeister warning categories** (Engelse namen), of in Vela via **Flitsmeister-waarschuwingsaudio**. Voor De-Waze werkt het hetzelfde. Eerdere expliciete demp- en typekeuzes blijven geselecteerd; een expliciete Maps-geluidskeuze wordt Toon. Kaartspelden staan los van hoorbare categorieën.

Kies Spraak, Toon of Stil. De eigen dempstand van Maps/Vela begrenst die keuze: alleen meldingen gebruikt Toon en volledig gedempt blijft Stil. Spraak gebruikt een beschikbare geïnstalleerde offline stem. Native meldingen wachten niet op de oude camera-afstand of algemene afkoelperiode. Een ontbrekende afstand blijft onbekend; een naderende hulpdienst wordt niet weggefilterd omdat de auto stilstaat of de gebeurtenis geen puntcoördinaten heeft.

Slechts één kaartapp bezit de waarschuwingsaudio. Een tweede ontvanger kan actuele waarschuwingen tonen en aangeven welke kaart de audio afhandelt. Ontvangst, wachtrij, audiostart en voltooiing zijn verschillende toestanden. Een ontbrekende engine, geweigerde audiofocus of onderbroken levering zet FM tijdens de beheerde sessie niet automatisch weer hoorbaar. Als eerdere audio mogelijk nog speelt, blijft de volgende kaart stil tot stoppen of voltooien positief is bevestigd.

Gebruik **Audiovoorbeeld terwijl u geparkeerd staat** alleen terwijl je geparkeerd staat en navigatie is gestopt. Dit vraagt via de normale audiotoestemming een duidelijk gemarkeerd lokaal synthetisch voorbeeld aan en maakt geen openbare verkeersmelding. De eigen dempstand blijft gelden. Blijft waarschuwingsaudio geblokkeerd, dan opent de hersteloptie FM's eigen bevestigingsscherm. Stop beide ontvangende kaartapps en hun spraakengine, controleer dat niets speelt of wacht, en bevestig het geparkeerde herstel. Oude aankondigingstoestemming vervalt; de eerdere waarschuwing wordt niet opnieuw afgespeeld.

Een waarschuwing die na opnieuw verbinden aankomt, behoudt haar oorspronkelijke geldigheidsduur. Een duidelijk gepasseerd punt of verlopen aankondiging wordt niet alsnog afgespeeld. Een actuele waarschuwingskaart kan na de audiotermijn zichtbaar blijven; de kaart zelf veroorzaakt geen spraak. Na een onzekere onderbreking kan stilte bedoeld zijn om dubbel afspelen te voorkomen.

Maps toont de onderstaande statussen in het Engels. Vela kan de Nederlandse tekst tonen.

| Status van waarschuwingsaudio | Wat je kunt doen |
| --- | --- |
| **Audio gereed** / **Audio ready** | De ontvanger heeft bij het verbinden een stem in de taal van de telefoon klaargezet en is gereed voor een volgende geldige waarschuwing. Controleer de aparte bronstatus voor de motor en gegevensontvangst. |
| **Waarschuwingen afgehandeld door Google Maps / Vela** | De genoemde kaart verzorgt de audio. Wijzig of schakel daar de FM-bron uit als je de andere kaart wilt gebruiken. |
| **Waarschuwingsaudio niet beschikbaar** / **Warning audio unavailable** | Controleer de spraakengine, gedownloade stem en eigen dempstand van de kaartapp. Kies Toon zelf als dat de gewenste uitvoer is. |
| **Wacht op bevestiging dat vorige audio is gestopt** / **Waiting for previous audio to stop** | Blijf geparkeerd, stop beide kaartapps en hun spraakengine en gebruik herstel pas nadat je hebt gecontroleerd dat niets meer speelt of wacht. |
| **Werk de andere ontvangende kaartapp bij** / **Update the other receiving map** | Werk de patch van de andere kaart bij of schakel daar FM uit. Een oudere actieve ontvanger verhindert exclusieve waarschuwingsaudio. |

Wanneer de gekozen spraakengine of stem beschikbaar komt, kan een nog geldige wachtende waarschuwing de voorbereiding opnieuw proberen. Verlopen waarschuwingen worden na een stemdownload of engineherstel niet alsnog afgespeeld. Houd zelf de gewenste keuze Spraak/Toon/Stil aan; herstel verandert de eigen dempstand niet.

### Waze-waarschuwingen in ontwikkeling

De ontwikkelkoppeling voor Waze 5.26.90.901 hergebruikt dezelfde waarschuwingsontvanger en spraakpaden in Maps/Vela. De brondekking blijft als onvolledig gemarkeerd zolang de runtime-acceptatie openstaat; Spraak kiezen omzeilt die blokkade niet.

Bij beheerde Waze-gebeurtenissen bepalen de gecontroleerde categorieën en Spraak/Toon/Stil-keuze van de ontvangende kaart de uitvoer. Wazes eigen camerageluidsschakelaars en beperking onder de snelheidslimiet gelden voor Wazes eigen audio. Uitgeschakelde bronwaarschuwingen, ongeldige meldingen en stille activatie voor bekende of gegroepeerde meldingen blijven van toepassing op brongebeurtenissen. Native meldingen die alleen visueel zijn blijven visueel. Maps/Vela blijft de navigatie verzorgen.

## 4. Controleer de ontvangst

Open na de eenmalige broninstellingen, terwijl je geparkeerd staat, de ontvangende kaartapp met een externe bron geselecteerd. Controleer of de gekozen bron wordt vermeld en verse gegevens meldt wanneer er waarnemingen zijn. Laat de bron op de achtergrond en controleer of de ontvangst doorgaat. Stilstand met snelheid nul is geldig; een ontbrekende snelheid of limiet moet onbekend blijven of terugvallen op de eigen kaartgegevens.

Een bronwissel, het verlaten van een traject of verlopen trajectwaarnemingen verwijdert het gedeeltelijke gemiddelde. De waarden van beide bronnen blijven gescheiden. Vanaf Android 14 kan de ontvanger de afzender van de gedeelde broadcast controleren; oudere versies bieden die Android-controle niet. Het afzonderlijke kanaal voor native FM-waarschuwingen controleert beide apps via Binder op alle ondersteunde Android-versies.

| Probleem | Controleer |
| --- | --- |
| **Android blocked background startup** bij Flitsmeister | Werk naast FM ook Maps/Vela bij, controleer FM's toegang tot de exacte locatie en kies FM terwijl de ontvangende kaart zichtbaar is. FM's scherm blijft gesloten; altijd toegestane locatie is niet de algemene oplossing voor een oudere ontvanger. |
| De-Waze blijft onbeschikbaar | Zet bij **Waze / De-Waze → App-info → Machtigingen → Locatie** de toegang op **Altijd toestaan** en ga terug naar Maps/Vela. Volg [stap 2](#2-stel-de-bron-eenmaal-in). |
| Flitsmeister werkt, maar De-Waze niet | Locatietoestemming geldt per app. Controleer **Altijd toestaan** ook voor **Waze / De-Waze**; Flitsmeisters toestemming geldt niet voor Waze. |
| Bron blijft daarna onbeschikbaar | Controleer of beide apps de bijgewerkte patches hebben, de eerste broninstellingen zijn afgerond en de juiste bron is gekozen. Controleer de bronstatus en de batterijbeperkingen van de bronapp. |
| Eén ontvanger krijgt gegevens, een andere niet | Verwijder of corrigeer de optionele **Receiver package** van de bronpatch en patch de bron opnieuw als je die optie wijzigt. |
| Snelheid werkt, maar geen gemiddelde | Er is een verse waarneming van een actief traject nodig, gevolgd door voldoende tijd en afstand. Alleen een cameramelding is geen actief traject. |
| Geen kaartspelden in Maps | Zet kaartweergave en de gewenste speldcategorieën aan. Spelden vereisen een verse melding met een bekende positie. |
| FM-gegevens komen aan, maar waarschuwingsaudio ontbreekt | Controleer de aparte FM-audio en categorieën en bekijk de audiostatus hierboven. De oude geluidsschakelaar en geschatte naderingsafstand sturen oorspronkelijke FM-aankondigingen niet aan. |
| Gegevens stoppen bij schermvergrendeling | Controleer de bronstatus en batterijbeperkingen. Ga terug naar de ontvangende kaart voor een nieuwe stille startpoging. Voor een volledig verborgen herstart gelden andere Android-beperkingen dan bij het kiezen van FM in een zichtbare kaart. |

De weergave en terugval in Google Maps zijn gecontroleerd met gestuurde bronherhalingen. Ontvangst op de achtergrond, telefoon-/autoweergave en gesproken voorwaarschuwingen in Vela zijn gecontroleerd op een Android 16-emulator met Gearslip. Native Maps-navigatie heeft aparte controles in Gearslip en de officiële Android Auto Desktop Head Unit. Deze resultaten bewijzen niet iedere combinatie van bron, telefoon, fysiek autoscherm of nauwkeurigheid op de weg.

Voor ontwikkelaars beschrijft het [gedeelde navigatieprotocol](https://gitlab.com/johninnld/nl-morphe-patches/-/blob/main/docs/navigation-broadcasts.md) de gegevens en geldigheidsregels. Andere ontvangende apps moeten dat protocol ondersteunen; alleen de bronpatch installeren voegt geen ondersteuning toe aan een willekeurige app.

Stil koud starten is ook gecontroleerd voor alle vier combinaties van Maps/Vela en Waze/Flitsmeister op een Android 16-emulator, met de aangeleverde originelen en de eigen motorstatus van de bron. Dit bewijst niet alle energieregels van fabrikanten of gedrag in een fysieke auto.

De nieuwere FM15-startoplossing is apart gecontroleerd op Android 14 met exacte locatie toegestaan, achtergrondlocatie geweigerd en meldingen geweigerd. Beide bijgewerkte kaartapps startten de echte FM-motor terwijl FM's scherm gesloten bleef. Voor Android 16 bestaan unitcontroles en onderbouwing uit de platformbron; de controle op de fysieke telefoon staat nog open. Zie het [startbewijs en de grenzen](https://gitlab.com/johninnld/nl-morphe-patches/-/blob/main/docs/research/2026-11-03-fm15-background-startup.md).

## Bekende problemen met Maps op Android Auto

De afsluitactie in de auto kan de Maps-navigatie actief laten en een gesproken FM-melding bij de ingang van een trajectcontrole kan worden onderbroken. De vernieuwde pillen verhelpen deze twee problemen niet. Livewaarschuwingen van Waze, uitgebreide muziekoverlays en extra schermprofielen zijn nog niet volledig gevalideerd.
