# Publication and version targeting

Release instructions for `johnneerdael/dutch-applications-patches`, updated on 2026-10-27. Earlier publication and community-index observations below are historical.

## Two different versions

The **patch bundle version** is independent of each supported application's version. The bundle now covers Buienalarm, Buienradar, Weeronline, Weerplaza, NU.nl and de Volkskrant. Current versions and device-verification status are listed in the [README](../README.md); the generated patch list carries the exact per-app compatibility metadata.

Each app has its own `Compatibility` declaration under `patches/src/main/kotlin/patches/`. For example, the original Buienalarm target in `buienalarm/Compatibility.kt` is:

| Field | Declared target |
| --- | --- |
| Package | `org.yoki.android.buienalarm` |
| App version | `4.32.0` |
| Version code | `3723` |
| Minimum Android SDK | `26` (Android 8) |
| Original standalone certificate SHA-256 | `d7e009b89d18f11ac9cdc58b1027e14772de9b429a6f2520cd6459c6b9413ceb` |
| Verified Play Store certificate SHA-256 | `057057399eda86a88f79726f9686cd224aa2ca98761a380deebb7d1df9e462b4` |

The generated `patches-list.json` and MPP carry each app's targets. The initial Buienalarm release declared the standalone certificate; the Google compatibility update additionally accepts the verified Play Store certificate and prefers original APKS input. Its extracted Play Store ARM64 variant has minSdk 32, while the older standalone variant has minSdk 26. There is no wildcard or experimental target for untested app versions. The convenience target constructor declares code 3723 for all four ABI keys, which does not constitute runtime testing of every architecture.

For a new Buienalarm version, inspect and test that APK before adding another `AppTarget`. The matching code additionally rejects missing/ambiguous fingerprints and unexpected resource structure. `--force` is a developer override, not a supported upgrade path.

## Automatic GitHub releases

The existing template workflows and `.releaserc` control publication:

1. Push a `feat:` or `fix:` commit to `dev` to create a prerelease. Documentation-only and `chore:` commits do not normally create another release.
2. The Release workflow chooses the version, builds the Android-capable MPP, generates `patches-list.json`, updates `patches-bundle.json`, the README and changelog, and uploads the MPP to a GitHub release.
3. The automatic PR workflow opens a `dev` to `main` PR. Merge it with a **merge commit**, preserving release history, when ready for a stable release. Do not squash or manually bump generated versions.
4. Later feature/fix pushes repeat the same process. Do not manually upload replacement release assets or edit generated metadata.

Preserve `dev` ancestry when promoting a release. Copying its files into an unrelated promotion commit can make the post-publication `main` → `dev` backmerge conflict, even when the patch code matches. Resolve those overlaps in the promotion branch and merge `dev` history before publication. The backmerge must preserve unpromoted development work; do not apply a blanket `ours` or `theirs` rule.

Actions supplies the repository secret `SHARED_MAPS_API_KEY` to both release and verification builds. Local builds must use that intended key through the environment or the Git-ignored `.community-maps-api-key` input; never use generated build output as a key source. Weerplaza radar was verified after correcting a stale local key to match the working phone and published Actions bundle.

The first successful automated run was [Release 40366065641](https://github.com/johnneerdael/dutch-applications-patches/actions/runs/40366065641), producing [v1.0.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.0.0-dev.1). Its downloaded MPP includes both JVM classes and `classes.dex`, identifies patcher 2.0.1, and declares the intended Buienalarm target.

GitHub initially generated `main` and `dev` as unrelated root histories, causing the automatic PR workflow to fail with “No common ancestor between main and dev.” A one-time merge of the initial `main` history into `dev`, preserving the complete `dev` tree, establishes the common ancestor. This changes neither patch behavior nor the contents of `main`.

## Morphe Manager distribution

The add-source link is:

https://morphe.software/add-source?github=johnneerdael/dutch-applications-patches

Manager's source implementation uses the root `patches-bundle.json`, with `main` for stable and `dev` for prereleases. The manifest's `download_url` points to the versioned MPP release asset. The release workflow generates the manifest on the corresponding branch; consumers should use that generated download URL.

Leave **Use pre-release patches** disabled to receive stable releases from `main`. Enable it to receive development releases from `dev`. Stable publication follows a merge of the release PR to `main`; pushing `dev` alone does not make a stable release.

The source needs no local PAT on users' devices. The local read:packages PAT is only for developer dependency resolution; GitHub Actions supplies its own scoped workflow token. Secrets and APKs are not committed.

Primary implementation reference: [RemotePatchBundle.kt](https://github.com/MorpheApp/morphe-manager/blob/main/app/src/main/java/app/morphe/manager/domain/bundles/RemotePatchBundle.kt).

## Listing on morphe-patches.software

GitHub publication and website discovery are separate. [morphe-patches.software](https://morphe-patches.software/) describes itself as a community-maintained index. Morphe's own maintainer also identifies it as independently run in [this discussion](https://github.com/MorpheApp/morphe-website/issues/136).

The site's frontend reads its catalog from `/data/bundles.json`. The inspected catalog had 331 bundles and did not contain `johnneerdael/dutch-applications-patches` or `org.yoki.android.buienalarm`. The frontend does not submit new repositories as part of a GitHub release.

No public automatic-enrollment API, webhook contract, refresh schedule or guaranteed discovery rule was found. The backend's discovery policy is therefore **unknown**; publishing a release and adding repository topics does not prove the site will list it automatically. Repository description, compatibility metadata, add-source links and relevant GitHub topics are configured for discovery.

The site's public **Feedback** form is the available route to ask its maintainer to list a source or clarify automatic discovery. No message was sent as part of this investigation. Suggested request:

> Please add `https://github.com/johnneerdael/dutch-applications-patches` to the community patch index. It contains five patches for `org.yoki.android.buienalarm` 4.32.0 (3723): Hide ads, Hide Premium banner, Fix Google services, Disable tracking and Skip consent screens. The existing template workflow publishes MPP releases and generated patches-list.json / patches-bundle.json on dev, with stable releases on main. Can this source be enrolled for automatic updates?

Once the operator confirms how the source is enrolled, use the standard generated metadata to support its ingestion. Do not add an undocumented deployment or contact webhook to the release workflow.
