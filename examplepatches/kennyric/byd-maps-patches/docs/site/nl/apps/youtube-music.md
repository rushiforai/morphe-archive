# YouTube Music

**Appversie:** 9.30.53 · **Build:** 93053240 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de originele YouTube Music-APK. Morphe kan de geïnstalleerde versie **YT Music Morphe** noemen; die uitvoer vormt geen aparte app in deze patchbron.

De compatibiliteit is **Any** wanneer de browserstructuur en Morphe's bibliotheekstructuur eenduidig worden herkend. De volledige gecombineerde werkwijze is getest met 9.30.53 en Morphe Patches 2.0.0. Bij gewijzigde structuren of ontbrekende vereiste onderdelen stopt het patchen. Morphe's eigen Android Auto-patch moet de gekozen appversie ook ondersteunen.

[Muziekspelers en persoonlijke bibliotheken in Gearslip instellen](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Gearslip music browser support** | Aan | Laat Gearslip persoonlijke Home- en bibliotheekinhoud bekijken via het bestaande account en controleert daarbij de echte Android-aanroeper. |

## Advertenties en trackingdiensten

Deze compatibiliteitspatch verwijdert geen advertenties, tracking, accountvereisten of abonnementen. YouTube Musics bestaande online diensten blijven actief.

## Voor gebruik

Selecteer de originele app en schakel **Android Auto** uit Morphe Patches samen met **Gearslip music browser support** uit Dutch App Patches in. De Gearslip-patch bevat de persoonlijke bibliotheekintegratie; er is geen tweede bibliotheekpatch om te selecteren. Gebruik de originele invoer ook bij het opnieuw patchen van een bestaande installatie.

Pas op Gearslip **Keep music player entries** toe zodat de spelertegel behouden blijft. **Trusted Gearslip and DriveDeck packages** gebruikt standaard de Gearslip- en DriveDeck-pakketten, inclusief hun `.dev`-versies; voeg alleen een ander pakket toe voor een versie die je bewust gebruikt.

Automatische tests controleren de hosttoegang, het opbouwen van de hoofd- en bibliotheekmappen en het gecombineerd patchen van de originele app. De bibliotheekinhoud en het afspelen hangen af van het ingelogde account en de beschikbare inhoud.

Gebruik dezelfde ondertekeningssleutel als de geïnstalleerde app voor een update. Bewaar de ingelogde installatie tijdens het testen.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
