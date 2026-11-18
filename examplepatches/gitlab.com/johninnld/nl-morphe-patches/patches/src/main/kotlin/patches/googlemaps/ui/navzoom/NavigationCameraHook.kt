package org.ungoogled.patches.maps.ui.navzoom

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.sharedExtensionPatch

/**
 * NavigationCameraControllerImpl.updateSharedCameraMode -- Maps names it in its
 * own trace label. Runs about once a second while guidance is live, and near
 * its end re-targets the camera through SharedCameraControllerImpl, which is
 * what pulls a held zoom back toward Maps' own.
 */
private object NavCameraUpdateFingerprint : Fingerprint(
    returnType = "Lj\$/util/Optional;",
    filters = listOf(
        string("NavigationCameraControllerImpl.updateSharedCameraMode"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Lj\$/util/Optional;", parameters = listOf("Lcffa;", "Lbmad;", "Z")),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
)

/** 26.44 renamed the retarget call's holder and value types. */
private object NavCameraUpdateFingerprint2644 : Fingerprint(
    returnType = "Lj\$/util/Optional;",
    filters = listOf(
        string("NavigationCameraControllerImpl.updateSharedCameraMode"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Lj\$/util/Optional;", parameters = listOf("Lcfnq;", "Lbmgp;", "Z")),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
    ),
    custom = { method, _ -> method.definingClass == "Lbmly;" },
)

private object NavCameraTeardownFingerprint2644 : Fingerprint(
    classFingerprint = NavCameraUpdateFingerprint2644,
    name = "g",
    returnType = "V",
    parameters = emptyList(),
)

/** The same controller's teardown: it unregisters from the camera and releases the shared controller. */
private object NavCameraTeardownFingerprint : Fingerprint(
    classFingerprint = NavCameraUpdateFingerprint,
    name = "g",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(opcode = Opcode.INVOKE_VIRTUAL, name = "A", parameters = listOf("Lbjxu;"))),
)

/**
 * Tells the extension that turn-by-turn is live (Shapes.navCam, about once a second)
 * and when it ends (Shapes.navEnded) -- the signal behind every navigation overlay of
 * ours: the zoom tiles, and Power Saving Options' button, idle switch and frame rate.
 * Shared, so either patch can be applied without the other.
 */
internal val navigationCameraHookPatch = bytecodePatch(
    description = "Lets the extension know when turn-by-turn navigation starts and ends.",
) {
    dependsOn(sharedExtensionPatch)

    execute {
        val update = if (packageMetadata.versionName == "26.44.06.1006895251") NavCameraUpdateFingerprint2644 else NavCameraUpdateFingerprint
        val teardown = if (packageMetadata.versionName == "26.44.06.1006895251") NavCameraTeardownFingerprint2644 else NavCameraTeardownFingerprint
        update.let { fp ->
            // Capture before editing: the entry hook below shifts every index by one.
            val afterRetarget = fp.instructionMatches.last().index + 1
            // Re-assert a held zoom in the same call that just re-targeted the camera,
            // so the re-target is cancelled before anything is drawn. Only on that path;
            // a no-op while no zoom is held.
            fp.method.addInstruction(afterRetarget, "invoke-static {}, $SHAPES->navReassert()V")
            // Publish the controller: `this` is v17 here, out of reach of the short invoke form.
            fp.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $SHAPES->navCam(Ljava/lang/Object;)V")
        }

        // An instant "navigation ended", instead of inferring it from the camera
        // hook going stale -- which left the tiles up for three seconds after the
        // rest of the drive screen had gone.
        teardown.method.addInstruction(0, "invoke-static {}, $SHAPES->navEnded()V")
    }
}
