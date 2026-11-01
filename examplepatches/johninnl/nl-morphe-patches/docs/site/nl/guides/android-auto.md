# Apps installeren voor Android Auto

Werkt een gepatchte app op je telefoon maar ontbreekt die in Android Auto? Probeer installatie via **KingInstaller met Shizuku ingeschakeld**. Dit is de installatieroute in deze handleiding voor [Flitsmeister](../apps/flitsmeister.md). Laat de opstart- en privacypatches aan.

## Voorbereiden

- [Installeer en start Shizuku-Next](shizuku.md) of behoud een compatibele dienst die al werkt.
- [Download KingInstaller](https://github.com/fcaronte/KingInstaller/releases) en installeer de APK.
- Patch de exacte originele appbestanden in Morphe Manager.

Root is niet nodig. Controleer vóór installatie of Shizuku draait, ook na opnieuw opstarten.

## Installeer de gepatchte app

1. Kies in Morphes installerlijst de afzonderlijke optie **KingInstaller**. De ingebouwde optie **Shizuku** is iets anders.
2. Zet in KingInstaller **Shizuku** aan en geef toegang wanneer daarom wordt gevraagd. Geef zo nodig bestandstoegang. Laat **Root** uit.
3. Tik op **Install as king**.
4. Bevestig **Bijwerken** voor een bestaande gepatchte app of **Installeren** voor een eerste installatie. Gebruik bij updates dezelfde ondertekeningssleutel om gegevens te behouden.
5. Open de app op je telefoon en rond zo nodig instellen of inloggen af.
6. Open de Android Auto-instellingen → **Launcher aanpassen** en schakel de app in. Verbind opnieuw met de auto als het overzicht niet is vernieuwd.

Ontbreekt KingInstaller in Morphe? Exporteer de **gepatchte APK**, open KingInstaller en selecteer die APK. Gebruik niet het originele APKS-/APKM-archief of de gewone installer van de bestandsbeheerder.

Gebruik voor toekomstige updates dezelfde KingInstaller-stappen.

## Als de app nog ontbreekt

Controleer of Shizuku draait, KingInstaller toegang heeft en **Shizuku** aan stond vóór **Install as king**. Controleer Android Auto’s lijst met verborgen apps. Alleen **Onbekende bronnen** aanzetten in Android Auto is mogelijk niet genoeg voor Flitsmeister.

Verwijder de app of appgegevens niet alleen om de launcher te vernieuwen. [Meld een probleem](troubleshooting.md#meld-een-probleem) met app/build, Android- en KingInstaller-versies en je installatiestappen. Zichtbaarheid in de launcher garandeert niet dat elke autofunctie op elke combinatie werkt.
