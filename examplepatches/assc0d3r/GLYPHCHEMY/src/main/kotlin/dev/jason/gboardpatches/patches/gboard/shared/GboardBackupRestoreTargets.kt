package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext

/**
 * Per-release facts the Backup & Restore port needs but cannot project from 18.6.3.
 *
 * The flag family hook rewrites whatever flag getter the release hands it, so it never needs a flag
 * name. The Backup & Restore port is different: it has to *enable* Gboard's own backup data
 * providers, and that is a specific rollout flag read at module registration time. Gboard renames
 * the holder class every release, so the name and the holder are recorded together, per release,
 * and resolved by shape instead of by trusting the name.
 *
 * Not consumed by a patch yet: [gboardDataBackupFlagValuePatch] drives the flag family transformation
 * and nothing reads this table. It is recorded now so the audited value is not lost, and because the
 * extension cannot run the feature until it carries GboardDataBackupFlagRuntime anyway.
 */
internal data class GboardBackupRestoreTargets(
    val release: String,
    val flagName: String,
    val flagHolder: GboardFieldTarget,
    val moduleDefinitions: List<GboardMethodTarget>,
) {
    /** True when this row describes the APK in front of us. */
    fun matches(context: BytecodePatchContext): Boolean = flagHolder.resolveOrNull(context) != null
}

/**
 * 18.8.0.1022711984-beta-arm64-v8a, derived from the release's own dex rather than from a name list:
 *
 * - `enable_backup_delight5_personalized_data` is built in `Lmdy;-><clinit>` (index 77) and stored to
 *   `Lmdy;->q:Ladfh;` through `Ladfk;->a(String;Z)`, i.e. a boolean flag definition.
 * - Reading `Lmdy;->q` finds exactly two consumers, both module definitions:
 *   `Lmgu;->getModuleDef(Landroid/content/Context;)Lagwf;` and
 *   `Lmgw;->getModuleDef(Landroid/content/Context;)Lagwf;`. That is the "registers the backup
 *   providers" behaviour: the flag decides whether those modules exist at all, so the backup
 *   providers behind them are absent when it is off.
 * - The neighbouring `enable_hmm_user_history_backup` (`Lotm;->c`) is read by exactly one module
 *   definition (`Lour;->getModuleDef`). It gates a single provider, so it is not the plural gate the
 *   Backup & Restore feature is built on.
 *
 * Re-check with: `MethodDump <apk> 'Lmdy;' '<clinit>'` for the literal-to-field mapping and
 * `FieldRefs <apk> 'Lmdy;' q` for the consumers. The full command chain, with the output each step
 * produced, is in `tools/bindings/README.md`.
 */
internal val GBOARD_BACKUP_RESTORE_18_8 = GboardBackupRestoreTargets(
    release = GBOARD_18_8_TARGET,
    flagName = "enable_backup_delight5_personalized_data",
    flagHolder = GboardFieldTarget(
        classType = "Lmdy;",
        name = "q",
        type = "Ladfh;",
    ),
    moduleDefinitions = listOf(
        GboardMethodTarget(
            classType = "Lmgu;",
            name = "getModuleDef",
            parameterTypes = listOf("Landroid/content/Context;"),
            returnType = "Lagwf;",
        ),
        GboardMethodTarget(
            classType = "Lmgw;",
            name = "getModuleDef",
            parameterTypes = listOf("Landroid/content/Context;"),
            returnType = "Lagwf;",
        ),
    ),
)

/**
 * Audited rows only. There is no 18.6.3 row on purpose: that release is not on this machine, so its
 * holder class and literal have not been derived, and an invented row would be worse than a missing
 * one. A feature that resolves no row must keep the stock flag rather than guess.
 */
internal val GBOARD_BACKUP_RESTORE_TARGETS = listOf(GBOARD_BACKUP_RESTORE_18_8)
