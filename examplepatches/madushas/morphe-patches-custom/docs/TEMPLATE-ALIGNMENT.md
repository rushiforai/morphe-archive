# Patch-template alignment audit (2026-11-12)

Against the updated `morphe-patching` skill (`SKILL.md` §Phase 2 +
`references/patching-cookbook.md` §11 "Definition of done" +
`references/official-patch-study.md` §7). The bar is the official
`MorpheApp/morphe-patches` bundle.

## What was found (audit of all 80 patches / 14 app packages)

| Item | State before | State now |
|---|---|---|
| `category(...)` (Manager expert-mode grouping) | 3 (Hutch only) | **70 calls / 67 files** (every patch) |
| Per-feature `Fingerprints.kt` (community convention) | 0 — all fingerprints inline | unchanged (see plan) |
| Fail-closed (`?: throw PatchException`) | 35 silent `?: return` / `firstOrNull` fallbacks | unchanged (see plan) |
| Debug leftovers | 1 dead probe (Strava) | removed |
| Options vs runtime prefs | Manager options used for mostly patch-time choices; in-app switches exist per app | unchanged (see plan) |
| Compatibility annotations (signatures / experimental targets) | signers listed, no per-signer or `isExperimental` comments | unchanged (see plan) |

## Done in this pass

1. **`category()` on every patch**, derived from the patch's subdirectory
   (`ads/` → Ads, `trackers/`+`telemetry/` → Privacy, `pairip/` → PairIP,
   `premium/` → Premium, `theme/` → Theme, `security/` → Security, root files
   by name). Applied by `tools/`-style script with a dry run; build + dex verified;
   end-to-end patch run verified.
2. **Strava debug probe removed** and its stale header bullet replaced.

### Known limitation (bucket-level, not patch-level)

Our pin's patch-list generator (morphe-patches-gradle-plugin **2.0.0**) emits only
`name, description, default, dependencies, compatiblePackages, options` — **no
`category`, no `use`, no rich `compatibility[]`**. So `category()` is declared
correctly but does not appear in `patches-list.json`; whether Manager surfaces it
depends on the bundle path. The richer community schema comes from a newer plugin
or a repo-side generator override. Adopting it is a repo/toolchain change, not a
patch-writing one.

## Plan for the remaining gaps (prioritised)

1. **Fail-closed pass (behavioural — do deliberately, app by app).** Replace silent
   `?: return` / `firstOrNull()` with `?: throw PatchException("<patch>: <anchor> moved")`
   where the anchor is required, so a moved anchor stops the build instead of
   silently shipping a no-op patch. 35 sites; group by app, verify each target still
   patches, and keep the intentional permissive lookups (optional features) as-is.
2. **`Fingerprints.kt` extraction.** Move each patch's `Fingerprint(...)` vals into a
   per-feature `Fingerprints.kt` named after what they match, and add
   "Verified against <app> <build>" header comments (the community convention that
   makes post-update breakage diagnosable in minutes).
3. **Declared-preference model.** For runtime-togglable behaviour, move toward the
   declarative preference object model (key → derived `_title`/`_summary`, grouped
   screens) plus locale resources, so switches apply without repatching and strings
   are translatable. Keep Manager options only for rebuild-time choices.
4. **Compatibility annotations.** Comment each signer with the build line it belongs
   to; mark tracked-but-not-recommended targets `isExperimental = true`; note version
   boundaries where behaviour differs.
5. **Behavioural anchors.** Where a patch still anchors on a bare string literal,
   add the behavioural filter that pins the method (a `MethodCallFilter` /
   `FieldAccessFilter` / `LiteralFilter` alongside the string) so a moved anchor is
   caught by the "verified against" checks rather than shipping.

Items 1–2 are the highest value and are mechanical enough to do per app; 3–5 are
per-feature work. None of them change patch behaviour on the current targets, so they
can land incrementally (one app per change set) without a bundle-wide risk.
