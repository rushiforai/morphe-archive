# Contributing to Solo Patches

Solo Patches targets WebNovel `com.qidian.Int.reader` **8.24.2 APKM**. Search [GitLab issues](https://gitlab.com/solo-patches/solo-patches/-/issues) before reporting a bug or proposing a feature. Source is public; patch-bundle release publication is still being prepared.

## Reports and requests

Use the GitLab **Bug report** or **Feature request** template. For bugs, state the app version/input type, Solo bundle version, Manager/CLI version, Android version, selected patches/options and runtime switches. Include the external bundle version only for older two-source builds. Give safe reproduction steps and expected versus actual behavior. Distinguish patching failure, install failure, startup failure and an in-app bug; say whether it worked in an older build.

Never submit account names/IDs, credentials, session/token values, consent screens, full device/account/network logs, app data, APKs/APKMs, chapter text, screen dumps or attachments containing account/reading data. A short, manually reviewed and redacted error excerpt is enough to begin; do not capture or upload broad logs to fill a template. No one needs your signing private key or account access to triage a report.

Requests must stay within local UI/compatibility scope. Do not request paywall or purchase bypasses, fabricated rewards, anti-ban guarantees, authentication/TLS bypasses or weakened native/server-side enforcement. Font work is paused; retained code is not a promise of continued font development.

## Changes

Discuss material behavior or new target-version support in an issue first. Make a focused branch from the repository's default branch and open a GitLab merge request explaining the behavior, affected patches and limitations. Do not copy another project's release automation, namespaces or branding unchanged.

Reuse existing patch/runtime patterns. Keep internal `app.saketh` namespaces and imported upstream attribution stable. Fail clearly on unsupported targets or missing required compatibility transformations rather than adding a silent fallback. Preserve authentication, purchases, manual check-in, independent reading statistics and native enforcement. Keep the timer reward-loss warning beside its control.

Use [Development](docs/DEVELOPMENT.md) for build and regression commands. Run heavy work serially. A bug fix needs a focused regression check; changed observable behavior needs coverage of its new contract. Documentation/configuration-only changes need no new tests. Do not weaken checks to obtain a pass. In the merge request, name the exact checks run and their outcomes; mark device/Manager/server-dependent behavior unverified when it was not exercised. Device/account actions require the owner's consent and must not clear data or change account state.

Update relevant documentation and release notes when behavior changes. Preserve [LICENSE](LICENSE), [NOTICE](NOTICE) and upstream attribution. Keep credentials, private keys, app inputs/outputs and private device artifacts out of commits and release assets. Public releases carry patch bundles/source only; beta publication is a separate manual maintainer decision, not an effect of opening or merging a request.
