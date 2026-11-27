# Lokale AI voor Android-ontwikkelaars

Voeg lokale schrijf-, beeld-, spraak- en extractiefuncties toe zonder in elke app een apart model te laden. Local Model Host is een zelfstandige APK met een openbare Binder-SDK. Gboard gebruikt dezelfde dienst die andere Android-apps kunnen gebruiken.

Voor de inferentie zijn Play Store-installatie, Google Play-services, AICore, een Google-account en een bevoorrechte clienthandtekening niet nodig. Installeer de ondertekende companion rechtstreeks en voeg de kleine Java-SDK toe. De officiële host-APK vereist **Android 11 of nieuwer en 64-bits ARM**. De client-SDK kan ook deel uitmaken van apps die oudere Android-versies ondersteunen.

## Begin hier

1. [Installeer en verifieer de companion en SDK](install.md).
2. [Voeg een correctieactie toe](quickstart.md).
3. Kies [tekst- en beeldtaken](tasks.md), [spraak en talen](speech.md), of [tools, extractie en geheugen](tools-and-memory.md).

Gebruik voor het toetsenbord de [Local AI-handleiding voor Gboard](../../guides/local-ai.md).

## Eén host, gescheiden appgegevens

| Onderdeel | Verantwoordelijkheid |
| --- | --- |
| Jouw app | Invoer, rechten, editorstatus, afspelen en definitieve acties |
| Java-SDK | Binder-verbinding, verzoekidentiteit, callbacks, annulering en bestandsoverdracht |
| Local Model Host | Geselecteerde modellen, inferentie, planning, geheugenbeheer en gebruikersinstellingen |
| Android | Procesisolatie, UID-identiteit, installatiebevestiging en systeem-TTS-keuze |

Eén geselecteerde Gemma-engine bedient tekst- en beeldclients. Spraakherkenning, synthese en extractie hebben eigen geselecteerde modellen binnen het gedeelde geheugenbudget. Laat een ingebouwde engine los bij de overstap om dubbele modelbelading te voorkomen. Installatie van de host leidt bestaande AICore-aanroepen of eigen engines niet automatisch om.

Elke Android-UID bezit eigen sessies, prefixes, verzoeken en privégeheugen. Iedere app kan integreren; er is geen lijst met toegestane clienthandtekeningen. Controleer de provider voordat gegevens worden verstuurd. Een sessie of opgeslagen herinnering van een andere app is geen gedeelde gesprekscontext.

## Controleer functies vooraf

Onderhandel protocolversie, mogelijkheden en modelgereedheid. Protocol 1.4 voegt extractie, prefetch en privégeheugen toe aan tekst, beeld, spraak, synthese en optioneel zoeken. Alleen een versienummer bewijst niet dat een functie of model beschikbaar is.

Lees taalgegevens van het geselecteerde profiel. Opgegeven dekking, exportpariteit en bewijs van taakkwaliteit zijn verschillende claims. Toon modelkeuze, download, laden, Gereed, geheugenpauze en Stop door de gebruiker als afzonderlijke toestanden.

[Companion-broncode en volledige contracten](https://gitlab.com/johninnld/local-model-host) · [Gebruikersinstellingen](../../guides/local-ai.md)
