package app.morphe.patches.reddit.customclients.sync.syncforreddit.redirects

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patches.reddit.customclients.sync.syncforreddit.settings.answerTheScreenLookupWith
import app.morphe.patches.reddit.customclients.sync.syncforreddit.settings.fadeDisabledRowsPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.settings.settingsAlertsPatch
import com.android.tools.smali.dexlib2.AccessFlags

private const val REDIRECTS = "Lapp/morphe/extension/syncforreddit/redirects/"

private const val SETTINGS_CLASS_DESCRIPTOR = "${REDIRECTS}RedirectSettings;"

private const val SCREEN_CLASS_DESCRIPTOR = "${REDIRECTS}RedirectsScreen;"

private const val UNBLOCK_CLASS_DESCRIPTOR = "${REDIRECTS}imgur/ImgurUnblock;"

private const val SHARE_CLASS_DESCRIPTOR = "${REDIRECTS}imgur/ImgurShare;"

private const val INSTEAD_OF_STRING =
    "insteadOf(Ljava/lang/String;)Ljava/lang/String;"

private const val INSTEAD_OF_TEXT =
    "insteadOf(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"

/**
 * Where the app hands a piece of text out — to another app, or to the clipboard.
 *
 * <p>Found by what each one says rather than by its name, which the minifier has taken: the
 * share helper is the one that builds a SEND intent and rebuilds a v.redd.it address, and the
 * three clipboard helpers are told apart by whether they announce a URL or text. Each string
 * named here is the whole of a string in the method it belongs to.
 */
private val handsOutAnAddress = listOf(
    // share(Context, subject, url) — the link, with the url last.
    HandsOut(
        listOf("android.intent.action.SEND", "v.redd.it"),
        listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
        parameter = 2,
        text = false,
    ),
    // copyUrl(Context, url).
    HandsOut(
        listOf("reddit sync link", "URL copied to clipboard"),
        listOf("Landroid/content/Context;", "Ljava/lang/String;"),
        parameter = 1,
        text = false,
    ),
    // copyText(Context, text, saySo).
    HandsOut(
        listOf("reddit sync link", "Text copied to clipboard"),
        listOf("Landroid/content/Context;", "Ljava/lang/CharSequence;", "Z"),
        parameter = 1,
        text = true,
    ),
    // copyText(text, Context).
    HandsOut(
        listOf("reddit sync link", "Text copied to clipboard"),
        listOf("Ljava/lang/CharSequence;", "Landroid/content/Context;"),
        parameter = 0,
        text = true,
    ),
)

private class HandsOut(
    val says: List<String>,
    val parameters: List<String>,
    val parameter: Int,
    val text: Boolean,
)

private const val PICK_CLASS_DESCRIPTOR = "${REDIRECTS}PickAFile;"

private const val WHAT_CAME_BACK_METHOD = "whatCameBack(IILandroid/content/Intent;)V"

/**
 * Where a result from another app arrives.
 *
 * <p>Every activity in the app inherits this one, and it is the one place the picker's answer
 * can be caught: {@code onActivityResult} overrides a method of the framework's, so its name
 * survives the minifier, while the members a fragment is handed a result through do not.
 */
private val activityResultFingerprint = Fingerprint(
    definingClass = "Landroidx/activity/ComponentActivity;",
    name = "onActivityResult",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    returnType = "V",
)

/**
 * Every class the app itself ends up calling into or building, which therefore has to be public.
 *
 * <p>A class that is not public is refused at the moment it is first reached, from whatever app
 * package the call was injected into — which for a settings screen means the screen comes down
 * rather than opens. The five screens are built by the framework when one is rotated, which is
 * the same problem arriving later and harder to find.
 */
private val reachedFromTheApp = listOf(
    SETTINGS_CLASS_DESCRIPTOR,
    SCREEN_CLASS_DESCRIPTOR,
    UNBLOCK_CLASS_DESCRIPTOR,
    PICK_CLASS_DESCRIPTOR,
    SHARE_CLASS_DESCRIPTOR,
    "${REDIRECTS}CertificateDialog;",
    "${REDIRECTS}RedirectAlerts;",
    "${REDIRECTS}RedirectsScreen\$Front;",
    "${REDIRECTS}RedirectsScreen\$Imgur;",
    "${REDIRECTS}RedirectsScreen\$DuckDuckGo;",
    "${REDIRECTS}RedirectsScreen\$Rimgo;",
    "${REDIRECTS}RedirectsScreen\$Proxy;",
)

@Suppress("unused")
val redirectsPatch = bytecodePatch(
    name = "Unblock Imgur",
    description = "Loads Imgur pictures, videos, and albums another way where Imgur refuses the " +
            "region, through DuckDuckGo's image proxy, a Rimgo instance, or a proxy of your own. " +
            "Off until it is turned on under Settings > Redirects.",
    default = true,
) {
    dependsOn(
        sharedExtensionPatch,
        interceptHttpRequests,
        redirectsSettingsPatch,
        fadeDisabledRowsPatch,
        // A certificate is deliberately kept out of Sync's Backup, so a restored copy comes
        // back set up to use one and without it. That is only sayable where there is somewhere
        // to say it; the alerts patch has no name of its own and is applied once, however many
        // patches ask for it.
        settingsAlertsPatch,
    )

    compatibleWith(*SyncForRedditCompatible)

    execute {
        reachedFromTheApp.forEach { reached ->
            val extension = classDefByOrNull(reached)
                ?: throw PatchException("$reached is not in the app to be called")
            if (extension.accessFlags and AccessFlags.PUBLIC.value == 0) {
                throw PatchException("$reached is not public, so the app cannot reach it")
            }
        }

        // Nothing here does anything until it is turned on in the settings; this only says the
        // patch was applied, which is what keeps every route passing requests straight through
        // in a copy that was patched without it.
        listOf(
            SETTINGS_CLASS_DESCRIPTOR,
            UNBLOCK_CLASS_DESCRIPTOR,
            SHARE_CLASS_DESCRIPTOR,
        ).forEach { descriptor ->
            Fingerprint(definingClass = descriptor, name = "isPatchIncluded")
                .method.returnEarly(true)
        }

        // What is handed out when something is shared or copied. The address itself is read
        // and put back, so a string that is not wholly an Imgur address — a comment, a title,
        // a post's text — comes back exactly as it went in.
        handsOutAnAddress.forEach { handing ->
            val descriptor = if (handing.text) INSTEAD_OF_TEXT else INSTEAD_OF_STRING
            Fingerprint(
                parameters = handing.parameters,
                returnType = "V",
                strings = handing.says,
            ).method.addInstructions(
                0,
                """
                invoke-static       { p${handing.parameter} }, $SHARE_CLASS_DESCRIPTOR->$descriptor
                move-result-object  p${handing.parameter}
                """,
            )
        }

        answerTheScreenLookupWith(SCREEN_CLASS_DESCRIPTOR)

        // Told about every result the app is handed, and answers to one request code of its
        // own; anything else passes through it untouched. This is what lets a certificate be
        // read out of a file rather than only pasted in.
        activityResultFingerprint.method.addInstructions(
            0,
            "invoke-static { p1, p2, p3 }, $PICK_CLASS_DESCRIPTOR->$WHAT_CAME_BACK_METHOD",
        )
    }
}
