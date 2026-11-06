# Contributing

Thanks for helping improve Agrokenga's Morphe Patches.

## Workflow

- Make changes on the `dev` branch, not `main`.
- Use [Semantic Commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index) messages.
- Common types are `feat:`, `fix:`, and `chore:`.
- Do not squash or force-push release commits.

## Building

- Build the patch bundle with `./gradlew buildAndroid`.
- The bundle is written to `patches/build/libs/patches-*.mpp`.
- Run `./gradlew :patches:compileKotlin` for a quick compile check.

## Generated files

Do not edit generated files by hand:

- `patches-list.json`
- `patches-bundle.json`
- `CHANGELOG.md`
- the patches section between the `PATCHES_START` and `PATCHES_END` markers in `README.md`

These are updated by the Semaphore release pipeline.

## Pull requests

- Keep changes focused and describe what the patch does and which app version it targets.
- Include the app package name and the supported version(s).
- Test the patch locally with Morphe Desktop before opening a pull request.
- Report bugs and feature requests through the issue templates.
