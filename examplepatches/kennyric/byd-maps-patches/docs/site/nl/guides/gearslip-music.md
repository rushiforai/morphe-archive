# Meer muziekspelers in Gearslip

Gearslip heeft een eigen muziekbrowser en spelerpaneel. Een geschikte muziekapp kan mappen, albumhoezen en afspeelknoppen leveren terwijl je kaart openblijft. Sommige apps verbinden al; andere beperken hun browser tot Android Auto en hebben naast de Gearslip-launcherpatch ook een patch in de muziekapp nodig.

## Kies je speler

| Muziekapp | Benodigde patches | Wat kun je verwachten? |
| --- | --- | --- |
| [YouTube Music / YT Music Morphe](../apps/youtube-music.md) | **Android Auto** uit Morphe Patches en **Gearslip music browser support** uit Dutch App Patches, samen op de originele YouTube Music-APK | Persoonlijke Home en Library via het bestaande aangemelde account. Er is één Gearslip-patch om te kiezen; de bibliotheekkoppeling zit daarin. |
| [Myspoti](../apps/myspoti.md) | **Allow any Android Auto host** uit Dutch App Patches, op de originele APK van de uitgever | De bestaande Home, Library en Downloads, zoeken en muziek kiezen. Meld je eerst aan op de telefoon. |
| SoundCloud | De bestaande Gearslip-speler; voor het paneel is geen SoundCloud-patch uit dit project nodig | Albumhoezen en afspeelknoppen zijn gecontroleerd in de officiële Gearslip-telefoonpreview. Bladerbare inhoud en extra knoppen hangen van de app af. |
| Een andere muziekapp | Probeer eerst de bestaande auto-/mediabrowser | Ondersteuning hangt af van wat de app beschikbaar stelt. Een werkende melding of telefoonspeler bewijst geen toegang tot de persoonlijke bibliotheek in Gearslip. |

YouTube Music toont alleen **Any** wanneer de vereiste structuren worden herkend. De volledige combinatie is gecontroleerd met YouTube Music 9.30.53 en Morphe Patches 2.0.0; ook Morphes Android Auto-patch moet je versie ondersteunen. Myspoti patchen en opnieuw opbouwen is gecontroleerd met 2.2.0 en 2.3.0, met door de gebruiker bevestigde Gearslip-werking op 2.2.0. De apppagina's noemen de huidige doelen en testgrenzen.

## 1. Maak Gearslip gereed

Patch de [officiële Gearslip-APK](../apps/gearslip.md) met **Keep music player entries**. Als een muziekapp ook een auto-instellingendienst aanbiedt, blijft hierdoor één werkende spelertegel over en verdwijnt de onbruikbare instellingentegel. Deze patch voegt geen mediabrowser toe aan de muziekapp.

**Hide apps from drawer** is optioneel. Open op de telefoon de kaart **Car → Apps** in Gearslip en laat je speler aangevinkt. Een verborgen app blijft geïnstalleerd. Bestaande vastgepinde tegels op de navigatiebalk staan los van de appkiezer.

De muziek- en appkiezerpatches ondersteunen Gearslip 0.3.12-alpha en 0.3.31-alpha. Gebruik bij bijwerken de exacte invoer en aanwijzingen voor ondertekening op de apppagina.

## 2. Maak de muziekapp gereed

Kies voor YouTube Music de originele `com.google.android.apps.youtube.music`-APK in Morphe. Combineer de twee bovenstaande patches in één poging; gebruik geen al hernoemde YT Music Morphe-APK als invoer. Kies voor Myspoti de originele APK van de uitgever en pas de ene Gearslip-patch toe.

De optie **Trusted Gearslip and DriveDeck packages** bevat standaard Gearslip en DriveDeck, inclusief hun ontwikkelversies: `app.seb3thehacker.gearslip`, `app.seb3thehacker.gearslip.dev`, `app.johninnl.drivedeck` en `app.johninnl.drivedeck.dev`. Gepatchte Gearslip met dezelfde pakketnaam gebruikt diezelfde instelling. Toont Manager alleen `app.seb3thehacker.gearslip`, zet de optie dan vóór het patchen terug naar de standaard. Voeg alleen een andere pakketnaam toe als je bewust een hernoemde host gebruikt. De muziekpatches controleren of de werkelijke Android-aanroeper bij het ingestelde pakket hoort.

Gebruik bij bijwerken dezelfde ondertekeningssleutel als voor de bestaande gepatchte versie. Een installatie met de sleutel van de uitgever accepteert geen update met een andere sleutel. Bewaar het account en de gegevens; volg de [handleiding voor installeren en ondertekenen](install.md#4-installeer-en-werk-bij) voordat je iets vervangt.

Open de muziekapp op de telefoon, meld je zo nodig aan en controleer of een nummer afspeelt. Deze compatibiliteitspatches leveren geen account, abonnement of toegang tot onbeschikbare inhoud.

## 3. Open de speler naast de kaart

1. Open de autolauncher of telefoonpreview van Gearslip en kies je muziekapp.
2. Open een map of zoek waar dat wordt ondersteund en start een nummer.
3. Ga terug naar de kaart.
4. Tik op de dockknop rechts in de now-playing-balk onderaan. Gearslip zet zijn spelerpaneel naast de kaart. De bestaande spelerinstelling bepaalt de plaats links of rechts.

Afspeelknoppen, shuffle, herhalen, likes en beschikbare inhoud hangen van de muziekapp af. Afspelen kan werken terwijl bladeren nog beperkt of onvolledig is; controleer naast Play/Pause ook de mappen en persoonlijke inhoud die je gebruikt.

## Als iets ontbreekt

| Probleem | Controleer |
| --- | --- |
| Speler ontbreekt in de appkiezer | Laat hem aangevinkt bij **Car → Apps** en open het autoscherm opnieuw. Controleer of de muziekapp een geschikte auto-/mediabrowser heeft. |
| Muziekapp heeft een tweede instellingenicoon | Werk gepatchte Gearslip bij met **Keep music player entries** aan. |
| YouTube Music speelt, maar Home of Library is leeg | Controleer of beide vereiste patches samen zijn toegepast, de originele APK is gebruikt en de telefoonapp is aangemeld. Toegang voor de host alleen vult geen persoonlijke bibliotheek. |
| Myspoti laat geen inhoud zien | Pas **Allow any Android Auto host** toe, meld je aan en houd rekening met de ondersteunde versies. |
| Geen paneel naast de kaart | Start muziek in de Gearslip-speler, ga terug naar de kaart en gebruik de dockknop in de now-playing-balk. |

**SoundCloud in Waze** en **YT Music Morphe in Waze** zijn aparte patches voor de ingebouwde Waze-speler. Ze zijn niet nodig voor het Gearslip-paneel en tonen andere inhoud dan de bovenstaande persoonlijke bibliotheekkoppelingen.

Voor het SoundCloud-paneel is bewijs uit de telefoonpreview beschikbaar. YouTube Music heeft controles voor gecombineerd patchen en browsermappen; de aangemelde inhoud en het afspelen moeten nog op je eigen omgeving worden gecontroleerd. De Myspoti-apparaatcontrole geldt momenteel voor 2.2.0. Een fysiek autoscherm is een aparte controle naast de telefoonpreview.
