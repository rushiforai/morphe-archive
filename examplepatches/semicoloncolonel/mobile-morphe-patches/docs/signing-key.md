# Signing key

Every release of this patch source is signed. Morphe Manager checks the signature when it downloads the patch bundle, shows a short fingerprint of the signer on the source's "Signed by" line, and can copy the full public key.

<!-- signer:start -->
<p align="center">
  <img alt="Signed by 4c2b a5d2 28d4 532f" src="assets/signed-by.svg">
  <br>
  <sub>Full public key: <code>6sNE7CnUmEbvfVcaYklfOzJuN60m4+HH2LKlqlxhSN0=</code></sub>
</p>
<!-- signer:end -->

## Check the signer yourself

The fingerprint is the first 8 bytes of the SHA-256 hash of the public key. The key is in [morphe-signing.pub](../morphe-signing.pub) and in the `public_key` field of [patches-bundle.json](../patches-bundle.json), the file Morphe Manager reads. To compute the fingerprint on macOS or Linux, run this command in a copy of the repository:

```bash
base64 -d < morphe-signing.pub | shasum -a 256 | cut -c1-16
```

The command prints the fingerprint without the spaces.

## Key history

This table lists every key the source has used. When the key changes, a workflow adds a row for the new key and records the date the old key stopped. Rows are never removed, and every change to the key file is also in its [commit history](https://github.com/semicoloncolonel/mobile-morphe-patches/commits/main/morphe-signing.pub).

<!-- history:start -->
| Fingerprint | Public key | In use from | In use until | Added in |
|-------------|------------|-------------|--------------|----------|
| `4c2b a5d2 28d4 532f` | `6sNE7CnUmEbvfVcaYklfOzJuN60m4+HH2LKlqlxhSN0=` | 2026-10-31 | current | [e79b3dd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e79b3dde72be6574c4fc1e3e6ffb9158ea0adc21) |
<!-- history:end -->
