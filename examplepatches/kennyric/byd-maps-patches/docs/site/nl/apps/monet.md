# Monet Android TV

**Appversie:** 1.1.1 · **Build:** 135 · **Origineel bestand:** APK

[Download originele app](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de originele Monet-launcher-APK in Morphe Manager. De patch verifieert Monet 1.1.1 (build 135) op de exacte native contracts voordat er iets verandert, en wijst andere versies af.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Unlock Premium** | Aan | Schakelt Monets lokale premiumfuncties in. Facturering en licentieopslag blijven native; alleen de valse return van de lokale evaluator verandert. |
| **Unlimited displayed cards** | Uit | Verwijdert de limiet van 20 kaarten bij Weergavekaarten. Voegt -10, +10 en Max toe aan de originele thematische kiezer, met behoud van indeling en enkelvoudige stappen. |
| **Individual Wuplay catalog rows** | Uit | Voegt afzonderlijke gepubliceerde Wuplay-catalogi toe aan Monets Content-keuzelijst, met Wuplay-iconen en verversing onafhankelijk van Recommendations. |
| **Individual Nuvio catalog rows** | Uit | Voegt afzonderlijke gepubliceerde catalogi toe aan Monets Content-keuzelijst, met ondersteuning voor elke ondersteunde catalogusuitgever. |

Kies slechts één catalogusbronpatch: de Wuplay- en Nuvio-rijenpatches gebruiken dezelfde native methodes en zijn niet te combineren. Unlock Premium en Unlimited displayed cards combineren vrij met beide.

## Advertentie- en trackingdiensten

Deze patches voegen Wuplay- of Nuvio-inhoudskeuzes en lokale premium- en kaartaantalcontroles toe. Advertentie- en trackinginstellingen veranderen niet.

## Voor gebruik

Gebruik eerst [Wuplay's cataloguspublicatie](wuplay.md): open in Wuplay **Settings > Catalogs > TV channels**, kies Home-catalogi van het standaardprofiel en druk op **Save and refresh**. De optionele Android TV-toestemming via **Add to TV Home** is niet nodig om de kanalen in Monet te lezen.

Maak in Monet een aangepaste mediarij, selecteer **Wuplay** en kies een catalogus bij **Content**. Herhaal dit voor elke gewenste catalogus. Monets gewone rijnamen, volgorde, indeling, kaartlimieten en opties om titels te verbergen blijven beschikbaar. De bestaande keuzes Continue Watching, Recommendations en de gecombineerde keuze blijven behouden.

Alleen kanalen van de ondersteunde Wuplay-app worden door deze patch toegevoegd. Andere uitgevers worden niet als Wuplay-catalogi behandeld. Keuzes gebruiken stabiele uitgeversidentiteiten: een kanaal hernoemen of opnieuw aanmaken behoudt de opgeslagen selectie. Lege catalogi blijven selecteerbaar; verwijderde catalogi behouden een opgeslagen maar niet-beschikbare keuze.

Verversen gebeurt zolang Monet op de voorgrond staat, onafhankelijk van de zichtbaarheid of inschakeling van Recommendations. Bij leesfouten blijft de laatste geslaagde inhoud behouden. Het maximum is 256 kanalen en 100 titels per kanaal. Accounttoegang, afspelen en eventuele eigen Monet-premiumbeperkingen blijven bij de betreffende apps.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
