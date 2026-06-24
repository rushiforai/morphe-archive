# Release Signing

GitHub releases can be signed with a detached ASCII-armored signature after the `.mpp` bundle is published.

## Mise Task

Use the repo task:

```bash
mise run sign-release -- --tag v26.4.29-abcdef
```

If `secrets/sign-release.env.sops.yaml` exists, the task decrypts it with `sops exec-env` and injects the values into the process environment before starting the Python helper.

Example secret template:

```yaml
GPG_KEY: replace_me
GH_TOKEN: replace_me
REPO: kareemlukitomo/morphe-patches
```

Create the encrypted file from the example:

```bash
cp secrets/sign-release.env.example.yaml secrets/sign-release.env.yaml
sops encrypt --filename-override secrets/sign-release.env.sops.yaml \
  --input-type yaml \
  --output-type yaml \
  secrets/sign-release.env.yaml > secrets/sign-release.env.sops.yaml
rm secrets/sign-release.env.yaml
```

You can still run [scripts/sign-latest-release.py](../scripts/sign-latest-release.py) directly if you prefer plain environment variables.

Optional environment variables and CLI equivalents:

- `REPO=owner/repo`
- `TAG=v1.2.3`
- `KEEP=1`
- `DRY_RUN=1`
- `GITHUB_TOKEN=...`
- `GH_TOKEN=...`

## Behavior

- Finds the newest non-draft release that has a `.mpp` asset without a matching `.asc`.
- Downloads the `.mpp` bundle.
- Creates `patches-<version>.mpp.asc` with `gpg --armor --detach-sign`.
- Uploads the signature back to the release when `GITHUB_TOKEN` or `GH_TOKEN` is available.
- Keeps local files for manual upload if no GitHub token is present.

Requirements:

- `gpg` with the configured signing key available locally
- `sops` when using the encrypted `secrets/sign-release.env.sops.yaml` flow
