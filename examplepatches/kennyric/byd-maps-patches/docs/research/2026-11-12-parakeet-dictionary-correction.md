# Dictionary auto-correct for Parakeet Ultra voice typing (research, 2026-11-12)

Question: are there cheap ways to make Parakeet Ultra spell dictionary words (names, brands, places) correctly,
similar to what the Rambler personal dictionary does for cloud Rambler, and can misheard addresses that do not
exist be corrected?

Short answer: yes. The cheapest and strongest route needs no new model: sherpa-onnx 1.13.3, the runtime we already
ship, has contextual biasing ("hotwords") for NeMo TDT models. A pure-Java phonetic matcher and a second,
candidate-only decode cover what hotwords miss and make large lists such as all Dutch street names safe to use.
An LLM is not needed for spelling; at most it could help with capitalisation.

## Evidence (desktop prototype, not phone)

Setup: sherpa-onnx 1.13.3 Python on an Apple Silicon Mac, 4 threads, the exact pinned Parakeet Ultra int8 files
(hashes match `ParakeetCatalog`). Audio: 24 Dutch sentences synthesised with macOS `say -v Xander` (clean TTS, one
voice). 12 contain dictionary words (names, brands, places, addresses), and 12 are near-miss sentences built to
provoke false corrections (vele/Vela, hoek van de straat/Hoekstra, parkieten/Parakeet, code/Codeberg, timmerman/
Timmermans). Dictionary: 20 entries. Thresholds were tuned on this same set, so these are directional results, not
accuracy figures.

| Method | Dictionary-word errors fixed (of 11) | Damage on near-miss set | Extra cost |
| --- | --- | --- | --- |
| Greedy (shipped today) | 0 | none | baseline (0.83 s for 12 clips) |
| Beam search, no hotwords | 0 | none | +13% |
| Beam + hotwords, naive `bpe.vocab`, boost 1.5 | 5 (+2 partial) | "vos" became "Vos" | +13% |
| Beam + hotwords, fitted `bpe.vocab`, boost 2.5 | 9 | case flips only: "vos" became "Vos", "timmerman" became "Timmerman" | +13% |
| Phonetic post-correction of greedy text | 9 | none (with a common-word guard list) | ~1-5 ms in Java (est.) |
| Hotwords (2.5) followed by phonetic pass | 10 | same case flips as hotwords | +13% |

Fixed examples: rambler/paraket/geboaard became Rambler/Parakeet/Gboard, Codenberg became Codeberg, Vreswijk became
Vreeswijk, Ruisdaal became Ruijsdael, Koolsingel became Coolsingel, "Prins Hendrik de 33" became "Prins Hendrikkade
33", and Oud-Bijland became Oud-Beijerland (phonetic pass only). Still wrong: "Morphe patches" heard as one compound
("morvenpatjes", which became "Morphepatjes").

Candidate-only second decode (`createStream(hotwords)` with only the proposed word, boost 2.5, 50-90 ms per extra
decode on the Mac):

- Accepted the right candidates Coolsingel, Prins Hendrikkade and Ruijsdael.
- Rejected wrong candidates from the audio: Parakeet for "parkieten", Vela for "vele", Hoekstra for "hoek van de
  straat", Codeberg for "code".
- Did not reject case-only changes (Vos, Timmerman), because the audio is identical.

## Option 1: sherpa-onnx hotwords (recommended first step)

What already exists in 1.13.3: `offline-recognizer-transducer-nemo-impl.h` builds an Aho-Corasick `ContextGraph`
for `modified_beam_search`, and `offline-transducer-modified-beam-search-nemo-decoder.cc` applies it with TDT
duration handling. The Java API exposes `OfflineModelConfig.setModelingUnit("bpe")`, `setBpeVocab(path)`,
`OfflineRecognizerConfig.setHotwordsFile/setHotwordsScore`, and per-utterance `OfflineRecognizer.createStream(String
hotwords)` (phrases separated by `/`, merged with the file list). Per-entry boosts use `Word :2.0` lines.

