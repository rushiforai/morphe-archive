# Repository rules

- Perform every GitHub mutation for this repository as the `liongalahad` GitHub account; never use another account.
- Before committing or pushing, verify the repository-local Git identity is `liongalahad <145302945+liongalahad@users.noreply.github.com>` and the active authenticated GitHub CLI account is `liongalahad`.
- Never commit, release, cache in Actions artifacts, or attach original, decoded, rebuilt, signed, or patched Stremio APK contents.
- Keep original APKs, decoded trees, build outputs, signing keys, screenshots, and device captures gitignored.
- Treat Stremio implementation files as patch targets only. Commit compact diffs and original Morphe source, not reconstructed upstream files.
- Keep compatibility checksum-gated. A new Stremio version is unsupported until patch application, assembly, install, launch, and relevant device acceptance checks pass.
- The side-by-side patch must retain the package `com.stremio.morphe`, label `Stremio Morphe`, and unique app-defined permission and provider authorities.
- Keep every patch fully compartmentalized under `patches/<patch-id>/`. Each patch directory must be self-contained and own its diff, original source, scripts, tools, documentation, and test evidence; do not place patch-specific assets in shared root directories.
- Register each patch through its module-local `patch.json`. Keep root build scripts generic: they may discover, order, compose, rebuild, sign, and verify modules, but patch-specific build or application logic belongs inside the owning patch directory.
- Push all ongoing development to `dev`. Update `main` only when the user explicitly confirms that the patches are tested and stable enough for promotion.
- Use conventional commits.
