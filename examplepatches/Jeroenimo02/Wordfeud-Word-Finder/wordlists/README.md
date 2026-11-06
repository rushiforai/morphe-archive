# Woordenlijsten

Per taal een opgeschoonde woordenlijst die de patch downloadt. Alle lijsten komen uit openbare bronnen
(zie `sources.json` voor bron, licentie en bronvermelding per taal).

| Map | Regelsets | Bron | Licentie van de lijst |
|---|---|---|---|
| `en-us` | 0 (Engels VS) | ENABLE (dolph/dictionary) + Wordnik open word list; ~95% van NWL | Publiek domein + MIT (Copyright (c) 2020 Wordnik) |
| `en-intl` | 5 (Engels internationaal) | ENABLE + Wordnik + Letterpress `en.txt`; ~98% van Collins | Publiek domein + MIT + CC0 zoals gepubliceerd |
| `nb` | 1 (Noors bokmål) | Norsk ordbank, Språkbanken / Språkrådet, via Ondkloss/norwegian-wordlist | CC BY 4.0 |
| `nl` | 2 (Nederlands) | OpenTaal, via jensanjo/wordfeud-wordlists | BSD en/of CC BY 3.0 |
| `sv` | 4 (Zweeds) | Den stora svenska ordlistan (Göran Andersson), via mrcz/Wordfeud-Player | CC BY-SA 3.0 |
| `de` | 9 (Duits) | enz/german-wordlist | CC0 1.0 |
| `nn` | 10 (Noors nynorsk) | Norsk ordbank, Språkbanken / Språkrådet, via Ondkloss/norwegian-wordlist | CC BY 4.0 |
| `da` | 3 (Deens) | COR₁ 1.5.1.0 (Det Centrale Ordregister, Dansk Sprognævn; = Retskrivningsordbogen 5.1), vormen met status N en K | Vrij voor elk gebruik (CC0 1.0) |
| `fr` | 7 (Frans) | Lexique des formes fléchies du français, Grammalecte v7.7 | MPL 2.0 |

| `es` | 6 (Spaans) | lorenbrichter/Words `es.txt` (Letterpress; inhoud = FISE-2-lexicon). CH, LL en RR telt als één tegel | CC0 1.0 zoals gepubliceerd |
| `sv-strict` | 8 (Zweeds strikt) | hising/svenska-ord.txt, ~120.000 SAOL-grondvormen | Unlicense zoals gepubliceerd |
| `fi` | 11 (Fins) | fginter/hunspell-fi (TurkuNLP) via mhavo/suomen-kieliavut; alle vormen uit het Hunspell-woordenboek gegenereerd (`tools/wordlists/hunspell.py`) | CC0 1.0 |
| `pt` | 12 (Portugees) | jfoclpf/words-pt (Europees-Portugees, Natura-lijsten Universidade do Minho) | GPL-3.0 |

Woorden zijn 2 tot 15 tegels lang (bij Spaans telt een dubbelletter-tegel als één).

De afgeleide lijst in elke map valt onder dezelfde licentie als de bron (bij CC BY-SA ook "share alike").
De licentie van de code van dit project (GPLv3) geldt niet voor deze gegevensbestanden.

## Bestanden per taal

- `words.txt.gz`: de lijst die de patch downloadt. Gegenereerd, niet met de hand aanpassen.
- `remove.txt`: woorden die uit de bron gehaald worden (bijvoorbeeld omdat Wordfeud ze weigert).
- `add.txt`: woorden die aan de bron toegevoegd worden.

`manifest.json` (gegenereerd) bevat per lijst de SHA-256, het aantal woorden en een versienummer. De patch
controleert de download met die SHA-256; een hogere versie laat geïnstalleerde patches de lijst opnieuw downloaden.

## Opnieuw bouwen

```sh
python3 tools/wordlists/build.py            # alles
python3 tools/wordlists/build.py --only nl  # één taal
python3 tools/wordlists/build.py --check    # controleren of alles up-to-date is (CI)
```

Het script haalt de bronnen op (vaste commit-URL's met SHA-256-controle) en past de normalisatie toe: hoofdletters,
letters buiten het Wordfeud-alfabet worden teruggebracht tot hun basisletter (é → E) of de regel valt af,
woorden van 2 tot 15 letters, geen dubbelen, gesorteerd.
