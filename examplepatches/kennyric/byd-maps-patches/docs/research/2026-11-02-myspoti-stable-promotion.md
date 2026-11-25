# Myspoti stable promotion

On 2026-11-02 the user reported “myspoti works perfect promote to main” after testing development release 1.27.0-dev.2 on Myspoti 2.2.0. Device acceptance applies to 2.2.0; 2.3.0 has automated validation only. This explicitly accepts Myspoti and authorizes its stable promotion. It does not approve the separate YouTube Music personal-library patch.

The promoted Myspoti patch, extension and discovery tests are unchanged from accepted development commit `5b333f79e55763aac4ad2d3c9d4feae68550ef70`. It supports publisher inputs 2.2.0 / 1116 and 2.3.0 / 1121. The shared catalogue, navigation and downloads edits add only Myspoti. Existing stable YouTube Music host support remains unchanged.

Prior development validation passed 27 patch tests, 415 Python tests with 45 skips, strict patching and rebuilds of both Myspoti inputs, and six accountless API 36 checks per input against actual emitted DEX. The device acceptance is the user's reported result; automated checks alone do not establish account contents or playback. No account-bearing phone installation is changed by this promotion.

Fresh stable-candidate validation passed the complete release Gradle preflight, including 29 patch tests; 414 Python regressions with 45 skips; 15 Medium reader regressions; the Medium bundle/private ABI checks; and both app-page and Markdown-link checks. The five Myspoti class/extension entries built for stable match the accepted published development bundle byte-for-byte.

## Myspoti 2.3.0 Manager archive report

The user separately reported that Manager 2.3.0 / Patcher 2.1.0 fails before patch-session construction while reading the local-file header for `lib/arm64-v8a/libandroidx.graphics.path.so` at offset 14,057,336. The two supplied local filenames, including the refreshed `(1)` file, are byte-identical: 18,499,227 bytes, SHA-256 `2633fbc80e79c2b6ccadb7cda34f381fc5537770d7c2d77b49abb37dd4ef1e5f`. Both pass CRC verification for all 1,054 ZIP entries and APK v2 signature verification with publisher certificate SHA-256 `2b8f54daf60ce32cee1ab9206553c7e5741e96f2f32efdf2545758bf210a2c41`. The reported offset contains a valid local-file header.

Fresh strict patching and rebuild of the refreshed file passes with Morphe desktop 1.19.1 through its Arsclib resource coder and this stable candidate. The bounded workaround is desktop patching of this exact input; device acceptance remains on Myspoti 2.2.0. The later phone-file audit established the cause below; the original error occurred before patch callbacks ran.

The phone copy was subsequently pulled and audited. It had the same 18,499,227-byte length but SHA-256 `92f5bddda2e53ec7ca14220d251f447cc97dc349581c2f076396f893e9f79290`, with 736,319 differing bytes. Its 16 bytes at the reported local-header offset were all zero, and ZIP CRC validation first failed at `classes2.dex`. The Manager failure is therefore explained by corrupted phone input. A fresh USB-transferred `Myspoti-2.3.0-verified.apk` was verified on the phone to match the desktop SHA-256 `2633fbc80e79c2b6ccadb7cda34f381fc5537770d7c2d77b49abb37dd4ef1e5f`. No 2.3.0 device installation or signed-in acceptance is claimed. Local audit evidence: `.analysis/gearslip-personal-library/failure-2026-11-02/myspoti-phone-copy-audit.json` in the primary workspace.

## Stable publication verified

Stable [v1.27.0](https://codeberg.org/JohninNL/nl-morphe-patches/releases/tag/v1.27.0) was published by `johninnl` from promotion commit `bfdc032e1ee71fc160fc208d48f6aa96f4568e02`; generated release commit `9a3de3f7feeb56b43447464213928767048404eb` retains the required author and committer. [Release](https://codeberg.org/JohninNL/nl-morphe-patches/actions/runs/41397257078), [Release safety](https://codeberg.org/JohninNL/nl-morphe-patches/actions/runs/41397257047), and [Documentation](https://codeberg.org/JohninNL/nl-morphe-patches/actions/runs/41397257088) passed. Main's signed Morphe discovery manifest resolves to this stable version and uploaded asset.

The downloaded 13,357,614-byte bundle matches GitHub's published asset digest, SHA-256 `03308b12001f09c07f60c6607466d4af9d90d59ab816331ac9932ee8e8aed2f1`. All five Myspoti extension/class entries match accepted development release 1.27.0-dev.2 byte-for-byte. All six existing YouTube Music host-support entries match stable 1.26.1 byte-for-byte; no YouTube Music personal-library patch is present, and Myspoti is the only app in the release notes.

Strict patching and APK rebuild with the actual downloaded stable bundle pass for both Myspoti 2.2.0 and the exact 2.3.0 publisher input. Each report records only `Gearslip personal library`, with no failed patches. No phone installation is performed by these checks. Download, digest/payload evidence and patch reports are retained under `.tools/worktrees/myspoti-main-release/.analysis/published-stable/` in the local workspace.

## Any-version compatibility

The user explicitly requested Any-version compatibility for Myspoti on main. The Myspoti package now declares one `AppTarget(version = null)` without a build-code or ABI filter. Package `app.myspoti.stable` and APK input scope are retained. Structural `BrowserDiscovery` checks are unchanged: the common permission predicate must be uniquely established from root, children and search paths while preserving UID ownership checks. Unknown or ambiguous layouts still stop patching. Other apps' compatibility is unchanged.

A JVM regression reads the compiled patch's actual compatibility metadata and requires exactly this package, APK input and one target with null version and build-code metadata. It first failed against the prior two-version restriction. The reference input remains 2.3.0 / 1121, with real-input patch validation on 2.2.0 and 2.3.0 and signed-in device acceptance bounded to 2.2.0. The separate corrupted 2.3.0 phone input was replaced and its hash verified as described above.

Any-version candidate validation passes 30 patch tests, including the new compiled-metadata assertion, the full release Gradle preflight, 414 Python tests with 45 skips, 15 Medium reader tests, and the private ABI/bundle checks. Generated metadata has one target with null version and null version-code metadata. Strict patching and rebuilds of the real 2.2.0 and 2.3.0 inputs pass without a forced version override.
