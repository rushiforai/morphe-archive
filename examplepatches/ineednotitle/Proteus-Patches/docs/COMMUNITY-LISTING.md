# Getting Proteus Patches listed in the Morphe ecosystem

> Goal: make `ineednotitle/Proteus-Patches` show up on
> [morphe-patches.software](https://morphe-patches.software/) — the "Morphe
> Community Patches" directory linked from the official
> [morphe.software](https://morphe.software/) site — and in the community
> catalogs that share the same data.

## 1. Status snapshot — checked 2026-11-03

| Catalog | Entries | Proteus listed? |
|---|---|---|
| [morphe-patches.software](https://morphe-patches.software/) (Morphe Community Patches) | 387 bundles | ❌ no |
| [Jman-Github/Patch-Bundle-Registry](https://github.com/Jman-Github/Patch-Bundle-Registry) | 550 sources | ❌ no |
| [nvbangg/awesome-morphe](https://github.com/nvbangg/awesome-morphe) | mirrors the above | ❌ no |
| [rushiforai/morphe-archive](https://github.com/rushiforai/morphe-archive) | auto index | ❌ no |

## 2. Why no crawler ever found this repo (root cause)

Every crawler in this ecosystem discovers bundles the same way: a **GitHub code
search for `filename:patches-bundle.json`**, then a check that the
`download_url` in that file really serves an `.mpp`.
(morphe-archive's crawler is public and does exactly this in
`scripts/discover_github_wide.py`; awesome-morphe and the community patches site
behave the same way — they index repos within days of creation, including
0-star repos.)

Diagnostics run against this repo:

```text
q = filename:patches-bundle.json repo:ineednotitle/Proteus-Patches  -> 0 results
q = filename:patches-list.json   repo:ineednotitle/Proteus-Patches  -> 0 results
q = <any term>                   repo:ineednotitle/Proteus-Patches  -> 0 results

control (all return 1):
    AltF4G0x/consumer-clarity      SysAdminDoc/HushPine
    hoo-dles/morphe-patches        zeldrisho/morphe-patches
    0x0day-0wl/morphe-patches
```

So **not a single file of this repository is in GitHub's code-search index** —
which is why the topic `morphe-patches`, the 10 releases and the valid
`patches-bundle.json` never helped.

Most likely cause: a `.gradle/` **build cache was committed** (15 files, ~1.2 MB),
including a 540 KB `executionHistory.bin` and blobs with 69,000-character lines.
GitHub's code search only indexes small text files (per-file size and line-length
limits) and skips binary/generated content; oversized blobs on the default branch
are the most plausible reason the indexer never ingested this repo.

**Fix shipped in this PR:** `.gradle/` is no longer tracked (it was already in
`.gitignore`, but the files had been added before the rule existed).

### How to verify after merging

```bash
gh api -X GET search/code \
  -f q='filename:patches-bundle.json repo:ineednotitle/Proteus-Patches' \
  --jq .total_count
```

- `1` → the repo is indexed; the crawlers will pick it up on their next run
  (morphe-archive runs nightly, the others roughly hourly/daily).
- Still `0` after 24–48 h → open a ticket with
  [GitHub Support](https://support.github.com/contact) asking why
  `ineednotitle/Proteus-Patches` is not in the code search index, or fall back to
  the manual submissions below (they work regardless of GitHub's index).

## 3. Manual submissions

These are the four catalogs that feed the Morphe ecosystem. Submitting manually
gets you listed even if GitHub's code-search index never recovers — which is why
this is worth doing right away rather than waiting on §2.

> Heads-up: the submissions cannot be automated from CI. A repo-scoped GitHub
> token (and the built-in Actions token) only has **read** access to other
> people's repositories, and fine-grained PATs cannot create forks, so PRs and
> issues elsewhere have to be filed by you — the links below open each form with
> everything already filled in, so it is one click plus **Submit**.

### 3.1 Jman's Patch Bundle Registry — [open prefilled issue][jman]

(Filing an issue is enough; they also accept a PR to `config/sources.json` if you
prefer — the entry to add is shown in the issue body.)

### 3.2 awesome-morphe — [open prefilled issue][awsm]

If the YAML form does not prefill, use
<https://github.com/nvbangg/awesome-morphe/issues/new?template=bundle-request.yml>
and fill in:

- **Action:** Add Bundle
- **Repository URL:** `https://github.com/ineednotitle/Proteus-Patches`
- **Description:** Proteus Patches — a curated Morphe patch bundle: 118 patches,
  24 universal patches, 27 app packages (23 apps). Ad/analytics blocking,
  privacy hardening and misc tweaks for Telegram, MUBI, Meesho, Amazon, Google
  Photos, Pinterest, Reddit, Strava, ChatGPT, Firefox and more.
- Tick both confirmation boxes.

### 3.3 morphe-archive — [open prefilled issue][arch]

(PR would append `ineednotitle/Proteus-Patches` to `custom_repos.txt`; the issue
asks a maintainer to do exactly that.)

### 3.4 morphe-patches.software — contact form

Scroll to the bottom of <https://morphe-patches.software/> and use the
**Name / Email Address / Message** form:

```text
Hi,

please add my Morphe patch bundle to the community patches directory.

Repository: https://github.com/ineednotitle/Proteus-Patches
Bundle:     Proteus Patches (patches-2.0.0.mpp)
Content:    118 patches, 24 universal patches, 27 app packages (23 apps)
Metadata:   https://github.com/ineednotitle/Proteus-Patches/blob/main/patches-bundle.json
Patch list: https://github.com/ineednotitle/Proteus-Patches/blob/main/patches-list.json

The repo has the "morphe-patches" topic and 10 releases, each with a
patches-<version>.mpp asset. Note: GitHub code search currently returns 0
results for this repository, so your crawler most likely never saw it -
adding it manually would be much appreciated.

Thanks!
```

[jman]: https://github.com/Jman-Github/Patch-Bundle-Registry/issues/new?title=Suggest+a+source%3A+ineednotitle%2FProteus-Patches+%28Morphe%29&body=Please+add+this+Morphe+patch+source+to+the+catalog.%0A%0A-+%2A%2ARepository%3A%2A%2A+https%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%0A-+%2A%2AFormat%3A%2A%2A+Morphe+%28%60.mpp%60%29%0A-+%2A%2AIntegrations%3A%2A%2A+not+required%0A-+%2A%2AChannels%3A%2A%2A+stable+releases+from+%60main%60+%28latest+%60v2.0.0%60%29%3B+prereleases+published+occasionally+%28e.g.+%60v1.17.1-projectivy.2%60%29%0A-+%2A%2ABundle+metadata%3A%2A%2A+https%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%2Fblob%2Fmain%2Fpatches-bundle.json%0A-+%2A%2APatch+list%3A%2A%2A+%60patches-list.json%60+is+published+on+the+default+branch+root+%E2%80%94+118+patches%2C+24+universal%2C+27+app+packages+%2F+23+apps%0A-+%2A%2AExample+release+artifact%3A%2A%2A+https%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%2Freleases%2Fdownload%2Fv2.0.0%2Fpatches-2.0.0.mpp%0A-+%2A%2AApps%3A%2A%2A+Telegram+%2F+Telegram+Plus+%2F+Telegram+Web%2C+MUBI%2C+Meesho%2C+Amazon+Shopping%2C+Google+Photos%2C+Pinterest%2C+Reddit%2C+Strava%2C+ChatGPT%2C+Firefox%2C+Microsoft+Excel+%26+Word%2C+Proton+Pass%2C+Proton+VPN%2C+Trakt%2C+Inure%2C+Malwarebytes%2C+Nothing+Widgets%2C+Zomato+District%2C+Claude%2C+Proxyman%2C+Mereframe%2C+IRCTC+Yatri%0A%0AI+tried+to+open+a+PR+against+%60config%2Fsources.json%60+%28as+CONTRIBUTING+suggests%29%2C+but+my+fine-grained+token+cannot+create+forks%2C+so+I%27m+requesting+it+here.+The+entry+would+be%3A%0A%0A%60%60%60json%0A%22proteus%22%3A+%7B%0A++%22patches%22%3A+%22https%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%22%2C%0A++%22integrations%22%3A+false%2C%0A++%22disabled%22%3A+false%0A%7D%0A%60%60%60%0A%0AContext+that+may+matter+for+your+own+discovery%3A+GitHub+code+search+currently+returns+%2A%2A0%2A%2A+results+for+every+file+in+this+repository+%28nothing+is+indexed%29%2C+so+a+code-search-based+crawler+will+not+find+it+on+its+own.+A+%60.gradle%2F%60+build+cache+had+been+committed+by+mistake+%28540+KB+binary+blobs%29%3B+it+is+now+untracked+on+%60main%60%2C+so+indexing+may+recover%2C+but+a+manual+entry+would+be+much+appreciated.%0A&labels=Suggestion
[awsm]: https://github.com/nvbangg/awesome-morphe/issues/new?title=%5BBundle+Request%5D+Add+ineednotitle%2FProteus-Patches&body=%23%23%23+Action%0A%0AAdd+Bundle%0A%0A%23%23%23+Repository+URL%0A%0Ahttps%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%0A%0A%23%23%23+Description%0A%0AProteus+Patches+%E2%80%94+a+curated+Morphe+patch+bundle%3A+%2A%2A118+patches%2A%2A%2C+%2A%2A24+universal+patches%2A%2A%2C+%2A%2A27+app+packages+%2823+apps%29%2A%2A.+Ad%2Fanalytics+blocking%2C+privacy+hardening+and+misc+tweaks+for+Telegram+%2F+Telegram+Plus+%2F+Telegram+Web%2C+MUBI%2C+Meesho%2C+Amazon+Shopping%2C+Google+Photos%2C+Pinterest%2C+Reddit%2C+Strava%2C+ChatGPT%2C+Firefox%2C+Microsoft+Excel+%26+Word%2C+Proton+Pass%2C+Proton+VPN%2C+Trakt%2C+Inure%2C+Malwarebytes%2C+Nothing+Widgets%2C+Zomato+District%2C+Claude%2C+Proxyman%2C+Mereframe+and+IRCTC+Yatri.%0A%0A-+Valid+%60patches-bundle.json%60+on+%60main%60+%28v2.0.0%2C+%60download_url%60+%E2%86%92+%60patches-2.0.0.mpp%60%29%0A-+%60patches-list.json%60+published+on+the+default+branch+root%0A-+10+releases%2C+each+shipping+a+%60patches-%3Cversion%3E.mpp%60+asset%0A-+Topics%3A+%60morphe%60%2C+%60morphe-patches%60%0A%0AHeads-up+for+the+crawler%3A+GitHub+code+search+currently+returns+%2A%2A0%2A%2A+results+for+every+file+in+this+repo+%28nothing+is+indexed%29%2C+which+is+very+likely+why+it+has+never+been+picked+up.+A+%60.gradle%2F%60+build+cache+had+been+committed+by+mistake+%28540+KB+binary+blobs%29%3B+it+has+just+been+untracked+on+%60main%60%2C+so+the+repo+should+become+indexable+again+%E2%80%94+but+a+manual+entry+here+would+still+help.%0A%0A%23%23%23+Confirmation+%28Add+Bundle+only%29%0A%0A-+%5Bx%5D+The+bundle+is+compatible+with+Morphe%0A-+%5Bx%5D+The+repository+contains+a+valid+patches-bundle.json%0A&template=bundle-request.yml&labels=bundle-request
[arch]: https://github.com/rushiforai/morphe-archive/issues/new?title=Add+ineednotitle%2FProteus-Patches&body=Please+add+this+Morphe+patch+source+to+%60custom_repos.txt%60.%0A%0A-+%2A%2ARepository%3A%2A%2A+https%3A%2F%2Fgithub.com%2Fineednotitle%2FProteus-Patches%0A-+%2A%2ABundle%3A%2A%2A+%60patches-2.0.0.mpp%60+%28v2.0.0%2C+latest+stable%29%0A-+%2A%2AContent%3A%2A%2A+118+patches%2C+24+universal+patches%2C+27+app+packages+%2F+23+apps%0A-+%2A%2A%60patches-bundle.json%60%3A%2A%2A+present+on+%60main%60%2C+%60download_url%60+points+at+the+v2.0.0+release+asset%0A%0ASuggested+diff%3A%0A%0A%60%60%60diff%0A+%23+Lines+starting+with+%23+are+ignored.%0A+hxreborn%2Fhxreborn-tiktok-patches%0A%2Bineednotitle%2FProteus-Patches%0A%60%60%60%0A%0AI+tried+to+open+a+PR%2C+but+my+fine-grained+PAT+cannot+create+forks+%E2%80%94+sorry+for+filing+an+issue+instead.%0A%0AUseful+for+%60scripts%2Fdiscover_github_wide.py%60%3A+GitHub+code+search+currently+returns+%2A%2A0%2A%2A+results+for+this+repository+%28no+file+at+all+is+indexed%29%2C+which+is+why+the+%60filename%3Apatches-bundle.json%60+discovery+has+never+surfaced+it.+A+committed+%60.gradle%2F%60+build+cache+%28540+KB+binary+blobs%2C+69k-character+lines%29+was+the+likely+cause+and+has+just+been+untracked+on+%60main%60%2C+so+it+may+start+appearing+after+the+next+indexing+pass.%0A

## 4. Discovery checklist

Done in this PR:

- [x] `patches-bundle.json` on the default branch root, `version` and
      `download_url` synced to the real latest release (**v2.0.0** — it still
      advertised v1.19.0)
- [x] `patches-list.json` `version` field synced to 2.0.0
- [x] `.gradle/` build cache untracked (unblocks GitHub code search)
- [x] README: "Add to Morphe" deep link
      (`https://morphe.software/add-source?github=ineednotitle/Proteus-Patches`)
      and the plain source URL for manual entry
- [x] GitHub topics: `morphe`, `morphe-patches`
- [ ] **You** — set the repo description and topics in
      **Settings → About** (a `chore`/CI token cannot change these):

      ```text
      Description: Proteus Patches — a Morphe patch bundle (.mpp) for Android:
                   removes ads, trackers and annoyances across 23 apps, plus
                   universal patches.

      Topics:      morphe   morphe-patches   android   patches   privacy
      ```

      The current description ("Free yourself from Big tech Corporations ")
      contains no "Morphe", so crawlers that fall back to a keyword search for
      `morphe` (name/description/readme) rank this repo poorly.

Still open / optional:

- [ ] Wait 24–48 h, then re-run the code-search check in §2
- [ ] Optional: add `patches-bundle.png` so Manager and the catalogs show a
      custom icon instead of the GitHub avatar
- [ ] Optional: sign releases (`./gradlew generateSigningKey`, add
      `MORPHE_SIGNING_KEY` to repo secrets) — releases then show as verified and
      `signature_download_url` gets filled in
- [ ] Releases are cut by semantic-release; after the next release, confirm
      `patches-bundle.json` was updated automatically and still points at the
      newest `.mpp`

### ⚠️ Do not do this

Never mark `patches-bundle.json` or `patches-list.json` as
`linguist-generated` / `linguist-vendored` in `.gitattributes`. GitHub's code
search skips generated and vendored files, which would hide the bundle from
every crawler in this ecosystem.
