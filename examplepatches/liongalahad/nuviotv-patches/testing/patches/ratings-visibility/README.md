# Rating Visibility

Patch ID: `ratings-visibility`. Target: official NuvioTV `0.8.4-beta` universal and ABI-specific builds.

The patch adds `Settings → Morphe → Ratings` with two independent controls. `Overall Ratings` defaults to `Show` and controls standard ratings on Home, collection, hero, and Detail surfaces while leaving configured MDBList providers authoritative. `Episode Ratings` defaults to `Hide Unwatched` and provides `Show`, `Hide`, and `Hide Unwatched`. These defaults apply only when the corresponding preference is absent; stored choices remain authoritative.

Preferences are stored only in private `morphe_patches` storage under `ratings.overall_visibility` and `ratings.episode_visibility`. They are not added to Nuvio profiles, sync payloads, analytics, DTOs, or backend reports.

This patch has its own patcher, extension, test, and gitignored runtime-evidence compartments and does not depend on the SDH patch.
