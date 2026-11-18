# Updating this fork — checklist

Everything below assumes the repo is at `C:\Users\itzde\piko-view-history\piko`.
If it is somewhere else, `cd` there first.

Tools you need (already installed on this PC): **Git** and **GitHub CLI (`gh`)**, logged in as
`Dekum69`. Check with `gh auth status`.

---

## When does anything need doing?

| Situation | What you do |
|---|---|
| **piko released a new version** (check https://github.com/crimera/piko/releases) | Scenario 1 — usually just merge the auto-opened PR |
| **Instagram released a new version** | Scenario 2 (usually nothing) |
| Both | Scenario 1, then Scenario 2 |
| Nothing changed, you just want a fresh `.mpp` | Scenario 3 |

---

## Scenario 1 — piko released an update

### Fast path (no terminal) — use the automatic sync PR

A GitHub Action called **Sync upstream** runs every day at 06:00 UTC. If piko has new commits it
merges them into a branch and opens a pull request. All you do is:

1. Open https://github.com/Dekum69/piko-view-history/pulls (or the GitHub app / Copilot chat).
2. Open the PR titled `chore: merge upstream piko (…)`.
3. Wait for the **Build patches** check on the PR to go green.
4. Click **Merge pull request**.
5. Download the new `.mpp` from the run that starts on `main` afterwards (steps 4–8 below).

If no PR appeared but you know piko released, open
https://github.com/Dekum69/piko-view-history/actions → **Sync upstream** → **Run workflow**.

If that workflow fails with "Upstream changes conflict with the view-history commits", the merge
needs a human — do the manual path below. Conflicts are always in the view-history files.

### Manual path (terminal)

Five commands, then a download.

```powershell
cd C:\Users\itzde\piko-view-history\piko
git fetch upstream
git switch main
git rebase upstream/main
git push
```

What happens:

1. `git fetch upstream` downloads piko's new commits (does not touch your files).
2. `git rebase upstream/main` replays your two/three commits on top of piko's new code.
3. `git push` uploads it, which **automatically starts the Build patches workflow**.

Then:

4. Open https://github.com/Dekum69/piko-view-history/actions
5. Wait ~3 minutes for the green tick on the newest run.
6. Click the run → scroll to **Artifacts** → download **`piko-patches-view-history`**.
7. Unzip it - inside is `patches-<version>.mpp` (name follows `gradle.properties`).
8. Import that `.mpp` in Morphe Manager, patch your APK, install.

### If the rebase stops with a conflict

Git prints `CONFLICT (content): Merge conflict in <file>`. Conflicts can only be in the
view-history files, never anywhere else.

```powershell
git status                       # lists the conflicted files
# open each one, look for <<<<<<< ======= >>>>>>> and keep BOTH sides:
#   piko's new code around our lines, our lines where they belong
git add <the files you fixed>
git rebase --continue
```

If it gets messy and you want to start over:

```powershell
git rebase --abort               # back to exactly how it was before
```

Nothing is lost by aborting — the rebase is not pushed until you `git push`.

### If `git push` is rejected

```powershell
git pull --rebase
git push --force-with-lease
```

`--force-with-lease` is safe: it refuses to overwrite if someone else pushed in the meantime.

---

## Scenario 2 — Instagram released an update

Usually **nothing to do**. Patch the new APK with the same `.mpp` you already have.

Only if Morphe Manager fails with a message like:

```
Feed view history: viewed_impression not found
Reels view history: clips item lookup not found
Stories view history: ReelItem media field not found
```

…does a patch need fixing. That message tells you exactly which file to edit:

| Error contains | File to edit |
|---|---|
| `viewed_impression` | `patches/src/main/kotlin/app/crimera/patches/instagram/misc/history/FeedViewHistoryPatch.kt` |
| `clips item lookup` | `.../misc/history/ReelsViewHistoryPatch.kt` |
| `ReelItem media field` | `.../misc/history/StoriesViewHistoryPatch.kt` |

How to fix:

1. Open the new Instagram APK in **MT Manager** (or jadx on PC) and search the dex for the
   trace string that patch uses — `viewed_impression`,
   `ClipsViewerViewPagerListener.onPageSelected`, or `ReelViewerFragment.onCurrentActiveItemBound`.
2. Open that method and note its **return type** and **parameter types**.
3. Update the `Fingerprint(...)` at the top of the file:

```kotlin
private object FeedViewedImpressionFingerprint : Fingerprint(
    returnType = "V",                                             // <-- from step 2
    parameters = listOf("Ljava/lang/Object;", "J", "Ljava/lang/Object;"),  // <-- from step 2
    strings = listOf("viewed_impression", "instagram_organic_viewed_impression"),
)
```

4. Save, then Scenario 3 to rebuild.

The `execute { ... }` block underneath the fingerprint normally needs no change — it locates the
casts and fields itself.

> Never rename `GetPostTypeExtensionFingerprint` back to `getPostType`. It must stay
> `getPostTypeKey` (the method with the `"A7Q"` literal), otherwise Reels stop being detected.

---

## Scenario 3 — just rebuild without changing anything

```powershell
cd C:\Users\itzde\piko-view-history\piko
git push
```

Or trigger it by hand: https://github.com/Dekum69/piko-view-history/actions →
**Build patches** → **Run workflow**.

Then download the artifact as in Scenario 1, steps 4–8.

---

## Using GitHub Copilot instead of a terminal

Copilot can do the git work, but it needs the right entry point:

| Where | Can it do this? | Notes |
|---|---|---|
| **GitHub.com → Copilot Chat → "Coding agent"** | Yes, fully in the cloud | Assign it an issue/PR; it has its own sandbox, so it can rebase, push and open PRs. It cannot build the `.mpp` locally — CI does that. |
| **VS Code → Copilot Chat → Agent mode** | Yes, on this PC | It runs terminal commands, so the manual commands above work. Approve the commands it asks for. |
| **Copilot Chat on github.com (plain ask)** | No | It can only read and suggest, it cannot push. |

A prompt that works well (paste into Copilot agent mode with the repo open):

> The upstream piko repo has new commits. Update this fork: fetch upstream, rebase `main` onto
> `upstream/main`, resolve any conflicts in the view-history files by keeping both sides, push to
> `main`, and then tell me when the Build patches workflow is green so I can download the artifact.
> Do not change anything outside the history-related files.

For the coding agent, file an issue with that text and assign Copilot — it will open a PR you merge.

Copilot is a convenience, not a requirement: the daily **Sync upstream** PR already covers the
common case, and nothing breaks if you never use Copilot.

---

## Applying the `.mpp` (same every time)

1. Morphe Manager **1.33.0-dev.1 or newer**.
2. Select the Instagram APK/APKM.
3. Import the `.mpp`, keep **View history** enabled.
4. Patch → install. If installing over an existing patched build fails, uninstall it first
   (the signature differs from the Play Store copy anyway).

---

## Useful facts

- **Where the feature lives:** 9 new files + 11 edited ones. `git show --stat a1caaf61` lists them.
- **Export the feature as a patch:** `git format-patch upstream/main..HEAD --stdout > view-history.patch`
- **Restore on a clean piko checkout:** `git clone https://github.com/crimera/piko.git && cd piko && git am <path>\view-history.patch`
- **See what you changed vs piko:** `git log --oneline upstream/main..HEAD` and `git diff upstream/main..HEAD --stat`
- **Undo the last commit (keep files):** `git reset --soft HEAD~1`
- **Discard everything local and match GitHub:** `git fetch origin && git reset --hard origin/main`
- **Version in the `.mpp` name:** `gradle.properties` → `version = 3.11.1`. It always matches the
  piko release this fork is based on, so bump it only if you deliberately skip an upstream version.
- **Docs:** `VIEW_HISTORY.md` (what the feature does), `MAINTENANCE.md` (this file).
