# Woordenlijsten per regelset (onderzoek taak 9, stappen 1 en 2)

Status: **vervangen** (2026-11-03). De lijsten staan nu in `wordlists/` van deze repository, alleen uit openbare bronnen; zie `wordlists/README.md` en spec §6.1. Hieronder het oorspronkelijke onderzoek (2026-11-01), ter referentie.
Onderzoeksdatum: 2026-11-01.

## Werkwijze

- Alleen bronnen met een vaste URL: `raw.githubusercontent.com/<eigenaar>/<repo>/<commit>/<pad>`. Geen `main` of `master`.
- Per kandidaat is het ruwe bestand gedownload (alleen als data) en zijn SHA-256, grootte en regelaantal vastgesteld.
- **Woorden / afgevallen** volgen de regels van `WordListNormalizer`: BOM weg, `trim`, hoofdletters met `Locale.ROOT`, lege regels over, woorden met een teken buiten het alfabet over, ontdubbelen. *Afgevallen* = regels min woorden (ongeldig + dubbel + leeg). Een script dat deze regels naspeelt (Python, niet de Java-klasse zelf, want die bestaat nog niet) leverde de cijfers.
- Alle bestanden zijn UTF-8 (alleen ASCII voor de Engelse, Franse en Nederlandse lijsten); alleen `kaikkisanat.txt` heeft een BOM, die de normalizer weghaalt.

### Alfabetten

- Regelset 2 (Nederlands): A-Z, uit `extensions/extension/src/test/resources/fixtures/detail_neigen.json` (`tile_points`).
- Alle andere: **aanname** op basis van de gangbare Wordfeud-letterset per taal; er is geen fixture met `tile_points`. Aantal afgevallen woorden hangt hiervan af en moet worden herberekend zodra de echte `tile_points` bekend zijn (bijvoorbeeld uit een `games/detail`-respons).
  - Engels (0, 5) en Frans (7): A-Z. Noors (1) en Deens (3): A-Z + Æ Ø Å. Zweeds (4): A-Z + Å Ä Ö. Spaans (6): A-Z + Ñ. Duits: A-Z + Ä Ö Ü (geen ß). Fins: A-Z + Ä Ö. Portugees: A-Z + Ç.

### Wat Wordfeud zelf zegt over zijn bronnen

- Wordfeud-help (`https://wordfeud.com/wf/help/ios/`): "For US English we use the TWL", "For international English the SOWPODS dictionary is used". Voor de andere talen noemt de helppagina geen bron. Talen: Deens, Nederlands, Fins, Frans, Duits, Noors, Portugees, Spaans, Zweeds (plus Engels).
- Derden (`word.tips/wordfeud`, niet door Wordfeud bevestigd): Nederlands = TaalTik, gebaseerd op OpenTaal; Noors = NSF-ordlisten; Deens = Retskrivningsordbogen (volgens een Deense helper-app juist DSDO); Zweeds = Svenska Akademien (volgens een andere helper-app SAOL13); Frans = ODS5.
- Geen enkele lijst hieronder is aantoonbaar *Wordfeuds eigen bestand*. De enige met een directe band is `mrcz/Wordfeud-Player` (Zweeds: oorspronkelijk door Wordfeud gedistribueerd) en voor het Nederlands `jensanjo/wordfeud-wordlists` (gebaseerd op OpenTaal, de bron die Wordfeud-Nederlands volgens derden gebruikt).

## Regelsets

Regelset-id's 0-7 volgen spec §3 (hint uit externe Go-client, alleen 2 is bevestigd). Id 8-12 zijn **onbevestigd (V9)**: Wordfeud biedt ook Duits, Fins en Portugees, maar welk id bij welke taal hoort is niet vastgesteld. De tabellen hieronder voor Duits, Fins en Portugees staan daarom onder "id onbekend".

### 0. Amerikaans Engels (TWL)

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `dolph/dictionary` `enable1.txt` | https://raw.githubusercontent.com/dolph/dictionary/233d25a56b9ac8bef906916ccf091a976995cce0/enable1.txt | ENABLE is publiek domein; repo heeft geen LICENSE-bestand (aanname uit de ENABLE-herkomst, niet uit het repo) | 172.823 | 0 | `3f16130220645692ed49c7134e24a18504c2ca55b3c012f7290e3e77c63b1a89` | 1.743.363 B | Niet TWL; ENABLE wijkt licht af (enkele honderden woorden). Kleine letters, ASCII. |
| `dolph/dictionary` `ospd.txt` | https://raw.githubusercontent.com/dolph/dictionary/233d25a56b9ac8bef906916ccf091a976995cce0/ospd.txt | **Onduidelijk**: OSPD is Merriam-Webster (Hasbro), geen licentie in het repo | 79.339 | 0 | `aed321e0ce21f8d858a4755c114b7ecc4ae61616a68e9f30b1488a46eda2c6f5` | 614.670 B | Waarschijnlijk basisvormen/oudere editie, te klein voor TWL. Niet aanbevolen. |

