# Cloudflare `patches.json` Worker

This repository includes an optional Worker project that exposes the latest signed release as Morphe-compatible patch source JSON.

Target source URL:
- `https://morphe.kareem.one/patches-bundle.json`

## What It Does

- Serves `patches-bundle.json` from the newest signed GitHub release.
- Keeps `/patches.json` as a compatibility alias for `patches-bundle.json`.
- Also serves `/patches-list.json` for diagnostics/catalog consumers.
- Optionally redirects non-canonical hosts back to `PRIMARY_HOST`.
- Reads the public GitHub releases Atom feed for this repository.
- Selects the newest release authored by an allowed actor.
- Optionally requires a detached `.asc` signature before serving that release.
- Does not require Worker redeploys when a new release is signed.

## Default Asset Expectations

The Worker derives release assets from the tag name:

- bundle: `patches-<version>.mpp`
- signature: `patches-<version>.mpp.asc`
- list metadata: `patches-list.json`
- bundle metadata: `patches-bundle.json`

For tag `v1.2.3`, the Worker expects:

- `patches-1.2.3.mpp`
- `patches-1.2.3.mpp.asc`

## Tracked Files

- [cloudflare/patches-json/wrangler.toml](../cloudflare/patches-json/wrangler.toml)
- [cloudflare/patches-json/src/index.js](../cloudflare/patches-json/src/index.js)
- [scripts/sign-latest-release.py](../scripts/sign-latest-release.py)

## Config

The Worker uses only public metadata:

- `PRIMARY_HOST`
- `GITHUB_OWNER`
- `GITHUB_REPO`
- `REPO_HOMEPAGE`
- `ALLOWED_GITHUB_ACTORS`
- `ALLOW_PRERELEASE`
- `REQUIRE_SIGNATURE`

No secret is required to run the Worker itself.

## Deploy

1. Confirm the `morphe.kareem.one` route entries in `wrangler.toml`.
2. Authenticate with Cloudflare.
3. Deploy from `cloudflare/patches-json/`:

```bash
npx wrangler deploy
```

## Signing

If `REQUIRE_SIGNATURE = "true"`, the newest unsigned GitHub release is ignored until the matching `.asc` asset exists. While an unsigned newer release is pending, Worker responses use a short cache TTL so the signed release appears quickly after upload.

Use the repo task to sign and optionally upload the missing detached signature:

```bash
mise run sign-release
```
