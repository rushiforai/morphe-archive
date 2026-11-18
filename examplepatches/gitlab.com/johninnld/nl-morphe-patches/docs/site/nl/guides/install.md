# Patches installeren

Morphe Manager past de gepubliceerde patchbundels van deze bron toe op je originele appbestanden.

## 1. Kies de juiste originele app

Zoek je app in het [appoverzicht](../apps/index.md) en [download het originele bestand](downloads.md). Controleer zowel versie als build. Gebruik bij gesplitste apps het volledige APKS- of APKM-archief. Telefoon- en Android TV-versies zijn afzonderlijke doelen.

## 2. Voeg de patchbron toe

Installeer [Morphe Manager](https://morphe.software/). Open **Bronnen → + → Extern** en plak deze volledige metadata-URL:

```text
https://gitlab.com/johninnld/nl-morphe-patches/-/raw/main/patches-bundle.json
```

Tik op **Toevoegen**. Gebruik de volledige metadata-URL hierboven in plaats van de GitHub-repositorysnelkoppeling. Vervang `main` door `dev` als je ontwikkelvoorversies wilt volgen.

Tik op **Update** bij de bron om de nieuwste gepubliceerde patchbundel op te halen. Controleer vóór het patchen de bundelversie. Die staat los van de appversie.

## 3. Pas patches toe

Selecteer het originele appbestand, bekijk de patchkeuzes en pas ze toe. Begin met de standaardselectie en lees op de [apppagina](../apps/index.md) welke functies kunnen veranderen. Manager kan andere patches toevoegen die nodig zijn voor je keuzes.

Controleer bij een mislukte patch het originele bestand en de compatibiliteitsmelding voordat je het resultaat installeert.

## 4. Installeer en werk bij

Bewaar eerst belangrijke appgegevens. Android kan de app van de uitgever meestal niet vervangen door een gepatchte app, omdat ze verschillende ondertekeningssleutels gebruiken. De geïnstalleerde app verwijderen kan de gegevens wissen.

Gebruik voor toekomstige gepatchte updates dezelfde sleutel en bewaar een werkende installer. De patchbron bijwerken verandert een al geïnstalleerde app niet; patch het originele bestand opnieuw om bij te werken.

Controleer opstarten en de functies die je gebruikt, zoals afspelen, kaarten, login of waarschuwingen. [Problemen oplossen](troubleshooting.md) helpt bij veelvoorkomende problemen.

Volg voor Waze, Flitsmeister of Ungoogled Maps in de auto de [Android Auto-stappen met screenshots](android-auto.md). Lees voor installatietools met extra toegang over [Shizuku](shizuku.md) of [Android TV instellen](shizuku-tv.md).
