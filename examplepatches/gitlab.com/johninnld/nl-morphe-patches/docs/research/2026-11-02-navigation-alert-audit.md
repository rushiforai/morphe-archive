# Onderzoek: van Flitsmeister en De-Waze naar tijdige waarschuwingen in Maps en Vela

Onderzocht op 2 november 2026. Broncodebasis: `839868dfab1624eba2265b0fa199f123eadc2d1a` (main, versie 1.31.1). Appdoelen: Waze 5.26.90.901, Flitsmeister 14.17, Google Maps 26.43.05.1002020710 en Vela 0.5.2621.

Dit is onderzoek naar de bestaande implementatie. Er zijn geen productpatches, telefooninstellingen of releases gewijzigd. Reproduceerbare onderzoeksproeven staan lokaal onder `.analysis/navigation-alert-research/`.

## Belangrijkste uitkomst

De koppeling kan vóór het bereiken van een camera waarschuwen. De-Waze's optionele Flock-/OSM-cameralaag selecteert camera's op ongeveer twintig seconden rijafstand. Voor meldingen zonder eigen waarschuwingsafstand gebruiken de ontvangers ongeveer twaalf seconden, met een minimum van 150 en maximum van 600 meter.

Er is echter geen garantie op volledige of tijdige waarschuwingen. De belangrijkste concrete gaten zijn:

1. Externe snelheid of maximumsnelheid onderdrukt de eigen Flock-functies van de ontvanger, ook zonder externe Flock-meldingen. Flitsmeister exporteert geen aparte Flock-laag; De-Waze's Flock-laag staat aanvankelijk uit.
2. Maps gebruikt voor deze externe meldingen geluidstonen en tekst, geen gesproken beschrijving. Vela kan wel spreken, mits de aparte instelling en stemmodus dat toelaten.
3. Maps geeft zijn route niet door aan de bestaande routegeschikte waarschuwingsmodule. Vela doet dat wel. Maps kan daardoor een melding om een bocht later oppikken of missen.
4. De dichtstbijzijnde melding wordt geselecteerd vóór wordt beslist of zij hoorbaar moet worden. Een andere dringende melding kan daardoor worden verdrongen. De algemene pauze van acht seconden kan een tweede melding laten vervallen voordat zij wordt gepasseerd.
5. Niet alle native waarschuwingstypen of boodschappen overleven de adapter. Sommige worden algemeen 'gevaar'; aparte Flitsmeister-early-warningmodellen worden overgeslagen. Ondertussen is de bron tijdens een beheerde deelsessie gedempt.

## 1. Wat de bronnen daadwerkelijk kunnen versturen

Beide gebruiken hetzelfde lokale Android-broadcastprotocol. Een veld wordt alleen bruikbaar als de native bron het heeft waargenomen en de geldigheid nog niet is verlopen. Een werkende start-API of status 'connected' bewijst geen beschikbare camera- of trajectmeldingen.

