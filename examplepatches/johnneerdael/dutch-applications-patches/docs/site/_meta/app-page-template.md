# App-page template

Every page in `docs/site/{nl,en}/apps/` except `index.md` and `research.md` uses
this layout. The approved reference is the Trouw page. CI runs
`scripts/check_docs_app_pages.py` and fails the documentation build when a page
drifts from it.

## Rules

- The metadata line, package, download button, Manager hint, headings, table
  header and closing link paragraphs are fixed text. Copy them exactly.
- Version, build and input type come from `patches-list.json` (APKS, APKM or
  APK). The version and build must be a target of the stable bundle in the
  checkout, or of the latest prerelease bundle.
- The download button links the app's own file in the
  [Buzzheavier folder](https://buzzheavier.com/gnmtadlpn31g). Add the same link
  to the app's row in `guides/downloads.md` in both languages.
  When no original download is published, use the local-input button instead:
  `[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }`
  (Dutch: `[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }`).
  Match the declared input type and add a row linking `#local-original-inputs`
  to both downloads guides. Never invent a download URL.
- The first paragraph under the controls heading lists exactly the control names
  for that app in the metadata, comma separated, ending with a full stop. Use
  the names as Morphe Manager shows them.
- Use exactly four sections in this order. Do not add `###` subsections, bullet
  lists, numbered lists, admonitions or bold status lines. Put warnings in the
  introduction or in the remaining section as prose.
- When the target is only in a prerelease bundle, end the metadata line with
  ` · **Channel:** Pre-release` (Dutch: ` · **Kanaal:** Pre-release`) and add
  `· **Pre-release**` to the app's downloads row. Remove both, and any
  pre-release wording in the header and introduction, once the target is in the
  stable bundle. CI fails in both directions, and a pull request into main
  treats its own `patches-list.json` as the next stable bundle.
- Defaults, dependencies and expert options go in prose paragraphs between the
  control list and the closing link paragraph.
- Pin evidence links to a reviewed commit and end the evidence section with the
  methodology link.

## English

```markdown
# <App name>

**Supported app:** <version> · **Build:** <build> · **Input:** <APKS|APKM|APK>[ · **Channel:** Pre-release]

`<package.name>`

[Download the original <APKS|APKM|APK>](https://buzzheavier.com/<file-id>){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

<One or two paragraphs: what the app does with your activity, and any status
such as pre-release only.>

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| <service or activity> | <finding> | <effect of the patch> |

## What remains and what is still unknown

<Services that keep working, data they still receive, open questions, required
original files and minimum Android version.>

## Available controls

<Control A>, <Control B>, <Control C>.

<Optional: defaults, dependencies, expert options.>

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed <date> against <commit>: [technical audit](<pinned link>) and <other pinned links>. <What the evidence does and does not establish.> [How to read the evidence](../reference/methodology.md).
```

## Nederlands

```markdown
# <Appnaam>

**Ondersteunde app:** <versie> · **Build:** <build> · **Invoer:** <APKS|APKM|APK>[ · **Kanaal:** Pre-release]

`<package.name>`

[Download de originele <APKS|APKM|APK>](https://buzzheavier.com/<bestand-id>){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

<Een of twee alinea's.>

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| <dienst of activiteit> | <bevinding> | <effect van de patch> |

## Wat blijft bestaan en wat weten we nog niet?

<Tekst.>

## Beschikbare opties

<Optie A>, <Optie B>, <Optie C>.

<Optioneel: standaardinstellingen, afhankelijkheden, expertopties.>

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op <datum> tegen <commit>: [technisch onderzoek](<vastgepinde link>). <Wat het bewijs wel en niet aantoont.> [Zo lees je het bewijs](../reference/methodology.md).
```
