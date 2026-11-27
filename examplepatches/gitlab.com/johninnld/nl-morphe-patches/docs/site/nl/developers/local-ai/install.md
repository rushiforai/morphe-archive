# Local AI installeren en verifiëren

Deze procedure werkt zonder Gboard en zonder Play Store-distributie. Android vraagt de gebruiker nog steeds installatie vanuit jouw app toe te staan. Het downloaden van een model is een aparte stap.

## Leg één release vast

Het [companion-project](https://gitlab.com/johninnld/local-model-host) publiceert de ondertekende APK, bijbehorende client-AAR, `model-host-release.json` en `SHA256SUMS` samen. Het [pakketregister](https://gitlab.com/johninnld/local-model-host/-/packages) biedt onveranderlijke artifact-URL's.

Bundel een goedgekeurd descriptorbestand in jouw app. Dit bevat pakketnaam, broncommit, numerieke versiecode, exacte APK-grootte en SHA-256, ondertekeningscertificaat en download-URL. Laat niet-ondertekende online metadata de vertrouwenswaarden niet vervangen. Accepteer een vertrouwde compatibele nieuwere host zonder te downgraden.

Officiële pakketnaam: `app.johninnl.modelhost`.

SHA-256 van het officiële ondertekeningscertificaat:

```text
1c45e972f387160e6994391954d0f1ebd983a2b0ab506e444645f4ca9f47bdc4
```

## Installatie of update aanbieden

1. Roep `ProviderDiscovery.isOfficialProviderSupported()` aan. De officiële APK vereist Android 11/API 30 of nieuwer en arm64. Leg een ongeschikt toestel uit voordat downloaden wordt aangeboden.
2. Controleer pakketaanwezigheid, ingeschakelde dienst, ondertekenaar en numerieke versie. Een uitgeschakelde dienst is iets anders dan een ontbrekend pakket.
3. Download op een werkthread naar de privécache. Vereis HTTPS, begrensde omleidingen/time-outs, de exacte bestandsgrootte en `VerifiedApk.MAX_APK_BYTES` (256 MiB).
4. Gebruik `VerifiedApk.verify(...)` met verwachte pakketnaam, APK-hash en certificaat. Eis ook dat `verified.versionCode` overeenkomt met de descriptor.
5. Vraag zo nodig Androids toestemming voor installatie vanuit **jouw eigen pakket**. De toestemming voor Gboard geldt niet automatisch voor jouw app.
6. Open `ProviderInstallIntent.create(activity, verified)` via Activity Result. Houd een zichtbare installatieactie beschikbaar als jouw app de voorgrond verliest.
7. Controleer daarna opnieuw pakketidentiteit, versie, Binder-protocol en vereiste functies. Alleen een succesvol installatiescherm is onvoldoende.

Behoud appgegevens en ondertekeningsidentiteit bij updates. Toon verificatiefouten duidelijk; omzeil ze niet door te verwijderen of een ander certificaat te accepteren.

Verklaar voor een APK-download en installatie vanuit jouw app deze rechten:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

De AAR voegt zijn privé-APK-provider en pakketzichtbaarheid samen, maar vraagt deze apprechten niet aan. Een client die een al geïnstalleerde host via lokale Binder-inferentie gebruikt heeft daarvoor geen van beide rechten nodig.

## De SDK toevoegen

Gebruik de AAR die bij de goedgekeurde descriptor hoort:

```kotlin
android { buildFeatures { aidl = true } }
dependencies { implementation(files("libs/modelhost-client-api.aar")) }
```

Voeg pakketzichtbaarheid toe aan het manifest:

```xml
<queries>
    <package android:name="app.johninnl.modelhost" />
</queries>
```

De client-AAR bevat geen modelgewichten of inferentieruntime. Houd LiteRT/ONNX-engines in de companion. SDK-helpers verzorgen detectie, identiteitscontrole en installatie-intents; jouw app beheert de download- en installatie-interface.

## Modelinstellingen afronden

Open Local AI. De gebruiker schakelt de host in, kiest en downloadt modellen en wacht tot de vereiste functie Gereed meldt. Een clientverbinding kan Stop door de gebruiker niet opheffen. Alleen geselecteerde beheerde downloads blijven bewaard; een modelwissel wacht op lopend gebruik voordat oude beheerde bestanden worden verwijderd. Originele importbestanden van de gebruiker blijven intact.

Ga verder met het [eerste verzoek](quickstart.md).
