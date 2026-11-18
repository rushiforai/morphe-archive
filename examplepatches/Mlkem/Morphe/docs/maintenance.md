# Maintenance

Work on `dev`. Keep each app in its own package and extension module. Update its
compatibility, documentation and tests with the code. Run build and verification
before pushing a `feat:` or `fix:` commit. Build the whole collection together;
do not concatenate prebuilt MPP ZIP files.

Walmart was imported from the saved 26.31 / 1.5.0-beta.1 source. Import later reviewed
Kotlin, Java and test changes here without overwriting unrelated ongoing work.

## Publishing

The workflow uses Morphe's official semantic-release template. It generates the
version, changelog, `patches-bundle.json`, `patches-list.json` and release assets.
Only `dev` automatically publishes prereleases. `main` builds in CI, and its manual
Release workflow requires a matching phone-test approval before a stable release.
There is no stable manifest until that approval. Beta users add the `dev` source.

Preserve generated release commits and tags. Merge reviewed source updates from
`dev` into `main` before approving and publishing a stable version. Afterward,
merge `main` back into `dev` to keep release history aligned.

## Privacy

Do not commit personal patch variants, account IDs, credentials, APK inputs,
private keys or user backups to this repository, including branches and releases.
Private variants stay outside the public collection.

## Signing

Morphe bundle signing is optional and not configured. The template can generate
keys with `./gradlew generateSigningKey`; commit only the public key and store the
private key in the Actions `MORPHE_SIGNING_KEY` secret. This is distinct from the
APK signing key on the phone, which must be retained for in-place app updates.
