package semicoloncolonel.mobilestream.patches.retailmenot.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

private const val SERVICE = "Lexpo/modules/adapters/react/permissions/PermissionsService;"
private const val BLOCKER = "Lsemicoloncolonel/mobilestream/extension/retailmenot/privacy/LocationBlocker;"

// RetailMeNot 10.0.6 asks for precise location, and can ask for it in the
// background. When granted, the position is added to the in-store deals
// query and to the context sent with each Snowplow analytics event.
//
// Every location check and request goes through Expo's PermissionsService.
// Its grant check now reports the blocked location permissions as not
// granted, and a request made only of blocked permissions returns "denied"
// without showing Android's dialog. expo-location then refuses to read a
// position, and the app runs as it does when you deny location.
//
// The permissions stay in the manifest: Expo rejects calls about undeclared
// permissions, and the app's root screen then fails to load. 10.1.0's root
// screen checks background location at startup, so the shared "Block
// background location" patch, which removes that permission from the
// manifest, left RetailMeNot 10.1.0 on a blank screen. RetailMeNot gets its
// own "Block background location" below, which denies it here instead.

internal object IsPermissionGrantedFingerprint : Fingerprint(
    definingClass = SERVICE,
    name = "isPermissionGranted",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

internal object DelegateRequestToActivityFingerprint : Fingerprint(
    definingClass = SERVICE,
    name = "delegateRequestToActivity",
    returnType = "V",
    parameters = listOf("[Ljava/lang/String;", "Lexpo/modules/interfaces/permissions/PermissionsResponseListener;"),
)

private object BlockForegroundFingerprint : Fingerprint(
    definingClass = BLOCKER,
    name = "blockForeground",
    returnType = "Z",
)

private object BlockBackgroundFingerprint : Fingerprint(
    definingClass = BLOCKER,
    name = "blockBackground",
    returnType = "Z",
)

// Routes Expo's permission check and request through LocationBlocker. Which
// permissions it denies is set by the patches below.
private val expoLocationHookPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        IsPermissionGrantedFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1}, $BLOCKER->isBlocked(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        DelegateRequestToActivityFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1}, $BLOCKER->deniedResults([Ljava/lang/String;)[I
                    move-result-object v0
                    if-eqz v0, :original
                    invoke-direct {p0, p1, v0}, $SERVICE->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;
                    move-result-object v0
                    invoke-interface {p2, v0}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}

@Suppress("unused")
val removeLocationAccessPatch = bytecodePatch(
    name = "Remove location access",
    description = "Keeps the app from reading your location, even when location access is allowed.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(expoLocationHookPatch)

    execute {
        BlockForegroundFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
        BlockBackgroundFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}

@Suppress("unused")
val blockBackgroundLocationPatch = bytecodePatch(
    name = "Block background location",
    description = "Removes the app's access to your location while it is closed or in the background.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(expoLocationHookPatch)

    execute {
        BlockBackgroundFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}
