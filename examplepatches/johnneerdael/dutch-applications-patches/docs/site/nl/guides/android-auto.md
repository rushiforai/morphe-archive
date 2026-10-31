# Apps installeren voor Android Auto

Werkt een gepatchte app op je telefoon, maar ontbreekt hij in Android Auto? De installatiemethode kan de oorzaak zijn. Bij [Flitsmeister](../apps/flitsmeister.md) herstelde **KingInstaller met Shizuku ingeschakeld** de vermelding in Android Auto op de geteste telefoon en emulator. Houd de crashreparatie en privacypatches ingeschakeld.

## Download en start de hulpmiddelen

- [Installeer en start Shizuku-Next](shizuku.md), de standaard voor deze werkwijze. De handleiding bevat [downloads](https://github.com/rushiranpise/Shizuku-Next/releases), telefooninstellingen en een korte vergelijking van onderhouden alternatieven. Controleer dat de dienst actief is voordat je de gepatchte app installeert.
- [Download KingInstaller via de releases van het project](https://github.com/fcaronte/KingInstaller/releases). Installeer KingInstaller zelf en open zo nodig daarna opnieuw de installerkeuze in Morphe.

Onze onafhankelijke KingInstaller-test gebruikte Shizuku-Next. Draait er al een compatibele dienst, dan hoef je die niet te vervangen. Controleer de status na een herstart; automatisch herstel hangt af van de aanbieder en startmethode. Gebruik voor een televisie in plaats van een auto de afzonderlijke [Android TV-handleiding](shizuku-tv.md).

## Installeer via Morphe en KingInstaller

1. Pas de patches in Morphe toe met de originele app-bestanden die op de app-pagina staan. Installeer de **gepatchte APK** die Morphe maakt, niet de originele APKS of APKM.
2. Kies in Morphes scherm **Select installer** de afzonderlijke optie **KingInstaller** en bevestig. De ingebouwde optie **Shizuku** van Morphe gebruikt KingInstaller niet.
3. Schakel in KingInstaller **Shizuku** in. Geef KingInstaller toestemming om Shizuku te gebruiken en verleen zo nodig de gevraagde bestandstoegang. Laat **Root** uit voor deze geteste werkwijze zonder root.
4. Tik op **Install as king**.
5. Bevestig **Bijwerken** in het Android-installatiescherm, of **Installeren** bij een eerste installatie. Werk je een bestaande gepatchte app bij, behoud dan de ondertekeningssleutel en installeer de update eroverheen. Verwijder de app niet om een ontbrekende launcher-vermelding op te lossen.
6. Open de app op je telefoon en voltooi eventuele aanmelding of instellingen. Open de Android Auto-instellingen opnieuw, ga naar **Launcher aanpassen** en controleer of de app zichtbaar en ingeschakeld is. Verbind Android Auto opnieuw met de auto als de appkiezer nog niet is vernieuwd.

Staat KingInstaller niet tussen de opties in Morphe? **Bewaar/exporteer de gepatchte APK** vanuit Morphe. Open KingInstaller, selecteer die opgeslagen APK en ga verder vanaf stap 3. De APK in een bestandsbeheerder openen en de gewone systeeminstaller accepteren, gebruikt de geteste KingInstaller-werkwijze niet.

Shizuku moet tijdens deze installatie actief zijn. Gebruik KingInstaller ook voor latere updates van de gepatchte app, zodat de installatieherkomst behouden blijft.

## Waarom de installerkeuze uitmaakt

Android Auto controleert zowel de ondersteuning voor de auto als de geregistreerde installatieherkomst. De geteste ingebouwde opties **System installer** en **Shizuku** van Morphe Manager 2.3.0 registreerden voor Flitsmeister niet de vereiste herkomst, ook niet met **Install as Play Store** ingeschakeld. KingInstallers Shizuku-modus gebruikt een andere installatieweg en registreerde wel de herkomst die de onderzochte host accepteert.

Alleen **Ontwikkelaarsmodus** en **Onbekende bronnen** in Android Auto inschakelen loste dit voor Flitsmeisters Car App Library-categorie niet op. De [Android-documentatie](https://developer.android.com/training/cars/testing#allow-unknown-sources) legt uit dat de uitzondering voor onbekende bronnen niet geldt voor apps die deze bibliotheek gebruiken. Houd de crashreparatie van Flitsmeister aan; voor een andere installatiemethode hoef je geen patch terug te draaien.

## Als de app nog ontbreekt

Controleer of Shizuku actief was, of KingInstaller toestemming had en of je **Install as king** hebt gebruikt nadat je Shizuku in KingInstaller inschakelde. Kijk ook bij de verborgen apps onder **Launcher aanpassen** in Android Auto. Begin niet met gegevens wissen of de app verwijderen.

De gebruiker bevestigde dat dit op de fysieke telefoon werkt. Een onafhankelijke test met KingInstaller 2.4, Shizuku-Next, Android 16 en Android Auto 17.9 herstelde ook een aangevinkte Flitsmeister-vermelding in de appkiezer. Dit bewijst zichtbaarheid op die opstellingen, niet op elke telefoon, de compatibiliteit van een andere app of een volledige rijtest. Het [onderzoek naar installatieherkomst](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-flitsmeister-android-auto-installer.md) bevat het technische bewijs. Werkt het nog niet, [meld dan de app/build, Android-versie, KingInstaller-versie en installatiestappen](troubleshooting.md#meld-bruikbare-informatie).
