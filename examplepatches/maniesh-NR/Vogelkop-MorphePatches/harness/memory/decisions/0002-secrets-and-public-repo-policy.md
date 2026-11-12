# ADR 0002 — secrets & public-repo mirror policy

Date: 2026-11-12 · Status: accepted

The repository is PUBLIC, so the backup mirror must be conservative.

## Mirror exclusions (rsync layer)

- `upload/` entirely — copyrighted Opera APKs, pasted screenshots (user
  privacy), token files (secrets).
- `skills/` — agent-platform internals; not ours to publish.
- `.vault/`, `.harness/`, `.git/`, caches, `node_modules`, `.venv`, `.next`.
- Secrets by name: `.env`, `*.local`, `morphe.keystore`, `morphe-signing.key`
  (matches the root `.gitignore`, which acts as a second layer).
- Binaries: `*.apk`, `*.apkm`, `*.xapk`, `*.zip` (repo policy, GitHub size
  limits) and any file > 95 MiB.

## Compensating record

`state/MANIFEST.txt` records paths + sizes of the WHOLE sandbox (names only,
no content), so a post-recycle session knows what existed — including the
excluded files — and where to re-fetch them from (uploads, `sandbox-storage`
prerelease).

## Token handling

- Lives only at `.vault/github.token` (chmod 600) or the uploaded
  `Vogelkop access key.txt`; auto-imported into the vault by `backup.sh` /
  `install.sh`.
- Auth via GIT_ASKPASS (`askpass.sh` holds no secret) so remote URLs and
  `.git/config` stay clean.
- Hard backstop: `backup.sh` greps the literal token value(s) — the vault
  token AND any different uploaded key — across the clone before every push
  and refuses to push (exit 2) on any hit. This covers known tokens only;
  sessions must still never write other secrets into the clone.

## Big binaries

Anything large-but-precious goes to the `sandbox-storage` prerelease via
`harness/bin/storage_upload.py` (pre-existing convention; prerelease without
`.mpp` so Morphe Manager ignores it).

Do not relax these filters without an explicit owner decision.