Er is geen vrij gelicentieerde TWL gevonden. **Aanbeveling:** `enable1.txt` als vrije benadering; de overlay moet dan weigeringen van de server (`RejectedWords`) afvangen. Afwijkingen met TWL zijn beperkt.

### 1. Noors

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `Ondkloss/norwegian-wordlist` bokmål (Norsk ordbank 2005, update 2022-02-01) | https://raw.githubusercontent.com/Ondkloss/norwegian-wordlist/de07f3fe9c9dda2012e143205e04df539be178ab/wordlist_20220201_norsk_ordbank_nob_2005.txt | Data CC BY 4.0 (Norsk ordbank, Språkbanken/Språkrådet); code WTFPL | 141.295 | 1.882 (1.879 ongeldig, 3 dubbel) | `33ec794e5fbb35b0ea271c3b152bd35f95cb503e2edbdca93d6878a2581fce05` | 1.679.174 B | Alle vormen, eigennamen met regex verwijderd (README: verwijdert ook enkele geldige woorden). Niet de NSF-lijst. Kleine letters. |
| idem nynorsk (2012) | https://raw.githubusercontent.com/Ondkloss/norwegian-wordlist/de07f3fe9c9dda2012e143205e04df539be178ab/wordlist_20220201_norsk_ordbank_nno_2012.txt | CC BY 4.0 | 103.275 | 1.646 (1.643 ongeldig, 3 dubbel) | `580775889d017efde0ed3d975e4bd7e0a4ea83ff77be7e7bf999d62f13ded84e` | 1.108.544 B | Wordfeud-Noors staat bokmål en nynorsk toe; per regelset kan maar één URL. |

De NSF-ordlisten (Wordfeuds bron volgens derden) is volgens een nixpkgs-pakket "unfree" en niet als vrije download gevonden. **Aanbeveling:** bokmål-lijst (CC BY 4.0, bronvermelding nodig). Nynorsk-woorden ontbreken dan; geen samengevoegde lijst, want dat vereist een eigen artefact.

### 2. Nederlands (bevestigd)

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `jensanjo/wordfeud-wordlists` `nl/wordlist-nl.txt` (commit 2025-01-06) | https://raw.githubusercontent.com/jensanjo/wordfeud-wordlists/9e8bbff63d7ebd80e2d91b9a33bd69d5d9c2bd06/nl/wordlist-nl.txt | OpenTaal: Revised BSD en/of CC BY 3.0 (`nl/LICENSE.txt`); `LICENSE` in de root verwijst daarnaar | 340.672 | 0 | `414075805ca9b76fba3cbdaab7dd5ff7cbf1f851c3580b06f1001e2fca97b287` | 3.973.269 B | Gemaakt voor Wordfeud op basis van OpenTaal; al kleine letters, A-Z, zonder dubbelen. De bron die Wordfeud-Nederlands volgens derden gebruikt (TaalTik/OpenTaal). |
| `OpenTaal/opentaal-wordlist` `wordlist.txt` (2025-02-09) | https://raw.githubusercontent.com/OpenTaal/opentaal-wordlist/b250510dda431785f962019167d1415198ff3905/wordlist.txt | Revised BSD en/of CC BY 3.0 | 386.570 | 27.367 (23.120 ongeldig, 4.247 dubbel) | `12e5fb5e3c73840b583b30016926d1f63a75e9bf1652a3a6634b2ba7c49ad7be` | 5.104.598 B | Bevat cijfers, koppeltekens, accenten, hoofdletters; groter dan de Wordfeud-lijst, dus meer zetten die de server kan weigeren. |

**Aanbeveling:** `jensanjo/wordfeud-wordlists` (aantoonbaar voor Wordfeud gemaakt, schoon, vrije licentie met bronvermelding OpenTaal). Het Nederlands is de enige regelset met een bevestigde regelset-id en fixture.

