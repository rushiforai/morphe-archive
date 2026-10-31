# De oorzaak van een probleem vinden

## De app wordt niet aangeboden of het patchen mislukt

Vergelijk de pakketnaam, app-versie en het buildnummer met de [ondersteunde app-pagina](../apps/index.md). Controleer of je een volledige splitset nodig hebt en die ook hebt geselecteerd. Noteer de versie van de patchbundel en of ontwikkelversies aanstaan. Een patch voor een oudere app-versie werkt niet vanzelf op een nieuwere versie.

## Android wil het resultaat niet installeren

Android kan een update weigeren als de geïnstalleerde app en je nieuwe APK met verschillende sleutels zijn ondertekend. Dat kan gebeuren bij de originele app van de uitgever of bij een build die ergens anders is ondertekend. Bewaar de exacte installatiefout. Stel belangrijke gegevens veilig voordat je een installatie vervangt. Begin het onderzoek niet met gegevens wissen.

## De app ontbreekt in Android Auto

Volg de [installatiehandleiding voor Android Auto](android-auto.md), met links naar Shizuku en KingInstaller. De geteste oplossing voor Flitsmeister is: kies KingInstaller als externe installer in Morphe, schakel Shizuku in KingInstaller in, tik op **Install as king** en bevestig **Bijwerken**. Morphes ingebouwde installeropties en het vinkje Onbekende bronnen in Android Auto losten het geteste geval niet op. Behoud je ondertekeningssleutel en werk de app bij zonder hem te verwijderen.

## Kaarten, waarschuwingen of audio werken niet

Lees op de app-pagina welke diensten blijven werken. De optionele Swrve-patch voor Buienradar schakelt waarschuwingen bewust uit. Bij [RTL Nieuws](../apps/rtl-nieuws.md) schakelt Disable Swrve (expert) pushmeldingen en Swrve-kanaalsynchronisatie uit. Met de standaardopties blijven die functies beschikbaar. Bij een nieuwe installatie met Skip consent screens zet je meldingen zelf aan; bestaande eigen keuzes blijven behouden.

Vraagt [Omroep Brabant](../apps/omroep-brabant.md) niet meer om toestemming voor meldingen bij het opstarten, open dan zelf de meldingsinstellingen. Skip consent screens voorkomt dat automatische verzoek bewust; hij verleent geen toestemming.

Of kaarten werken, hangt af van de instellingen van de ondersteunde release. Voor het afstemmen van het afspelen kunnen de oorspronkelijke serververzoeken nodig zijn. Blokkeer een hostnaam niet alleen omdat je die niet herkent.

## Ik zie een dienst nog steeds in een netwerkhulpmiddel

Noteer de bestemming, het tijdstip en welke handeling het verzoek uitlokte. Een verzoek kan instellingen ophalen, pushmeldingen registreren, een artikel laden of analysegegevens uploaden. De naam "Firebase" of een overeenkomend domein vertelt op zichzelf niet waarvoor het verzoek diende. [Zo beoordeel je bewijs](../reference/methodology.md).

## Meld bruikbare informatie

Maak een [issue](https://github.com/johnneerdael/dutch-applications-patches/issues) met de app-versie en build, patchbundelversie, gekozen opties en Android-versie. Beschrijf je stappen en neem de exacte foutmelding op. Verwijder tokens, accountgegevens, precieze coördinaten en URL's die je kunnen identificeren uit logs. Vermeld of je bevinding uit app-code, een DNS-registratie of een bekeken verzoek komt. Daarmee maak je duidelijk wat je wel en niet hebt kunnen vaststellen.
