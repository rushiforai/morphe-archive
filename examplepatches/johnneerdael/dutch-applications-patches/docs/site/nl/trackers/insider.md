# Insider: hoe worden gebeurtenissen en locatie marketinggegevens?

## Wat doet deze SDK?

Insider, nu gedocumenteerd als Insider One, levert hulpmiddelen voor klantprofielen, doelgroepselectie en berichten. De **SDK** is een herbruikbaar codepakket binnen een app. Een **event** legt een handeling met context vast; een **attribuut** beschrijft een profieleigenschap, zoals een huidige voorkeur. Volgens de aanbieder moet de app sommige standaardvelden zelf invullen. Apparaatkenmerken kunnen bij het instellen van de SDK worden ingevuld. Een functie in documentatie bewijst niet dat een app die gegevens verstuurt. [Insider over gebeurtenissen en eigenschappen](https://academy.insiderone.com/docs/android-events-and-attributes?isBot=true).

De dienst ondersteunt ook **geofencing**: vaststellen of een apparaat een bepaald geografisch gebied binnenkomt of verlaat. De instructies beschrijven locatierechten en een afzonderlijke locatiekeuze. Dat is een productmogelijkheid. Een geofencebibliotheek bewijst geen concrete gebiedsgrens, locatiegeschiedenis of campagne. [Insider-documentatie over geofencing](https://academy.insiderone.com/docs/expo-start-tracking-geofence).

## Waarom onderscheid maken tussen navigatie en marketinglocatie?

**Denkbeeldig voorbeeld:** een navigatieapp heeft de huidige positie nodig om een kaart te tonen. Een afzonderlijk marketingonderdeel zou het binnenkomen van een gebied kunnen gebruiken om een bericht te kiezen. Beide gebruiken locatie, maar aanleiding, ontvanger en doel verschillen. Het marketingonderdeel stoppen hoeft de GPS-functie voor het rijden dus niet uit te schakelen.

Een ID kan opeenvolgende gebeurtenissen aan één installatie of profiel verbinden. De functies voor profielen en gebeurtenissen geven aan welke code onderzocht moet worden. Welke profielvelden en berichten de app werkelijk verstuurt, moet uit bewijs voor die app blijken.

## Wat vonden we in Flitsmeister?

Bij [Flitsmeister 14.17](../apps/flitsmeister.md) stopt **Disable tracking** het opstarten van Insider, gebeurtenissen, profieleigenschappen, geofencing, opgeslagen taken en de verzending door de SDK zelf. Een **opgeslagen taak** is werk dat later wordt uitgevoerd. Alleen zichtbare schermen aanpassen zou zo'n route missen. Het gepubliceerde onderzoek noemt geen exact ontvangstadres voor Insider-uploads en bevat geen volledig onderschept gegevensbericht. [Flitsmeister-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FLITSMEISTER_PATCH_AUDIT.md).

## Welke locatie-uitwisseling blijft bestaan?

Dezelfde patch onderdrukt afzonderlijk de aangetroffen eigen footprint-, floating-car-data-, gebruiks- en optionele sensor- of monitoringmetingen. **Live GPS-uitwisseling met CITS blijft echter bestaan.** CITS is de verbonden verkeerswaarschuwingsdienst uit het onderzoek. Ook noodzakelijke kaart- en routeverzoeken, expliciete gevarenmeldingen en operationele account- en pushregistratie blijven bestaan. Daarbij kunnen functionele locatiegegevens en identificatoren meegaan.

Alle zes Flitsmeister-controles staan in de ondersteunde uitgave standaard aan. De door de gebruiker bevestigde praktijktest bewijst geen volledige netwerkstilte of bewaarbeleid bij aanbieders.

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [locatie](../learn/location.md), [identificatoren](../learn/identifiers.md) en [de methode](../reference/methodology.md).
