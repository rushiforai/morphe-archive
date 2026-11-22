# Security

## Supported versions

Only the latest release gets fixes. Morphe Manager updates the patches on its own, so an older
bundle is replaced as soon as a new one is out.

## Reporting a vulnerability

Please don't open a public issue. Report it privately through
[GitHub's vulnerability reporting](https://github.com/JoFSlash/google-health-patches/security/advisories/new)
with what you found, how to reproduce it, and the versions of Google Health, the patches and Morphe
Manager. You'll get an answer within a week, and a fix goes out as an urgent release instead of
waiting for the weekly one.

## What counts

In scope is the code this repository adds to the Google Health app:

- the extension code in `extensions/`,
- the changes the patches make to the app, for example where it signs in,
- the build and release workflows.

Out of scope are problems in Google Health itself, in Morphe Manager or the Morphe CLI, and in
MicroG-RE. Please report those to their own projects.

## Checking a release

The bundles are built by the Release workflow on GitHub, which also publishes a build provenance
attestation for each one. Only install the bundle from this repository's releases or through
Morphe Manager.

From the next release on, each bundle is also signed with this repository's Ed25519 key. Its public key
is in [morphe-signing.pub](morphe-signing.pub) and in `patches-bundle.json`, and the signature is in
the comment of the `.mpp` file (`MorpheSig1 <public key> <signature>`). Morphe Manager can check it, so a
bundle that someone else changed or built doesn't pass as this one.
