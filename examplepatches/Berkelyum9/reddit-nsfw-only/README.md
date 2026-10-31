# Reddit NSFW Only

An independent Morphe patch project maintained by **Berkelyum9**.

## Stable release

- Version: **0.2.0**
- Intended Reddit target: **2026.39.0**
- Package: `com.reddit.frontpage`
- Known behaviour: NSFW-only filtering on the Home feed. Other screens are not claimed as verified in this stable release.

Download: [Reddit NSFW Only v0.2.0](https://github.com/Berkelyum9/reddit-nsfw-only/releases/tag/v0.2.0)

## Experimental compatibility work

Reddit 2026.24.0 is being tested separately on the `feature/reddit-2026.24` branch. That work does not replace the stable v0.2.0 release. Successful compilation is not the same as confirmed runtime compatibility; the test package must be applied in Morphe and checked in the app.

## Add as a remote Morphe source

Use this repository:

`https://github.com/Berkelyum9/reddit-nsfw-only`

The repository's `patches-bundle.json` points to the stable v0.2.0 release asset. The stable release asset is kept unchanged while compatibility work continues.

## Origin and license

This is a separate derivative/adapted project based on GPLv3 work from:

- https://github.com/warleysr/reddit-nsfw-blocker
- https://github.com/MorpheApp/morphe-patches
- https://github.com/variablenine/morphe-patches

See `LICENSE` and `NOTICE` for applicable terms.
