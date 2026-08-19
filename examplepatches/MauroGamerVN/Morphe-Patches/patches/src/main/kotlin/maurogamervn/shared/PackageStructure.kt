package maurogamervn.shared

/**
 * Package layout for this repository:
 *
 * ```
 * maurogamervn/
 *   shared/          <- helpers used by several apps (optional)
 *   multirun/        <- one folder per app
 *     ads/           <- group related patches (ads, premium, ui, ...)
 *       DisableAdsPatch.kt
 *   otraapp/         <- next app
 *     premium/
 *       UnlockPremiumPatch.kt
 * ```
 *
 * Rules:
 * 1. One top-level folder per app (short name, lowercase).
 * 2. Inside, group by feature: ads, premium, ui, tracking, etc.
 * 3. Each patch file exposes a public `val xxxPatch = bytecodePatch(...)`.
 * 4. appIconColor must be 0xRRGGBB (no alpha), e.g. 0x2196F3.
 * 5. After adding patches, rebuild and publish a new release (.mpp).
 */
object PackageStructure