| Gegeven | De-Waze | Flitsmeister | Gebruik door de ontvangers |
| --- | --- | --- | --- |
| Actuele snelheid | Native speedometercallback, genormaliseerd naar km/h | Native GPS-snelheid, vóór vervanging van ontbrekende snelheid door nul | Compacte snelheidsweergave; invoer voor snelheidsovertredingswaarschuwing en waarschuwingstiming |
| Effectieve maximumsnelheid | Native weg-/speedometergegevens | RoadInfoService na relevante variabele limieten en voertuig-/wegbeperkingen | Snelheidsbord en vergelijking met snelheid; per veld terugval op eigen kaartgegevens |
| Naderende trajectcontrole | Native insights APPROACHING, met native afstand | Native kandidaat vóór trajectingang; geometrische afstand naar het begin | Visuele voorwaarschuwing en hoorbaar signaal binnen de waarschuwingsafstand |
| Actieve trajectcontrole | Native legacy- of WITHIN-informatie | Projectie op het gerichte native trajectpad | Voortgang, resterende afstand en gedeeltelijk waargenomen gemiddelde |
| Vaste flitsers | Native alertrepository; daarnaast optioneel OSM | Actieve SpeedCam-meldingen | Camera-waarschuwing; Maps kan een pin tonen als er coördinaten zijn |
| Mobiele controles | Native politietypen worden doorgaans 'police'; adapter kent geen afzonderlijke native mobile-camera-uitvoer | SpeedTrap wordt 'mobile_camera' | Maps groepeert beide camera-categorieën onder Speed cameras; Vela onderscheidt mobiele controle in tekst/spraak |
| Politie | Native politierapporten | PoliceHotspot en Incident CONTROL | Politiewaarschuwing |
| Gevaar, ongeval, file en afsluiting | Whitelist van native alertertypen | Ondersteunde incident-/rapporttypen | Algemene categorie plus afstand; geen overname van volledige native instructie |
| Flock / andere kentekenlezers | Alleen de gepatchte OSM-Flock-laag, wanneer toegepast én ingeschakeld | Geen aparte Flock-uitvoer in deze adapter | Flock-waarschuwing als de ontvangende instellingen dat toelaten |
| Cameratitel en positie | Titel/positie uit native repository of OSM | Rapporttitel en rapportlocatie, indien beschikbaar | Maps gebruikt titels voor pins; compacte waarschuwing en Vela-spraak gebruiken een algemene categorienaam |
| Afstand tot wegmelding | Native repository geeft hier geen actuele afstand; OSM-laag wel | Adapter exporteert geen actuele afstand | Bij ontbrekende afstand berekent de ontvanger een schatting uit zijn eigen GPS en rapportpositie |
| Gewenste waarschuwingsafstand | Native triggerDistanceMeters of OSM-bereik | Niet geëxporteerd | Bekende trigger wordt gevolgd; anders twaalfsecondenregel |

Niet aanwezig in dit protocol: de route/bestemming van Maps of Vela, rijstrookadvies, afslagcommando's, een verkeersmodel waarmee de ontvanger automatisch een omleiding berekent, camerakijkrichting, een gegarandeerde lijst van alle toekomstige gevaren, of de volledige oorspronkelijke gesproken boodschap. Bron-GPS-posities van het voertuig worden niet meegestuurd; camera-/incidentposities kunnen wel in het bericht staan.

Maps/Vela delen hun gekozen route ook niet terug met de bron. De bron levert wat zijn eigen engine onder de actuele omstandigheden produceert. Een native repository of bus is geen onbeperkte database van alle meldingen op de route van de ontvanger.

Bronnen: [gedeeld protocol](../../docs/navigation-broadcasts.md), [Waze-exporter](../../extensions/waze/src/main/java/org/ungoogled/waze/NavigationBroadcasts.java), [Flitsmeister-exporter](../../extensions/flitsmeister/src/main/java/nl/johninnl/flitsmeister/NavigationBroadcasts.java), [berichtvelden](../../support/navigation/src/main/java/nl/johninnl/navigation/NavigationProtocol.java).

### Wat 'actieve melding' bij Flitsmeister betekent

De adapter luistert naar `AppNotificationBus.getBusAlertedReports()` en exporteert alleen `AlertedReport.isActive()`. Hij neemt niet de volledige native rapportcache over.

Onderzoek van het oorspronkelijke 14.17-base-APK laat zien dat `fc0` de native `AppNotificationService` is. `fc0.J(report,true)` voegt een melding toe aan de actieve set, start de native waarschuwing (`x(report)`) en publiceert daarna de buslijst. De aanroep komt onder meer uit `xl.c`, de native `AlertManagerFM$newBaseReportWarning`-coroutine. `fc0.O` actualiseert bestaande actieve modellen; de stopfunctie publiceert een lege lijst.

Gevolg: voor reguliere rapporten kan Maps/Vela niet eerder waarschuwen dan het moment waarop Flitsmeister het rapport beschikbaar maakt als actief. Daarna beslist de ontvanger nogmaals wanneer te waarschuwen. Omdat Flitsmeisters eigen triggerafstand niet meegaat, kan de ontvanger later waarschuwen dan Flitsmeister zelf zou doen. De exacte eerste publicatieafstand per rapporttype is hiermee niet op de weg gemeten.

De aparte trajectkandidaat is een eerdere, afzonderlijk gekoppelde bron en hoeft niet op deze bus te wachten.