### 3. Deens

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `n0kovo/danish-wordlists` `ddo_fullforms.txt` | https://raw.githubusercontent.com/n0kovo/danish-wordlists/d63363695b28362375f04d2b011c0273a52f92ec/ddo_fullforms.txt | **Onduidelijk**: repo zonder LICENSE; data is een export uit Den Danske Ordbog (DSL, korpus.dsl.dk), voorwaarden niet vastgesteld | 613.470 | 18.590 (1.729 ongeldig, 16.861 dubbel) | `68a0f1b67d05b4a9c16f94550717a1e552ecd9971e2590aa24b6dcf0bb9e52c7` | 8.495.510 B | Alle vormen van DDO, geen Retskrivningsordbogen/DSDO; mogelijk veel woorden die Wordfeud niet kent (samenstellingen). |

Overige Deense bronnen (Stavekontrolden/aspell-da, GPL/LGPL/MPL) zijn Hunspell/aspell-woordenboeken met affixregels; daar is geen platte lijst als vaste download van gevonden. **Aanbeveling: geen** (licentie onduidelijk) tot de opdrachtgever een bron aanwijst; anders `WL-NONE`.

### 4. Zweeds

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `mrcz/Wordfeud-Player` `ordlista.txt` (2016-06-06) | https://raw.githubusercontent.com/mrcz/Wordfeud-Player/0d3db71bdcee6f490556fe1e7219ea2392393de8/ordlista.txt | CC BY-SA 3.0 (README); code GPL-2 | 417.108 | 3 (2 ongeldig: de twee kopregels `# ...`, 1 dubbel) | `fb5870745290e808e5aca98209185b5cfcd70e9d5ba1b08033a2777cf3519762` | 5.230.259 B | "Den stora svenska ordlistan" (DSSO, G. Andersson), licht aangepast door de Wordfeud-auteur, vroeger door Wordfeud zelf aangeboden. Band met Wordfeud dus aantoonbaar, maar het is de **oude** lijst en wijkt waarschijnlijk af van de huidige (SAOL volgens derden). Bevat een `#`-kopregel. |
| `martinlindhe/wordlist_swedish` `swe_wordlist` (2014-07-29) | https://raw.githubusercontent.com/martinlindhe/wordlist_swedish/c1c4464df5d2232fcdd04f2b17bc491aba3cda27/swe_wordlist | MIT (repo); herkomst van de woorden niet vermeld ("compiled by me") | 401.454 | 9.332 (9.315 ongeldig, 17 dubbel) | `ed072a895de54b96fa256e7d6480408c61fc75d1160bfc6bcad0c95b83b3d194` | 5.409.759 B | Bevat leestekens/`.net`; eigen herkomst onduidelijk. Niet aanbevolen. |

**Aanbeveling:** `mrcz/Wordfeud-Player` `ordlista.txt`. Let op: CC BY-SA is "share alike"; de lijst wordt tijdens gebruik gedownload en niet in de patch meegeleverd, maar de opdrachtgever moet dit kennen. Bronvermelding in README.

### 5. Engels internationaal (SOWPODS / Collins)

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `jesstess/Scrabble` `scrabble/sowpods.txt` (2014) | https://raw.githubusercontent.com/jesstess/Scrabble/5d4a1e69ad2267126fa8d82bbc34ca936d1f878a/scrabble/sowpods.txt | Repo MIT, maar **Collins Scrabble Words is auteursrechtelijk beschermd** (HarperCollins); herdistributievoorwaarden niet vastgesteld | 267.751 | 0 | `8fa1b8384c6121b2cd16697f68c46569570b788204ca2633a79b2b61ef71886b` | 2.707.014 B | Oude SOWPODS-editie (aantal komt overeen met CSW07-tijdperk, ~267k); mist recentere Collins-woorden. Hoofdletters. |
| ENABLE (zie regelset 0) | zie 0 | publiek domein | 172.823 | 0 | `3f161302...` | 1.743.363 B | Vrije, kleinere benadering; mist veel Collins-woorden. |

**Aanbeveling: geen zonder besluit.** SOWPODS is de bron die Wordfeud noemt, maar de bestanden online zijn een niet-gelicentieerde kopie van een commerciële lijst. Keuze voor de opdrachtgever: sowpods.txt gebruiken (juridisch risico bij de opdrachtgever), ENABLE als vrije vervanger (meer afwijzingen), of `WL-NONE`.