What we must add:

1. A `bpe.vocab` for the Parakeet v3 tokenizer. Neither ONNX repo ships one. NVIDIA's `tokenizer.json` (BPE, 8,192
   pieces) matches our `tokens.txt` order exactly (0 mismatches; `<blk>` is the extra last entry).
2. A fix for a segmentation mismatch. sherpa encodes hotwords with simple-sentencepiece, a score-based DP, not real
   BPE merges. With the usual score `-id`, 35 of 86 test words were split differently from what Parakeet emits (for
   example `▁M or p he` instead of `▁Mor p he`). The boost then follows a path the model rarely produces. Fitting
   per-piece scores with a structured perceptron, so the DP reproduces the HF BPE split, gave 100% on the dictionary
   words and about 82% on 6,000 unseen English words. That fit raised fixes from 5 to 9. Two ways to ship it:
   - Fit offline on a large Dutch/English word list and ship one vocab file (~150 KB).
   - Fit at runtime against the user's own dictionary. This needs a Java BPE port (13,476 merges from
     `tokenizer.json`), about 100 lines, and makes those words exact.
3. Decoding: keep greedy for live partials, and use beam plus hotwords only for `finishUtterance` (one decode per
   utterance; about +13% on the Mac, phone cost not measured). Otherwise switch `ParakeetEngine` to
   `modified_beam_search` with `max_active_paths` 4.
4. Word sources: contacts (the Rambler contacts patch already has the permission flow), a list editable in
   `ParakeetSettingsActivity`, and optionally Gboard's own personal dictionary or the Rambler voice-correction list
   (UserFeatureCache, `ryi`). Reading the latter from the Parakeet path needs a small reverse-engineering step.
5. False-positive control. Give names that are also common words (Vos, Bakker, Visser, De Vries) a low or zero
   per-entry boost; the audio cannot tell them apart. Keep the list to hundreds or low thousands of entries. Large
   lists were not tested, and false positives grow with list size; use option 3 for big lists.

## Option 2: phonetic post-correction (no model, pure Java)

Run on the final text, after hotwords. Prototype logic: a Dutch-aware phonetic key (ij/ei/y, ch/g, c/k/s, v/f, z/s,
dt/d at word end, collapsed doubles, dropped h), then Levenshtein similarity against dictionary keys over windows of
1 to 3 words. Merged windows repair splits such as "Prins Hendrik de". Guards that were needed:

- Try the shortest window first, and never let a window swallow a leading function word ("is Bloemgracht 42" ate
  "is" until guarded).
- Never span digits or sentence punctuation.
- Require an exact key match for keys of 4 characters or fewer, otherwise 0.8 or 0.72 similarity ("veel" became
  "Vela" without this).
- Never change a word that is itself a common word (needs a real frequency lexicon, for example a SUBTLEX-NL or
  OpenSubtitles top-30k Dutch list plus an English list, a few hundred KB; check the licence first).

Brute-force Python matching costs 80 ms per sentence for 1,500 entries. Java with length buckets or a SymSpell-style
delete index should reach low single-digit milliseconds (not measured).

## Option 3: two-pass acoustic verification (makes large lists safe)

The matcher proposes candidates from any size of list (contacts, 286k streets). A second beam decode of the retained
utterance audio receives only those candidates as per-stream hotwords. The correction is accepted only when the
second pass produces the candidate. This costs one extra decode, only for utterances that have candidates, and it
lets the model veto proposals that do not fit the audio (see the evidence above). `finishUtterance` already holds the
audio, so no recorder change is needed.

## Addresses that do not exist

The key point: existence must be checked per place. "Koolsingel" is a real street, but it is in Alblasserdam. A
nationwide street list would accept "Koolsingel in Rotterdam"; limiting the check to Rotterdam flags it and finds
Coolsingel.

Proposed flow:

1. Detect an address span: a street-like word (ending in -straat, -laan, -weg, -plein, -gracht, -kade, -singel,
   -dijk, -pad, -hof, -steeg, -markt, -dreef, -ring and so on, or a known street name), an optional house number,
   then "in <place>" or a place name.
