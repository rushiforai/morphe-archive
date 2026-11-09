# Word lists

One cleaned-up word list per language, downloaded by the patch. All lists come from open sources (see
`sources.json` for the source, licence and attribution of each language).

| Folder | Rulesets | Source | Licence of the list |
|---|---|---|---|
| `en-us` | 0 (English, US) | ENABLE (dolph/dictionary) + Wordnik open word list; about 95% of NWL | Public domain + MIT (Copyright (c) 2020 Wordnik) |
| `nb` | 1 (Norwegian bokmål) | Norsk ordbank, Språkbanken / Språkrådet, via Ondkloss/norwegian-wordlist | CC BY 4.0 |
| `nl` | 2 (Dutch) | OpenTaal, via jensanjo/wordfeud-wordlists | BSD and/or CC BY 3.0 |
| `da` | 3 (Danish) | COR₁ 1.5.1.0 (Det Centrale Ordregister, Dansk Sprognævn; = Retskrivningsordbogen 5.1), forms with status N and K | Free for any use (CC0 1.0) |
| `sv` | 4 (Swedish) | Den stora svenska ordlistan (Göran Andersson), via mrcz/Wordfeud-Player | CC BY-SA 3.0 |
| `en-intl` | 5 (English, international) | ENABLE + Wordnik + Letterpress `en.txt`; about 98% of Collins | Public domain + MIT + CC0 as published |
| `es` | 6 (Spanish) | lorenbrichter/Words `es.txt` (Letterpress; content = the FISE-2 lexicon). CH, LL and RR count as one tile | CC0 1.0 as published |
| `fr` | 7 (French) | Lexique des formes fléchies du français, Grammalecte v7.7 (without symbols, units and short abbreviations) | MPL 2.0 |
| `sv-strict` | 8 (Swedish strict) | hising/svenska-ord.txt, about 120,000 SAOL base forms | Unlicense as published |
| `de` | 9 (German) | enz/german-wordlist | CC0 1.0 |
| `nn` | 10 (Norwegian nynorsk) | Norsk ordbank, Språkbanken / Språkrådet, via Ondkloss/norwegian-wordlist | CC BY 4.0 |
| `fi` | 11 (Finnish) | fginter/hunspell-fi (TurkuNLP) via mhavo/suomen-kieliavut; all forms generated from the Hunspell dictionary (`tools/wordlists/hunspell.py`) | CC0 1.0 |
| `pt` | 12 (Portuguese) | jfoclpf/words-pt (European Portuguese, Natura lists of Universidade do Minho) | GPL-3.0 |

Words are 2 to 15 tiles long (in Spanish a digraph tile counts as one).

The derived list in each folder has the same licence as its source (for CC BY-SA also "share alike"). The licence
of this project's code (GPLv3) does not apply to these data files.

## Files per language

- `words.txt.gz`: the list the patch downloads. Generated; do not edit by hand.
- `remove.txt`: words taken out of the source (for example because the Wordfeud server rejects them).
- `add.txt`: words added to the source (for example words played in a game that the source lacks).

Both are filled automatically by the word reports from the patch (see `tools/report-worker/README.md`), on a
`wordlist/<folder>` branch with one pull request per language.

`manifest.json` (generated) holds the SHA-256, word count and version of each list. The patch checks the download
against that SHA-256; a higher version makes installed patches download the list again.

## Rebuilding

```sh
python3 tools/wordlists/build.py            # everything
python3 tools/wordlists/build.py --only nl  # one language
python3 tools/wordlists/build.py --check    # check that everything is up to date (CI)
```

The script downloads the sources (pinned URLs with a SHA-256 check) and normalises them: upper case, letters outside
the Wordfeud alphabet are reduced to their base letter (é → E) or the word is dropped, 2 to 15 tiles, no duplicates,
sorted.