### 6. Spaans

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `JorgeDuenasLerin/diccionario-espanol-txt` `data/allwords.txt` (2025-11-19) | https://raw.githubusercontent.com/JorgeDuenasLerin/diccionario-espanol-txt/8991d20020f8727a16220cc26c86f80a24ffe63f/data/allwords.txt | **Geen licentie**; gescrapet van de RAE-server (DLE, RAE-auteursrecht) | 59.662 | 34.275 (34.205 ongeldig, 70 dubbel) | `36c3ad154954b5fcd8e8bff9d29babd0d7cab29adf5bea17438da266edc45ee0` | 1.002.776 B | Lemma's met accenten en achtervoegsel-items (`-aje`); geen vervoegingen, dus onbruikbaar voor Scrabble zonder accent-normalisatie en vervoegde vormen. |

**Aanbeveling: geen.** Licentie en inhoud ongeschikt. Zoek vervolgens een vervoegde, accentloze lijst (FreeLing-/Hunspell-es-export) als de opdrachtgever Spaans wil.

### 7. Frans

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `Thecoolsim/French-Scrabble-ODS8` `French ODS dictionary.txt` (2021-10-10) | https://raw.githubusercontent.com/Thecoolsim/French-Scrabble-ODS8/417bd2673e4ba688666301ffc44850939c60aa4b/French%20ODS%20dictionary.txt | **Geen licentie**; ODS is een commercieel product (Larousse), kopie niet toegestaan | 411.430 | 0 | `c3c5580619cd24044fe64675e30d1ae1974a54a8cb071a51dd3952c0e4d3fc6f` | 4.594.138 B | Technisch ideaal (A-Z, hoofdletters, ODS8; Wordfeud gebruikt volgens derden ODS5, dus kleine afwijkingen), juridisch niet. |

**Aanbeveling: geen** vanwege het ontbreken van een licentie. Een vrij alternatief (bijvoorbeeld Lexique/Morphalou, met accenten) is niet onderzocht en vraagt om accent-normalisatie.

### Regelset-id 8-12 (onbevestigd, V9)

Wordfeud biedt volgens de App Store-beschrijving en de helppagina ook Duits, Fins en Portugees. Hoeveel regelsets er in 8-12 echt zijn, en welke taal bij welk id hoort, is niet vastgesteld; dat moet blijken uit `rulesets[].language_code` in een echte respons.

**Duits (id onbekend)**

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `enz/german-wordlist` `words` (2026-09-13) | https://raw.githubusercontent.com/enz/german-wordlist/1071d87d9535b57b80ec076c699f2578a28ee9dc/words | CC0 1.0 (`COPYING`) | 675.569 | 10.260 (475 ongeldig, 9.785 dubbel door hoofdlettergevoeligheid) | `20095928ca70974fb5d86e44f10181cee16e2831b0d4b1a4ddd12c261aebc5e9` | 8.644.058 B | Gemaakt voor Tanglet met Scrabble-achtige regels (geen eigennamen); bron Wordfeud-Duits onbekend; ß-woorden vallen af (aanname: geen ß-tegel). Gemengde hoofdletters, geen ID-garantie voor gelijkheid met Wordfeud. |

**Fins (id onbekend)**

| Kandidaat | URL (vast) | Licentie | Woorden | Afgevallen | SHA-256 | Grootte | Opmerkingen |
|---|---|---|---|---|---|---|---|
| `hugovk/everyfinnishword` `kaikkisanat.txt` (2015-05-23) | https://raw.githubusercontent.com/hugovk/everyfinnishword/d4df6e4efdce54c10197cf151a5cd0638d99860a/kaikkisanat.txt | KOTUS-lijst: LGPL, EUPL 1.1 of CC BY 3.0 (`LICENSE.txt`, `kotus-sanalista_v1/`) | 91.566 | 1.520 (1.519 ongeldig, 1 dubbel) | `8bad281ebb184dbddec9113e7af5e9bf21c05505d10d2484ec523a556a7b5db8` | 1.136.186 B | Alleen grondvormen (93k lemma's), dus ver onder wat Scrabble-Fins (alle verbuigingen) kent; BOM in eerste regel (wordt verwijderd); koppeltekenitems. |
| `akx/fi-words` `words/words.txt` (2022-01-14) | https://raw.githubusercontent.com/akx/fi-words/66a54043c64ee6158794a1d9105878bc1eaf066e/words/words.txt | Mengsel: KOTUS (LGPL/EUPL/CC BY 3.0) plus Joukahainen (GPL 2+); glue-code MIT | 103.895 | 11.015 (10.439 ongeldig, 576 dubbel) | `f7e6e65ba0fa099587c6a7118df728accb62271f4da42d7b3321f52ab4c89855` | 1.378.077 B | GPL-component maakt de licentie lastiger. |

