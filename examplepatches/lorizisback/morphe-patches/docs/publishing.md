# Publish the patch source

The destination is **lorizisback/morphe-patches** on GitHub. Keep the repository public so Morphe Manager can fetch releases without GitHub authentication. This project retains the official template's semantic-release workflow: it builds the Android `.mpp`, generates `patches-bundle.json` and the patch list, and uploads the bundle to a GitHub release.

## First upload

Create an empty public repository named `morphe-patches` under `lorizisback`. Do not initialize it with a README or license. In **Settings → Actions → General**, allow GitHub Actions to create and approve pull requests. The template uses this to open the `dev` to `main` release PR.

Extract the prepared source archive into a new directory. From that directory, run:

```sh
git init -b main
chmod +x gradlew
git add .
git commit -m "feat: add Curve patches"
git branch dev
git remote add origin https://github.com/lorizisback/morphe-patches.git
git push -u origin main dev
```

The initial `feat:` commit triggers the first stable release. Watch **Actions → Release** and require a successful run before adding the source to Morphe. The release must contain a `patches-<version>.mpp` asset and the generated `patches-bundle.json` on `main` must have a nonempty version and download URL.

The workflow uses GitHub's automatic `GITHUB_TOKEN`; do not upload a personal token or your Android signing key. If Morphe's GitHub Packages dependencies reject that token, first check the workflow's package-read permissions and the upstream package's access settings. A local successful build does not prove the new repository's token has package access.

## Add to Morphe Manager

Open [Add source](https://morphe.software/add-source?github=lorizisback/morphe-patches&app=com.imaginecurve.curve.prd), or use **Sources → + → Remote** with:

```text
https://github.com/lorizisback/morphe-patches
```

After adding the remote source, use that source for Curve instead of the manually imported local bundle. Fetch future bundles with the source's Update button. Patch the supported Curve APK again and install the result; fetching a bundle alone does not change an installed app. Keep the same Morphe signing key for app updates.

## Future releases

Develop on `dev`. A `fix:` commit creates a patch release and a `feat:` commit creates a feature release. These are prereleases on `dev`; enable pre-release patches for this source in Morphe to receive them. Merge the template's PR from `dev` into `main` with a regular merge to publish a stable release. Do not squash it. `chore:` and documentation-only commits do not create releases.

Never hand-edit generated `patches-bundle.json`, `patches-list.json` or `CHANGELOG.md`. Never upload app APKs, APKM files, private signing keys or credentials. The prepared source archive contains source files and build configuration, including the Gradle wrapper; it excludes local app binaries, build output and chat skills.
