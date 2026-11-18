# YouTube

**Appversie:** 21.30.216 · **Build:** 1561187872 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de originele YouTube-APK en patch die samen met Morphe Patches. Morphe kan de geïnstalleerde versie **YouTube Morphe** noemen; die uitvoer vormt geen aparte app in deze patchbron.

Deze patches vullen Morphe Patches aan voor YouTube als geparkeerde app op het autoscherm, met Android Auto, DriveDeck en andere autohosts. Ze herkennen het autoscherm zelf, zonder lijst van toegestane apps of hosts.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Parked app for Android Auto** | Aan | Meldt YouTube aan als geparkeerde video-app, zodat Android Auto en DriveDeck de app zelf op het autoscherm tonen. Elke versie. |
| **Auto-hide navigation bar on car displays** | Aan | Verbergt op het autoscherm na 5 seconden de navigatiebalk onderaan, zodat de video's die ruimte krijgen. Veeg vanaf de onderrand omhoog om hem weer te tonen. Zolang je de balk aanraakt, blijft hij staan. |
| **Automotive layout on car displays** | Aan | Gebruikt de autolay-out op het autoscherm en de oorspronkelijke lay-out op de telefoon, ook als de app tussen beide wisselt. Werkt samen met Morphe's Change form factor: op het autoscherm beslist deze patch, op de telefoon geldt Morphe's instelling. |

**Car display detection** (optie van beide autoschermpatches):

- **Car displays** (standaard): Android Auto, zolang het een autoverbinding meldt; DriveDeck, Gearslip, graphene-auto en MyCar, aan de naam van hun autoscherm; en hosts die het scherm de automodus geven. Gearslip, graphene-auto en MyCar kunnen YouTube nog niet op hun autoscherm zetten en spiegelen in plaats daarvan het telefoonscherm: vanaf Android 15 gebruikt YouTube op de telefoon dan ook de autolay-out zolang het scherm wordt opgenomen en een van deze hosts is geïnstalleerd.
- **Any external display**: elk scherm behalve het telefoonscherm, voor andere autohosts. Dit geldt ook voor een tv of monitor.

**Hide after (seconds)** bepaalt hoe lang de navigatiebalk blijft staan; standaard 5.

## Advertenties en trackingdiensten

Deze compatibiliteitspatches verwijderen geen advertenties, tracking, accountvereisten of abonnementen. YouTubes bestaande online diensten blijven actief.

## Voor gebruik

Patch de originele app samen met Morphe Patches en deze patches. Morphe's **Change form factor** mag geselecteerd blijven; de handmatige instelling Automotive is in de auto niet meer nodig, want het autoscherm gebruikt de autolay-out vanzelf.

Android Auto toont een geparkeerde app die niet via Google Play is geïnstalleerd alleen met **Onbekende bronnen** aan in de ontwikkelaarsinstellingen. Android Auto accepteert video-apps op nieuwere autoschermen. DriveDeck toont YouTube zelf bij de geparkeerde apps; met **Add an installed app** kun je ook elke andere app toevoegen.

De autolay-out van YouTube werkt niet op kanaalpagina's, afspeellijsten, het tabblad Jij, de videobeschrijving en reacties bij Shorts, ook niet in auto's met Google ingebouwd. Die gebruiken daarom de tabletlay-out, net als bij Morphe's Change form factor; Home en Abonnementen houden de autolay-out.

Getest met 21.30.216 en Morphe Patches 2.1.0 en 2.2.0-dev.3 door beide samen te patchen, met Change form factor geselecteerd; in de autovoorvertoning van DriveDeck op een telefoon; en op een emulator met een autoscherm dat DriveDeck's naamgeving volgt en met een ander extern scherm. De autoverbinding van Android Auto en het spiegelen door Gearslip, graphene-auto en MyCar zijn niet getest met een auto of head unit.

Gebruik dezelfde ondertekeningssleutel als de geïnstalleerde app voor een update.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md)