## 2. Van ontvangst naar beeld, geluid of actie

| Gedrag | Google Maps / Ungoogled Maps | Vela |
| --- | --- | --- |
| Snelheid, limiet en traject | Compacte telefoonweergave; gemiddelde is gedeeltelijk, geen officieel trajectgemiddelde | Compacte telefoon- en native autoweergave |
| Naderende wegmelding | Categorienaam en afstand in de compacte weergave; tijdelijke tekstmelding wanneer geluid triggert | Compact pictogram en afstand; volledige categorienaam/afstand voor spraak en status |
| Kaartspeld | Ja, als positie bekend is, type geselecteerd is en Road alerts on the map aan staat; via de bestaande SavedOnMap-laag | Deze adapter voegt geen aparte externe rapportpins toe |
| Hoorbare wegwaarschuwing | `Chime.alert()`: drie tonen, geen TTS-zin | Bestaande Vela-stem voor bijvoorbeeld 'Flitspaal · 300 m' of 'Kentekencamera · 500 m' |
| Alleen-waarschuwingenmodus | Externe chime heeft zijn eigen schakelaar; dit pad controleert Maps' gewone stemdemping niet | Native modus met gedempte stem maar alerts aan geeft twee korte tonen; volledig gedempt geeft geen geluid |
| Standaard selectie | Externe bron uit; bij selecteren standaard alleen Police. Kaartpins en chime hebben elk standaard aan als voorkeur ontbreekt | Eigen bron standaard; externe spraak neemt bij ontbrekende eigen voorkeur `speed_cam_warn` over, met false als terugval. Dus niet automatisch aannemen dat spraak aan staat |
| Filter per meldingstype | Ja; uitgeschakelde categorie wordt ook uitgesloten van externe voorwaarschuwing. Camera omvat vast en mobiel | Geen afzonderlijke categorie-witlijst in deze externe adapter |
| Automatisch omrijden voor externe afsluiting/file/Flock | Niet door deze meldingenkoppeling | Niet door deze meldingenkoppeling |
| Native Flock-routevermijding | Blijft zijn eigen cameragegevens gebruiken; onderdrukking laat deze afzonderlijke Maps-routefunctie bestaan | Effectieve Flock-route-/detouropties worden tijdens externe onderdrukking ook op uit gemaskeerd |

De uitgebreide Maps-widget wordt aan `MapsActivity` gekoppeld en bij pauzeren verwijderd. Dit is geen afzonderlijk geïmplementeerde native Android Auto-widget. Het geluidspad kan tijdens actieve navigatie blijven werken en gebruikt Android navigation-guidance-audio, maar daadwerkelijke weergave en audioroutering op elk fysiek autoscherm zijn niet met dit onderzoek bewezen. Vela heeft expliciete telefoon- én autorenderhooks.

Het horen van de oorspronkelijke Waze-/Flitsmeister-zin is niet het mechanisme: tijdens een geldige API-deelsessie is de provider gedempt. De ontvangende app maakt zijn eigen waarschuwing uit de gegevens. Handmatig gebruik buiten zo'n beheerde sessie is een andere situatie.

Demping betreft audio. Zij schakelt niet automatisch alle native notificaties en tijdelijke tekstmeldingen van de bron uit. De-Waze's OSM-camerapad kan bijvoorbeeld nog een eigen toast plaatsen terwijl zijn geluid wordt onderdrukt. De normale doorlopende locatiedienstmelding blijft ook bestaan.

Bronnen: [Maps-ontvangst en alarmbeslissing](../../extensions/extension/src/main/java/org/ungoogled/ui/ExternalTelemetry.java), [Maps-categorieën en pins](../../extensions/extension/src/main/java/org/ungoogled/ui/WazeAlerts.java), [Maps-geluid](../../extensions/extension/src/main/java/org/ungoogled/ui/Chime.java), [Vela-runtime](../../extensions/vela/src/main/java/nl/johninnl/vela/TelemetryRuntime.java), [Vela-Flockmaskering](../../extensions/vela/src/main/java/nl/johninnl/vela/NativeUi.java).

