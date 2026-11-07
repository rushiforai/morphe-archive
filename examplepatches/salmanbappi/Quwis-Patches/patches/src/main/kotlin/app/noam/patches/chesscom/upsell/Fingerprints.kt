package app.noam.patches.chesscom.upsell

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The one helper every dialog direction goes through:
 * static void show(Router router, NavigationDialogDirections direction, FragmentManager manager).
 */
internal object ShowDialogDirectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "L",
        "Lcom/chess/navigationinterface/NavigationDialogDirections;",
        "Landroidx/fragment/app/FragmentManager;",
    ),
    strings = listOf("fragmentManager"),
)

/** The router's navigate(activity, directions), which opens every full screen. */
internal object NavigateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentActivity;",
        "Lcom/chess/navigationinterface/NavigationDirections;",
    ),
    strings = listOf("activity", "directions"),
)
