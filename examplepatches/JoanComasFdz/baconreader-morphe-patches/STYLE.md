<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Style

How patches are written. Shared by the Reseam and Morphe BaconReader repos, word for word (see [AGENTS.md](AGENTS.md), "Shared and patcher-specific files"). The patcher's API, the layout, the extension language, settings and formatting are in [patcher-specific-code.md](patcher-specific-code.md). When a patcher's code and these files disagree, its code wins; update the docs.

## Patches

- **Name:** what users see, in sentence case: "Fix Redgifs API", "Show tables". Same name in both repos.
- **Description:** one sentence about what the user gets, not how: "Makes Redgifs videos play again."
- **Comment above the patch:** why it exists. This is the place for how BaconReader breaks.
- **Compatibility:** BaconReader and BaconReader Premium, both pinned to 6.1.4, BaconReader's last release, from the repo's shared constants.
- **Fixes have no setting.** A patch that restores broken behavior always runs. A patch that changes how the app looks or behaves gets a toggle.
- **IDs and keys are permanent.** Users' saved options and settings are stored under a patch's ID and a setting's key. Don't rename either after a release.

## Targets

- BaconReader isn't obfuscated: match a method by its class and name. Add strings, return types, parameters or calls only when the name alone is ambiguous.
- A target matches exactly one method. Add a constraint rather than taking the first match.
- Give each target a name that says what it is (`tokenRequest`, not `target1`).
- Prefer the patcher's high-level edits (replace a string, return a constant, redirect a call) over raw bytecode. When ReVanced removes or rewrites instructions, look for the call to redirect instead.

## Options and settings

- Options are for values chosen once, before patching, such as a client ID. Settings are for anything users may change later.
- An option with a default can't be unset. If an empty value should skip a change, say so in its description and check for a blank value.
- A setting keeps ReVanced's meaning and default. Where the patcher's settings can't show a ReVanced preference, say so under "Differences from ReVanced" in [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md).

## Extensions

- **Values from the app may be null.** Check them before use.
- **App classes:** a library BaconReader bundles (okhttp 4.10.0, Glide 4.14.2, ExoPlayer…) is compiled against at the version BaconReader bundles; BaconReader's own classes are stubbed. Either way, check that every method called exists in the app: it's minified, so unused library methods may be missing.
- **Only public app classes and members,** or protected and inherited. Extension code lives outside BaconReader's packages, so Android throws `IllegalAccessError` at run time; a stub compiles whatever it declares. Make the member public at patch time or use reflection.
- **HTTP:** disconnect every `HttpURLConnection` in a `finally` block. Only set a fixed-length body when sending one.
- **Logging:** `android.util.Log` with a `TAG` constant.
- **Screens:** show a feature inside one of the app's screens where it fits (Reddit chat over the main screen's post list): views added to the app's layout, and the activity's lifecycle, back, menu and result methods hooked.
- **No code without a user.** Before porting a branch from ReVanced's shared code, check that BaconReader reaches it: grep the app for the endpoint, string or call. Leave out what it never uses, and say so in [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md).

## Porting from ReVanced

- Port from the newest ReVanced source that works, and name its branch and commit in [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md).
- Keep ReVanced's "why" comments, reworded to stand on their own. Drop comments that narrate.
- **Credit:** a file ported from ReVanced starts with these lines; a new file leaves out the ReVanced one. No "Ported from" comments.

  ```kotlin
  // SPDX-FileCopyrightText: 2026 ReVanced contributors
  // SPDX-FileCopyrightText: 2026 JoanComasFdz
  // SPDX-License-Identifier: GPL-3.0-only
  ```

- **Behavior differences:** any change in behavior goes under "Differences from ReVanced" in [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md): what ReVanced does, what the port does, and why.

## Comments

- Code says what it does. A comment says why, only when the code can't show it: an app quirk, a server rule, an invariant.
- No section headers, no narration, no restating the code.
- State facts you checked. "Reddit stopped accepting BaconReader's client" is checked. "Reddit revoked it when free API access ended" is a guess.

## Licensing

- This repo's own files are GPL-3.0-only. Files from the patcher's template and the Gradle wrapper keep their licenses; `REUSE.toml` says which file is which.
- Every source file has SPDX headers.

## Commits

- One line, conventional, lowercase: `feat(baconreader): add Show tables, which draws Reddit tables as a grid`, `fix(baconreader): …`, `chore: …`, `docs: …`. What each type releases: [patcher-specific-release.md](patcher-specific-release.md).
- One commit per patch. Shared setup goes in its own commit before the patches that use it.
- Every commit builds on its own and its patches apply (see [AGENTS.md](AGENTS.md)).

## Pull requests

Follow the layout of the BaconReader MRs on ReVanced:

1. An intro: what the PR adds, and that each patch is its own commit.
2. **Bug fixes** and **New features**: a `###` per patch with short bullets about what the user gets.
3. **Porting from ReVanced**: the source commit and the differences.
4. **Compatibility**, **License** and **Testing**, written in the first person. Testing says what was checked on a phone and what only statically.
5. **AI disclosure**.
