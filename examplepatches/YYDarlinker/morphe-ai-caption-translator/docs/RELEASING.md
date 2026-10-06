# Release process

The existing `.github/workflows/release.yml` and `.releaserc` are the only publisher. This follows the [official template](https://github.com/MorpheApp/morphe-patches-template/blob/main/README.md).

1. Develop on `dev`, preserving release tags and historical product anchors. Use semantic commits; a `feat:` since the latest stable tag requests a minor release, `fix:` requests a patch. Preview the computed version before merging.
2. PR validation builds the **current Java/Kotlin source**, even while its working version is still 1.3.5. The recovered 1.3.5 Smali snapshot is historical and never substitutes for validating current source.
3. Review user docs, compatibility declarations, secret/privacy hygiene and actual build provenance. Build and validate the final addon against the intended official/YouTube inputs. A compatibility listing is not proof of every OEM scene.
4. Merge `dev` into `main` without squashing or rewriting existing history. `release.yml` runs semantic-release, which generates the version, CHANGELOG, bundle metadata and patch list, builds the current Android MPP, and updates only the generated README patch table.
5. Publish `patches-<version>.mpp` and automatic build provenance. Do not upload patched YouTube APKs, private API profiles, signing keys or phone diagnostics. The runtime MPE is already embedded in the MPP.
6. Verify anonymous retrieval of `main/patches-bundle.json`, patch list, changelog and asset; match the downloaded asset SHA-256 to the final CI build. Keep source metadata/version/URL and actual MPP identity coherent.
7. Record tag/source/asset identity and known evidence boundaries in the project state. Do not overwrite published assets; fix mistakes with a new release. Keep backups for local rollback.

Generated `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and version changes are produced by the pipeline, not hand-maintained. Keep `main` stable; dev prerelease publishing is optional and must be deliberately enabled rather than creating accidental releases during preparation.

## Community visibility

Maintain a clear README, repository About and relevant topics. The official website links [Morphe Community Patches](https://morphe-patches.software/); it is community-maintained, and no automatic listing is promised. Its Feedback form can be used to ask about adding a source.

[Awesome Morphe](https://github.com/nvbangg/awesome-morphe) has a [Bundle Request](https://github.com/nvbangg/awesome-morphe/issues/new?template=bundle-request.yml) requiring an existing release and compatibility with Morphe. This is an independent directory.

The official community [r/MorpheApp](https://www.reddit.com/r/MorpheApp/) permits discussion subject to its current rules; do not share or link pre-patched APKs. Share the source, instructions and compatibility limits instead. Community inclusion is not official endorsement. Prepare outreach separately and only send it when explicitly authorized.