## 3. Wanneer komt een waarschuwing?

De twee RoadWarningEngine-implementaties hanteren dezelfde beslisregels:

1. Toon als kandidaat alleen een positieve afstand tot maximaal 2.000 meter. Dit is de maximale kandidaatweergaveafstand, niet automatisch de geluidsafstand.
2. Gebruik een door de bron geleverde actuele afstand als die niet negatief is.
3. Bereken anders een geschatte afstand uit eigen verse GPS en rapportpositie. Vela gebruikt een geldige actieve route; bij ontbreken daarvan is er een richtingsfilter. Maps gebruikt momenteel alleen dit richtingspad.
4. Bij routeprojectie moeten voertuig en doel binnen 60 meter van het routepad liggen; de afstand is het verschil langs de gerichte polyline. Bij richtingsfallback moet het doel binnen 60 graden van de rijrichting liggen. Dat bewijst niet dat het op dezelfde rijbaan of weg ligt.
5. Geluid vereist beweging van minimaal 2 m/s (7,2 km/h) en een afstand binnen de waarschuwingsgrens. Gebruik de trigger van de bron als die positief is, anders `min(600, max(150, snelheid_mps × 12))` meter.
6. Kies maar één kandidaat, de dichtstbijzijnde. Geluid volgt maximaal eens per acht seconden en maximaal eens per melding-ID per dertig minuten. Status- of bronwissels kunnen deze onderdrukking resetten.

| Snelheid | Terugval zonder brontrigger | Tijd tot locatie bij constante snelheid | De-Waze OSM/Flock-selectiebereik | Tijd tot locatie |
| --- | --- | --- | --- | --- |
| 30 km/h | 150 m | 18 s | 250 m | 30 s |
| 50 km/h | circa 167 m | 12 s | circa 278 m | 20 s |
| 80 km/h | circa 267 m | 12 s | circa 444 m | 20 s |
| 100 km/h | circa 333 m | 12 s | circa 556 m | 20 s |
| 130 km/h | circa 433 m | 12 s | circa 722 m | 20 s |

Deze tijden zijn berekende nominale waarden, geen gemeten aflevergarantie. Bronselectie, downloaden, Android-planning, broadcastvertraging, GPS, bochten, categorievoorkeuren en audiowachtrijen kunnen de beschikbare tijd verkorten. De OSM-laag exporteert haar bereik ook als trigger; de ontvanger past dan niet nogmaals de twaalfsecondenafstand toe.

De-Waze's OSM-laag vereist minimaal 4 m/s (14,4 km/h), bruikbare rijrichting en een GPS-fix. Zij selecteert binnen 250–1.000 meter, maximaal 80 graden naast de rijrichting en maximaal 60 meter dwars naast de huidige rijlijn. Een bocht, lage snelheid of ontbrekende richting kan dus voorkomen dat een camera überhaupt wordt geëxporteerd. De camera-kijkrichting wordt niet uit deze data gehaald.

Bij ontbrekende bronafstand moet de eigen fix maximaal tien seconden oud zijn; de ontvangstadapters verwerpen expliciet onnauwkeurige fixes boven 50 meter. Beeld kan eerder verschijnen dan geluid en ook bij stilstand zichtbaar zijn.

Bronnen: [Maps-engine](../../extensions/extension/src/main/java/org/ungoogled/ui/RoadWarningEngine.java), [Vela-engine](../../extensions/vela/src/main/java/nl/johninnl/vela/RoadWarningEngine.java), [De-Waze OSM-selectie](../../extensions/waze/src/main/java/org/ungoogled/waze/OsmCameras.java).

## 4. Flock: vóór passeren is mogelijk, betrouwbare vermijding is iets anders

