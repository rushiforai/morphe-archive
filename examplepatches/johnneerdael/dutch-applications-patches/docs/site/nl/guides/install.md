# Een ondersteunde app patchen

Een patch verandert onderdelen van het installatiebestand van een app. Morphe Manager past die wijzigingen toe en maakt een APK die je kunt installeren. Via deze repository krijg je de patches. De originele app-bestanden lever je zelf aan.

## 1. Controleer je app-versie

[Download het originele bestand voor je app](downloads.md).

Zoek je app in het [app-overzicht](../apps/index.md). Vergelijk zowel de exacte versie als het buildnummer. Een nieuwere versie van dezelfde app kan andere code bevatten. Ga er daarom niet van uit dat een patch ook op een andere build werkt.

Sommige apps bestaan uit een split-APK-set: een basisbestand plus bestanden voor bijvoorbeeld de processor, taal of scherminstellingen van je telefoon. Gebruik de volledige set die op de app-pagina staat. Ontbrekende bestanden kunnen installatieproblemen of ontbrekende onderdelen veroorzaken.

## 2. Voeg de patchbron toe

Open [Toevoegen aan Morphe](https://morphe.software/add-source?github=johnneerdael/dutch-applications-patches) op het apparaat waarop je Morphe Manager gebruikt. Controleer of de bron verwijst naar `johnneerdael/dutch-applications-patches`.

Laat Use pre-release patches uit voor stabiele versies. Ontwikkelversies komen van `dev` en zijn bedoeld om te testen. De [release-informatie](https://github.com/johnneerdael/dutch-applications-patches/releases) vermeldt de bundelversies. De versie van de patchbundel is iets anders dan de versie van de app.

## 3. Kies en pas de patches toe

Selecteer de originele APK of volledige splitset, bekijk de beschikbare patches en volg het patchproces in Manager. [Patches kiezen](choose-patches.md) legt het verschil uit tussen advertenties verbergen, gegevensverzameling stoppen en een melding overslaan. Manager kan onderdelen die de gekozen patch nodig heeft automatisch toevoegen.

Lees het patchrapport voordat je installeert. Als een patch mislukt of niet bij de app past, controleer dan de app-bestanden die je hebt geselecteerd. Ga er niet van uit dat een deel van de bescherming wel is toegepast.

## 4. Installeer en controleer het resultaat

De gepatchte app is met een andere sleutel ondertekend dan de app van de uitgever. Android kan de ene normaal niet over de andere installeren. Ook updates tussen gepatchte builds vereisen dezelfde ondertekeningssleutel.

Bewaar belangrijke gegevens voordat je een installatie vervangt.

Controleer na het installeren het opstarten en je gebruikelijke functies: weer, kaarten, artikelen, audio of waarschuwingen. Als audio werkt of een banner weg is, heb je die functie gecontroleerd. Daarmee weet je nog niet welke netwerkverzoeken de app heeft verstuurd. [Lees de uitleg over bewijs](../reference/methodology.md).