Beide Finse lijsten bevatten geen verbogen vormen en zijn daarom niet bruikbaar voor een zetgenerator; **aanbeveling: geen** (inhoudelijk onvoldoende, niet juridisch).

**Portugees (id onbekend):** geen kandidaat gedownload. Gevonden: een asciified lijst uit WinEdt (gist, LGPL 2.1, zonder ç/accenten en met herkomst WinEdt), en Dicionários Natura (Universidade do Minho; voorwaarden niet vastgesteld). **Aanbeveling: geen.**

Overige id's tot en met 12: geen taal bekend, dus geen onderzoek.

## Overzicht aanbevelingen

| Id | Taal | Aanbeveling | Licentie |
|---|---|---|---|
| 0 | US Engels | `enable1.txt` (benadering van TWL) | ENABLE, publiek domein |
| 1 | Noors | Ondkloss bokmål | CC BY 4.0 |
| 2 | Nederlands | jensanjo/wordfeud-wordlists | Revised BSD en/of CC BY 3.0 (OpenTaal) |
| 3 | Deens | geen (`WL-NONE`) | onduidelijk |
| 4 | Zweeds | mrcz/Wordfeud-Player `ordlista.txt` | CC BY-SA 3.0 |
| 5 | Engels internationaal | geen zonder besluit (SOWPODS-risico of ENABLE) | zie tekst |
| 6 | Spaans | geen | geen licentie |
| 7 | Frans | geen | geen licentie |
| 8-12 | o.a. Duits, Fins, Portugees | Duits: `enz/german-wordlist` mogelijk (CC0); Fins, Portugees: geen | zie tabellen |

## Ter goedkeuring

De opdrachtgever moet bevestigen of kiezen (per regelset; zonder akkoord blijft de tabel leeg en meldt de overlay `WL-NONE`):

1. **Regelset 2 Nederlands:** akkoord met `jensanjo/wordfeud-wordlists` @ `9e8bbff`, bronvermelding OpenTaal. (Sterkste kandidaat.)
2. **Regelset 0:** akkoord met ENABLE als benadering van TWL, of liever `WL-NONE`.
3. **Regelset 1:** akkoord met alleen bokmål (CC BY 4.0), of nynorsk/combinatie, of `WL-NONE`.
4. **Regelset 4:** akkoord met de oude Wordfeud-lijst DSSO (CC BY-SA 3.0, oude editie) of `WL-NONE`.
5. **Regelset 5:** SOWPODS-kopie van `jesstess/Scrabble` gebruiken (juridisch risico), ENABLE, of `WL-NONE`.
6. **Regelsets 3, 6, 7:** geen aanbeveling wegens licentie of inhoud; akkoord met `WL-NONE`, of een eigen aangeleverde bron.
7. **Regelset 8-12 (V9):** welke taal bij welk id hoort moet eerst blijken uit een echte respons; Duits (CC0) is de enige realistische kandidaat.
8. **Alfabetten** voor alle regelsets behalve 2 zijn aannames; bevestig met `tile_points` uit een echte respons voordat afgevallen aantallen en SHA-256's definitief worden ingevuld (de SHA-256 van het bestand zelf verandert hier niet door).
9. **Licentie-eisen:** CC BY 4.0 / CC BY 3.0 / CC BY-SA 3.0 vragen bronvermelding in de README ("Word lists"-sectie); CC BY-SA vraagt dat de lijst onder dezelfde voorwaarden beschikbaar blijft.

De juridische beoordeling hierboven is een lezing van de licentieteksten in de repo's, geen juridisch advies. Lijsten van commerciële woordenboeken (Collins, ODS, RAE, DSL) zijn alleen gemarkeerd, niet beoordeeld.

## Besluit

Datum: 2026-11-01.

- **Regelset 2 (Nederlands): goedgekeurd.** `jensanjo/wordfeud-wordlists` @ `9e8bbff63d7ebd80e2d91b9a33bd69d5d9c2bd06`, `nl/wordlist-nl.txt`, versie 1, UTF-8 (bestand is zuivere ASCII), SHA-256 `414075805ca9b76fba3cbdaab7dd5ff7cbf1f851c3580b06f1001e2fca97b287` (opnieuw berekend na download, komt overeen). Bronvermelding OpenTaal in de README.
- **Regelset 0 (EN-US ENABLE), 1 (Noors), 4 (Zweeds): afgewezen** voor nu.
- **Regelsets 3, 5, 6, 7, 8-12:** geen akkoord/bron; blijven leeg (`WL-NONE`).
