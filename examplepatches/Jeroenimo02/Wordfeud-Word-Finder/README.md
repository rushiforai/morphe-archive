# Wordfeud Word Finder

Patches for Wordfeud, compatible with Morphe.

[![Add to Morphe](.github/assets/add-to-morphe.svg)](https://morphe.software/add-source?github=jeroenimo02/wordfeud-word-finder)

Add the patch source in Morphe with the badge above, or open
`https://morphe.software/add-source?github=jeroenimo02/wordfeud-word-finder`.

## What it does

- Adds a floating button (FAB) on the game screen.
- The button opens an overlay with your rack and a preview board.
- Lists all legal moves, sortable by score, length or A-Z.
- The Play button sends the chosen move through the Wordfeud API.
- Separate patch **Remove ads**: no banner or full-screen ads and no ad consent popup; the ad SDKs no longer start with the app, Firebase Analytics is off and the advertising ID permissions are removed. Notifications keep working.

Supported app: `com.hbwares.wordfeud.free` **5.7.1** and **5.8.0**. Other versions are experimental; see `docs/UPDATING.md` for checking and adding a new Wordfeud version.

## Patches

<!-- PATCHES_START -->
> **[v1.5.0](https://github.com/Jeroenimo02/Wordfeud-Word-Finder/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Wordfeud&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.hbwares.wordfeud.free`

**🎯 Supported versions:**

| 5.7.1 | 5.8.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads](#remove-ads) | Removes the banner and full-screen ads and skips the ad consent popup. The ad SDKs no longer start with the app, Firebase Analytics is turned off and the advertising ID permissions are removed. Notifications keep working. |  |
| [Word finder overlay](#word-finder-overlay) | Adds a floating button on the game screen that opens a list of all possible moves. |  |

</details>

<!-- PATCHES_END -->

## Word lists

The word finder needs a word list per ruleset. The lists live in this repository (`wordlists/`, built from open
sources by `tools/wordlists/build.py`). A list is downloaded in the background from this repository, pinned to the
commit the patch was built from, as soon as a game in that ruleset is seen (opening the overlay retries a failed
download), and verified against a SHA-256 before use.

| Ruleset id | Language | Source | License of the list |
|---|---|---|---|
| 0 | English (US) | ENABLE ([dolph/dictionary](https://github.com/dolph/dictionary)) + [Wordnik open word list](https://github.com/wordnik/wordlist): about 95% of NWL | Public domain + MIT (Copyright (c) 2020 Wordnik) |
| 5 | English (international) | ENABLE + Wordnik + [Letterpress](https://github.com/lorenbrichter/Words) `en.txt`: about 98% of Collins Scrabble Words | Public domain + MIT + CC0 (as published) |
| 1 | Norwegian (bokmål) | Norsk ordbank (Språkbanken / Språkrådet), via [Ondkloss/norwegian-wordlist](https://github.com/Ondkloss/norwegian-wordlist) | CC BY 4.0 |
| 2 | Dutch | [OpenTaal](https://www.opentaal.org/), via [jensanjo/wordfeud-wordlists](https://github.com/jensanjo/wordfeud-wordlists) | Revised BSD and/or CC BY 3.0 |
| 4 | Swedish | Den stora svenska ordlistan (Göran Andersson), via [mrcz/Wordfeud-Player](https://github.com/mrcz/Wordfeud-Player) | CC BY-SA 3.0 |
| 9 | German | [enz/german-wordlist](https://github.com/enz/german-wordlist) | CC0 1.0 |
| 10 | Norwegian (nynorsk) | Norsk ordbank (Språkbanken / Språkrådet), via [Ondkloss/norwegian-wordlist](https://github.com/Ondkloss/norwegian-wordlist) | CC BY 4.0 |
| 3 | Danish | [COR₁ 1.5.1.0](https://ordregister.dk/) (Det Centrale Ordregister, Dansk Sprognævn), the register behind Retskrivningsordbogen 5.1 | Free for any use (CC0 1.0) |
| 7 | French | [Grammalecte](https://grammalecte.net/) lexicon of inflected forms v7.7 | MPL 2.0 |
| 6 | Spanish | [lorenbrichter/Words](https://github.com/lorenbrichter/Words) `es.txt` (the Letterpress list; its content matches the FISE-2 Scrabble lexicon). CH, LL and RR are read as Wordfeud's digraph tiles | CC0 1.0 as published |
| 8 | Swedish (strict) | [hising/svenska-ord.txt](https://github.com/hising/svenska-ord.txt): about 120,000 SAOL headwords, base forms only | Unlicense as published |
| 11 | Finnish | [fginter/hunspell-fi](https://github.com/fginter/hunspell-fi) (TurkuNLP), via mhavo/suomen-kieliavut, all forms generated from the Hunspell dictionary | CC0 1.0 |
| 12 | Portuguese | [jfoclpf/words-pt](https://github.com/jfoclpf/words-pt) (European Portuguese, Natura lists of Universidade do Minho) | GPL-3.0 |

Every Wordfeud ruleset (0-12) has a list. Words are at most 15 tiles long. Only the lists of rulesets you actually
have games in are downloaded. The derived lists keep the license of their source; see `wordlists/README.md`.

## Error codes

Every message shows a short text and a code.

| Code | Meaning |
|---|---|
| `WL-NET` | Word list: no connection or timeout |
| `WL-HTTP-<status>` | Word list: HTTP error |
| `WL-HASH` | Word list: checksum does not match |
| `WL-DISK` | Word list: saving failed |
| `WL-NONE` | No word list available for this ruleset |
| `GS-EVENT-<type>` | Unknown event type in the game |
| `GS-DATA` | Game data missing or unreadable |
| `MV-SESSION` | No valid session found |
| `MV-NET` | Move: connection failed, outcome unknown |
| `MV-SERVER-<type>` | Move: the server reported an error |
| `MV-SERVER-http_<status>` | Move: non-2xx reply that could not be parsed |

## Risks

- Using this patch may conflict with Wordfeud's terms of service. Possible consequences include a warning or a suspended account. You use it at your own risk.
- Moves are sent outside the app's own UI, straight to the API, using your Wordfeud session cookie. The cookie never leaves the device except to `api.wordfeud.com`.
- Network access is limited to `api.wordfeud.com`, the word lists in this repository and, when a release has a report address, the word report worker. Once a day the patch sends an anonymous ping (patch version and the languages of your games, nothing else) so the maintainer can count active users.
- **Word reports:** when the Wordfeud server rejects a word that is in our list, or when a word played in one of your games (by you or your opponent, so accepted by the server) is missing from our list, the patch sends that word to the project's report worker (`tools/report-worker`) once, in the background: only the report type (remove/add), the ruleset number, the words and the patch version, no user name, game, cookie or device id. The maintainer reviews the reported words before the list changes for everyone.

## Status and limitations

- Requires Android 7.0 (API 24) or newer.
- Verified on a device with Wordfeud 5.7.1 and 5.8.0: moves, blanks, cross words, the seven-tile bonus, refresh after a move, light and dark themes, word rejections by the server, and games in all languages (including the Spanish CH, LL and RR tiles).
- Word lists exist for every Wordfeud language (rulesets 0-12). They come from open sources and approximate Wordfeud's own lists, so the server sometimes rejects a suggested word or accepts one that is not suggested. Rejected words and words played in your games that are missing from the list are reported (see above), reviewed by the maintainer and fixed in a following release.
- Assumptions not confirmed by Wordfeud: Swedish strict (ruleset 8) allows base forms only; Portuguese (ruleset 12) is European Portuguese.

## Translations

Non-English UI texts were translated by the author. Improvements are welcome.

## Trademark

Wordfeud is a trademark of Bertheussen IT. This project is not affiliated with or endorsed by Bertheussen IT.

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE). See [docs/DEV.md](docs/DEV.md) for development notes and
[the design spec](docs/superpowers/specs/2026-11-01-wordfeud-word-finder-design.md).
