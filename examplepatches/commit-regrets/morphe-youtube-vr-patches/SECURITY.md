# Security policy

## Reporting a vulnerability

Use GitHub's **private vulnerability reporting**: the repository's **Security** tab →
**Report a vulnerability**. That reaches the maintainers privately; nothing is published
until a fix is ready.

Please do **not** open a public issue for anything you believe is exploitable — a public
issue that names a hook, a fingerprint or a bypass hands working notes to anti-user systems
before there is a patch.

## What is in scope

- The patches in [`patches/src`](patches/src/main/kotlin) and the injected extension in
  [`extensions/src`](extensions/src) — anything in the bundle that could behave contrary to
  its documented purpose, exfiltrate data, or weaken the patched app.
- The pipeline in [`scripts`](scripts) and the workflows in [`.github/workflows`](.github/workflows) —
  anything that could make a user run code or fetch content they did not intend to.

## What is not in scope

- Vulnerabilities in YouTube, the VR system or any Google service — report those to Google.
- The Morphe patcher framework itself — report those upstream to
  [MorpheApp](https://github.com/MorpheApp/morphe-patcher).
- "The app lets me watch ad-free / skip sponsors" — that is the documented purpose here, not
  a vulnerability.

## Supported versions

Only the [latest release](https://github.com/commit-regrets/morphe-youtube-vr-patches/releases)
is supported. The bundle targets the latest two app versions (currently YouTube VR 1.90.05 and 1.89.09);
a newer app build that the patches refuse to apply to is not a security issue — it is the
next porting job.
