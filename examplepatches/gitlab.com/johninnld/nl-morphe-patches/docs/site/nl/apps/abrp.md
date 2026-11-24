# ABRP

Ontgrendel de Premium-functies van ABRP zonder abonnement, en laat de app op elke Android Auto-host draaien in plaats van alleen op de hosts die hij al vertrouwt.

**Appversie:** 8.0.0 · **Build:** 6087 · **Origineel bestand:** APKS

[Gebruik je originele APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Kies de volledige split-APKS-bundel van precies deze versie in Morphe Manager.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | Aan | Accepteert elke autorek tijdens de Android Auto-handshake, zodat de app ook start op autorekken van derden en op projectiebruggetjes. |
| **Unlock Premium** | Aan | Behandelt de app als de autoversie die ABRP zonder aankoopflow uitlevert, waardoor de Premium-schakelaars in de app opengaan. Bevat de oplossing voor GPS en locatietoegang in Android Auto. |

## GPS opgelost

Het GPS-probleem met ingeschakelde Premium-functies is opgelost. ABRP vraagt nu om locatietoegang op de telefoon en gebruikt de GPS van de telefoon voor de kaart en Android Auto. Het toestemmingsscherm voor voertuigtelemetrie blokkeert de autokaart niet meer. Gedownloade JavaScript-updates kunnen de aangepaste locatiecode niet vervangen.

Patch ABRP opnieuw met de nieuwste bundel om de oplossing te ontvangen. Sta nauwkeurige locatie toe wanneer Android daarom vraagt. Laat **Allow custom Android Auto hosts** geselecteerd voor DriveDeck of een andere aangepaste host.

## Premium

ABRP bepaalt Premium op twee manieren: via de accountrollen die de server teruggeeft, of, voor de autoversie, via twee waarden die vastliggen wanneer die versie wordt gebouwd. De telefoonversie wordt zonder die waarden gebouwd, dus op een telefoon, in Android Auto en op een losse kopie kwam Premium alleen uit het account.

De patch geeft die twee waarden aan het deel van de app dat ze leest. Daarna volgt de app dezelfde route als de autoversie: Premium-functies staan aan en de aankoopschermen worden niet bereikt.

Twee dingen doet hij niet. Hij verandert je account niet, dus de accountpagina en de ABRP-website laten nog steeds het abonnement zien dat je echt hebt. En hij kan niets geven wat de server van ABRP per account autoriseert: live voertuigdata, verkeer en weer worden met de waarden opgevraagd die de app nu stuurt, maar of de server ze zonder abonnement levert, wordt daar beslist en niet hier.

## Android Auto-hosts

ABRP gebruikt de car-app-bibliotheek voor zijn scherm in de auto. Als een host verbindt, controleert de app de aanroeper tegen de certificaten die de bibliotheek kent en weigert al het andere met "Unknown host" voordat er een sessie is. Een autorek of projectiebrug die niet op die lijst staat, kon ABRP dus helemaal niet starten.

De patch vervangt alleen dat oordeel. De pakketnaam en het gebruikers-ID van de aanroeper worden nog steeds opgezocht, en de templates, navigatie en weergave blijven ongewijzigd. De host moet nog steeds het car-app-protocol ondersteunen dat ABRP verwacht.

Het account, de routering en de laaddiensten van ABRP blijven ongewijzigd.

## Voor gebruik

Een APKS is een split-bundel: kies het volledige archief zodat de architectuur- en taalsplits meegaan. Een gepatchte APK heeft een nieuw certificaat, dus de Play Store-versie kan niet in-place worden bijgewerkt, en Google-inloggen kan mislukken omdat het originele certificaat ontbreekt. Log in met het ABRP-account.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaarden](../reference/catalogue.md)