2. Resolve the place against the 2,503 Dutch place names (BAG woonplaatsen; tiny enough to bundle) with the phonetic
   matcher. This repaired Oud-Bijland into Oud-Beijerland.
3. Check whether the street exists in that place; if not, match phonetically within that place's streets (a few
   thousand at most), then confirm with option 3.
4. Optionally check the house number online.

Data sources:

- Offline: the BAG openbare-ruimte list, 285,828 (street, place) pairs according to PDOK's count, CC0. Compressed
  size not measured; my estimate is 2 to 4 MB. It could be an optional download like the models.
- Online, opt-in: PDOK Locatieserver `suggest`, free and keyless, Netherlands only. Solr fuzzy syntax with a place
  filter worked: `q=Koolsingel~&fq=woonplaatsnaam:Rotterdam` gave Coolsingel, "Prins Hendrikde~" in Amsterdam gave
  Prins Hendrikkade, "Kerkststraat~ 12" in Schoonhoven gave Kerkstraat 12. Plain `free` search failed on
  "Bloemgraft". Solr fuzzy allows at most two edits, so "Oud-Bijland~" found nothing; keep the local phonetic step.
  Privacy cost: the address span leaves the phone, and lookups add network latency.
- Outside the Netherlands, OSM Photon or Nominatim are the free options (not tested). Do not reuse the community
  Maps API key; it belongs to the Maps patches.

## Small LLM: not needed for spelling

The 2026-11-05 research found that no model under 1B could clean up dictation without damaging correct text. That
was free rewriting. Here the LLM would never write: it would only score a sentence with and without a proposed
replacement. The acoustic verification in option 3 already does that job better for spelling, because it hears the
audio. An LM only adds value for capitalisation ("De vos sprong" versus the surname Vos). A small n-gram model or a
rule ("de/het/een" + common noun stays lowercase unless an exact contact match is followed by a verb) is a cheaper
first try than shipping an LLM runtime of 150 MB or more.

## Suggested order

1. Hotwords on the final decode, with a fitted `bpe.vocab`, contacts plus a user list, and per-entry boosts. This is
   the smallest change with most of the gain. Measure phone latency first.
2. Phonetic post-correction with a common-word lexicon guard.
3. Two-pass verification, then the address module (bundled place names; streets as an optional download, or PDOK
   when online).

Open checks before building: decode latency of beam plus hotwords on the OnePlus 15; behaviour with real speech
instead of TTS; false positives with a list of about 1,000 contacts; whether Gboard's personal dictionary or the
Rambler voice-correction list can be read from the Parakeet path.

## Implementation notes (same day)

Built as the "Parakeet personal dictionary" patch, using Rambler's voice correction list as the only word source.
Findings that changed the plan:

- sherpa-onnx 1.13.3 builds its NeMo decoder once per recognizer (`SetConfig` only copies the config), so beam
  search cannot be limited to the final decode without loading the 600 MB encoder twice. With a list, every decode
  uses beam search; partials use plain streams without hotwords.
- A boost of `:0.0` means "use the default", not "no boost", so ordinary-word entries are left out instead.
- The candidate-only second decode never accepted a word that the first decode, with the same boost, had not already
  produced, at boosts from 2.5 to 7 and beams of 4 to 16 paths. It rejected every wrong candidate. With a small list
  it therefore acts as a veto on the sound-alike matcher; it adds fixes only for words outside the boost list.
- Frequency lists contain names (Peters, Mulder, Frida), so "ordinary" for boosting uses the top 12,000 words per
  language; the matcher and the capital fix still avoid all 50,000.

Desktop run of the extension classes with sherpa-onnx's Java API (same 24 TTS clips): 8 of 11 dictionary-word errors
fixed plus Morphe partly, Oud-Beijerland proposed and rejected by the second decode, no near-miss sentence damaged;
final decoding about 15% slower than greedy, partials about 14%.