De-Waze's Flock-laag leest gemapte OSM-nodes met `surveillance:type=ALPR`, inclusief andere merken kentekenlezers. De fabrikantnaam kan in de titel staan. De laag is geen rechtstreekse liveverbinding met Flock Safety en weet niet of een camera actief is, welk voertuig zij al heeft gefotografeerd of wanneer haar werkelijke zichtveld wordt ingereden. DeFlock beschrijft zijn communitygegevens als bijdragen aan OpenStreetMap; ontbrekende of fout geplaatste camera's blijven mogelijk. Zie [DeFlock's eigen uitleg](https://blog.deflock.me/deflock-mobile-guide/).

Voor een Flock-waarschuwing via De-Waze moeten zowel Broadcast navigation data als Flock cameras toegepast zijn; vervolgens moet Flock cameras in De-Waze Customization aan. Die laatste schakelaar begint uit. Maps moet bovendien Flock cameras als categorie toestaan en zijn chime aan hebben. Vela moet externe waarschuwingen hoorbaar toestaan. De kaartgegevens moeten beschikbaar zijn; de OSM-laag gebruikt een lokale cache met een week als verversingsgrens en netwerkverzoeken met terugval/backoff.

Een signaal op 500 meter vóór de camera is dus realistisch binnen de code en reproduceerbaar aangetoond. Het is geen bewijs dat er nog een bruikbare afslag vóór de camera is. Voor daadwerkelijke routevermijding moet de camera vóór de relevante routebeslissing beschikbaar zijn. Deze externe laag levert alleen al geselecteerde nabije camera's; zij voert zelf geen routeherberekening uit.

Het huidige Flock-onderdrukkingsbeleid maakt dit kwetsbaarder: verse externe snelheid kan de eigen, rijkere Flock-weergave/waarschuwingen uitschakelen terwijl de externe bron nog geen enkele Flock-camera levert. Dit geldt zelfs wanneer een andere ontvangen bron bruikbare gegevens levert dan de geselecteerde bron. In Maps blijft de aparte routevermijdingslaag uitgezonderd; Vela maskeert ook de effectieve Flock-route-/detouropties.

## 5. Trajectcontrole en te hard rijden

Een naderende trajectcontrole is een afzonderlijke toestand. Zij start nog geen gemiddelde. Waze gebruikt de native APPROACHING-afstand; Flitsmeister schat een afstand naar de native kandidaatstart. Een actieve trajectcontrole krijgt voorrang boven de naderingsweergave.

Een gemiddelde verschijnt pas na minimaal dertig meter waargenomen afstand en drie seconden. Het wordt berekend als waargenomen afname van resterende afstand gedeeld door verstreken tijd, niet uit de volledige rit of een officiële handhavingsmeting. Midden in een traject beginnen herstelt het eerdere deel niet. Bij wisselen/verlopen van het traject wordt de gedeeltelijke meting gewist. Waze documenteert zelf dat de standaardapp geen gemiddelde berekent/toont; de gedeeltelijke berekening is hier patchfunctionaliteit. Zie [Waze over trajectcontroles](https://support.google.com/waze/answer/14717826?hl=en).

Er is in deze externe waarschuwingengine geen aparte gesproken 'traject begint', 'traject geëindigd' of 'gemiddelde te hoog'-toestand. Zij geeft een naderingswaarschuwing en toont daarna de actieve waarden. De compacte weergave kleurt het gemiddelde boven limiet +5 km/h rood. Dit mag niet worden uitgelegd als een gegarandeerde gesproken waarschuwing voor een te hoog trajectgemiddelde.

De gewone snelheidsovertredingsfunctie is apart:

- Maps gebruikt, als Speeding chime is toegepast, standaard de roodgrens van +10 km/h of +5 mph. Andere modi zijn +1 km/h/mph of +20 km/h/+10 mph. Herhaling vereist terugzakken tot de limiet en minimaal twintig seconden. Dit is een geluid, geen gesproken instructie.
- Vela behoudt zijn native waarschuwing: meer dan 5 km/h te hard gedurende vier seconden, minstens 45 seconden sinds het vorige alarm en acht seconden onder de overschrijdingsgrens om opnieuw te activeren. De patch vervangt de vergelijkingsinvoer door externe snelheid/limiet waar beschikbaar. De eigen schakelaar en stemmodus blijven gelden.

Bronnen: [gedeelde meting](../../support/navigation/src/main/java/nl/johninnl/navigation/NavigationState.java), [Maps-snelheidsalarm](../../extensions/extension/src/main/java/org/ungoogled/ui/SpeedAlerts.java), [Vela-invoerbinding](../../patches/src/main/kotlin/patches/vela/VelaTelemetryPatch.kt). Vela's native `dl2.j()` en `dl2.a(String)` zijn opnieuw gelezen uit het bewaarde gepatchte 0.5.2621-APK.

## 6. Concrete lacunes en prioriteit

| Prioriteit | Bevinding | Gevolg / logische verbetering |
| --- | --- | --- |
| Hoog | Native Flock wordt onderdrukt op algemene bruikbare brongegevens | Behoud eigen Flock totdat daadwerkelijke equivalente cameradekking aantoonbaar is; dedupliceer per camera/capability. Algemene snelheid is geen bewijs van Flock-dekking |
| Hoog | Gegevens en bronspraak zijn niet gelijkwaardig | Native FM EarlyWarningReport heeft type INCIDENT maar geen getIncidentType; de reflectieve adapter slaat dit model bij die aanroep over. Aparte early-warningbussen worden niet gevolgd. Een gewone WRONG_WAY_DRIVER-Incident wordt slechts hazard. Onderzoek volledige eventdekking en behoud belangrijke betekenis voordat de gedempte bron als volledig vervangen wordt beschouwd |
| Hoog | Maps heeft geen externe TTS-zin | Voor een gesproken 'kentekencamera over 500 meter' moet een ontvangend spraakpad worden toegevoegd; de huidige chime bevat geen type of instructie |
| Hoog | Maps geeft geen route aan de engine | Verbind de echte actieve Maps-route met de reeds bestaande routeprojectie; verifieer bochten, parallelwegen en complexe kruisingen |
| Hoog | Dichtstbijzijnde kandidaat wordt vóór urgentie/deduplicatie gekozen | Plan alle relevante waarschuwingen op tijd tot gevaar; laat een niet-urgente of al aangekondigde nabije melding geen andere melding blokkeren |
| Hoog | Algemene pauze van acht seconden zonder urgentiewachtrij | Een tweede gevaar kan gepasseerd zijn voordat het hoorbaar mag worden; gebruik begrensde wachtrij, prioriteit en resterende aanrijtijd |
| Middel | Bekende positieve bronafstand wordt zonder eigen passagecontrole vertrouwd | Bij uitblijvende bronupdates kan nog een oude '100 m vooruit' worden gebruikt nadat de eigen GPS de coördinaten passeerde. Herbereken waar mogelijk en verwerp gepasseerde doelen |
| Middel | FM exporteert geen oorspronkelijke triggerafstand | De ontvanger kan de native waarschuwing uitstellen tot zijn eigen twaalfsecondenregel; exporteer native afstand/trigger met observatietijd waar betrouwbaar beschikbaar |
| Middel | Type/subtype en boodschap gaan verloren | Roodlicht-/stop-/trajectcamera uit de OSM-laag wordt algemeen camera; gevaar kan een veel specifiekere veiligheidsboodschap vervangen. Voeg betekenis, urgentie en passende taal toe |
| Middel | Hoorbaar is geen bevestigde aflevering | shouldSpeak registreert de melding vóór audio/TTS-aflevering. Geen bevestigde spraak of audiofocus betekent nu niet automatisch een herstelpoging. Vela kan tekst bovendien in zijn native wachtrij zetten |
| Middel | Alleen Mapscategorie Police staat aanvankelijk aan | Maak relevante keuzes bij installatie duidelijk; 'bron verbonden' betekent niet dat Flock/flitsers hoorbaar zijn |

De bevinding over een mogelijk te late positieve bronafstand is een reproduceerbaar scenario bij uitblijvende nieuwe waarnemingen, niet de bewering dat gezonde continue GPS-updates standaard te laat waarschuwen.

## 7. Geldigheid, vertraging en controles

Snelheid is maximaal vijf seconden geldig; weg/limiet, naderend traject en meldingen maximaal dertig seconden; een actief traject maximaal negentig seconden. De ontvanger eist bovendien een recente advertentie van de bron (tien seconden). Oude waarden worden niet vers door een verzoek of heartbeat. Gewone publicatie wordt begrensd rond één keer per seconde; heartbeat is vijf seconden. De ontvangende waarschuwing wordt ook op een seconde-tick herberekend.

Een geldige lege lijst betekent geen actuele meldingen, geen bewijs dat de wereld vrij van gevaren is. Als de bron stopt, gebruikt de kaart eigen gegevens waar mogelijk. Locatietoegang 'Altijd toestaan', de native rij-engine, bron-/ontvangerinstellingen en Android-energieregels blijven voorwaarden. De health-API controleert de engine; zij kan geen ontbrekend rapport of onvolledige camerakaart repareren.

Waze's eigen standaardgedrag moet apart worden gehouden: het officiële helpartikel zegt dat een native flitser bij rijden onder/bij de limiet alleen visueel kan waarschuwen. De ontvangerengine hier vereist voor camera-alarm beweging en afstand, maar geen snelheidsovertreding. Ook wordt niet bewezen dat iedere native instelling iedere repositorymelding blijft leveren. Zie [Waze's camera-uitleg](https://support.google.com/waze/answer/15758855?hl=en).

## 8. Bewijs en reikwijdte

Opnieuw uitgevoerd tegen de onderzochte werkmap:

- Vier Gradle-unittesttaken expliciet opnieuw uitgevoerd met `--rerun`: Waze 57, Flitsmeister 14, Vela 36, Maps-extension 43; totaal **150 tests, nul fouten of skips**. Log: `.analysis/navigation-alert-research/gradle-tests-fresh.log`.
- De werkelijke Java-klassen TelemetryStore en RoadWarningEngine van beide ontvangers los gecompileerd, zonder ze aan te passen. **Elf onderzoeksasserties per ontvanger** bevestigen onder meer vroege Flockmelding, twaalfsecondenafstand, bochtverschil, verdringing, cooldown, oude bronafstand en Flock-onderdrukking bij uitsluitend snelheid. Bron en uitvoer: `.analysis/navigation-alert-research/{org/ungoogled/ui,nl/johninnl/vela}/AlertResearchProbe.java` en `probe-results.txt`.
- De oorspronkelijke Flitsmeister-base opnieuw gedecompileerd om het native busmoment en het EarlyWarningReport-model te lezen. Native Vela-stem en snelheidsovertredingsregel gelezen uit het bewaarde gepatchte APK. JADX meldt fouten elders in de volledige FM-decompilatie en in sommige Vela-methoden; conclusies zijn beperkt tot de daadwerkelijk leesbare methoden en de bron-/ABI-koppeling. Dit is geen volledige native decompilatieacceptatie.
- Bestaande schema-, native-probe- en opstartvalidatie gelezen. Die bewijzen niet iedere wegmelding, ieder audiosysteem of werkelijke waarschuwingstijd op de weg.

Onderzochte lokale APK-hashes (SHA-256): FM-base `c1f923ce12054b1dde88b7a0cec50e60075ce6a5e578c3bdba0dcdc8bac5a7ac`; Waze-base `5ab9853c76a3f83a493e1872f232bbbde96ec61245cbca117aa39e176cdfe9c4`; bewaard gepatcht Vela-APK `fccafbd498713c7fb30a19a70281a09b6bb298cb1047a1af1ee39f32f6926c8d`. De twee base-hashes zijn geen hashes van de volledige APKM/APKS-archieven.

Niet nieuw getest: de persoonlijke telefoon, fysiek rijden, een fysiek autoscherm, alle TTS-engines, daadwerkelijke Flock-cameradekking of de aankomstafstand van elke native rapportcategorie. De juiste volgende praktijkproef is een tijdgestempelde routeherhaling met de echte broncallbacks én ontvangst/beeld/audio, over recht stuk, bocht, parallelweg, twee gevaren kort na elkaar, provideruitval en een routebeslissing vóór een Flock-camera. Leg bronwaarneming, ontvangst, alarmbeslissing, audiostart en passage apart vast. Een losse producerprobe of hoorbare testtoon vervangt die keten niet.

De onderzoeksvragen zijn hiermee beantwoord op code-, native-bindings- en deterministisch gedragsniveau. De gevonden productgaten zijn nog niet gerepareerd; tijdige dekking op alle echte ritten is niet vastgesteld.
