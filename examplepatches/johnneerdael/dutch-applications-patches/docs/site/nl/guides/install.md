# Een ondersteunde app patchen

Een patch verandert onderdelen van het installatiebestand van een app. Morphe Manager past die wijzigingen toe en maakt een APK die je kunt installeren. Via deze repository krijg je de patches. De originele app-bestanden lever je zelf aan.

## 1. Controleer je app-versie

[Download het originele bestand voor je app](downloads.md).

Zoek je app in het [app-overzicht](../apps/index.md). Vergelijk zowel de exacte versie als het buildnummer. Een nieuwere versie van dezelfde app kan andere code bevatten. Ga er daarom niet van uit dat een patch ook op een andere build werkt.

Sommige apps bestaan uit een split-APK-set: een basisbestand plus bestanden voor bijvoorbeeld de processor, taal of scherminstellingen van je telefoon. Gebruik de volledige set die op de app-pagina staat. Ontbrekende bestanden kunnen installatieproblemen of ontbrekende onderdelen veroorzaken.

## 2. Voeg de patchbron toe

Open [Toevoegen aan Morphe](https://morphe.software/add-source?github=johnneerdael/dutch-applications-patches) op het apparaat waarop je Morphe Manager gebruikt. Controleer of de bron verwijst naar `johnneerdael/dutch-applications-patches`.

Laat Use pre-release patches uit voor stabiele versies. Ontwikkelversies komen van `dev` en zijn bedoeld om te testen. De [release-informatie](https://github.com/johnneerdael/dutch-applications-patches/releases) vermeldt de bundelversies. De versie van de patchbundel is iets anders dan de versie van de app.

### Een ontwikkelversie testen

1. Open **Sources** in Morphe Manager en klap **Dutch App Patches** open (`johnneerdael/dutch-applications-patches`).
2. Zet bij deze bron **Pre-release patches** aan. Sommige Manager-versies noemen dit **Use pre-release patches**. Dit is een instelling per bron; de instelling voor prerelease-updates van de Manager-app zelf kan uit blijven.
3. Tik op **Update** op de bronkaart (de ronde pijl). Controleer **Version**: een ontwikkelbundel bevat `-dev.`. Staat er nog een stabiele versie, vernieuw deze bron dan opnieuw voordat je gaat patchen.
4. Kies je originele app-bestand en volg de app-handleiding. Kies bij [Videoland Android TV](../apps/videoland-android-tv.md) de exacte tv-APKS. **Hide ads** en **Disable tracking** zijn aanbevolen en staan standaard aan; Simple mode past beide toe. Laat beide aan als je de selectie zelf aanpast. Ontbreekt de app, open dan **Apps** op de bronkaart en zet hem aan.

We ontvangen graag geslaagde tests én reproduceerbare problemen. [Deel je testresultaat](https://github.com/johnneerdael/dutch-applications-patches/issues/new/choose) met de app/build, bundelversie, gekozen patches, eventueel je abonnementstype, apparaat/Android-versie en stappen. Gebruik voor Videoland het [testfeedbackformulier](https://github.com/johnneerdael/dutch-applications-patches/issues/new?template=videoland_test.yml); tests met het betaalde abonnement met reclame zijn bijzonder welkom. Deel geen inloggegevens, tokens of herkenbare persoonlijke logs.

Terug naar stabiele patches: zet **Pre-release patches** voor deze bron uit en tik op **Update**. Daarmee vervang je een al geïnstalleerde gepatchte app niet; bouw opnieuw vanuit de originele bestanden als je die wilt vervangen. Bewaar je ondertekeningssleutel en een werkende installer voor updates.

[Morphe's documentatie over patchbronnen](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) legt de broninstellingen uit.

## 3. Kies en pas de patches toe

Selecteer de originele APK of volledige splitset, bekijk de beschikbare patches en volg het patchproces in Manager. [Patches kiezen](choose-patches.md) legt het verschil uit tussen advertenties verbergen, gegevensverzameling stoppen en een melding overslaan. Manager kan onderdelen die de gekozen patch nodig heeft automatisch toevoegen.

Lees het patchrapport voordat je installeert. Als een patch mislukt of niet bij de app past, controleer dan de app-bestanden die je hebt geselecteerd. Ga er niet van uit dat een deel van de bescherming wel is toegepast.

## 4. Installeer en controleer het resultaat

Volg voor [Android Auto-apps](android-auto.md) de instructies voor KingInstaller en Shizuku voordat je installeert. Met de gewone installer kan Flitsmeister op je telefoon werken, maar ontbreken in de appkiezer van je auto.

De gepatchte app is met een andere sleutel ondertekend dan de app van de uitgever. Android kan de ene normaal niet over de andere installeren. Ook updates tussen gepatchte builds vereisen dezelfde ondertekeningssleutel.

Bewaar belangrijke gegevens voordat je een installatie vervangt.

Controleer na het installeren het opstarten en je gebruikelijke functies: weer, kaarten, artikelen, audio of waarschuwingen. Als audio werkt of een banner weg is, heb je die functie gecontroleerd. Daarmee weet je nog niet welke netwerkverzoeken de app heeft verstuurd. [Lees de uitleg over bewijs](../reference/methodology.md).

Vraagt je installatiemethode om Shizuku, gebruik dan de [installatie- en implementatiehandleiding](shizuku.md). Volg op een TV de [TV-specifieke instructies](shizuku-tv.md).
