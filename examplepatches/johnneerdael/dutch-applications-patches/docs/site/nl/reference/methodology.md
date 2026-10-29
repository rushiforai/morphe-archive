# Wat ons bewijs aantoont

Onze uitspraken gelden voor de onderzochte app-versie, de bekeken onderdelen en de uitgevoerde controles. De app-onderzoeken gebruiken main-commit `6102fa9`, uitgebracht als v1.8.0. Het bewijs is beoordeeld op 28 oktober 2026. Het Dumpert-onderzoek gebruikt main `8ca0ddb` (v1.9.0). Elk app-onderzoek behoudt zijn oorspronkelijke bronverwijzingen. Latere app- of patchversies hebben een nieuwe beoordeling nodig.

## Vijf soorten bewijs

| Label | Wat het aantoont | Wat openblijft |
| --- | --- | --- |
| Gedocumenteerde mogelijkheid | Een aanbieder beschrijft een functie of gegevensveld. | Of deze app het inschakelt of gebruikt. |
| Gevolgd in app-code | De onderzochte code maakt gebeurtenissen aan, geeft waarden door of roept een verzender aan. | Of de telefoon dat deel van de code tijdens een bepaald gebruik heeft uitgevoerd. |
| Ingestelde / meegeleverde bestemming | Een instelling of SDK bevat of kiest een bestemming. | Of er een verzoek plaatsvond en wat de server bewaarde. |
| Gedekt door webbeleid | De patch blokkeert een vastgesteld verzoek als de webinhoud dat verzoek doet. | Of ieder genoemd domein in een sessie voorkwam. |
| Waarneming tijdens gebruik | Een vastgelegde handeling, log of bekeken verzoek toont specifiek gedrag aan. | Wat er gebeurt bij andere handelingen, apparaten, accounts of latere instellingen, en wat de server met de gegevens doet. |

Een ingebouwde SDK kan inactief zijn. Exodus maakt hetzelfde onderscheid in zijn [uitleg van de onderzoeksmethode](https://exodus-privacy.eu.org/en/page/faq/). Een DNS-registratie toont welke naam is benaderd. Je ziet daarmee niet ieder veld in de versleutelde gegevens.

## Hoe de patches worden gecontroleerd

Het project test losse patchopties en combinaties. Het bouwt en ondertekent de aangepaste bestanden en decodeert de uitvoer voor een onafhankelijke controle. Daarbij controleert het zowel het gewijzigde gedrag als wat behouden moet blijven. Meldingen van apparaattests geven daarnaast informatie over het opstarten en de werking van functies. Zo weten we meer over de codewijzigingen, installatie en bijvoorbeeld het openen van artikelen. Deze controles vormen op zichzelf geen volledig onderzoek naar het netwerkverkeer.

Het [register van bestemmingsbewijs](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md) vermeldt waar het bewijs vandaan komt en wat nog onbekend is. De app-pagina's verwijzen naar hun uitgebreide onderzoeken. Voor dit documentatieonderzoek zijn geen nieuwe netwerkopnamen of apparaattests uitgevoerd.

## Uitspraken die we uit elkaar houden

Een hostnaam alleen vertelt niet of gegevens worden verkocht of verder gedeeld, hoelang ze worden bewaard, of het gebruik aan de wet voldoet of wie een persoon is. Een veld dat gebeurtenissen *kan* verbinden laat zien dat koppelen mogelijk is. Om vast te stellen of er vervolgens een profiel wordt gemaakt, is ander bewijs nodig. Ook als een verzender is geblokkeerd, kunnen andere diensten in de app nog gegevens verzamelen.

## Als er iets verandert

Controleer opnieuw de originele app-versie, patchbundelversie, onderzochte onderdelen en diensten die blijven werken. Bewaar de oude bronverwijzingen. Geef bij nieuw bewijs uit een netwerkopname aan dat het om een andere controle gaat dan de eerdere bevindingen uit de code. Correcties zijn welkom via [GitHub-issues](https://github.com/johnneerdael/dutch-applications-patches/issues).
