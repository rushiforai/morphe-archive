package app.morphe.patches.reddit.customclients.sync.syncforreddit.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch

private const val ROWS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/settings/SettingsRows;"

private const val DRAW_ENABLED_METHOD =
    "drawEnabled(Landroidx/preference/Preference;Landroidx/preference/h;)V"

/** The kinds of row Sync draws itself, each of which sets its own colours as it does. */
private val rowKinds = listOf(
    "SyncPreference;",
    "SyncListPreference;",
    "SyncCheckBoxPreference;",
)

/** Where a row of a given kind draws itself. */
private fun drawsRow(kind: String) = Fingerprint(
    parameters = listOf("Landroidx/preference/h;"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith(kind) && method.name == "S"
    },
)

/**
 * Makes a settings row that cannot be used look like it.
 *
 * <p>Sync sets the colour of every row's words as it draws them, whatever state the row is in,
 * so a row turned off stopped answering a tap while its words went on looking like words that
 * could be tapped. The whole row is faded instead, once for every kind of row there is.
 *
 * <p>Dependency only: it has no name, so it is not offered as a patch of its own. Anything that
 * turns a row off depends on it so that the row says so.
 */
internal val fadeDisabledRowsPatch = bytecodePatch(
    description = "Fades a settings row that cannot be used.",
) {
    compatibleWith(*SyncForRedditCompatible)

    dependsOn(sharedExtensionPatch)

    execute {
        // Reached from whatever app package the call is injected into, so a class that is not
        // public throws the first time a row is drawn rather than when the patch is applied.
        val rows = classDefByOrNull(ROWS_CLASS_DESCRIPTOR)
            ?: throw PatchException("$ROWS_CLASS_DESCRIPTOR is not in the app to be called")
        if (rows.accessFlags and AccessFlags.PUBLIC.value == 0) {
            throw PatchException("$ROWS_CLASS_DESCRIPTOR is not public, so the app cannot call it")
        }

        // Said before the row draws itself rather than after: by the end of drawing, the
        // register the holder arrived in has been put to another use and holds a view, and
        // nothing in the drawing touches what is set here.
        rowKinds.forEach { kind ->
            drawsRow(kind).method.addInstructions(
                0,
                "invoke-static { p0, p1 }, $ROWS_CLASS_DESCRIPTOR->$DRAW_ENABLED_METHOD",
            )
        }
    }
}
