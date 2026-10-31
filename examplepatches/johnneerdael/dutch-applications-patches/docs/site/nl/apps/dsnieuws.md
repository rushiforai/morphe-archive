# DS Nieuws

**Ondersteunde app:** 22.0.0 · **Build:** 2012316104 · **Invoer:** APKS

`com.twipemobile.dsmobile`

[Download de originele APKS](https://buzzheavier.com/xekgzljrg2lg){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Deze Mediahuis-nieuwsapp bevat advertenties en metingen van lezen, interacties en mediagebruik. Het krantentabblad gebruikt een aparte Twipe-lezer met aanvullende logging en Engage Readers-metingen. In het telefoonmenu ontbrak Abonneer en bleef de echte optie Log in beschikbaar. Dit bevestigt de waargenomen menustatus, maar zegt niets over toegang tot artikelen of edities.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en gesponsorde plaatsingen | Kaching verzorgt native advertentie- en prerollverzoeken. Daarnaast bevatten expliciete groepen met gesponsorde inhoud promoties voor Shop, Jobat, Zimmo en quizzen; DS heeft ook een specifiek herkende banner voor het NYT-abonnement. | Hide ads geeft het uitgeschakelde resultaat van de app terug voor Kaching en filtert deze gemarkeerde groepen plus de exacte NYT-banner op start-, artikel-, sectie- en lokale groepsroutes. De aparte Shop-feed onderaan de pagina wordt ook verwijderd wanneer het onderzochte widgetcontract overeenkomt. |
| Publieks- en interactiemetingen | De onderzochte code verstuurt lees-, scherm-, identiteits- of spelerevents via Mediahuis Glitr, Cxense, Google Analytics, Gemius en Comscore. | Disable tracking stopt de gevonden partners, events, leestijdmetingen, segmenten en videometingen. |
| Diagnostiek en videokwaliteit | Datadog, Mux, de aparte Agnoplay-dataplugin, Firebase en Airship bevatten metingen naast bezorging en push. | De onderzochte verzameling en initialisatie stoppen; pushregistratie en inhoud blijven werken. |
| Ingebouwde krantenlezer | De echte Twipe-JavaScript bevat Kinesis/HTTP-logging en initialisatie, events en timers van Engage Readers. | De bestaande uitgeschakelde logtransportfunctie rondt lokaal af; de onderzochte Engage Readers-paden stoppen. |
| Toestemming en Premium-weergave | Automatische toestemming, PayOrOk en introductie openen aparte schermen; de abonnementsgetter bepaalt ook de menuoptie Abonneer. | Skip consent screens slaat normale voltooiing van de introductie op zonder toestemming te registreren. Hide Premium banner verbergt promoties en de menuoptie Abonneer; de aparte echte optie Log in blijft beschikbaar. |

## Wat blijft bestaan en wat weten we nog niet?

Artikelinhoud en krantdownloads blijven echte serverbeslissingen gebruiken. Hide Premium banner kan geen tekst of edities leveren die de uitgever achterhoudt. Inloggen, accountstatus, pushbezorging, personalisatie en alternatieve facturatie blijven behouden.

In het telefoonmenu ontbrak Abonneer en bleef de echte optie Log in beschikbaar. De eigenaar bevestigde het gecorrigeerde Shop-gedrag onderaan de pagina in Nieuwsblad en keurde beide apps na de gedeelde correctie goed voor de stabiele uitgave. De DS-uitvoer slaagde ook voor de eigen widget- en behoudcontroles. Statische analyse koppelt een updatevenster aan de AuthProvider-migratie; in de onderzochte code is geen code-pushroute gevonden. Deze migratie staat los van updates via Play. Afspelen, serverrechten voor artikelen/edities en werkelijk netwerkverkeer zijn niet bevestigd. Een geconfigureerde bestemming bewijst niet dat een verzoek is verstuurd.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

Alle vier opties staan standaard aan. Disable tracking omvat Hide ads; Skip consent screens omvat beide.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/dsnieuws-audit.md). De huidige uitvoercontrole bewaakt 1242 methodecontracten en 45 switchkoppelingen. De gewijzigde opties en hun gecombineerde uitvoer slagen voor FULL-patching, ondertekening en controles van het gedecodeerde gedrag. De definitieve gedeelde Shop-correctie slaagde voor Hide ads en de gecombineerde uitvoercontrole voor deze app. De eigenaar keurde beide apps goed voor uitgave; de schermwaarnemingen gelden voor de geteste schermen en er is geen netwerkopname gemaakt. [Zo lees je het bewijs](../reference/methodology.md).
