# Patch modules

Every patch is a self-contained directory under `patches/<patch-id>/`. A module owns its diff, source code, scripts, tools, documentation, and test evidence; patch-specific files must not be placed in shared root directories.

Each module must contain a `patch.json` manifest whose `id` matches its directory name, plus a deterministic `order` and module-local `apply` script. If a patch needs to add compiled files to the rebuilt APK, it can also declare a module-local `augment` script. The orchestrator rejects absolute hook paths and paths that escape the module directory.

The root `scripts/build.ps1` script is only an orchestrator. It checksum-gates and decodes the original APK, discovers module manifests, runs their hooks in declared order, and performs the shared rebuild/sign/verify stages.

The Morphe Manager bundle is built by `scripts/build-morphe.ps1`. Each module owns its Morphe fingerprints and patch code under its local `morphe/` directory; shared bundle metadata and compatibility declarations under `patches/src/` contain no patch-specific implementation.

Current modules:

- `multi-account/` owns the chooser diff, original Java source, APK augmentation hook, diagnostics, design notes, and device test results.
- `addon-reordering/` owns the add-on ordering diff, original Java source, APK augmentation hook, and interaction test evidence.
- `side-by-side-installation/` owns the install-identity diff and its application hook.
