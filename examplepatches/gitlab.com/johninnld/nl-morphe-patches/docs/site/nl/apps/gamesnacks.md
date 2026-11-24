# GameSnacks

Installeer het autospelportaal van Google op een telefoon en zet het op het Android Auto-autoscherm en op carhosts zoals DriveDeck en Gearslip.

**Appversie:** 1.40.827663177 · **Build:** 40 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de originele APK in Morphe Manager. Deze build is één APK, geen splitarchief.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Parked app for Android Auto** | Aan | Maakt de eis van automotive-hardware optioneel zodat de app op een telefoon installeert, en voegt de Android Auto geparkte-app-declaratie aan het manifest toe. |

## Voor gebruik

GameSnacks is uitgegeven voor Android Automotive OS: het manifest vereist automotive-hardware, waardoor een telefoon de app helemaal niet installeert. De patch maakt die eis optioneel, zodat dezelfde app installeert op de telefoon die Android Auto of een carhost draait, en voegt `android.intent.category.CAR_LAUNCHER` toe aan de launcher-activity met behoud van de bestaande gamecategorie.

De spellen zelf zijn webpagina's van gamesnacks.com, dus er zit geen advertentie- of tracking-SDK in deze app om te verwijderen en zo'n patch wordt niet aangeboden. Een internetverbinding is nodig, en de inhoud van het portaal valt buiten wat deze patchet kan wijzigen.

Android Auto heeft nog steeds Unknown sources nodig in de ontwikkelaarsinstellingen voor een gepatchte app. Gecontroleerd met een build en patchsessie op de originele APK en tegen het gepatchte manifest. Er is geen playsessie op het autoscherm uitgevoerd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
