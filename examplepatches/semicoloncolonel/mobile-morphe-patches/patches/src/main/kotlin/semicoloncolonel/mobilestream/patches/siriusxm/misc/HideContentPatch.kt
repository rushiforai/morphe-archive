package semicoloncolonel.mobilestream.patches.siriusxm.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.siriusxm.shared.Constants
import semicoloncolonel.mobilestream.patches.siriusxm.shared.filterDecodedJson

// SiriusXM 2610.4.0 reads its pages, search results, and library from
// SiriusXM's API as JSON, and decodes them with kotlinx.serialization's
// Json.decodeFromString. That builds a StringJsonLexer from the response
// text. The patch passes the text through ContentFilter first, which removes
// the items that belong to or feature the user's names, so the app never
// sees them. ContentFilter describes the rules. Only catalog items are
// removed: channels, shows, episodes, and rows carry an "entity" or "texts"
// object, and the live now-playing data does not, so a channel keeps its
// on-air details.
//
// The list is edited in the app: long-pressing the app icon offers "Hidden
// names", which opens HiddenNamesActivity. The patch options give the list
// it starts with.

private const val CONTENT_FILTER = "Lsemicoloncolonel/mobilestream/extension/siriusxm/ContentFilter;"

internal object ContentFilterTermsFingerprint : Fingerprint(
    definingClass = CONTENT_FILTER,
    name = "terms",
    returnType = "Ljava/lang/String;",
)

internal object ContentFilterMentionsFingerprint : Fingerprint(
    definingClass = CONTENT_FILTER,
    name = "hideMentions",
    returnType = "Z",
)

private const val EDITOR = "semicoloncolonel.mobilestream.extension.siriusxm.HiddenNamesActivity"
private const val SHORTCUTS = "msp_hidden_names_shortcuts"

private val hiddenNamesShortcutPatch = resourcePatch {
    execute {
        val shortcuts = get("res/xml/$SHORTCUTS.xml")
        shortcuts.parentFile.mkdirs()
        // The XML declaration must be the first characters of the file.
        shortcuts.writeText(
            """
            |<?xml version="1.0" encoding="utf-8"?>
            |<shortcuts xmlns:android="http://schemas.android.com/apk/res/android">
            |    <shortcut android:shortcutId="msp_hidden_names" android:enabled="true"
            |        android:icon="@mipmap/ic_launcher"
            |        android:shortcutShortLabel="@string/msp_hidden_names_short"
            |        android:shortcutLongLabel="@string/msp_hidden_names_long">
            |        <intent android:action="android.intent.action.VIEW"
            |            android:targetPackage="${Constants.COMPATIBILITY.packageName}"
            |            android:targetClass="$EDITOR" />
            |    </shortcut>
            |</shortcuts>
            """.trimMargin(),
        )

        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            mapOf(
                "msp_hidden_names_short" to "Hidden names",
                "msp_hidden_names_long" to "Edit hidden names",
            ).forEach { (name, text) ->
                val string = document.createElement("string")
                string.setAttribute("name", name)
                string.textContent = text
                resources.appendChild(string)
            }
        }

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val activity = document.createElement("activity")
            activity.setAttribute("android:name", EDITOR)
            activity.setAttribute("android:label", "@string/msp_hidden_names_short")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:excludeFromRecents", "true")
            activity.setAttribute("android:taskAffinity", "")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
            activity.setAttribute("android:windowSoftInputMode", "adjustResize")
            application.appendChild(activity)

            // The shortcuts belong to the launcher entry, which SiriusXM
            // declares as an activity-alias.
            val launcher = listOf("activity", "activity-alias").flatMap { tag ->
                val entries = application.getElementsByTagName(tag)
                (0 until entries.length).map { entries.item(it) as Element }
            }.firstOrNull { entry ->
                val categories = entry.getElementsByTagName("category")
                (0 until categories.length).any {
                    (categories.item(it) as Element).getAttribute("android:name") == "android.intent.category.LAUNCHER"
                }
            } ?: throw PatchException("SiriusXM: launcher activity not found")
            val metaData = document.createElement("meta-data")
            metaData.setAttribute("android:name", "android.app.shortcuts")
            metaData.setAttribute("android:resource", "@xml/$SHORTCUTS")
            launcher.appendChild(metaData)
        }
    }
}

@Suppress("unused")
val hideContentPatch = bytecodePatch(
    name = "Hide content",
    description = "Hides the channels, shows, podcasts, and episodes of the people and shows you list, " +
        "and the episodes that list them as a host or guest. " +
        "Long-press the app icon and choose Hidden names to edit the list.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hiddenNamesShortcutPatch)

    extendWith("extensions/extension.mpe")

    val terms by stringOption(
        key = "terms",
        default = "",
        title = "Names to hide",
        description = "The people, shows, podcasts, or channels to start with, separated by commas, " +
            "for example: True Crime, Comedy Central. " +
            "You can change it later in the app. Letter case and accents do not matter, " +
            "and each name must match whole words.",
        required = false,
    )

    val hideMentions by booleanOption(
        key = "hideMentions",
        default = false,
        title = "Also hide mentions",
        description = "Hides everything that mentions a name, such as an episode of another show that talks " +
            "about the person. Without it, a person's own channels and shows are hidden, along with the " +
            "episodes that list them as a host or guest. You can change it later in the app.",
    )

    execute {
        val list = terms.orEmpty()
        if (list.contains('"') || list.contains('\\') || list.contains('\n')) {
            throw PatchException("Names to hide cannot contain quotes, backslashes, or line breaks")
        }
        ContentFilterTermsFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$list"
                return-object v0
            """,
        )

        if (hideMentions == true) {
            ContentFilterMentionsFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        filterDecodedJson("$CONTENT_FILTER->filter(Ljava/lang/String;)Ljava/lang/String;")
    }
}
