# Angry Birds Friends

Zet het spel op het Android Auto-autoscherm en op carhosts zoals DriveDeck en Gearslip.

**Appversie:** 14.9.0 · **Build:** 423911 · **Origineel bestand:** APKS

[Gebruik je originele APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele APKS-archief in Morphe Manager, inclusief de basis- en architectuur-APK's.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Parked app for Android Auto** | Aan | Voegt de Android Auto geparkte-app-declaratie toe aan het manifest, zodat hosts die de gedocumenteerde detectie volgen het spel zelf op het autoscherm tonen. |
| **Hide ads** | Aan | Stopt de advertentiebrug van het spel: elk advertentieverzoek meldt de eigen no-fill-fout van het spel, zodat interstitial- en beloningsstromen netjes sluiten en er geen advertentienetwerk wordt benaderd. |
| **Disable tracking** | Aan | Stopt de advertentie-ID, de app set ID en install-referrer-attributie, zet Google measurement en Firebase Analytics uit en schakelt de advertentie-ID en gebeurtenisupload van Facebook uit. |
| **Hide paid shop tab** | Aan | Verbergt alleen het betaalde Bird Coins-tabblad en opent Power-ups; Power-ups en Slingshots blijven beschikbaar. |

## Voor gebruik

Google zet het spel op Android Auto via een interne, door Play beheerde gametoestaanlijst in de Android Auto-app. Het spel zelf declareert de openbare geparkte-app-categorie niet, dus hosts die Googles gedocumenteerde detectie volgen kunnen het spel niet tonen. De geparkte-app-patch voegt `android.intent.category.CAR_LAUNCHER` toe aan de launcher-activity en behoudt de bestaande gamecategorie. Gameplay, opgeslagen voortgang en de onlinediensten van Rovio veranderen niet; op Android 15 en later draait het spel op de telefoon en toont de verbonden host het op het autoscherm.

Beloningen die een advertentie vereisen worden niet meer aangeboden, omdat er nooit een gevulde advertentie is. Al het overige blijft werken.

Android Auto heeft nog steeds Unknown sources nodig in de ontwikkelaarsinstellingen voor een gepatchte app. Gecontroleerd met build-, patchsessie- en manifestcontroles tegen de originele APKS. Er is geen playsessie op het autoscherm uitgevoerd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
