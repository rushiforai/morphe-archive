# Prompt: Turn `channel-blacklist-patch` into a Git Repo, Document It, and Push to GitHub

The patch code itself is already written. This prompt covers only what's left:
initializing the git repo, writing the README, and publishing it to GitHub as a
Morphe patch source.

---

## 1. Context

**Morphe** is an open-source Android app patcher (continuation of ReVanced) for
YouTube, YouTube Music, and Reddit. Reference links to use in the README:

- Morphe org (all repos): **https://github.com/MorpheApp**
- Official patches (structure/README style to mirror): https://github.com/MorpheApp/morphe-patches
- Patcher library this patch depends on: https://github.com/MorpheApp/morphe-patcher
- Manager app (Android, has Expert Mode): https://github.com/MorpheApp/morphe-manager
- Desktop app (Windows/Mac/Linux): https://github.com/MorpheApp/morphe-desktop
- Docs: https://github.com/MorpheApp/morphe-documentation
- Website: https://morphe.software

**Licensing note:** Morphe's patches/patcher are GPL-3.0 with a Section 7c name
restriction — derivative works can't use "Morphe" in their own name.
`channel-blacklist-patch` already complies. License this repo GPL-3.0 to stay
compatible with the `morphe-patcher` dependency.

---

## 2. Task 1 — Initialize the git repo

In the existing project directory containing the finished patch code:

```bash
cd channel-blacklist-patch
git init -b main
git add .
git commit -m "Initial commit: channel-blacklist-patch"
```

If a `.gitignore` isn't already present, add one covering standard Gradle/Android
build output (`build/`, `.gradle/`, `local.properties`, `*.iml`, `.idea/`) before
the first commit.

---

## 3. Task 2 — Write `README.md`

Include, in this order:

1. **Title + one-line description** of what the patch does.
2. **⚠️ Disclaimer** (near the top, impossible to miss):
   > This patch was generated with AI assistance. It may be incomplete, unstable,
   > or break on future app versions. **Use at your own risk.** Always keep a
   > backup of your original APK. Not affiliated with, endorsed by, or supported
   > by the Morphe or ReVanced teams, and modifying an app may violate that app's
   > Terms of Service — use responsibly and for personal use.
3. **Features** — bullet list describing what the channel blacklist patch actually
   does (which feeds/surfaces it filters, how the blacklist is configured, that
   it can be toggled on/off).
4. **Compatibility table** — target app, package name, tested app version(s).
5. **Installation** — the step-by-step from Section 4 below, reproduced in full.
6. **Building from source** — clone, `local.properties` SDK path, any
   `morphe-patcher` credentials needed, `./gradlew build`.
7. **License** — GPL-3.0, link to `LICENSE`, note the "no Morphe name" restriction
   inherited from upstream.
8. Repeat the risk disclaimer briefly at the bottom.

---

## 4. README step-by-step: adding this patch source to Morphe and applying it in Expert Mode

Write this exactly (adapt only the release-asset filename/URL once a release exists):

### Morphe Manager (Android)

1. Install Morphe Manager from **https://morphe.software** (or
   https://github.com/MorpheApp/morphe-manager releases).
2. Open Morphe Manager → **Patches / Repositories** → **Add source**.
3. Enter this repo's URL: `https://github.com/<your-username>/channel-blacklist-patch`
   (or the raw `patches-bundle.json` link from the latest GitHub release).
4. Leave the official `MorpheApp/morphe-patches` source enabled — do **not** remove
   it; multiple patch sources can be active at once.
5. Select the target app (e.g. YouTube) → switch from **Simple mode** to
   **Expert mode** (full control over individual patch selection).
6. In the Expert Mode patch list you'll now see patches from **both** sources.
   Enable the official Morphe patches you normally use, plus **Channel Blacklist**
   from this repo, then open its options and set your blacklisted channel
   names/IDs.
7. Provide the original APK when prompted, tap **Patch**, then install the result.

### Morphe Desktop

1. Download the latest `morphe-desktop-*-all.jar` from
   https://github.com/MorpheApp/morphe-desktop/releases.
2. Download the official patches bundle (`.rvp`/`.mpp`) from
   `MorpheApp/morphe-patches` **and** this repo's release bundle.
3. GUI: launch the jar, switch out of Quick mode into the **Expert** patching
   screen, load both patch bundles, select the official patches you want plus
   **Channel Blacklist**, configure its options, choose your APK, and patch.
4. CLI equivalent (pass both bundles):
   ```
   java -jar morphe-desktop-*-all.jar patch \
     -p morphe-patches-*.mpp \
     -p channel-blacklist-patch-*.mpp \
     your_app.apk
   ```

---

## 5. Task 3 — Push to GitHub

```bash
# Create the remote repo and push in one step (requires GitHub CLI, gh auth login):
gh repo create channel-blacklist-patch --public --source=. --remote=origin --push

# — or, if the GitHub repo already exists —
git remote add origin https://github.com/<your-username>/channel-blacklist-patch.git
git push -u origin main
```

After pushing, cut a GitHub Release so a release workflow (or manual upload)
produces the `patches-bundle.json` / `.rvp`/`.mpp` file that Morphe Manager/Desktop
actually consume as a patch source — a bare repo with no release won't show up as
usable patches in either app.
