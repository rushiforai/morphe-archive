# Morphe source imported by Afterglow

This is an Afterglow adaptation, not an official Morphe release. The feature implementations retain their original packages, source notices and runtime assets. Only named patch export metadata and the documented settings-resource, native enum, Cast, navigation and seekbar integration adapters are changed during import. Afterglow catalog wrappers control selection; original option objects and dependency objects remain shared. Additional integration changes are recorded by the repository diff.

`provenance.json` records the exact upstream versions, complete source archive URLs, input hashes and each imported file hash. `licenses/` preserves the original license and NOTICE texts. Imported sources build offline through `tools/local_build.sh`; upstream extension DEX assets are unchanged. No upstream compiled JVM patch classes or host DEX are imported.

To reproduce the initial import, supply the three pinned inputs to `tools/import_morphe.py --patches-source ARCHIVE --library-source ARCHIVE --bundle MPP`. The command verifies their SHA-256 hashes before writing. It refuses to overwrite an existing import without `--replace`.
