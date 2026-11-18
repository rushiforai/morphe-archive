# Candy Crush Soda Saga

Zet het spel op het Android Auto-autoscherm en op carhosts zoals DriveDeck en Gearslip.

**Appversie:** 1.330.1 · **Build:** 13300010 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele APKM-archief in Morphe Manager, inclusief de basis-, architectuur- en taal-APK's.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Parked app for Android Auto** | Aan | Voegt de Android Auto geparkte-app-declaratie toe aan het manifest, zodat hosts die de gedocumenteerde detectie volgen het spel zelf op het autoscherm tonen. |
| **Hide ads** | Aan | Zet de advertentie-ondersteuning uit zoals het spel zelf op tv's en in auto's doet: geen ad-SDK start, geen toestemmingsscherm en elk advertentieverzoek volgt het eigenpad-zonder-advertenties van het spel. |
| **Disable tracking** | Aan | Stopt de advertentie-ID, install-referrer-attributie en analytics-SDK's (Firebase, AppsFlyer of Braze per spel) en zet measurement-, crashrapport- en adverteerdercollectie-vlaggen in het manifest uit. |

## Voor gebruik

Google zet het spel op Android Auto via een interne, door Play beheerde gametoestaanlijst in de Android Auto-app. Het spel zelf declareert de openbare geparkte-app-categorie niet, dus hosts die Googles gedocumenteerde detectie volgen kunnen het spel niet tonen. Deze patch voegt `android.intent.category.CAR_LAUNCHER` toe aan de launcher-activity en behoudt de bestaande gamecategorie. Gameplay, opgeslagen standen en onlinediensten veranderen niet; op Android 15 en later draait het spel op de telefoon en toont de verbonden host het op het autoscherm.

Android Auto heeft nog steeds Unknown sources nodig in de ontwikkelaarsinstellingen voor een gepatchte app. Gecontroleerd met build- en manifestcontroles tegen de originele APKM. Er is geen playsessie op het autoscherm uitgevoerd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
