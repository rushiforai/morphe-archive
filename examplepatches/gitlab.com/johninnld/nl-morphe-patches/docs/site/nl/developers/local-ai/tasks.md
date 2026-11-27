# API's voor tekst- en beeldtaken

Gebruik taakfactories voor kleine, veelvoorkomende bewerkingen. De host levert specifieke instructies en begrensde uitvoerbudgetten. Jouw app beheert invoer, voorbeeld en definitieve actie.

| Taak | SDK-verzoek |
| --- | --- |
| Spelling, grammatica en interpunctie | `TaskRequests.proofread(text)` |
| Samenvatting | `TaskRequests.summarize(text)` |
| Professionele toon | `TaskRequests.rewrite(text, TaskRequests.RewriteStyle.PROFESSIONAL)` |
| Natuurlijke herformulering | `TaskRequests.rewrite(text, TaskRequests.RewriteStyle.REPHRASE)` |
| Vertaling | `TaskRequests.translate(text, "French")` |
| Antwoord op aangeleverde conversatie | `TaskRequests.reply(incomingMessage, intendedReply)` |
| Expliciete stijlvoorbeelden volgen | `TaskRequests.matchStyle(text, userExamples)` |
| Een wijziging op gebruikersinstructie | `TaskRequests.edit(text, instruction)` |
| Zichtbare tekst in een afbeelding | `TaskRequests.extractText()` |
| Afbeeldingsbeschrijving | `TaskRequests.describeImage()` |

Verstuur tekst via `HostSession.submitText` en afbeeldingen via `submitImage` met een leesbare bestandsdescriptor. Vision moet zijn ingeschakeld en beschikbaar worden gemeld. De client beheert camera-/kiezerrechten en expliciete selectie. De host neemt niet voortdurend het scherm of de microfoon op.

## Context en taal

De ingestelde sessiegrens is 4096 tokens totaal, inclusief instructies, geschiedenis, media en gereserveerde uitvoer. Contextverzoeken zijn begrensd tot 256–4096 tokens en uitvoerbudgetten tot 1–2048. Houd toetsenbordtaken kort. Deel een lang document bewust op in plaats van het einde stilzwijgend weg te laten.

Een vertaling vereist een expliciete doeltaal. Geef het ontvangen bericht en het bedoelde antwoord mee bij een antwoordtaak; het model kent een andere appconversatie alleen als de client die aanlevert. Stijlvoorbeelden moeten expliciet van gebruiker of app komen.

Het schrijfbeleid gebruikt een basisset van 38 talen en staat extra talen toe met een waarschuwing over experimentele kwaliteit. Dat bewijst geen geverifieerde kwaliteit voor elke taak. Spraak- en stemprofielen hebben eigen taallijsten.

## Eigen taken

Gebruik `TextRequest.rawMessages(...)` met `ChatMessage`-rollen voor eigen generatie. Houd de systeeminstructie stabiel, zet wisselende invoer in het gebruikersbericht en beschrijf een klein uitvoerformaat. Valideer JSON, enumwaarden, bereiken en verwijzingen met code.

Gebruik deterministische code voor exacte tellingen, rekenen, rechten en acties. Kies extractie-API's voor namen en ondersteunde labels; gebruik het taalmodel voor de onduidelijke taalstap. Zoeken krijgt afzonderlijke [tooltoestemming](tools-and-memory.md).

## Afbeeldingen en verouderde resultaten

Beeldbewerkingen accepteren PNG/JPEG/WebP binnen de gemelde bestands- en pixelgrenzen. Het resultaat is tekst of een beschrijving, zonder OCR-vakken of gekalibreerde detectiezekerheid. Controleer gevoelige namen en getallen.

Koppel ieder verzoek aan een editor-/documentrevisie. Controleer die vóór toepassing en behoud normaal ongedaan maken. De host verstuurt geen bericht en bewerkt geen andere app namens de client.

[Verbindingstutorial](quickstart.md) · [Modellen en gedeelde spraak](speech.md)
