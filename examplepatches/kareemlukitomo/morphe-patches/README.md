# Kareem Patches for Morphe

Targeted Morphe-compatible patches for small app-specific share-link fixes.

## Supported apps and patches

| App | Package | Target APK/APKM | Patches |
| --- | --- | --- | --- |
| Instagram | `com.instagram.android` | [`424.0.0.49.64`](https://www.apkmirror.com/apk/instagram/instagram-instagram/instagram-instagram-424-0-0-49-64-release/) | `Change Instagram share domain` |
| Threads | `com.instagram.barcelona` | [`426.0.0.36.67`](https://www.apkmirror.com/apk/instagram/threads/threads-426-0-0-36-67-release/) | `Change Threads share domain` |
| TikTok | `com.zhiliaoapp.musically` | [`44.9.3`](https://www.apkmirror.com/apk/tiktok-pte-ltd/tik-tok-including-musical-ly/tik-tok-including-musical-ly-44-9-3-release/) | `Change TikTok share domain` |
| Reddit | `com.reddit.frontpage` | [`2026.17.0`](https://www.apkmirror.com/apk/redditinc/reddit/reddit-2026-17-0-release/) | `Change Reddit share domain`, `Sanitize Reddit share links` |
| X / Twitter | `com.twitter.android` | [`11.86.0-release.0`](https://www.apkmirror.com/apk/x-corp/twitter/x-11-86-0-release-0-release/) | `Disable Twitter PairIP startup checks`, `Change Twitter share domain`, `Sanitize Twitter share links` |

Experimental compatibility entries are kept for previously validated app versions where useful, but the linked versions above are the currently maintained targets.

## Use In Morphe

Add this repository as a patch source in Morphe:
- [Add source in Morphe](https://morphe.software/add-source?github=kareemlukitomo/morphe-patches)
- Manual source URL: `https://github.com/kareemlukitomo/morphe-patches`
- Worker source URL: `https://morphe.kareem.one/patches-bundle.json`

Notes:
- Releases publish a signed `.mpp` patch bundle on GitHub.
- The Worker URL serves `patches-bundle.json` from the newest signed release, so it does not need to be rebuilt for each release.

## Release Flow

- Development happens on feature branches and lands on `dev` before `main`.
- Releases are tag-driven CalVer bundles. Use tags like `v26.4.29-abcdef`, where `abcdef` is the first six characters of the tagged commit SHA.
- Pushing a matching tag runs [release.yml](.github/workflows/release.yml) and publishes the `.mpp` bundle.
- Release metadata is generated as release assets in `patches-bundle.json` and `patches-list.json`.
- After the GitHub release exists, sign the `.mpp` with `mise run sign-release -- --tag v26.4.29-abcdef`.

## Build From Source

Requirements:
- JDK 17
- Access to `https://maven.pkg.github.com/MorpheApp/registry`

Example:

```bash
export GITHUB_ACTOR=<github-user>
export GITHUB_TOKEN=<github-token>
JAVA_HOME=/path/to/jdk17 \
PATH=/path/to/jdk17/bin:$PATH \
./gradlew :patches:buildAndroid generatePatchesList --no-daemon
```

Artifacts are written under `patches/build/libs/`.

## Maintainer Notes

- Contribution guide: [CONTRIBUTING.md](CONTRIBUTING.md)

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE), with additional conditions under GPLv3 Section 7.

- `Morphe` is referenced only to describe compatibility.
- Derivative works must use distinct branding as described in [NOTICE](NOTICE).

See [LICENSE](LICENSE) and [NOTICE](NOTICE) for the full terms.
