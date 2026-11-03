package app.czyeru.patches.tiktok.misc.favorites

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.MainActivityOnCreateFingerprint
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/favorites/FavoritesRetryPatch;"

private const val SETTINGS_STATUS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/settings/SettingsStatus;"

private const val FUNCTION2_DESCRIPTOR = "Lkotlin/jvm/functions/Function2;"

/**
 * AwemeCollectionAgent's favorite / unfavorite request (LJI on 47.6.3): video id, true to
 * favorite, request params, error callback, success callback. Every video favorite button
 * reaches it through ICollect.collect / unCollect.
 */
internal object CollectRequestFingerprint : Fingerprint(
    definingClass = "/AwemeCollectionAgent;",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Ljava/util/Map;",
        FUNCTION2_DESCRIPTOR,
        FUNCTION2_DESCRIPTOR,
    ),
)

@Suppress("unused")
val favoritesRetryPatch = bytecodePatch(
    name = "Favorites rate limit retry",
    description = "Adds an option to queue favorites TikTok refuses with \"You're adding to " +
        "Favorites too fast\" and save them automatically once TikTok allows it, " +
        "also after the app is restarted.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableFavoritesRetry()V",
        )

        // Wrap the callbacks to see each result. p0..p5 are contiguous, so /range works with
        // any register count.
        CollectRequestFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p4}, $EXTENSION_CLASS_DESCRIPTOR->wrapError(Ljava/lang/Object;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p4
                check-cast p4, $FUNCTION2_DESCRIPTOR
                invoke-static/range {p0 .. p5}, $EXTENSION_CLASS_DESCRIPTOR->wrapSuccess(Ljava/lang/Object;Ljava/lang/String;ZLjava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p5
                check-cast p5, $FUNCTION2_DESCRIPTOR
            """,
        )

        // Resume favorites queued before the app was closed.
        MainActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->onAppStart()V",
        )
    }
}
