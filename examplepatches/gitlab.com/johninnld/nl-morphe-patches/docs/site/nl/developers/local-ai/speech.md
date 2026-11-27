# Gedeelde spraak, stemmen en talen

Bewaar spraakmodellen in Local AI zodat integrerende apps ze delen. Laat bij migratie de eigen herkenner of synthesizer los; alleen installatie van de companion ontlaadt die engines niet.

## Spraakherkenning

Gebruikers kiezen en downloaden Parakeet TDT v3, Parakeet Ultra, Nemotron Streaming of Whisper Tiny in de host. Lees taalgegevens en gereedheid van het geselecteerde profiel. De meegeleverde Whisper Tiny-integratie gebruikt een Engelse prefix; bied niet op basis van de modelfamilienaam alleen meertalige Whisper aan. De adapters bieden geen akoestische voorkeur voor een spraakwoordenboek.

Roep na verbinden `client.openSpeechSession("auto")` aan op een werkthread. Jouw app neemt audio op met haar gewone microfoontoestemming. Geef eindige float32-monosamples op 16 kHz door, maximaal 16000 samples per deel, via `SpeechSession.feed(samples, endOfStream, listener)`. Wacht op elke bevestiging of uitslag om de wachtrij te begrenzen.

Elk resultaat vervangt de vorige voorlopige transcriptie. `final=true` beëindigt de uiting. Annulering beëindigt de stream; open daarna een nieuwe sessie. Sluit de sessie aan het gesprekseinde. Toon een bezette herkenner, geheugenpauze of Stop duidelijk; vervang die niet stilzwijgend door een cloudherkenner.

Optionele beurtendetectie wordt afzonderlijk onderhandeld met `supportsTurnDetection()`. Ze meldt spraak-/beurtstatus; jouw app bepaalt wanneer te antwoorden, afspelen te onderbreken of een actie uit te voeren.

## Spraakuitvoer

Voor gewone Android-spraak kan de gebruiker **Local AI** als systeemengine voor tekst-naar-spraak kiezen. Jouw app gebruikt vervolgens Androids TTS-API zonder een tweede engine te beheren.

Onderhandel voor eigen audioroutering `supportsSynthesis()` en open een `SynthesisSession`. Gebruik `prepare(listener)` bij gespreksbegin, wacht op gereedheid, genereer spraak en gebruik `release(listener)` aan het einde. Release verwijdert jouw vasthoudverzoek; een ander gesprek, gebruikersinstelling of systeem-TTS-keuze kan de stem geladen houden.

Het audioformaat hoort bij iedere stream. Respecteer de gemelde samplefrequentie en begrensde PCM-callbacks. Voltooide synthese betekent dat de host klaar is met genereren; jouw app beheert nog steeds afspeelvoltooiing, stop/flush, audiofocus en onderbrekingen.

## Talen van het geselecteerde model aanbieden

Gebruik `HostCapabilities.synthesisModels()` en de relevante status-/profielgegevens. Bied stemmen en locales van de geselecteerde/gedownloade provider aan, niet een vaste samenvoeging van de hele catalogus. Werk de UI bij na een modelwissel.

Pocket TTS-taalpakketten, Kokoro, Supertonic en Piper-stemmen verschillen in dekking, downloads en licenties. Opgegeven ondersteuning, exportpariteit en taakkwaliteit zijn afzonderlijk. Een taalaantal in de catalogus is geen kwaliteitsgarantie en bewijst niet dat de stem geladen is.

Altijd-gereedvoorkeuren, actieve gesprekken, systeem-TTS en geheugendruk bepalen wat geladen blijft. Stop blijft beslissend. Verwerk niet-gereed, modelwissels en verbroken verbindingen zonder oude audio opnieuw af te spelen.

[Installatie](install.md) · [Teksttaken](tasks.md) · [Tools en geheugen](tools-and-memory.md)
