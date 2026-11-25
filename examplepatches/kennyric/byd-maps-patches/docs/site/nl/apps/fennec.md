# Fennec

Geef Fennec, de F-Droid-build van Firefox, de naam en het app-icoon van Firefox.

**Appversie:** 159.0.1 · **Build:** 1590120 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Download de Fennec-APK voor de processor van je telefoon via [F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/); F-Droid publiceert elke versie als aparte builds met eigen buildnummers. **Custom branding** werkt met elke Fennec-versie: de patch verandert alleen de appnaam en het app-icoon in het manifest en voegt eigen icoonbestanden toe, dus nieuwe versies hebben geen patchupdate nodig. De versie hierboven is de referentie-invoer. Fennec wordt gebouwd door [relan/fennecbuild](https://gitlab.com/relan/fennecbuild) uit de Firefox-broncode van Mozilla (MPL-2.0).

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Custom branding** | Aan | Hernoemt Fennec naar Firefox en zet het Firefox-app-icoon. Naam en icoon zijn aan te passen. |

## Advertentie- en trackingdiensten

Deze patch verandert alleen de appnaam en het app-icoon. Functies, add-ons, rechten en netwerkgedrag van Fennec blijven gelijk.

## Voor gebruik

**Custom branding** heeft een veld **App name**, vooraf ingevuld met Firefox, en een keuzelijst **App icon**: Original Fennec of Firefox (het Firefox-logo op wit, standaard). Maak de naam leeg om de eigen naam van Fennec te houden. Het Firefox-icoon is een adaptief icoon; de monochrome laag voor thema-iconen toont de vos rond de wereldbol. Naam of icoon wijzigen vraagt opnieuw patchen.

De nieuwe naam verschijnt in de launcher, recente apps, de keuze voor de standaardbrowser en de Android-appinformatie. De eigen schermen van Fennec, meldingen en downloadmappen houden de naam Fennec. De eigen instelling voor het app-icoon in Fennec blijft werken: kies je daar een alternatief icoon, dan vervangt dat het Firefox-icoon tot je weer het standaardicoon kiest.

Fennec is niet verbonden aan Mozilla. Mozilla en Firefox zijn handelsmerken van de Mozilla Foundation. Het icoon is zelfgekozen launcherafbeelding voor je eigen toestel en maakt van Fennec geen app van Mozilla.

Een gepatchte APK moet opnieuw worden ondertekend. Een Fennec-installatie uit F-Droid kan niet worden bijgewerkt met een andere ondertekeningssleutel; verwijder die eerst of installeer de gepatchte kopie op een toestel zonder die installatie.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
