# Contributing

Prepare changes for `main`. Use conventional commit messages such as
`feat(app): ...`, `fix(app): ...` and `docs: ...`. Release automation publishes
production bundles from `main` and development prereleases from `dev`. All current app targets belong to that release.
Do not manually publish versions or edit generated release metadata.

Keep each patch restricted to its declared app versions and form factor. Fail
when a required match is absent or ambiguous. Keep independent controls
independent and preserve functionality outside their documented scope.

## Build and verify

Use JDK 21 and the Android SDK. Run `python3 scripts/build.py buildAndroid` to
use the Gradle wrapper with an optional local `.pat` for GitHub Packages. The
build requires `SHARED_MAPS_API_KEY`; Bright article builds also use
`BRIGHT_ARTICLE_SIGNING_KEY`. Store credentials in the environment or the
ignored files used by the build, never in source control.

Run `python3 -m unittest discover -s tests` and
`node --test tests/test_release_branding.cjs tests/test_preview_release.cjs`.
For changed apps, use the corresponding verifiers and target validation in
`scripts/validate_targets.py`. `scripts/validate.py` covers Buienalarm only.
Report compilation, patch application, static verification and device checks
separately. A successful build does not prove runtime behaviour.

Install `docs/site-requirements.txt`, run `python3 scripts/generate_docs_catalog.py`,
`python3 scripts/check_markdown_links.py`, `python3 -m mkdocs build --strict`
and `python3 scripts/check_docs_site.py` to validate documentation.

## Verify dev distribution

Keep stable publication on `main`. For a dev prerelease, publish the signed
bundle and the generated `patches-bundle.json` on `dev`; its version and
`download_url` must identify the same prerelease asset. Morphe reads the branch
manifest when selecting a source channel. The `dev` release workflow generates and commits that manifest with the signed
bundle. Marking a GitHub release as a prerelease alone does not update it.

Before reporting a dev build available in Manager, fetch the public raw
`dev/patches-bundle.json`, follow its download URL, verify the repository signing
key and bundle version, and check that the new apps are present. Confirm that
`main/patches-bundle.json` and GitHub's latest stable release remain unchanged.
The release workflow runs `node .github/scripts/verify_release_discovery.cjs`
with its expected branch and version to reject stale manifests, wrong-channel
downloads, signing-key changes or incomplete uploads. Promote to `main` only
after the requested user confirmation.

Dev announcements exclude commits reachable from earlier stable or dev release
tags. Promoting one app from a combined commit must not announce that app again
in the next dev build. The release-note guard rejects replayed commits and keeps
explicit shared-change app scopes mandatory. Archived changelog history remains
available separately from each release announcement.

Release checks read affected apps from file paths, and Morphe shows a repatch badge for any
release bullet naming an app. When a commit edits an app's files without changing what its
patches produce, such as an adapter shared with 2dehands, add an `Unchanged-Apps: Marktplaats`
trailer. It covers only that commit, so another change to the app in the same release still
needs its own scope.

A commit editing more than one app's patch folder must declare every one of those apps in
`Release-Apps` or `Unchanged-Apps`, or the Release safety check fails. Run
`node .github/scripts/preview_release_notes.cjs` before pushing to `main`, because a pushed
commit cannot gain a trailer. If one slips through, revert it and reapply it with the trailers.

## Write for users

Keep Dutch and English app pages aligned. Describe each patch's visible effect,
default, supported versions and useful limitations. Named advertising and
tracking services may be described in detail. Leave implementation mechanics,
reverse-engineering instructions and technical measurement records out of the
user guide. Keep technical verification in developer source and tests.

Regenerate the public catalogue and README summary after changing patch
metadata. The source metadata may contain developer details; public summaries
must use the app guides' end-user explanations.

## Repository setup

Follow the mandatory identity rules in [AGENTS.md](AGENTS.md). Activate
`johninnl` with `gh auth switch --user johninnl` before working. Every author,
committer and release publisher must use that identity.

Configure GitHub Packages access and the build secrets before enabling
releases. Set `JOHNINNL_RELEASE_TOKEN` to a token owned by `johninnl`; checkout
and publishing require it. Use `MORPHE_SIGNING_KEY` for bundle signing and
retain its public key. Keep the map and Bright build inputs in their Actions
secrets. Enable GitHub Pages with Actions. This repository uses `main` for production and `dev` for prereleases.

The first release creates `patches-bundle.json`; no download manifest is
supplied for an artifact that has not been published. Start `main` with the
prepared source snapshot, including the complete current patch set. Do not
import old branches or tags.

Open issues and pull requests at
https://github.com/johninnl/nl-morphe-patches. Include the app version, selected
patches and reproducible steps. Keep original APKs, credentials, signing keys,
private app data and downloaded tools out of Git.
