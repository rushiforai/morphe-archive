# WuPlay Mobile

**Appversie:** 0.1.9-alpha · **Build:** 9 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de originele WuPlay Mobile-APK in Morphe Manager en schakel **Add Gearslip car interface** in.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Add Gearslip car interface** | Uit | Voegt Home-carrousels met posters, seizoensrijen met afleveringen en automatische bronkeuze tot 10 Mbps toe, met je actieve profiel en de bestaande afspeelbediening. |

## Advertentie- en trackingdiensten

WuPlay gebruikt zijn eigen diensten en je ingestelde add-ons. Deze patch voegt geen advertentie- of trackinginstellingen toe.

## Voor gebruik

Stel je WuPlay-profiel en add-ons eerst op de telefoon in of importeer je bestaande profiel. Open **Wuplay** in DriveDeck om direct de ingestelde rijen van je Home-scherm te zien, in dezelfde volgorde. De Home/Catalogs-tabs, profielkop en vaste vernieuwknop ontbreken. Gewijzigde catalogusinstellingen worden automatisch opgehaald. Oudere Gearslip-versies behouden hun compatibele navigatieomslag. Bij een film zie je de afbeelding, beschrijving en **Play · ≤10 Mbps**. Een serie opent rijen per seizoen met afleveringsafbeeldingen en titels; kies een aflevering om deze af te spelen. Via **Sources** kies je een andere geschikte bron. Beveiligde profielen vragen om hun normale pincode. Bij een ander profiel of het verbreken van de autoverbinding stopt de afspeelsessie in de auto.

**Play** kiest automatisch een directe stream uit je ingeschakelde add-ons. Je ingestelde autoplay-add-on krijgt voorrang binnen de geschikte bronnen. Als afspelen mislukt, probeert de speler maximaal drie geschikte bronnen zolang de afspeelpagina openstaat. Het openen van Home start geen video; automatisch doorgaan naar de volgende aflevering is niet inbegrepen.

De auto-interface sluit bronnen boven 10 Mbps en bronnen met een onbekende bitrate uit. Een bitrate op basis van bestandsgrootte en speelduur is een schatting van het gemiddelde, geen harde limiet op kortstondig netwerkverkeer. De adaptieve speler begrenst ook zijn video- en audiotracks. Zonder geschikte bron verschijnt **No suitable stream within 10 Mbps**; de speler kiest dan niet stilzwijgend een zwaardere bron. Voor een aflevering gebruikt de schatting de speelduur van die aflevering. Ontbrekende speelduurgegevens kunnen dus het aantal beschikbare bronnen beperken.

Home laadt vier catalogusrijen tegelijk, met twaalf postervertoningen per rij. Via **More catalogs**, **More titles** en **More episodes** bereik je de overige inhoud. Vernieuw Home om de catalogusinhoud opnieuw te laden. Bij ontbrekende afbeeldingen verschijnt een vervangende tegel; oudere hosts houden lijstnavigatie.

Video verschijnt op een apart autoscherm; de telefoon hoeft de video niet te tonen. Root, Shizuku en schermdelen zijn niet nodig. Gearslip verzorgt de autoverbinding en het geluid. Gebruik Bluetooth-audio of de gewone optie voor audiodeling van Gearslip.

Vereist Android 12 of nieuwer en Gearslip; de validatie gebruikt Gearslip **0.3.31-alpha**. Deze interface voegt geen video-ondersteuning toe aan Android Auto van Google. Gebruik video als de auto geparkeerd staat. Directe videostreams en tekstondertiteling gebruiken de bestaande speler en add-ons van WuPlay; vermeldingen voor een externe speler blijven extern.

Gearslip wordt herkend aan de geïnstalleerde pakketnaam, ook als Morphe de app met een andere sleutel heeft ondertekend.

Bewaar je profielherstelcode voordat je van installatie wisselt. Bij een andere ondertekening kan het nodig zijn de originele app te verwijderen; importeer je profiel daarna opnieuw indien nodig. De Android TV-APK is een afzonderlijk doel en werkt niet met deze patch.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
