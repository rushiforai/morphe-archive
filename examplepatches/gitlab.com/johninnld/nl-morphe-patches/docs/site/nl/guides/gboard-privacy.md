# Gboard instellen voor private lokale AI

Gebruik Local Model Host voor schrijfhulp, vertalen, tekst uit afbeeldingen en dicteren op je telefoon. Pas **Block Gboard telemetry** toe om de gevonden achtergrondrapportages tegen te houden en de standaardoptie Translate te verwijderen. Internet blijft beschikbaar voor zoekopdrachten en downloads die je gebruikt.

## Kies de patches en providers

1. Selecteer in Morphe **Block Gboard telemetry**, **AI Writing Tools**, **Enable OCR / Scan Text** en **Parakeet voice typing**. Behoud bij een update dezelfde pakketnaam en ondertekeningssleutel. Laat **Rambler voice typing** uitgevinkt als je de spraakmodus van Google wilt weglaten.
2. Open in Gboard **Patches → AI & Voice → Local AI**. Installeer **Local Model Host**, kies een Gemma-model op Android 11 of nieuwer met 64-bits ARM, en wacht op **Ready**. Zet in Gboard **Use Local AI** aan.
3. Kies en download voor dicteren een spraakmodel dat jouw taal vermeldt. Kies bij **Voice typing** in Gboard **Standard** (soms **Parakeet** genoemd) en zet **Use shared local speech** aan. Wacht tot het spraakmodel **Ready** meldt. Als je alleen typt, kun je dicteren uit laten staan.
4. Kies bij **Local AI → Writing preferences → Translation language** een doeltaal en gebruik **AI Translate** in de werkbalk. De standaardtegel **Translate** verdwijnt met de telemetriepatch.
5. Zet voor **Scan Text**, **AI Reply** en **My Style** met afbeeldingen beeldverwerking aan in de Host. Bevestig een schermopname wanneer Android erom vraagt en controleer het voorbeeld.

De [Local AI-gebruikshandleiding](local-ai.md) behandelt schrijfhulp, vertalen, schermcontext, beeldtekst, Smart Compose, inline grammatica en Voice Edit.

## Wat verlaat je telefoon?

| Functie | Gegevens |
| --- | --- |
| **Lokale schrijfhulp, AI Translate, Scan Text en schermcontext** | Gboard geeft de gekozen tekst of afbeelding op het toestel door aan Local Model Host. Controleer het voorbeeld voordat je het toepast. |
| **Gedeeld lokaal dicteren en Voice Edit** | De microfoonopname gaat op het toestel naar de Host. Bij Voice Edit gebruikt Gemma ook het concept en de uitgeschreven opdracht om een bewerking voor te stellen. |
| **GIF-zoeken en populaire GIF’s** | Tenor ontvangt de zoekterm die je invoert en verzoeken voor resultaten of afbeeldingen. De patch stopt het afzonderlijke deelrapport. |
| **Modellen, taalpakketten, thema’s en Emoji Kitchen** | Downloaddiensten ontvangen verzoeken voor de gekozen bestanden. Optionele pakketten kunnen eerst een download vereisen. Die bestanden worden onafhankelijk van je concept opgehaald. |
| **Oorspronkelijke schrijf- of spraakmodi van Google** | De provider kan tekst, audio of context ontvangen die de gekozen modus nodig heeft. Gebruik Local AI en gedeelde standaardspraak voor vertrouwelijke tekst en audio. |
| **Handmatige feedback, Android-back-up en gedelegeerde diensten** | Feedback kan de inhoud versturen die je kiest. Back-up en Play-services hebben eigen Android-instellingen en machtigingen. De patch grijpt in op de gevonden Gboard-verzendpaden. |

De patch stopt de gevonden Clearcut-uploads en clienttelemetrie via Play-services, naast Tenor-deelrapporten. Android kan nog steeds verbindingen maken voor systeemdiensten en Gboard behoudt netwerktoegang. De genoemde Local AI-acties verwerken hun invoer op het toestel. Uitspraken over iedere verbinding of iedere native of gedelegeerde component vereisen aanvullend netwerkonderzoek.

## Controleer je instellingen offline

1. Download de geselecteerde modellen volledig en controleer of ze **Ready** melden. Zet wifi en mobiele data tijdelijk uit.
2. Laat in een testveld een verzonnen zin nakijken en vertaal die met **AI Translate**. Controleer beide voorbeelden en pas ze toe of annuleer.
3. Kies in **Scan Text** een testafbeelding en controleer de herkende tekst. Dicteer een korte testzin via de gewone microfoon en controleer wat er wordt ingevoerd.
4. Zet je verbinding weer aan wanneer je bestanden wilt downloaden of GIF’s wilt zoeken. Controleer bij een mislukte lokale actie de gekozen provider en modelstatus in de [Local AI-handleiding](local-ai.md).

Laat voor andere apps die de Host gebruiken online zoekfuncties uit wanneer je uitsluitend lokale verwerking wilt. Als je een zoekfunctie aanzet en een client die aanroept, gaat de zoekopdracht naar de ingestelde provider.
