# SoundCloud

**Appversie:** 2026.11.02-release · **Build:** 379060 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige, door de uitgever ondertekende APKM-archief voor precies deze build (Android 10+), inclusief de apparaatbestanden.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Home in Android Auto** | Aan | Vult de Home-tab in de auto met gewone covertegels uit de telefoon-Home, via het bestaande account van de app. Tracks, mixen en artiesten spelen af; playlists en albums openen. Publiceert de echte afspeelwachtrij voor Up next, met selectie van wachtrij-items. Valt terug op de oorspronkelijke Home van SoundCloud als de telefoon-Home niet laadt. |
| **Disable analytics** | Aan | Stopt het opslaan en versturen van gebeurtenissen via de eigen analytics-handler van SoundCloud, met behoud van het afsluiten van de worker. Andere trackingdiensten blijven actief. |
| **Disable consent popup** | Aan | Slaat de OneTrust-pop-up over met de bestaande lege toestemmingscontroller. Geeft geen toestemming en schakelt tracking niet uit; selecteer Disable analytics apart. |
| **Enable SoundCloud Go** | Aan | Activeert lokale Go+-bediening, verbergt Go-aanbiedingen en schermen voor wijzigingen van het luisterabonnement, schakelt advertentieverzoeken en weergaveplekken uit, en zet de offline_sync-, no_audio_ads- en hq_audio-schakelaars uit het /configuration-antwoord permanent aan. Zie hieronder wat die schakelaars wel en niet kunnen. |
| **Ignore device limit** | Aan | SoundCloud logt in op maximaal tien apparaten, en alleen de app handhaaft dat: het /configuration-antwoord markeert het apparaat als geautoriseerd of niet, een ongeautoriseerde nieuwe aanmelding wordt nooit afgerond, en een latere verversing meldt het apparaat af en trekt zijn token in. De patch slaat de registratie bij het inloggen volledig over en laat de statuscontroles *geautoriseerd* antwoorden, zodat het inloggen afrondt zonder registratie en ingelogd blijven niet langer van het apparaataantal afhangt. |

## Waarom Home in de auto leeg was

De Home-tab van SoundCloud in de auto leest een oudere ontdekfeed, terwijl de telefoon-Home de nieuwere Home-secties gebruikt. Feed en Bibliotheek werkten al, omdat die je eigen stream en collectie gebruiken. De patch vraagt de telefoonsecties op bij de GraphQL-SDUI-Home-dienst van de app, in plaats van het afzonderlijke bibliotheekbanner-endpoint van de eerdere patch, zodra de auto Home opent. Dit geldt voor Android Auto, Gearslip, DriveDeck en andere mediahosts die SoundCloud doorbladeren.

Muziek-Home gebruikt een coverraster zonder sectiegroepen. Tracks binnen playlists en albums behouden de tracklijst van de app.

## De limiet van tien apparaten

SoundCloud laat een account inloggen op maximaal tien apparaten, en de handhaving zit volledig in de app. `/configuration` geeft een `device_management`-status voor het apparaat, die op twee plekken wordt gelezen: een ongeautoriseerde **nieuwe** aanmelding wordt nooit afgerond — via de statusvlaggen, of doordat de server de registratie-aanvraag zelf met een HTTP-fout weigert — en een ongeautoriseerd **bestaand** apparaat wordt bij de volgende configuratie-verversing afgemeld en zijn token wordt ingetrokken. Ignore device limit slaat de registratie-handshake bij het inloggen volledig over en laat de statuscontroles *geautoriseerd* antwoorden, zodat de aanmelding afrondt zonder deze installatie te registreren en ingelogd blijven niet langer van het apparaataantal afhangt. Afspeel- en streamcode raadpleegt de status nooit, dus verder verandert er niets. Twee eerlijke grenzen: de installatie blijft ongeregistreerd in de apparatenlijst van SoundCloud, en als de servers ooit beyond deze handshakes verzoeken gaan weigeren, kan geen client-patch helpen.

## De Go-schakelaars, eerlijk

De app van SoundCloud beslist zelf wat er voor abonnementsfuncties wordt getoond: het `/configuration`-antwoord bevat schakelaars zoals `offline_sync`, `no_audio_ads` en `hq_audio`, en alleen de app leest ze. Enable SoundCloud Go slaat alle drie permanent als aan op en legt lokaal Go+-abonnementswaarden aan — plus wat andere SoundCloud-patchsets weglaten: geen dreigende downgrade, geen Go-aanbiedingen of overgangsschermen, en de advertentieverzoeken en weergaveplekken van de client direct uitgeschakeld, zodat de advertentiekant niet alleen van de `no_audio_ads`-schakelaar afhangt.

Wat de schakelaars niet kunnen:

- **Hoogwaardige audio** toont de instelling en laat de app om HQ vragen. Of HQ wordt geleverd beslist de server van SoundCloud: de hogere AAC-bitrates worden alleen aangeboden en geautoriseerd bij een betalende Go+-login. Een gratis account houdt de normale streams, of een weigering als de app tóch vraagt.
- **Offline synchronisatie** toont de downloadknoppen. Go+-only tracks blijven previews van 30 seconden, en versleutelde offline exemplaren vereisen een echt abonnement. Hooguit kan de app tracks opslaan die het account al kan streamen.
- **Geen audio-advertenties** werkt wel lokaal, en de advertentie-overrides van de patch dekken hetzelfde grondgebied breder.

Lokale Go+-status bewijst nooit toegang aan de serverkant. Betaalde streams, downloads en audiokwaliteit blijven gekoppeld aan het account.

## Advertentie- en trackingdiensten

Home in Android Auto wijzigt de Home-inhoud in de auto en publiceert de actieve afspeelwachtrij in de mediasessie. Alleen een werkende knop Volgende levert nog geen titels of afbeeldingen voor Up next. De extra opties werken onafhankelijk: Disable analytics stopt de eigen event-handler, Disable consent popup slaat OneTrust over en Enable SoundCloud Go wijzigt lokaal abonnementsgedrag en advertenties. Niet alle trackingdiensten worden verwijderd en er komt geen account bij. Lokale Go+-bediening bewijst geen toegang tot betaalde inhoud op de servers van SoundCloud.

## Voor gebruik

Log op de telefoon in bij SoundCloud. Een gepatchte APK moet opnieuw worden ondertekend, dus de Play Store-installatie kan niet ter plekke worden bijgewerkt; bewaar die tot de gepatchte kopie werkt. Alle extra opties bouwen afzonderlijk en samen met Home op exact dit bestand. Hun lokale effecten en het starten van de app zijn op Android zonder account gecontroleerd. Home, covertegels en Up next zijn met een ingelogd account op de telefoon bevestigd na een update ter plekke. Downloads en audiokwaliteit blijven afhankelijk van je account en servertoegang.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
